streets.trafficlights.register_trafficlight({
	name = "vertical",
	description = "Traffic Light",
	aspects = 3,
	default = {
		aspect_1 = "streets_trafficlight_red_off.png",
		aspect_2 = "streets_trafficlight_yellow_off.png",
		aspect_3 = "streets_trafficlight_green_off.png",
	},
	phases = {
		red = {
			aspect_1 = "streets_trafficlight_red_on.png",
		},
		yellow = {
			aspect_2 = "streets_trafficlight_yellow_on.png",
		},
		green = {
			aspect_3 = "streets_trafficlight_green_on.png",
		},
		flashred = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_red_flashing.png"),
		},
		flashyellow = {
			aspect_2 = streets.helpers.animation("streets_trafficlight_yellow_flashing.png"),
		},
		flashgreen = {
			aspect_3 = streets.helpers.animation("streets_trafficlight_green_flashing.png"),
		},
		redyellow = {
			aspect_1 = "streets_trafficlight_red_on.png",
			aspect_2 = "streets_trafficlight_yellow_on.png",
		},
		yellowgreen = {
			aspect_2 = "streets_trafficlight_yellow_on.png",
			aspect_3 = "streets_trafficlight_green_on.png",
		},
	}
})

streets.trafficlights.register_trafficlight({
	name = "beacon",
	description = "Beacon",
	aspects = 1,
	default = {
		aspect_1 = "streets_trafficlight_white_off.png",
	},
	phases = {
		red = {
			aspect_1 = "streets_trafficlight_red_on.png",
		},
		yellow = {
			aspect_1 = "streets_trafficlight_yellow_on.png",
		},
		green = {
			aspect_1 = "streets_trafficlight_green_on.png",
		},
		flashred = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_red_flashing.png"),
		},
		flashyellow = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_yellow_flashing.png"),
		},
		flashgreen = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_green_flashing.png"),
		},
	}
})

local on_mask = function(tex, mask)
	return "^(" .. tex .. "^" .. mask .. "^[makealpha:255,0,255)"
end

streets.trafficlights.register_trafficlight({
	name = "pedestrians_us",
	description = "Pedestrian Traffic Light (US-Style)",
	aspects = 2,
	default = {
		aspect_1 = "streets_trafficlight_red_off.png^streets_trafficlights_mask_hand_off.png",
		aspect_2 = "streets_trafficlight_white_off.png^streets_trafficlights_mask_pedestrian_green_off.png",
	},
	phases = {
		red = {
			aspect_1 = "streets_trafficlight_red_off.png^[resize:32x32" .. on_mask("streets_trafficlight_red_on.png", "streets_trafficlights_mask_hand_on.png"),
		},
		green = {
			aspect_2 = "streets_trafficlight_white_off.png^[resize:32x32" .. on_mask("streets_trafficlight_white_on.png", "streets_trafficlights_mask_pedestrian_green_on.png"),
		},
		flashred = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_red_off_flashing.png^[resize:32x64" .. on_mask(
				"streets_trafficlight_red_flashing.png", "streets_trafficlights_mask_hand_flashing.png")),
		},
		flashgreen = {
			aspect_2 = streets.helpers.animation("streets_trafficlight_white_off_flashing.png^[resize:32x64" .. on_mask(
				"streets_trafficlight_white_flashing.png", "streets_trafficlights_mask_pedestrian_green_flashing.png")),
		},
	}
})
