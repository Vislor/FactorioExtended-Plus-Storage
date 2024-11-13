local vanilla_entity = data.raw["logistic-container"]["requester-chest"]

local chest = table.deepcopy(vanilla_entity)
chest.name = "titanium-requester-chest"
chest.icon = "__FactorioExtended-Plus-Storage__/graphics/icons/titanium-logistic-chest-requester.png"
chest.minable.result = chest.name
chest.next_upgrade = nil
chest.max_health = 500
chest.inventory_size = 96
chest.animation.layers[1].filename = "__FactorioExtended-Plus-Storage__/graphics/entity/titanium-logistic-chest/titanium-logistic-chest-requester.png"

data:extend({chest})
