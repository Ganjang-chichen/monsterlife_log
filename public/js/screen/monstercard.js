
const container = document.querySelector('.container_monstercard');
const card = document.querySelector('.monstercard');

const images = document.querySelector('.monstercard-img img');
const grade = document.querySelector('.monstercard-grade');
const names = document.querySelector('.monstercard-name');
const info = document.querySelector('.monstercard-info');
const searchBtn = document.querySelector('.monstercard-search_btn');

container.addEventListener('mousemove', (e) => {
    let xAxis = (window.innerWidth / 2 - e.pageX) / 20;
    let yAxis = (window.innerHeight / 2 - e.pageY) / 20;
    card.style.transform = `rotateY(${yAxis}deg) rotateX(${xAxis}deg)`;
});

container.addEventListener('mouseenter', (e) => {
    card.style.transition = "none";

    images.style.transform = `translateZ(50px)`;
    grade.style.transform = `translateZ(80px)`;
    names.style.transform = 'translateZ(50px)';
    info.style.transform = 'translateZ(80px)';
    searchBtn.style.transform = 'translateZ(65px)';
});

container.addEventListener('mouseleave', (e) => {

    card.style.transition = "all 0.5s ease"
    card.style.transform = `rotateY(0deg) rotateX(0deg)`;

    images.style.transform = `translateZ(0px) rotateX(0deg)`
    grade.style.transform = `translateZ(1px)`
    names.style.transform = 'translateZ(0px)';
    info.style.transform = 'translateZ(0px)';
    searchBtn.style.transform = 'translateZ(0px)';
});