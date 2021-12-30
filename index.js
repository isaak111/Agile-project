modules.export { showUsers };

/*(function () {*/


const mysql  = require("promise-mysql");
const config = require("./config/db/rpg_game.json");
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

async function showUsers() {
    let sql = `CALL show_users();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/*})();*/
