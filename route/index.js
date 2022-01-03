/**
 * Route for bank.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const rpg_game   = require("../src/rpg_game.js");
const sitename   = "| Cyklarens Van";

module.exports = router;

router.get("/index", (req, res) => {
    let data = {
        title: `Welcome ${sitename}`
    };

    res.render("../views/index", data);
});

router.post("/edit/cykel", async (req, res) => {
    await rpg_game.editCykel(req.body);

    res.redirect("../views/index");
});

/**
 * General routes.
 */
/*"use strict";

const express = require("express");
const router  = express.Router();

// Add a route for the path /
router.get("/", (req, res) => {
    res.send("Hello World");
});

// Add a route for the path /about
router.get("/about", (req, res) => {
    res.send("About something");
});

module.exports = router;*/
