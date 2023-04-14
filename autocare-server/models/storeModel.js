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
		required: true,
	},
	items: [itemSchema],
});

const Store = mongoose.model("Store", storeSchema);
module.exports = Store;
