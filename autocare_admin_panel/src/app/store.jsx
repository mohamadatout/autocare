import { createStore, applyMiddleware } from "@reduxjs/toolkit";
import { mainReducer } from "./mainReducer";
import reduxlogger from "redux-logger";
import reduxthunk from "redux-thunk";

export const store = createStore(
	mainReducer,
	applyMiddleware(reduxlogger, reduxthunk)
);
