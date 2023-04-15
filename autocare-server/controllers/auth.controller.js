const User = require("../models/userModel");
const bcrypt = require("bcrypt");
const saltRounds = 10;
const jwt = require("jsonwebtoken");

exports.register = async (req, res) => {
	const { name, email, password, type } = req.body;

	const existingUser = await User.findOne({ email });

	if (existingUser) {
		return res.status(409).json({
			message: "Email already associated with another account",
		});
	}

	const user = new User();
	user.name = name;
	user.email = email;
	const hashedPassword = await bcrypt.hash(password, 10);
	user.password = hashedPassword;
	if (type) user.type = type;

	await user.save();

	const { password: newPassword, ...newUser } = user.toJSON();
	res.status(201).json(newUser);
};

exports.login = async (req, res) => {
	const { email, password } = req.body;
	const user = await User.findOne({ email });

	if (!user) return res.status(404).json({ message: "Invalid Credentials" });

	const isMatched = await bcrypt.compare(password, user.password);
	if (!isMatched)
		return res.status(404).json({ message: "Invalid Credentials" });

	const token = jwt.sign(
		{ id: user._id, name: user.name, email: user.email, type: user.type },
		process.env.SECRET_KEY
	);

	res.json({ token });
};
