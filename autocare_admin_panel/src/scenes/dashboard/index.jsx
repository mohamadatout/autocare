import { Box, Typography, useTheme } from "@mui/material";
import { tokens } from "../../theme";
import Groups3Icon from "@mui/icons-material/Groups3";
import PersonIcon from "@mui/icons-material/Person";
import StorefrontIcon from "@mui/icons-material/Storefront";
import CheckIcon from "@mui/icons-material/Check";
import CloseIcon from "@mui/icons-material/Close";
import Header from "../../components/Header";
import BarChart from "../../components/BarChart";
import StatBox from "../../components/StatBoc";
import PieChart from "../../components/Pie";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchAllUsers } from "../../features/user/actions";

const Dashboard = () => {
	const dispatch = useDispatch();
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);
	useEffect(() => {
		dispatch(fetchAllUsers());
	}, []);
	const users = useSelector((state) => state.users);

	return (
		<Box m="20px">
			{/* HEADER */}
			<Box display="flex" justifyContent="space-between" alignItems="center">
				<Header title="DASHBOARD" subtitle="Welcome to your dashboard" />
			</Box>

			{/* GRID & CHARTS */}
			<Box
				display="grid"
				gridTemplateColumns="repeat(12, 1fr)"
				gridAutoRows="130px"
				gap="10px">
				{/* ROW 1 */}
				<Box
					gridColumn="span 4"
					backgroundColor={colors.primary[400]}
					display="flex"
					alignItems="center"
					justifyContent="center">
					<StatBox
						title={users.counters.stores + users.counters.customers}
						subtitle="All Users"
						icon={
							<Groups3Icon
								sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
							/>
						}
					/>
				</Box>
				<Box
					gridColumn="span 2"
					backgroundColor={colors.primary[400]}
					display="flex"
					alignItems="center"
					justifyContent="center">
					<StatBox
						title={users.counters.customers}
						subtitle="Customers"
						icon={
							<PersonIcon
								sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
							/>
						}
					/>
				</Box>
				<Box
					gridColumn="span 2"
					backgroundColor={colors.primary[400]}
					display="flex"
					alignItems="center"
					justifyContent="center">
					<StatBox
						title={users.counters.stores}
						subtitle="Stores"
						icon={
							<StorefrontIcon
								sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
							/>
						}
					/>
				</Box>
				<Box
					gridColumn="span 2"
					backgroundColor={colors.primary[400]}
					display="flex"
					alignItems="center"
					justifyContent="center">
					<StatBox
						title={users.counters.subscribed}
						subtitle="Subscribed Stores"
						icon={
							<CheckIcon
								sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
							/>
						}
					/>
				</Box>
				<Box
					gridColumn="span 2"
					backgroundColor={colors.primary[400]}
					display="flex"
					alignItems="center"
					justifyContent="center">
					<StatBox
						title={users.counters.unsubscribed}
						subtitle="Unsubscribed Stores"
						icon={
							<CloseIcon
								sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
							/>
						}
					/>
				</Box>

				{/* ROW 2 */}
				<Box
					gridColumn="span 6"
					gridRow="span 4"
					backgroundColor={colors.primary[400]}>
					<Typography
						variant="h5"
						fontWeight="600"
						sx={{ padding: "30px 30px 0 30px" }}>
						Accounts Summary
					</Typography>
					<Box height="55vh" mt="-20px">
						<BarChart isDashboard={true} />
					</Box>
				</Box>
				<Box
					gridColumn="span 6"
					gridRow="span 4"
					backgroundColor={colors.primary[400]}
					p="30px">
					<Typography variant="h5" fontWeight="600">
						Stores Summary
					</Typography>
					<Box height={"55vh"}>
						<PieChart />
					</Box>
				</Box>
			</Box>
		</Box>
	);
};

export default Dashboard;
