import {
	ADDSTORE,
	FETCHUSERS,
	FETCHUSERSERROR,
	FETCHUSERSSUCCESS,
	TOGGLESUBSCRIPTION,
} from "./constants";
import axios from "axios";
import { nanoid } from "@reduxjs/toolkit";

export const fetchUsers = () => ({
	type: FETCHUSERS,
});
export const usersSuccess = (users, counters) => ({
	type: FETCHUSERSSUCCESS,
	payload: { users, counters },
});
export const userError = (error) => ({
	type: FETCHUSERSERROR,
	payload: { error },
});
export const addStore = (store) => ({
	type: ADDSTORE,
	payload: { store },
});
export const toggleSubscription = (id, subscription) => ({
	type: TOGGLESUBSCRIPTION,
	payload: { id, subscription },
});

export const fetchAllUsers = () => {
	return (dispatch) => {
		dispatch(fetchUsers());
		axios
			.get("http://127.0.0.1:8000/admin/getAllUsers")
			.then((res) => {
				const counter = {
					customers: 0,
					stores: 0,
					unsubscribed: 0,
					subscribed: 0,
				};
				const users = res.data;
				users.forEach((user) => {
					console.log(user);
					user.id = nanoid();
					if (user.type === "customer") {
						counter.customers++;
					} else if (user.type === "user") {
						counter.stores++;
					}
					if (user.type == "user") {
						if (user.subscription) {
							counter.subscribed++;
						} else {
							counter.unsubscribed++;
						}
					}
				});
				dispatch(usersSuccess(res.data, counter));
			})
			.catch((error) => {
				dispatch(userError(error));
			});
	};
};

export const createStore =
	({ name, email, password }) =>
	(dispatch) => {
		axios
			.post("http://localhost:8000/admin/newStore", {
				name,
				email,
				password,
			})
			.then((res) => dispatch(addStore(res.data)));
	};

export const toggleUserSubscription = (storeId) => {
	return (dispatch) => {
		axios
			.post("http://127.0.0.1:8000/admin/changeSubscription", {
				_id: storeId,
			})
			.then((res) => {
				dispatch(toggleSubscription(storeId, res.data.subscription));
			})
			.catch((error) => {
				console.log(error);
			});
	};
};
