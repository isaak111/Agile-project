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
(function () {

const mysql  = require("promise-mysql");
const config = require("../config/db/rpg_game.json");
let db;

/**
  * Main function.
  * @async
  * @returns void
  */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();


setTimeout(function(){
    document.body.className="";
},1000);

})();
