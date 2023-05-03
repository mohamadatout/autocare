import { configureStore } from "@reduxjs/toolkit";
import usersReducer from "../features/user/usersSlice";

export const store = configureStore({
	reducer: {
		users: usersReducer,
	},
});
