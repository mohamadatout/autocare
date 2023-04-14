exports.adminMiddleware = async (req, res, next) => {
	if (req.user.type === "admin") return next();

	return res.status(401).json({ message: "Unauthorized" });
};
