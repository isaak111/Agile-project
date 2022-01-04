/**
 * Route for bank.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const rpg_game   = require("../src/rpg_game.js");
const sitename   = "| not Star wars TM";

module.exports = router;

router.get("/", async (req, res) => {
    let data = {
        title: `Welcome ${sitename}`
    };

    data.res = await rpg_game.showUser(1);

    res.render("../views/index", data);
});

router.get("/landing", async (req, res) => {
    let data = {
        title: `Product categories ${sitename}`
    };

    data.res = await rpg_game.showUser(2);
    
    /*console.log(data);*/

    res.render("../views/landing", data);
});

router.post("/edit/cykel", async (req, res) => {
    await rpg_game.editCykel(req.body);

    res.redirect("../views/index");
});
