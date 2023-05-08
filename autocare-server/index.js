const express = require("express");
const app = express();
const cors = require("cors");
require("dotenv").config();
app.use(express.json());
app.use(cors());

const { adminMiddleware } = require("./middlewares/admin.middleware");
const { storeAuthMiddleware } = require("./middlewares/storeAuth.middleware");
const { userAuthMiddleware } = require("./middlewares/userAuth.middleware");

const authRouter = require("./routes/auth.routes");
app.use("/auth", authRouter);

const adminRouter = require("./routes/admin.routes");
app.use("/admin", adminRouter);

const actionsRouter = require("./routes/actions.routes");
app.use("/actions", actionsRouter);

app.listen(process.env.PORT, (err) => {
	if (err) console.error(err);
	console.log("Server is running on port ", process.env.PORT);
	require("./configs/db.config");
});
