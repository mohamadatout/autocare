import { useState } from "react";
import { ProSidebar, Menu, MenuItem } from "react-pro-sidebar";
import { Box, IconButton, Typography, useTheme } from "@mui/material";
import { Link } from "react-router-dom";
import "react-pro-sidebar/dist/css/styles.css";
import { tokens } from "../../theme";
import MenuIcon from "@mui/icons-material/Menu";
import DashboardIcon from "@mui/icons-material/Dashboard";
import Groups3Icon from "@mui/icons-material/Groups3";
import PersonIcon from "@mui/icons-material/Person";
import StorefrontIcon from "@mui/icons-material/Storefront";
import PersonAddAlt1Icon from "@mui/icons-material/PersonAddAlt1";

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
	const [selected, setSelected] = useState("Dashboard");

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
				"& .pro-inner-item:hover": {
					color: "#868dfb !important",
				},
				"& .pro-menu-item.active": {
					color: "#6870fa !important",
				},
			}}>
			<ProSidebar collapsed={isCollapsed}>
				<Menu iconShape="square">
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
									AutoCare
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
									variant="h3"
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

						<Item
							title="All Users"
							to="/users"
							icon={<Groups3Icon />}
							selected={selected}
							setSelected={setSelected}
						/>
						<Item
							title="Customers"
							to="/customers"
							icon={<PersonIcon />}
							selected={selected}
							setSelected={setSelected}
						/>
						<Item
							title="Stores"
							to="/stores"
							icon={<StorefrontIcon />}
							selected={selected}
							setSelected={setSelected}
						/>
						<Item
							title="Add Store"
							to="/addStore"
							icon={<PersonAddAlt1Icon />}
							selected={selected}
							setSelected={setSelected}
						/>
					</Box>
				</Menu>
			</ProSidebar>
		</Box>
	);
};

export default Sidebar;
