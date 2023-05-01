import { Box, IconButton, useTheme } from "@mui/material";
import { useContext } from "react";
import { ColorModeContext, tokens } from "../../theme";
import { InputBase } from "@mui/material";
import { dark } from "@mui/material/styles/createPalette";
import SearchIcon from "@mui/icons-material/Search";
import DarkModeIcon from "@mui/icons-material/DarkMode";
import LightModeIcon from "@mui/icons-material/LightMode";

const Navbar = () => {
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);
	const colorMode = useContext(ColorModeContext);
	return (
		<Box display={"flex"} justifyContent={"space-between"} p={2}>
			<Box
				display={"flex"}
				borderRadius={"3px"}
				backgroundColor={colors.primary[400]}>
				<InputBase sx={{ ml: 2, flex: 1 }} placeholder="Search"></InputBase>
				<IconButton type="button" sx={{ p: 1 }}>
					<SearchIcon />
				</IconButton>
			</Box>

			<Box display={"flex"}>
				<IconButton onClick={colorMode.toggleColorMode}>
					{theme.palette.mode == "dark" ? <DarkModeIcon /> : <LightModeIcon />}
				</IconButton>
			</Box>
		</Box>
	);
};

export default Navbar;
