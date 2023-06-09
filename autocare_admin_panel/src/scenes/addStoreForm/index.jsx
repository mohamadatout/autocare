import { Box, Button, TextField } from "@mui/material";
import { Formik } from "formik";
import * as yup from "yup";
import useMediaQuery from "@mui/material/useMediaQuery";
import Header from "../../components/Header";
import axios from "axios";
import { useState } from "react";
import { useDispatch } from "react-redux";
import { createStore } from "../../features/user/actions";

const Form = () => {
	const dispatch = useDispatch();
	const isNonMobile = useMediaQuery("(min-width:600px)");

	const handleFormSubmit = async (values) => {
		dispatch(createStore(values));
	};
	return (
		<Box m="20px">
			<Header title="CREATE STORE" subtitle="Create a New Store Account" />

			<Formik
				onSubmit={handleFormSubmit}
				initialValues={initialValues}
				validationSchema={checkoutSchema}>
				{({
					values,
					errors,
					touched,
					handleBlur,
					handleChange,
					handleSubmit,
				}) => (
					<form onSubmit={handleSubmit}>
						<Box
							display="grid"
							gap="30px"
							gridTemplateColumns="repeat(4, minmax(0, 1fr))"
							sx={{
								"& > div": { gridColumn: isNonMobile ? undefined : "span 4" },
							}}>
							<TextField
								fullWidth
								variant="filled"
								type="text"
								label="Store Name"
								onBlur={handleBlur}
								onChange={handleChange}
								value={values.name}
								name="name"
								error={!!touched.name && !!errors.name}
								helperText={touched.name && errors.name}
								sx={{ gridColumn: "span 4" }}
							/>
							<TextField
								fullWidth
								variant="filled"
								type="text"
								label="Email"
								onBlur={handleBlur}
								onChange={handleChange}
								value={values.email}
								name="email"
								error={!!touched.email && !!errors.email}
								helperText={touched.email && errors.email}
								sx={{ gridColumn: "span 4" }}
							/>
							<TextField
								fullWidth
								variant="filled"
								type="text"
								label="Password"
								onBlur={handleBlur}
								onChange={handleChange}
								value={values.password}
								name="password"
								error={!!touched.password && !!errors.password}
								helperText={touched.password && errors.password}
								sx={{ gridColumn: "span 4" }}
							/>
						</Box>
						<Box display="flex" justifyContent="end" mt="20px">
							<Button type="submit" color="secondary" variant="contained">
								Create New User
							</Button>
						</Box>
					</form>
				)}
			</Formik>
		</Box>
	);
};

const checkoutSchema = yup.object().shape({
	name: yup.string().required("required"),
	email: yup.string().email("invalid email").required("required"),
	password: yup.string().required("required"),
});
const initialValues = {
	name: "",
	email: "",
	password: "",
};

export default Form;
