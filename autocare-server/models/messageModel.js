const mongoose = require("mongoose");

const messageSchema = new mongoose.Schema({
	user: {
		type: mongoose.Schema.Types.ObjectId,
		ref: "User",
		required: true,
	},
	store: {
		type: mongoose.Schema.Types.ObjectId,
		ref: "Store",
		required: true,
	},
	content: {
		type: String,
		required: true,
	},
	time: {
		type: Date,
	},
});

const Message = mongoose.model("Message", messageSchema);
module.exports = Message;
