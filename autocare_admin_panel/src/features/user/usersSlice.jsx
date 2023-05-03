import { createSlice } from "@reduxjs/toolkit";
import { nanoid } from "@reduxjs/toolkit";

const initialState = [];

const users = [
	{
		_id: "643a775ee359c62acb943d97",
		type: "admin",
		subscription: true,
		favourites: [],
		items: [],
		reviews: [],
		name: "Taha Taha",
		email: "taha.taha@gmail.com",
		password: "$2b$10$TKggXoz7hDYf9/lLVMDpW.p711D.rb7sKHp30EFaTuwQJ4V3aurQ2",
		__v: 0,
	},
	{
		_id: "643a775ee35b943d97",
		type: "store",
		subscription: true,
		favourites: [],
		items: [],
		reviews: [],
		name: "Mhmd Atout",
		email: "mhmd.atout@gmail.com",
		password: "$2b$10$TKggXoz7hDYf9/lLVMDpW.p711D.rb7sKHp30EFaTuwQJ4V3aurQ2",
		__v: 0,
	},
	{
		_id: "643a775ee359",
		type: "customer",
		subscription: true,
		favourites: [],
		items: [],
		reviews: [],
		name: "Mhmd Agha",
		email: "mhmd.agha@gmail.com",
		password: "$2b$10$TKggXoz7hDYf9/lLVMDpW.p711D.rb7sKHp30EFaTuwQJ4V3aurQ2",
		__v: 0,
	},
];

users.forEach((user) => {
	user.id = nanoid();
	initialState.push(user);
	console.log();
});

const usersSlice = createSlice({
	name: "users",
	initialState,
	reducers: {},
});

export const selectAllUsers = (state) => state.users;
export default usersSlice.reducer;
