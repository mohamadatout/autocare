const mongoose = require("mongoose");

const itemSchema = new mongoose.Schema({
	name: {
		type: String,
		required: true,
	},
	made: {
		type: String,
	},
	model: {
		type: String,
	},
	year: {
		type: String,
	},
	price: {
		type: Number,
		required: true,
	},
	image: {
		type: String,
	},
	category: {
		type: String,
		enum: ["Interior", "Exterior", "Motor", "Parts", "Washing"],
		required: true,
	},
});

const reviewSchema = new mongoose.Schema({
	user: {
		type: mongoose.Schema.Types.ObjectId,
		ref: "User",
		required: true,
	},
	review: {
		type: String,
		required: true,
	},
});

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
	type: {
		type: String,
		enum: ["customer", "user", "admin"],
		default: "customer",
	},
	subscription: {
		type: Boolean,
		default: true,
		required: true,
	},
	image: {
		type: String,
	},
	favourites: {
		type: Array,
		default: null,
	},
	items: {
		type: [itemSchema],
		default: null,
	},
	reviews: {
		type: [reviewSchema],
		default: null,
	},
});

const User = mongoose.model("User", userSchema);
module.exports = User;
