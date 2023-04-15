const mongoose = require("mongoose");

const messageSchema = new mongoose.Schema({
	customer: {
		type: mongoose.Schema.Types.ObjectId,
		ref: "User",
		required: true,
	},
	user: {
		type: mongoose.Schema.Types.ObjectId,
		ref: "User",
		required: true,
	},
	content: {
		type: String,
		required: true,
	},
	sender: {
		type: String,
		enum: ["user", "customer"],
		required: true,
	},
	time: {
		type: Date,
	},
});

const Message = mongoose.model("Message", messageSchema);
module.exports = Message;
