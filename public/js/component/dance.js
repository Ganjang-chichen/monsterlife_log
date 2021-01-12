
const dance = document.querySelector('.dance');
const icons = ['ዪ','ያ','ይ','ዮ','ደ','ዱ','ዳ','ድ','ዶ','ጰ','ጱ','ጲ','ጳ','ጵ','ጶ','ጸ','ጹ','ጺ','ጻ','ጽ','ጾ','ሄ','ሌ','ል','ሎ'];

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min; //최댓값은 제외, 최솟값은 포함
  }

function wait(msecs) {
    var start = new Date().getTime();
    var cur = start;
    while(cur - start < msecs) {
        cur = new Date().getTime();
    }
}

function change(value) {
    dance.innerHTML = ` ${value} `;
}

var i = 0;
setInterval(function(){
    //var random = getRandomInt(0, icons.length - 1);
    change(icons[i]);
    i++;
    if( i >= icons.length) {
        i = i - icons.length;
    }

}, 100 );



