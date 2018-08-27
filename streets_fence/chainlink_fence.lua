xpanes.register_pane("chainlink_fence", {
	description = "Chainlink Fence",
	textures = { "streets_fence_chainlink_fence.png", "xpanes_pane_half.png", "streets_transparent.png" },
	inventory_image = "streets_fence_chainlink_fence.png",
	wield_image = "streets_fence_chainlink_fence.png",
	sounds = default.node_sound_glass_defaults(),
	groups = { snappy = 2, cracky = 3 },
	recipe = {
		{"default:obsidian_glass", "default:obsidian_glass", "default:obsidian_glass"},
		{"default:obsidian_glass", "default:obsidian_glass", "default:obsidian_glass"}
	}
})