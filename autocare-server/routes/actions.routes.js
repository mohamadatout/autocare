const { Router } = require("express");
const router = Router();

const {
	sendMessage,
	getMessages,
	addItem,
	deleteItem,
} = require("../controllers/actions.controller");

router.post("/sendMessage", sendMessage);
router.post("/getMessages", getMessages);
router.post("/addItem", addItem);
router.delete("/deleteItem", deleteItem);

module.exports = router;
