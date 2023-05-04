import { combineReducers } from "@reduxjs/toolkit";
import { userReducer } from "../features/user/reducer";

export const mainReducer = combineReducers({
	users: userReducer,
});
