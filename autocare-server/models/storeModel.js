const { Double } = require("bson");
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

const storeSchema = new mongoose.Schema({
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
	cover_img: {
		type: String,
	},
	logo_img: {
		type: String,
	},
	subscription: {
		type: Boolean,
		default: true,
		required: true,
	},
	items: [itemSchema],
	reviews: [reviewSchema],
});

const Store = mongoose.model("Store", storeSchema);
module.exports = Store;
