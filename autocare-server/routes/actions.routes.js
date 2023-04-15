const { Router } = require("express");
const router = Router();

const { sendMessage } = require("../controllers/actions.controller");

router.post("/sendMessage", sendMessage);

module.exports = router;
