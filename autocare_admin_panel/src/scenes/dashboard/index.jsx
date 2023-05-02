import { Box, Button, Typography, useTheme } from "@mui/material";
import { tokens } from "../../theme";
import DownloadOutlinedIcon from "@mui/icons-material/DownloadOutlined";
import EmailIcon from "@mui/icons-material/Email";
import PointOfSaleIcon from "@mui/icons-material/PointOfSale";
import PersonAddIcon from "@mui/icons-material/PersonAdd";
import TrafficIcon from "@mui/icons-material/Traffic";
import Header from "../../components/Header";
import BarChart from "../../components/BarChart";
import StatBox from "../../components/StatBoc";
import PieChart from "../../components/Pie";

const Dashboard = () => {
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);

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
				gridAutoRows="140px"
				gap="20px">
				{/* ROW 1 */}
				<Box
					gridColumn="span 3"
					backgroundColor={colors.primary[400]}
					display="flex"
					alignItems="center"
					justifyContent="center">
					<StatBox
						title="20"
						subtitle="Customers"
						icon={
							<EmailIcon
								sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
							/>
						}
					/>
				</Box>
				<Box
					gridColumn="span 3"
					backgroundColor={colors.primary[400]}
					display="flex"
					alignItems="center"
					justifyContent="center">
					<StatBox
						title="50"
						subtitle="Stores"
						icon={
							<PointOfSaleIcon
								sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
							/>
						}
					/>
				</Box>
				<Box
					gridColumn="span 3"
					backgroundColor={colors.primary[400]}
					display="flex"
					alignItems="center"
					justifyContent="center">
					<StatBox
						title="33"
						subtitle="Subscribed Stores"
						icon={
							<PersonAddIcon
								sx={{ color: colors.greenAccent[600], fontSize: "26px" }}
							/>
						}
					/>
				</Box>
				<Box
					gridColumn="span 3"
					backgroundColor={colors.primary[400]}
					display="flex"
					alignItems="center"
					justifyContent="center">
					<StatBox
						title="17"
						subtitle="Unsubscribed Stores"
						icon={
							<TrafficIcon
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
