const { Router } = require("express");
const router = Router();

const {
	newStore,
	changeSubscription,
	getAllUsers,
} = require("../controllers/admin.controller");

router.post("/newStore", newStore);
router.post("/changeSubscription", changeSubscription);
router.get("/getAllUsers", getAllUsers);

module.exports = router;
