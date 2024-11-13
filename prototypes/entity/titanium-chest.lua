local vanilla_entity = data.raw["container"]["steel-chest"]

local chest = table.deepcopy(vanilla_entity)
chest.name = "titanium-chest"
chest.icon = "__FactorioExtended-Plus-Storage__/graphics/icons/titanium-chest.png"
chest.inventory_size = 96
chest.minable.result = chest.name
chest.next_upgrade = nil
chest.max_health = 500
chest.picture.layers[1].filename = "__FactorioExtended-Plus-Storage__/graphics/entity/titanium-chest/titanium-chest.png"

data:extend({chest})
