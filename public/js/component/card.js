console.log('test');

const card = document.querySelectorAll('.monster_card');
const container = document.querySelectorAll(`.container`);
const monster = document.querySelectorAll('.monster_card-img');

console.log(container[1]);

for(i = 0; i < 10; i++) {
    container[i].addEventListener("mousemove", (e) => {
        const clientRect = monster[i].getBoundingClientRect();
        //console.log(clientRect.top);
        let xAxis = (clientRect.x + 75 - e.pageX) / 5;
        let yAxis = (clientRect.y + 75 - e.pageY) / 5;
        card[i].style.transform = `rotateY(${yAxis}deg) rotateX(${xAxis}deg)`;
    });
    
    container[i].addEventListener('mouseenter', (e) => {
        card[i].style.transform = `translateZ(150px)`;
        
    });
    
    container[i].addEventListener('mouseleave', (e) => {
        card[i].style.transform = "none";
        
    })
}
