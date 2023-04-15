const { Router } = require("express");
const router = Router();

const {
	newStore,
	changeSubscription,
} = require("../controllers/admin.controller");

router.post("/newStore", newStore);
router.post("/changeSubscription", changeSubscription);

module.exports = router;
