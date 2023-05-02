import { useState } from "react";
import {
	ProSideBar,
	Menu,
	MenuItem,
	ProSidebarProvider,
} from "react-pro-sidebar";
import { Box, IconButton, Typography, useTheme } from "@mui/material";
import { Link } from "react-router-dom";
import { tokens } from "../../theme";
import DashboardIcon from "@mui/icons-material/Dashboard";
import PersonIcon from "@mui/icons-material/Person";
import StorefrontIcon from "@mui/icons-material/Storefront";
import PersonAddIcon from "@mui/icons-material/PersonAdd";
import MenuIcon from "@mui/icons-material/Menu";
import GroupsIcon from "@mui/icons-material/Groups";

const Item = ({ title, to, icon, selected, setSelected }) => {
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);
	return (
		<MenuItem
			active={selected === title}
			style={{
				color: colors.grey[100],
			}}
			onClick={() => setSelected(title)}
			icon={icon}>
			<Typography>{title}</Typography>
			<Link to={to} />
		</MenuItem>
	);
};

const Sidebar = () => {
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);
	const [isCollapsed, setIsCollapsed] = useState(false);
	const [selected, setSelected] = useState("Dahsboard");

	return (
		<Box
			sx={{
				"& .pro-sidebar-inner": {
					background: `${colors.primary[400]} !important`,
				},
				"& .pro-icon-wrapper": {
					backgroundColor: "transparent !important",
				},
				"& .pro-inner-item": {
					padding: "5px 35px 5px 20px !important",
				},
				"&.pro-inner-item:hover": {
					color: "red !important",
				},
				"&.pro-menu-item.active": {
					color: "red !important",
				},
				".ps-menu-button:hover": {
					"&:hover": {
						backgroundColor: `${colors.grey[900]} !important`,
					},
				},
			}}>
			<ProSidebarProvider collapsed={isCollapsed}>
				<Menu iconShape="square">
					{/* LOGO AND MENU ICON */}
					<MenuItem
						onClick={() => setIsCollapsed(!isCollapsed)}
						icon={isCollapsed ? <MenuIcon /> : undefined}
						style={{
							margin: "10px 0 20px 0",
							color: colors.grey[100],
						}}>
						{!isCollapsed && (
							<Box
								display="flex"
								justifyContent="space-between"
								alignItems="center"
								ml="15px">
								<Typography variant="h3" color={colors.grey[100]}>
									ADMINIS
								</Typography>
								<IconButton onClick={() => setIsCollapsed(!isCollapsed)}>
									<MenuIcon />
								</IconButton>
							</Box>
						)}
					</MenuItem>

					{!isCollapsed && (
						<Box mb="25px">
							<Box textAlign="center">
								<Typography
									variant="h2"
									color={colors.grey[100]}
									fontWeight="bold"
									sx={{ m: "10px 0 0 0" }}>
									Mohamad Atout
								</Typography>
							</Box>
						</Box>
					)}

					<Box paddingLeft={isCollapsed ? undefined : "10%"}>
						<Item
							title="Dashboard"
							to="/"
							icon={<DashboardIcon />}
							selected={selected}
							setSelected={setSelected}
						/>

						<Typography
							variant="h6"
							color={colors.grey[300]}
							sx={{ m: "15px 0 5px 20px" }}>
							Managment
						</Typography>
						<Item
							title="All Users"
							to="/team"
							icon={<GroupsIcon />}
							selected={selected}
							setSelected={setSelected}
						/>
						<Item
							title="Customer"
							to="/team"
							icon={<PersonIcon />}
							selected={selected}
							setSelected={setSelected}
						/>
						<Item
							title="Stores"
							to="/contacts"
							icon={<StorefrontIcon />}
							selected={selected}
							setSelected={setSelected}
						/>
						<Item
							title="Add Store"
							to="/invoices"
							icon={<PersonAddIcon />}
							selected={selected}
							setSelected={setSelected}
						/>
					</Box>
				</Menu>
			</ProSidebarProvider>
		</Box>
	);
};

export default Sidebar;
