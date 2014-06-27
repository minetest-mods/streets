-- example: streets.workshop.register_sign(nodename, desc, img, recipe, time)
streets.workshop.register_sign(":streets:sign_blank", streets.S("Empty sign"), "streets_sign_back.png", {"default:steel_ingot","","",""}, 3)

streets.workshop.register_sign(":streets:sign_lava", streets.S("Warning sign (lava)"), "streets_sign_lava.png", {"streets:sign_blank","bucket:bucket_lava","",""}, 5)

streets.workshop.register_sign(":streets:sign_water", streets.S("Warning sign (water)"), "streets_sign_water.png", {"streets:sign_blank","bucket:bucket_water","",""}, 5)

streets.workshop.register_sign(":streets:sign_construction", streets.S("Warning sign (Construction area)"), "streets_sign_construction.png", {"streets:sign_blank","default:dirt","",""}, 5)


streets.workshop.register_sign(":streets:sign_mine", streets.S("Notice sign (Public Mine Ahead)"), "streets_sign_mine.png", {"streets:sign_blank","default:dirt","",""}, 5)

streets.workshop.register_sign(":streets:sign_shop", streets.S("Notice sign (Shop/Mall Ahead)"), "streets_sign_construction.png", {"streets:sign_blank","default:dirt","",""}, 5)

streets.workshop.register_sign(":streets:sign_workshop", streets.S("Notice sign (Public Workshop Ahead)"), "streets_sign_workshop.png", {"streets:sign_blank","default:dirt","",""}, 5)

streets.workshop.register_sign(":streets:sign_grasswalk", streets.S("Warning sign (No walking on the grass)"), "streets_sign_grasswalk.png", {"streets:sign_blank","default:dirt","",""}, 5)
