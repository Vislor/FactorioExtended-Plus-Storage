    data:extend(
        {
            {
                type = "technology",
                name = "logistics-system-2",
                icon = "__base__/graphics/technology/logistic-system.png",
                icon_size = 256,
                prerequisites = {"construction-robotics", "titanium-processing", "logistic-system"},
                localised_name = {"technology-name.logistics-system-2"},
                effects = {
                    {
                        type = "unlock-recipe",
                        recipe = "titanium-chest"
                    },
                    {
                        type = "unlock-recipe",
                        recipe = "titanium-passive-provider-chest"
                    },
                    {
                        type = "unlock-recipe",
                        recipe = "titanium-active-provider-chest"
                    },
                    {
                        type = "unlock-recipe",
                        recipe = "titanium-buffer-chest"
                    },
                    {
                        type = "unlock-recipe",
                        recipe = "titanium-storage-chest"
                    },
                    {
                        type = "unlock-recipe",
                        recipe = "titanium-requester-chest"
                    }
                },
                unit = {
                    count = 300,
                    ingredients = {
                        {"automation-science-pack", 1},
                        {"logistic-science-pack", 1},
                        {"chemical-science-pack", 1},
                        {"production-science-pack", 1},
                        {"utility-science-pack", 1}
                    },
                    time = 60
                },
                order = "c-k-a-b"
            }
        }
    )
