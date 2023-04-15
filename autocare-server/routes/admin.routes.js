const { Router } = require("express");
const router = Router();

const { newStore } = require("../controllers/admin.controller");

router.post("/newStore", newStore);

module.exports = router;
