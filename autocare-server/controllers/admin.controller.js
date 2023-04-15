const User = require("../models/userModel");
const bcrypt = require("bcrypt");

exports.newStore = async (req, res) => {
	const { name, email, password } = req.body;

	const existingStore = await User.findOne({ email });
	if (existingStore) {
		return res.status(409).json({
			message: "Email already associated with another account",
		});
	}

	const store = new User();
	const hashedPassword = await bcrypt.hash(password, 10);
	store.name = name;
	store.email = email;
	store.password = hashedPassword;
	store.type = "user";
	store.cover_img = "";
	store.logo_img = "";
	store.items = [];
	store.reviews = [];

	await store.save();

	const { password: newPassword, ...newStore } = store.toJSON();
	res.status(201).json(newStore);
};

exports.changeSubscription = async (req, res) => {
	const { _id } = req.body;

	const store = await User.findOne({ _id });
	const opposite = !store.subscription;

	const updatesStore = await User.findOneAndUpdate(
		{ _id },
		{ $set: { subscription: opposite } },
		{ new: true }
	);
	res.status(201).json(updatesStore);
};
