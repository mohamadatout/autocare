const { measureMemory } = require("vm");
const Message = require("../models/messageModel");
const User = require("../models/userModel");
const { log } = require("console");

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
	const { id } = req.body;
	const name = req.body.name;
	const made = req.body.made;
	const model = req.body.model;
	const year = req.body.year;
	const price = req.body.price;
	const image = req.body.image;
	const category = req.body.category;

	const user = await User.findById(id);

	try {
		console.log(req.body);
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
		return res.json({ item: user.items[user.items.length - 1] });
	} catch (error) {
		console.log(error);
	}
};

exports.deleteItem = async (req, res) => {
	const { user, itemId } = req.body;

	const store = await User.findById(user);

	let items = store.items.filter((item) => item._id != itemId);
	store.items = items;
	await store.save();

	res.json(store);
};

exports.getStores = async (req, res) => {
	const stores = await User.find({ type: "user" });
	res.json(stores);
};

exports.getItemsOfStore = async (req, res) => {
	const user = req.body.user;

	const store = await User.findById(user);

	if (store) {
		res.json(store.items);
	}
};

exports.writeReview = async (req, res) => {
	const { user, customer, review } = req.body;

	const store = await User.findById(user);

	store.reviews.push({
		customer,
		review,
	});

	await store.save();

	const updated = await User.findById(user)
		.populate({
			path: "reviews.customer",
			model: "User",
			select: "name",
		})
		.exec();
	res.json(updated);
};

exports.getReviews = async (req, res) => {
	const { user } = req.body;

	const store = await User.findById(user);

	res.json(store.reviews);
};

exports.addFavourite = async (req, res) => {
	const { customer, user, item } = req.body;

	const custmer = await User.findById(customer);
	const store = await User.findById(user);
	let favItem = store.items.filter((each) => each.id == item)[0];

	const favourited = custmer.favourites.some((item) => item._id == favItem.id);

	if (favourited) {
		let newFav = custmer.favourites.filter((item) => item._id != favItem.id);
		custmer.favourites = newFav;
		await custmer.save();
		res.json({
			message: "Item removed from favourites",
			user: custmer,
		});
	} else {
		custmer.favourites.push(favItem);
		await custmer.save();
		res.json({
			message: "Item added to favourites",
			user: custmer,
		});
	}
};

exports.getFavourites = async (req, res) => {
	const { customer } = req.body;

	const user = await User.findById(customer);

	res.json(user.favourites);
};
