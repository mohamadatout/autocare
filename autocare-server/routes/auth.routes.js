const { Router } = require("express");
const router = Router();

const {
	register,
	login,
	googleLogin,
	googleRegister,
} = require("../controllers/auth.controller");

router.post("/register", register);
router.post("/googleRegister", googleRegister);
router.get("/login", login);
router.get("/googleLogin", googleLogin);

module.exports = router;
