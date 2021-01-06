var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var path = require('path');
var db_config = require(__dirname + '/config/database.js');
var conn = db_config.init();

app.use('/views', express.static(path.join(__dirname + '/views')));
app.use(express.static(__dirname + '/public'));
app.set('view engine', 'ejs');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended : false}));


app.get('/', (req, res) => {
    res.redirect('/index');
});

app.get('/index', (req, res) => {
    res.render('index.ejs');
});

app.get('/monster_tree', (req, res) => {
    
    var sql = `SELECT * FROM monster`;
    console.log(sql);

    conn.query(sql, (err, rows, fields) => {

        if(err) {
            console.log("error accuered!\n" + err);
            res.redirect('/index');
        }
        else {
            console.log(rows[0].name);

            var leaf = new Array(); // 최하단 조합필요없는 재료
            var tree = new Array(); // 조합 필요 계층도
            var count = 0;

            var used = new Array();
            var trees = new Array();

            for(i = 0; i < rows.length; i++){
                if(rows[i].leaf1 === '몬스터 상자' || rows[i].leaf1 === '일반 조합'){
                    leaf[count] = rows[i].name;
                    count++;
                }
            }
            count = 0;
            tree[0] = leaf;
            while(tree[count].length !== 0){ // 조합 트리 계층
                var temp_arr = new Array();
                for(i = 0; i < rows.length; i++){
                    for(j=0; j < tree[count].length; j++){
                        if(rows[i].leaf1 === tree[count][j] || rows[i].leaf2 === tree[count][j]){
                            temp_arr.unshift(rows[i].name);
                            break;
                        }
                    }
                }
                if(temp_arr.length === 0) {
                    break;
                }

                count++;
                tree[count] = temp_arr;
            }
            count = 0;

            for(i = 1; i < tree.length - 1; i++){ // 중복제거
                for(j = 0; ; j++) {
                    if(j >= tree[i].length) {
                        break;
                    }
                    
                    for(k = 0; k < tree[i + 1].length; k++){
                        if(tree[i + 1][k] === tree[i][j]) {
                            tree[i].splice(j,1);
                            j--;
                            break;
                        }
                    }
                }
            }

            for(i = tree.length - 1; i >= 0; i--) { // 트리 제작
                for(j = tree[i].length - 1; j >= 0; j--) { 
                    var isExist = false;
                    for(k = 0; k < used.length; k++){ // 트리 중복 제거
                        if(tree[i][j] === used[k]) {
                            isExist = true;
                            break;
                        }
                    }
                    if(isExist === true) {
                        continue;
                    }

                    var single_tree = new Array();
                    var max_count = 3;
                    
                    single_tree[1] = tree[i][j];
                    used.push(tree[i][j]);
                    for(count = 1; ; count++) {
                        if(count >= max_count){
                            break;
                        }
                        if(single_tree[count] === null){
                            continue;
                        }
                        for(k = 0; k < rows.length; k++) {
                            if(single_tree[count] === rows[k].name){
                                max_count = 2 * count +1;
                                
                                if(rows[k].leaf1 === '일반 조합' || rows[k].leaf1 === '몬스터 상자') {
                                    continue;
                                }

                                single_tree[2 * count] = rows[k].leaf1;
                                single_tree[2 * count + 1] = rows[k].leaf2;
                                
                                used.push(rows[k].leaf1);
                                used.push(rows[k].leaf2);

                                
                                break;
                            }
                        }
                    }
                    trees.push(single_tree);
                }
                
            }
            count = 0;
            
            console.log(trees);

            res.render('monster_tree.ejs', {list: rows, trees : trees});
        }
    })
    
    
});


app.listen(3000, () => console.log('Server is running on port 3000...'));