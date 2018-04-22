streets.trafficlights.register_trafficlight({
	name = "hybrid_beacon",
	description = "Hybrid Beacon",
	hybrid = true,
	default = {
		aspect_1 = "streets_trafficlight_red_off.png",
		aspect_2 = "streets_trafficlight_red_off.png",
		aspect_3 = "streets_trafficlight_yellow_off.png",
	},
	phases = {
		red = {
			aspect_1 = "streets_trafficlight_red_on.png",
			aspect_2 = "streets_trafficlight_red_on.png",
		},
		yellow = {
			aspect_3 = "streets_trafficlight_yellow_on.png",
		},
		flashyellow = {
			aspect_3 = streets.helpers.animation("streets_trafficlight_yellow_flashing.png"),
		},
		flashred = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_red_flashing.png"),
			aspect_2 = streets.helpers.animation("streets_trafficlight_red_flashing.png^[transformR180"),
		},
	}
})

streets.trafficlights.register_trafficlight({
	name = "horizontal",
	description = "Horizontal Traffic Light",
	horizontal = true,
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
	name = "alternating_warning",
	description = "Alternating Warning Light",
	horizontal = true,
	aspects = 3,
	default = {
		aspect_1 = "streets_trafficlight_yellow_off.png",
		aspect_2 = "streets_transparent.png",
		aspect_3 = "streets_trafficlight_yellow_off.png",
	},
	phases = {
		red = {
			aspect_1 = "streets_trafficlight_red_on.png",
			aspect_3 = "streets_trafficlight_red_on.png",
		},
		yellow = {
			aspect_1 = "streets_trafficlight_yellow_on.png",
			aspect_3 = "streets_trafficlight_yellow_on.png",
		},
		flashred = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_red_flashing.png"),
			aspect_3 = streets.helpers.animation("streets_trafficlight_red_flashing.png^[transformR180"),
		},
		flashyellow = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_yellow_flashing.png"),
			aspect_3 = streets.helpers.animation("streets_trafficlight_yellow_flashing.png^[transformR180"),
		},
	}
})

streets.trafficlights.register_trafficlight({
	name = "dual_aspect",
	description = "Dual Aspect Traffic Light",
	aspects = 2,
	default = {
		aspect_1 = "streets_trafficlight_red_off.png",
		aspect_2 = "streets_trafficlight_white_off.png",
	},
	phases = {
		red = {
			aspect_1 = "streets_trafficlight_red_on.png",
		},
		yellow = {
			aspect_2 = "streets_trafficlight_yellow_on.png",
		},
		green = {
			aspect_2 = "streets_trafficlight_green_on.png",
		},
		flashred = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_red_flashing.png"),
		},
		flashyellow = {
			aspect_2 = streets.helpers.animation("streets_trafficlight_yellow_flashing.png"),
		},
		flashgreen = {
			aspect_2 = streets.helpers.animation("streets_trafficlight_green_flashing.png"),
		},
		redyellow = {
			aspect_1 = "streets_trafficlight_red_on.png",
			aspect_2 = "streets_trafficlight_yellow_on.png",
		},
	}
})

local on_mask = function(tex, mask)
	return "^(" .. tex .. "^" .. mask .. "^[makealpha:255,0,255)"
end

streets.trafficlights.register_trafficlight({
	name = "right",
	description = "Right-Turn Traffic Light",
	aspects = 3,
	default = {
		aspect_1 = "streets_trafficlight_red_off.png^streets_trafficlights_mask_arrow_right_off.png",
		aspect_2 = "streets_trafficlight_yellow_off.png^streets_trafficlights_mask_arrow_right_off.png",
		aspect_3 = "streets_trafficlight_green_off.png^streets_trafficlights_mask_arrow_right_off.png",
	},
	phases = {
		red = {
			aspect_1 = "streets_trafficlight_red_off.png" .. on_mask("streets_trafficlight_red_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
		},
		yellow = {
			aspect_2 = "streets_trafficlight_yellow_off.png" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
		},
		green = {
			aspect_3 = "streets_trafficlight_green_off.png" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
		},
		flashred = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_red_off_flashing.png" .. on_mask(
				"streets_trafficlight_red_flashing.png", "streets_trafficlights_mask_arrow_right_flashing.png")),
		},
		flashyellow = {
			aspect_2 = streets.helpers.animation("streets_trafficlight_yellow_off_flashing.png" .. on_mask(
				"streets_trafficlight_yellow_flashing.png", "streets_trafficlights_mask_arrow_right_flashing.png")),
		},
		flashgreen = {
			aspect_3 = streets.helpers.animation("streets_trafficlight_green_off_flashing.png" .. on_mask(
				"streets_trafficlight_green_flashing.png", "streets_trafficlights_mask_arrow_right_flashing.png")),
		},
		redyellow = {
			aspect_1 = "streets_trafficlight_red_off.png" .. on_mask("streets_trafficlight_red_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
			aspect_2 = "streets_trafficlight_yellow_off.png" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
		},
		yellowgreen = {
			aspect_2 = "streets_trafficlight_yellow_off.png" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
			aspect_3 = "streets_trafficlight_green_off.png" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
		},
	}
})

streets.trafficlights.register_trafficlight({
	name = "left",
	description = "Left-Turn Traffic Light",
	aspects = 3,
	default = {
		aspect_1 = "streets_trafficlight_red_off.png^streets_trafficlights_mask_arrow_right_off.png^[transformR180",
		aspect_2 = "streets_trafficlight_yellow_off.png^streets_trafficlights_mask_arrow_right_off.png^[transformR180",
		aspect_3 = "streets_trafficlight_green_off.png^streets_trafficlights_mask_arrow_right_off.png^[transformR180",
	},
	phases = {
		red = {
			aspect_1 = "streets_trafficlight_red_off.png" .. on_mask("streets_trafficlight_red_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
		},
		yellow = {
			aspect_2 = "streets_trafficlight_yellow_off.png" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
		},
		green = {
			aspect_3 = "streets_trafficlight_green_off.png" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
		},
		flashred = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_red_off_flashing.png" .. on_mask(
				"streets_trafficlight_red_flashing.png", "streets_trafficlights_mask_arrow_right_flashing.png^[transformFX")),
		},
		flashyellow = {
			aspect_2 = streets.helpers.animation("streets_trafficlight_yellow_off_flashing.png" .. on_mask(
				"streets_trafficlight_yellow_flashing.png", "streets_trafficlights_mask_arrow_right_flashing.png^[transformFX")),
		},
		flashgreen = {
			aspect_3 = streets.helpers.animation("streets_trafficlight_green_off_flashing.png" .. on_mask(
				"streets_trafficlight_green_flashing.png", "streets_trafficlights_mask_arrow_right_flashing.png^[transformFX")),
		},
		redyellow = {
			aspect_1 = "streets_trafficlight_red_off.png" .. on_mask("streets_trafficlight_red_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
			aspect_2 = "streets_trafficlight_yellow_off.png" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
		},
		yellowgreen = {
			aspect_2 = "streets_trafficlight_yellow_off.png" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
			aspect_3 = "streets_trafficlight_green_off.png" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
		},
	}
})

streets.trafficlights.register_trafficlight({
	name = "right_extender",
	description = "Right-Turn Module Traffic Light",
	aspects = 2,
	default = {
		aspect_1 = "streets_trafficlight_yellow_off.png^streets_trafficlights_mask_arrow_right_off.png",
		aspect_2 = "streets_trafficlight_green_off.png^streets_trafficlights_mask_arrow_right_off.png",
	},
	phases = {
		yellow = {
			aspect_1 = "streets_trafficlight_yellow_off.png" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
		},
		green = {
			aspect_2 = "streets_trafficlight_green_off.png" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
		},
		flashyellow = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_yellow_off_flashing.png" .. on_mask(
				"streets_trafficlight_yellow_flashing.png", "streets_trafficlights_mask_arrow_right_flashing.png")),
		},
		flashgreen = {
			aspect_2 = streets.helpers.animation("streets_trafficlight_green_off_flashing.png" .. on_mask(
				"streets_trafficlight_green_flashing.png", "streets_trafficlights_mask_arrow_right_flashing.png")),
		},
		yellowgreen = {
			aspect_1 = "streets_trafficlight_yellow_off.png" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
			aspect_2 = "streets_trafficlight_green_off.png" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_arrow_right_on.png"),
		},
	}
})

streets.trafficlights.register_trafficlight({
	name = "left_extender",
	description = "Left-Turn Module Traffic Light",
	aspects = 2,
	default = {
		aspect_1 = "streets_trafficlight_yellow_off.png^streets_trafficlights_mask_arrow_right_off.png^[transformR180",
		aspect_2 = "streets_trafficlight_green_off.png^streets_trafficlights_mask_arrow_right_off.png^[transformR180",
	},
	phases = {
		yellow = {
			aspect_1 = "streets_trafficlight_yellow_off.png" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
		},
		green = {
			aspect_2 = "streets_trafficlight_green_off.png" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
		},
		flashyellow = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_yellow_off_flashing.png" .. on_mask(
				"streets_trafficlight_yellow_flashing.png", "streets_trafficlights_mask_arrow_right_flashing.png^[transformFX")),
		},
		flashgreen = {
			aspect_2 = streets.helpers.animation("streets_trafficlight_green_off_flashing.png" .. on_mask(
				"streets_trafficlight_green_flashing.png", "streets_trafficlights_mask_arrow_right_flashing.png^[transformFX")),
		},
		yellowgreen = {
			aspect_1 = "streets_trafficlight_yellow_off.png" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
			aspect_2 = "streets_trafficlight_green_off.png" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_arrow_right_on.png^[transformR180"),
		},
	}
})

streets.trafficlights.register_trafficlight({
	name = "pedestrians_eu",
	description = "Pedestrian Traffic Light (EU-Style)",
	aspects = 2,
	default = {
		aspect_1 = "streets_trafficlight_red_off.png^streets_trafficlights_mask_pedestrian_red_off.png",
		aspect_2 = "streets_trafficlight_green_off.png^streets_trafficlights_mask_pedestrian_green_off.png",
	},
	phases = {
		red = {
			aspect_1 = "streets_trafficlight_red_off.png^[resize:32x32" .. on_mask("streets_trafficlight_red_on.png", "streets_trafficlights_mask_pedestrian_red_on.png"),
		},
		green = {
			aspect_2 = "streets_trafficlight_green_off.png^[resize:32x32" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_pedestrian_green_on.png"),
		},
		flashred = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_red_off_flashing.png^[resize:32x64" .. on_mask(
				"streets_trafficlight_red_flashing.png", "streets_trafficlights_mask_pedestrian_red_flashing.png")),
		},
		flashgreen = {
			aspect_2 = streets.helpers.animation("streets_trafficlight_green_off_flashing.png^[resize:32x64" .. on_mask(
				"streets_trafficlight_green_flashing.png", "streets_trafficlights_mask_pedestrian_green_flashing.png")),
		},
	}
})

streets.trafficlights.register_trafficlight({
	name = "pedestrians_eu_3",
	description = "Pedestrian Traffic Light (EU-Style, 3 Aspects)",
	aspects = 3,
	default = {
		aspect_1 = "streets_trafficlight_red_off.png^streets_trafficlights_mask_pedestrian_red_off.png",
		aspect_2 = "streets_trafficlight_yellow_off.png^streets_trafficlights_mask_pedestrian_red_off.png",
		aspect_3 = "streets_trafficlight_green_off.png^streets_trafficlights_mask_pedestrian_green_off.png",
	},
	phases = {
		red = {
			aspect_1 = "streets_trafficlight_red_off.png^[resize:32x32" .. on_mask("streets_trafficlight_red_on.png", "streets_trafficlights_mask_pedestrian_red_on.png"),
		},
		yellow = {
			aspect_2 = "streets_trafficlight_yellow_off.png^[resize:32x32" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_pedestrian_red_on.png"),
		},
		green = {
			aspect_3 = "streets_trafficlight_green_off.png^[resize:32x32" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_pedestrian_green_on.png"),
		},
		flashred = {
			aspect_1 = streets.helpers.animation("streets_trafficlight_red_off_flashing.png^[resize:32x64" .. on_mask(
				"streets_trafficlight_red_flashing.png", "streets_trafficlights_mask_pedestrian_red_flashing.png")),
		},
		flashyellow = {
			aspect_2 = streets.helpers.animation("streets_trafficlight_yellow_off_flashing.png^[resize:32x64" .. on_mask(
				"streets_trafficlight_yellow_flashing.png", "streets_trafficlights_mask_pedestrian_red_flashing.png")),
		},
		flashgreen = {
			aspect_3 = streets.helpers.animation("streets_trafficlight_green_off_flashing.png^[resize:32x64" .. on_mask(
				"streets_trafficlight_green_flashing.png", "streets_trafficlights_mask_pedestrian_green_flashing.png")),
		},
		redyellow = {
			aspect_1 = "streets_trafficlight_red_off.png^[resize:32x32" .. on_mask("streets_trafficlight_red_on.png", "streets_trafficlights_mask_pedestrian_red_on.png"),
			aspect_2 = "streets_trafficlight_yellow_off.png^[resize:32x32" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_pedestrian_red_on.png"),
		},
		yellowgreen = {
			aspect_2 = "streets_trafficlight_yellow_off.png^[resize:32x32" .. on_mask("streets_trafficlight_yellow_on.png", "streets_trafficlights_mask_pedestrian_red_on.png"),
			aspect_3 = "streets_trafficlight_green_off.png^[resize:32x32" .. on_mask("streets_trafficlight_green_on.png", "streets_trafficlights_mask_pedestrian_green_on.png"),
		}
	}
})
