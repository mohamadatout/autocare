const { measureMemory } = require("vm");
const Message = require("../models/messageModel");
const User = require("../models/userModel");

exports.sendMessage = async (req, res) => {
	const { customer, user, content, sender } = req.body;

	const message = new Message();
	message.customer = customer;
	message.user = user;
	message.content = content;
	message.sender = sender;
	message.time = Date.now();

	await message.save();

	res.status(201).json(message);
};

exports.getMessages = async (req, res) => {
	const { customer, user } = req.body;

	const messages = await Message.find({ customer, user })
		.populate("customer", "-password")
		.populate("user", "-password");

	if (messages) {
		res.json({
			allMessage: messages,
		});
	}
};

exports.addItem = async (req, res) => {
	const { id, name, made, model, year, price, image, category } = req.body;

	const user = await User.findById(id);

	user.items.push({
		name,
		made,
		model,
		year,
		price,
		image,
		category,
	});

	await user.save();
	res.json(user);
};
