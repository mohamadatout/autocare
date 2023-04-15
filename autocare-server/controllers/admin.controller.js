const Store = require("../models/storeModel");
const bcrypt = require("bcrypt");

exports.newStore = async (req, res) => {
	const { name, email, password } = req.body;

	const existingStore = await Store.findOne({ email });
	if (existingStore) {
		return res.status(409).json({
			message: "Email already associated with another account",
		});
	}

	const store = new Store();
	const hashedPassword = await bcrypt.hash(password, 10);
	store.name = name;
	store.email = email;
	store.password = hashedPassword;
	store.cover_img = "";
	store.logo_img = "";
	store.items = [];
	store.reviews = [];

	await store.save();

	const { password: newPassword, ...newStore } = store.toJSON();
	res.status(201).json(newStore);
};