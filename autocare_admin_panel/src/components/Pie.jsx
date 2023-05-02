import { ResponsivePie } from "@nivo/pie";
import { tokens } from "../theme";
import { useTheme } from "@mui/material";
import { mockPieData as data } from "../data/mockData";

const PieChart = () => {
	const theme = useTheme();
	const colors = tokens(theme.palette.mode);
	return (
		<ResponsivePie
			data={data}
			theme={{
				axis: {
					domain: {
						line: {
							stroke: colors.grey[100],
						},
					},
					legend: {
						text: {
							fill: colors.grey[100],
						},
					},
					ticks: {
						line: {
							stroke: colors.grey[100],
							strokeWidth: 1,
						},
						text: {
							fill: colors.grey[100],
						},
					},
				},
				legends: {
					text: {
						fill: colors.grey[100],
					},
				},
			}}
			margin={{ top: 10, right: 100, bottom: 80, left: 100 }}
			innerRadius={0.5}
			padAngle={0.7}
			cornerRadius={3}
			activeInnerRadiusOffset={20}
			activeOuterRadiusOffset={5}
			borderColor={{
				from: "color",
				modifiers: [["darker", 0.2]],
			}}
			arcLinkLabelsSkipAngle={10}
			arcLinkLabelsTextColor={colors.grey[100]}
			arcLinkLabelsThickness={2}
			arcLinkLabelsColor={{ from: "color" }}
			enableArcLabels={false}
			arcLabelsRadiusOffset={0.4}
			arcLabelsSkipAngle={7}
			arcLabelsTextColor={{
				from: "color",
				modifiers: [["darker", 2]],
			}}
			defs={[
				{
					id: "dots",
					type: "patternDots",
					background: "inherit",
					color: "rgba(255, 8, 65, 0.7)",
					size: 4,
					padding: 1,
					stagger: true,
				},
				{
					id: "lines",
					type: "patternLines",
					background: "inherit",
					color: "rgba(255, 255, 255, 0.3)",
					rotation: -45,
					lineWidth: 6,
					spacing: 10,
				},
			]}
			legends={[
				{
					anchor: "bottom",
					direction: "row",
					justify: false,
					translateX: 0,
					translateY: 56,
					itemsSpacing: 0,
					itemWidth: 150,
					itemHeight: 50,
					itemTextColor: "#999",
					itemDirection: "left-to-right",
					itemOpacity: 1,
					symbolSize: 18,
					symbolShape: "circle",
					effects: [
						{
							on: "hover",
							style: {
								itemTextColor: "#000",
							},
						},
					],
				},
			]}
		/>
	);
};

export default PieChart;
