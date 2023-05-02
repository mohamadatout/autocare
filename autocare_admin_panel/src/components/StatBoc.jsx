import { Box, Typography, useTheme } from "@mui/material";
import { tokens } from "../theme";

const StatBox = ({ title, subtitle, icon }) => {
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);

	return (
		<Box
			width="80%"
			height="80%"
			display={"flex"}
			flexDirection={"column"}
			justifyContent={"space-evenly"}
			alignItems={"center"}>
			<Box
				padding={"5px"}
				display={"flex"}
				flexDirection={"column"}
				justifyContent={"center"}
				alignItems={"center"}>
				{icon}
			</Box>
			<Typography
				display={"flex"}
				flexDirection={"column"}
				justifyContent={"center"}
				alignItems={"center"}
				variant="h4"
				fontWeight="bold"
				sx={{ color: colors.grey[100] }}>
				{title}
			</Typography>

			<Box display="flex" justifyContent="space-between" mt="2px">
				<Typography variant="h5" sx={{ color: colors.greenAccent[500] }}>
					{subtitle}
				</Typography>
			</Box>
		</Box>
	);
};

export default StatBox;
