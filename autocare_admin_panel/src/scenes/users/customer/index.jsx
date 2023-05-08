import { Box, Typography, useTheme } from "@mui/material";
import { DataGrid, GridToolbar } from "@mui/x-data-grid";
import { tokens } from "../../../theme";
import { mockDataCustomers } from "../../../data/mockData";
import AdminPanelSettingsIcon from "@mui/icons-material/AdminPanelSettings";
import PersonIcon from "@mui/icons-material/Person";
import StorefrontIcon from "@mui/icons-material/Storefront";
import Header from "../../../components/Header";
import { useSelector } from "react-redux";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";

const Customer = () => {
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);
	const users = useSelector((state) => state.users);

	const columns = [
		{ field: "id", headerName: "ID" },
		{
			field: "name",
			headerName: "Name",
			flex: 1,
			cellClassName: "name-column--cell",
		},
		{
			field: "age",
			headerName: "Age",
			type: "number",
			headerAlign: "left",
			align: "left",
		},
		{
			field: "phone",
			headerName: "Phone Number",
			flex: 1,
		},
		{
			field: "email",
			headerName: "Email",
			flex: 1,
		},
	];

	return (
		<Box m="20px">
			<Header title="ALL USERS" subtitle="Managing  the Users" />
			<TableContainer>
				<Table>
					<TableHead>
						<TableRow>
							<TableCell>
								<p>ID</p>
							</TableCell>
							<TableCell>
								<p>Name</p>
							</TableCell>
							<TableCell>
								<p>Email</p>
							</TableCell>
							<TableCell>
								<p>Subscription</p>
							</TableCell>
						</TableRow>
					</TableHead>
					<TableBody>
						{users.data.map((user) => {
							return (
								<TableRow>
									<TableCell>{user._id}</TableCell>

									<TableCell>{user.name}</TableCell>

									<TableCell>{user.email}</TableCell>

									<TableCell>
										{/* <button
										onClick={() => {
											dispatch(toggleUserSubscription(user._id));
										}}>
										{user.subscription ? "Subscribed" : "Unsubscribed"}
									</button> */}
									</TableCell>
								</TableRow>
							);
						})}
					</TableBody>
				</Table>
			</TableContainer>
		</Box>
		// <Box m="20px">
		// 	<Header title="CUSTOMERS" subtitle="Managing the Customers" />
		// 	<Box
		// 		m="40px 0 0 0"
		// 		height="75vh"
		// 		sx={{
		// 			"& .MuiDataGrid-root": {
		// 				border: "none",
		// 			},
		// 			"& .MuiDataGrid-cell": {
		// 				borderBottom: "none",
		// 			},
		// 			"& .name-column--cell": {
		// 				color: colors.greenAccent[300],
		// 			},
		// 			"& .MuiDataGrid-columnHeaders": {
		// 				backgroundColor: colors.blueAccent[700],
		// 				borderBottom: "none",
		// 			},
		// 			// "& .MuiDataGrid-virtualScroller": {
		// 			// 	backgroundColor: colors.primary[400],
		// 			// },
		// 			"& .MuiDataGrid-footerContainer": {
		// 				borderTop: "none",
		// 				backgroundColor: colors.blueAccent[700],
		// 			},
		// 			"& .MuiCheckbox-root": {
		// 				color: `${colors.greenAccent[200]} !important`,
		// 			},
		// 		}}>
		// 		<DataGrid
		// 			checkboxSelection
		// 			rows={mockDataCustomers}
		// 			columns={columns}
		// 			components={{ Toolbar: GridToolbar }}
		// 		/>
		// 	</Box>
		// </Box>
	);
};

export default Customer;
