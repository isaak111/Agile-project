module.exports = {
  showUser: showUser,
  showStats: showStats
};

const mysql  = require('mysql');
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

/*async function showUsers() {
    let sql = `CALL show_users(?);`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}*/

async function showProducts() {
    let sql = `CALL show_products();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

async function showUser(userId) {
  return new Promise((resolve, reject) => {
    db.query(`SELECT * FROM user_logins;`, (err, res) => {
      if (err) {
        reject(err);
      }
      resolve(res[userId - 1]);
    });
  });
}

async function showStats(userId) {
  return new Promise((resolve, reject) => {
    db.query(`SELECT
      level,
      experience,
      money,
      health,
      strength,
      agility,
      weapon_skill
      FROM user_stats;`, (err, res) => {
      if (err) {
        reject(err);
      }
      resolve(res[userId - 1]);
    });
  });
}
