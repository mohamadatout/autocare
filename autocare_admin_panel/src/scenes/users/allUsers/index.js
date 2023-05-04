import { Box, Typography, useTheme } from "@mui/material";
import { DataGrid, GridToolbar } from "@mui/x-data-grid";
import { tokens } from "../../../theme";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import AdminPanelSettingsIcon from "@mui/icons-material/AdminPanelSettings";
import PersonIcon from "@mui/icons-material/Person";
import StorefrontIcon from "@mui/icons-material/Storefront";
import { useSelector } from "react-redux";
import Header from "../../../components/Header";

const AllUsers = () => {
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);
	const users = useSelector((state) => state.users);

	const columns = [
		{ field: "_id", headerName: "ID", flex: 1 },
		{
			field: "name",
			headerName: "Name",
			flex: 1,
			cellClassName: "name-column--cell",
		},
		{
			field: "email",
			headerName: "Email",
			flex: 1,
		},
		{
			field: "type",
			headerName: "Access Level",
			flex: 1,
			renderCell: ({ row: { type } }) => {
				return (
					<Box
						width="60%"
						// m="0 auto"
						p="5px"
						display="flex"
						justifyContent="center"
						backgroundColor={
							type === "admin"
								? colors.redAccent[500]
								: type === "customer"
								? colors.greenAccent[600]
								: colors.blueAccent[500]
						}
						borderRadius="4px">
						{type === "admin" && <AdminPanelSettingsIcon />}
						{type === "customer" && <PersonIcon />}
						{type === "store" && <StorefrontIcon />}
						<Typography color={colors.grey[100]} sx={{ ml: "5px" }}>
							{type}
						</Typography>
					</Box>
				);
			},
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
		/* // <Box m="20px">
		// 	<Header title="ALL USERS" subtitle="Managing  the Users" />
		// 	
		// 		m="40px 0 0 0"
		// 		height="75vh"
		// 		sx={{ */
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
		// 			rows={users.data}
		// 			columns={columns}
		// 			components={{ Toolbar: GridToolbar }}
		// 		/>
		// 	</Box>
		// </Box>
	);
};

export default AllUsers;
