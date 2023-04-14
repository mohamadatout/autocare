const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
	name: {
		type: String,
		required: true,
	},
	email: {
		type: String,
		required: true,
		unique: true,
	},
	password: {
		type: String,
		required: true,
	},
	image: {
		type: String,
	},
	type: {
		type: String,
		enum: ["customer", "admin"],
		default: "customer",
	},
	favourites: {
		type: Array,
	},
});

const User = mongoose.model("User", userSchema);
module.exports = User;
