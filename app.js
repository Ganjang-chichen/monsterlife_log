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

var selected_monster = 'empty';
var searching = `오베론`;
var option = `monster_name`;
var searched_isclicked_thanks = 'far';
var searched_isclicked_shit = 'far';
var searcher = 'undefined';

app.get('/', (req, res) => {
    res.redirect('/index');
});

app.get('/index', (req, res) => {
    sql = `SELECT name FROM monster WHERE name LIKE ('%${searcher}%')`;
    console.log(sql);
    conn.query(sql, (err, rows, fields) => {
        if(err) {
            console.log(`error accured at index \n` + err);
        }else {
            console.log(rows);
            res.render('index.ejs', {list: rows});
        }
    });
});

app.post('/index-monster_search', (req, res) => {
    searcher = req.body.searcher;
    res.redirect('/index');
});

app.get('/monster_tree', (req, res) => {
    
    var sql = `SELECT * FROM monster`;
    console.log(sql);

    conn.query(sql, (err, rows, fields) => {

        if(err) {
            console.log("error accuered at monster tree!\n" + err);
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
            
            res.render('monster_tree.ejs', {list: rows, trees : trees});
        }
    })
    
    
});

app.post('/monstercard_post', (req, res) => {
    selected_monster = req.body.name;

    res.redirect('/monstercard');
});

app.get('/monstercard', (req, res) => {
    var sql = `SELECT * FROM monster WHERE name = '${selected_monster}'`;
    conn.query(sql, (err, rows, fields) => {

        if(err) {
            console.log("error accuered at monster card!\n" + err);
            res.redirect('/index');
        }else {
            
            res.render('monster_card.ejs', {list : rows});
        }

    });
} );

app.post('/searched_post', (req, res) => {
    searching = req.body.monstercard_name;
    option = `monster_name`;
    console.log(searching, option);
    res.redirect('/searched');
});

app.get('/searched', (req, res) => {
    var sql = `SELECT farm_name, monster_name, SUM(population) "population", SUM(thanks) "thanks", SUM(shit) "shit" FROM log ` +
                `WHERE shelf_life > sysdate() ` +
                `AND ${option} = '${searching}' ` +
                `group by farm_name, monster_name ` +
                `ORDER BY SUM(population), SUM(thanks), SUM(shit); `;
    
    conn.query(sql, (err, rows, fields) => {
        if(err) {
            console.log("error accuered at searched\n" + err);
            res.redirect('/index');
        }else {
            console.log(rows);
            res.render('searched.ejs', {list : rows,
                                        option : option,
                                        value : searching,
                                        isclicked_thanks : searched_isclicked_thanks,
                                        isclicked_shit : searched_isclicked_shit});
        }
    });
});

app.post('/searched-thanks', (req, res) => {
    var searched_monster_name = req.body.searched_monster_name;
    if(req.body.thanks === 'fas') {
        searched_isclicked_thanks = 'far';

        sql = `SELECT log_idx FROM log ` +
                `WHERE monster_name = '${searched_monster_name}' ` +
                `ORDER BY shelf_life DESC LIMIT 1`;
        console.log(sql);
        
        conn.query(sql, (err, rows, fields) => {
            if(err) {
                console.log('Error accured' + err);
            }else {
                sql_update = `UPDATE log SET thanks = thanks - 1 ` +
                                `WHERE log_idx = ${rows[0].log_idx}`;
                console.log(sql_update);

                conn.query(sql_update, (err, rows) => {
                    if(err) {
                        console.log(`error accured` + err);
                    }
                    else {

                    }
                });
            }
        });
    }else if(req.body.thanks === 'far') {
        searched_isclicked_thanks = 'fas';

        sql = `SELECT log_idx FROM log ` +
                `WHERE monster_name = '${searched_monster_name}' ` +
                `ORDER BY shelf_life DESC LIMIT 1`;
        console.log(sql);
        
        conn.query(sql, (err, rows, fields) => {
            if(err) {
                console.log('Error accured' + err);
            }else {
                sql_update = `UPDATE log SET thanks = thanks + 1 ` +
                                `WHERE log_idx = ${rows[0].log_idx}`;
                console.log(sql_update);

                conn.query(sql_update, (err, rows) => {
                    if(err) {
                        console.log(`error accured` + err);
                    }
                    else {

                    }
                });
            }
        });
    }
    res.redirect('/searched');
});

app.post('/searched-shit', (req, res) => {
    var searched_monster_name = req.body.searched_monster_name;

    if(req.body.shit === 'fas') {
        searched_isclicked_shit = 'far';

        sql = `SELECT log_idx FROM log ` +
                `WHERE monster_name = '${searched_monster_name}' ` +
                `ORDER BY shelf_life DESC LIMIT 1`;
        console.log(sql);
        
        conn.query(sql, (err, rows, fields) => {
            if(err) {
                console.log('Error accured' + err);
            }else {
                sql_update = `UPDATE log SET shit = shit - 1 ` +
                                `WHERE log_idx = ${rows[0].log_idx}`;
                console.log(sql_update);

                conn.query(sql_update, (err, rows) => {
                    if(err) {
                        console.log(`error accured` + err);
                    }
                    else {

                    }
                });
            }
        });
    }else if(req.body.shit === 'far') {
        searched_isclicked_shit = 'fas';

        sql = `SELECT log_idx FROM log ` +
                `WHERE monster_name = '${searched_monster_name}' ` +
                `ORDER BY shelf_life DESC LIMIT 1`;
        console.log(sql);
        
        conn.query(sql, (err, rows, fields) => {
            if(err) {
                console.log('Error accured' + err);
            }else {
                sql_update = `UPDATE log SET shit = shit + 1 ` +
                                `WHERE log_idx = ${rows[0].log_idx}`;
                console.log(sql_update);

                conn.query(sql_update, (err, rows) => {
                    if(err) {
                        console.log(`error accured` + err);
                    }
                    else {

                    }
                });
            }
        });
    }
    res.redirect('/searched');
});

app.get('/insert_log', (req, res) => {

    var sql = `SELECT * FROM monster WHERE name = '${selected_monster}'`;
    conn.query(sql, (err, rows, fields) => {
        if(err) {
            console.log('error accuared at insert ' + err);
            res.redirect('/index');
        }else {
            console.log(rows);
            res.render('insert_log.ejs', {list : rows});
        }
    });
});

app.post('/insert_log_post', (req, res) => {
    selected_monster = req.body.name;
    res.redirect('/insert_log');
})

app.post('/insert_log_insert', (req, res) => {
    console.log(req.body.input_date);
    const insert_farm_name = req.body.farm_name;
    const insert_date = req.body.input_date;
    const insert_monster_name = req.body.monster_name;
    const insert_population = req.body.population;

    var sql = `SELECT * FROM log ` +  
                `WHERE farm_name = '${insert_farm_name}' ` +
                `AND monster_name = '${insert_monster_name}' ` +
                `AND date_format(shelf_life, '%Y-%m-%d') = '${insert_date}' `;

    console.log(sql);
    
    conn.query(sql, (err, rows, fields) => {
        if(err) {
            console.log('error accuared : ' + err);
        }else {
            var sql_temp;
            var IS_EXIST = false;
            for(i = 0; i < rows.length; i++) {
                IS_EXIST = true;
            }
            if(IS_EXIST) {
                sql_temp = `UPDATE log SET population = ${insert_population} WHERE log_idx = ${rows[0].log_idx}`;
            }else {
                sql_temp = `INSERT log (farm_name, monster_name, shelf_life, population, thanks, shit, overlap) ` +
                            `VALUES('${insert_farm_name}', '${insert_monster_name}', STR_TO_DATE('${insert_date}', '%Y-%m-%d'), ${insert_population}, 0, 0, 0)`;
            }

            console.log(sql_temp);

            conn.query(sql_temp, (err, rows) => {
                if(err) {
                    console.log('error insert accuared : ' + err);
                }else {
                    console.log('insert finish');
                }
            });
        }
    });
    res.redirect('/index');
});

app.listen(80, () => console.log('Server is running on port 80...'));