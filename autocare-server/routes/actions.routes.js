const { Router } = require("express");
const router = Router();

const {
	sendMessage,
	getMessages,
} = require("../controllers/actions.controller");

router.post("/sendMessage", sendMessage);
router.post("/getMessages", getMessages);

module.exports = router;
