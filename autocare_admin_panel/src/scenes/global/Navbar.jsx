import { Box, IconButton, useTheme } from "@mui/material";
import { useContext } from "react";
import { ColorModeContext, tokens } from "../../theme";
import DarkModeIcon from "@mui/icons-material/DarkMode";
import LightModeIcon from "@mui/icons-material/LightMode";

const Navbar = () => {
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);
	const colorMode = useContext(ColorModeContext);
	return (
		<Box display={"flex"} justifyContent={"end"} p={2}>
			<Box display={"flex"}>
				<IconButton onClick={colorMode.toggleColorMode}>
					{theme.palette.mode == "dark" ? <DarkModeIcon /> : <LightModeIcon />}
				</IconButton>
			</Box>
		</Box>
	);
};

export default Navbar;
