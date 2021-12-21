/*let staticList = document.getElementById("static-list");
 let iconList = document.querySelector('#icon-list');

iconList.addEventListener('mouseover', function () {
    document.querySelector('icon-list-hidden').style.display = ""
})

staticList.addEventListener("mouseenter", function() {
    document.querySelector('#hover-list').style.display = "flex";
    staticList.style.display = "none";
})

staticList.addEventListener('mouseleave', function() {
    document.querySelector('#hover-list').style.display = "none";
    staticList.style.display = "flex";
})*/

let li = document.getElementsByClassName("li-class");

for (let i = 0; i < li.length; i++) {
  li[i].classList.add("pause");
}
console.log(li);

(function () {
  console.log("yolo");
})();
setTimeout(function(){
    document.body.className="";
    let li = document.getElementsByClassName("li-class");
    console.log(li);
    for(let i = 0; i < li.length; i++) {
      li.classList.remove("pause");
    }
},500);
