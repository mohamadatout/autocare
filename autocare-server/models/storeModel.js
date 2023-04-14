const { Double } = require("bson");
const mongoose = require("mongoose");

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
		type: Text,
	},
	logo_img: {
		type: Text,
	},
	subscription: {
		type: Boolean,
		required: true,
	},
	items: [itemSchema],
});

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
		type: Double,
	},
	image: {
		type: Text,
	},
	category: {
		type: String,
		enum: ["Interior", "Exterior", "Motor", "Parts", "Washing"],
		required: true,
	},
});

const Store = mongoose.model("Store", storeSchema);
module.exports = Store;
