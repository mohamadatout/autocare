import {
	ADDSTORE,
	FETCHUSERS,
	FETCHUSERSERROR,
	FETCHUSERSSUCCESS,
	TOGGLESUBSCRIPTION,
} from "./constants";

const initstate = {
	data: [],
	loading: false,
	error: null,
	counters: {
		stores: 0,
		customer: 0,
		subscribed: 0,
		unsubscribed: 0,
	},
};

export const userReducer = (state = initstate, action) => {
	const { type, payload } = action;
	switch (type) {
		case FETCHUSERS:
			return {
				...state,
				loading: true,
			};

		case FETCHUSERSSUCCESS:
			return {
				...state,
				loading: false,
				data: payload.users,
				couters: payload.counters,
			};

		case FETCHUSERSERROR:
			return {
				...state,
				loading: false,
				error: payload.error,
			};

		case ADDSTORE:
			return {
				...state,
				data: [...state.data, payload.store],
				counters: { ...state.counters, stores: state.counters.stores + 1 },
			};

		case TOGGLESUBSCRIPTION:
			const counter = { ...state.counters };
			if (payload.subscription) {
				counter.subscribed++;
				counter.unsubscribed--;
			} else {
				counter.subscribed--;
				counter.unsubscribed++;
			}
			const updated = state.data.map((user) => {
				if (user._id === payload.id) {
					user.subscription = payload.subscription;
				}
				return user;
			});
			return {
				...state,
				data: updated,
				counters: counter,
			};

		default:
			return {
				...state,
			};
	}
};
