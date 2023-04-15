const { Router } = require("express");
const router = Router();

const {
	sendMessage,
	getMessages,
	addItem,
} = require("../controllers/actions.controller");

router.post("/sendMessage", sendMessage);
router.post("/getMessages", getMessages);
router.post("/addItem", addItem);

module.exports = router;
