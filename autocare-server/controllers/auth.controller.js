const User = require("../models/userModel");
const bcrypt = require("bcrypt");
const saltRounds = 10;

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
	user.favourites = [];
	if (type) user.type = type;

	await user.save();

	const { password: newPassword, ...newUser } = user.toJSON();
	res.status(201).json(newUser);
};
