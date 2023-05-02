import { Box, Typography, useTheme } from "@mui/material";
import { DataGrid, GridToolbar } from "@mui/x-data-grid";
import { tokens } from "../../../theme";
import { mockDataStores } from "../../../data/mockData";
import CheckIcon from "@mui/icons-material/Check";
import CloseIcon from "@mui/icons-material/Close";
import Header from "../../../components/Header";

const Stores = () => {
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);

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
		{
			field: "subscription",
			headerName: "Subscription",
			flex: 1,
			renderCell: ({ row: { subscription } }) => {
				return (
					<Box
						width="60%"
						// m="0 auto"
						p="5px"
						display="flex"
						justifyContent="center"
						backgroundColor={
							subscription === true
								? colors.greenAccent[600]
								: colors.redAccent[500]
						}
						borderRadius="4px">
						{subscription === true && <CheckIcon />}
						{subscription === false && <CloseIcon />}
						<Typography color={colors.grey[100]} sx={{ ml: "5px" }}>
							{subscription}
						</Typography>
					</Box>
				);
			},
		},
	];

	return (
		<Box m="20px">
			<Header title="STORES" subtitle="Managing the Store" />
			<Box
				m="40px 0 0 0"
				height="75vh"
				sx={{
					"& .MuiDataGrid-root": {
						border: "none",
					},
					"& .MuiDataGrid-cell": {
						borderBottom: "none",
					},
					"& .name-column--cell": {
						color: colors.greenAccent[300],
					},
					"& .MuiDataGrid-columnHeaders": {
						backgroundColor: colors.blueAccent[700],
						borderBottom: "none",
					},
					// "& .MuiDataGrid-virtualScroller": {
					// 	backgroundColor: colors.primary[400],
					// },
					"& .MuiDataGrid-footerContainer": {
						borderTop: "none",
						backgroundColor: colors.blueAccent[700],
					},
					"& .MuiCheckbox-root": {
						color: `${colors.greenAccent[200]} !important`,
					},
				}}>
				<DataGrid
					checkboxSelection
					rows={mockDataStores}
					columns={columns}
					components={{ Toolbar: GridToolbar }}
				/>
			</Box>
		</Box>
	);
};

export default Stores;
