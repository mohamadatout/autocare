import { ColorModeContext, useMode } from "./theme";
import { CssBaseline, ThemeProvider } from "@mui/material";
import Navbar from "./scenes/global/Navbar";
import Sidebar from "./scenes/global/Sidebar";
import { Route, Routes } from "react-router-dom";
import Dashboard from "./scenes/dashboard";
import Customer from "./scenes/users/customer";
import AllUsers from "./scenes/users/allUsers";
import Stores from "./scenes/users/stores";
import Form from "./scenes/addStoreForm";

function App() {
	const [theme, colorMode] = useMode();
	return (
		<ColorModeContext.Provider value={colorMode}>
			<ThemeProvider theme={theme}>
				<CssBaseline />
				<div className="app">
					<Sidebar />
					<main className="content">
						<Navbar />
						<Routes>
							<Route path="/" element={<Dashboard />}></Route>
							<Route path="/users" element={<AllUsers />}></Route>
							<Route path="/customers" element={<Customer />}></Route>
							<Route path="/stores" element={<Stores />}></Route>
							<Route path="/addStore" element={<Form />}></Route>
						</Routes>
					</main>
				</div>
			</ThemeProvider>
		</ColorModeContext.Provider>
	);
}

export default App;
