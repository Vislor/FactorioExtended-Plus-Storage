local tints = {
    titanium = {r = 225, g = 225, b = 228},
    passive = {r=220, g=61, b=65},
    active = {r=160, g=64, b=180},
    storage = {r=230, g=180, b=66},
    buffer = {r=70, g=200, b=70},
    requester = {r=80, g=160, b=220}
}

local function blend(c1, c2, pct)
    local r = c1.r * (1 - pct / 100) + c2.r * (pct / 100)
    local g = c1.g * (1 - pct / 100) + c2.g * (pct / 100)
    local b = c1.b * (1 - pct / 100) + c2.b * (pct / 100)
    return {r = r, g = g, b = b}
end

if (data.raw.container["aai-storehouse"]) then
    data.raw.container["titanium-chest"] = nil
    data.raw.item["titanium-chest"] = nil

    local chest = table.deepcopy(data.raw["container"]["steel-chest"])
    chest.name = "titanium-chest"
    table.insert(chest.icons, 2, {icon = "__aai-containers__/graphics/icons/container-1-mask.png", icon_size = 64, tint = tints.titanium})
    chest.inventory_size = 96
    chest.minable.result = chest.name
    chest.next_upgrade = nil
    chest.max_health = 500
    chest.picture.layers[1].filename = "__FactorioExtended-Plus-Storage__/graphics/entity/titanium-chest/aai-base.png"

    data:extend({chest})

    local chestitem = table.deepcopy(data.raw["item"]["steel-chest"])
    chestitem.name = "titanium-chest"
    table.insert(chestitem.icons, 2, {icon = "__aai-containers__/graphics/icons/container-1-mask.png", icon_size = 64, tint = tints.titanium})
    chestitem.subgroup = "fb-storage"
    chestitem.order = "a[items]-c[titanium-chest]"
    chestitem.place_result = "titanium-chest"
    chestitem.stack_size = 50

    data.extend({chestitem})

    for _, k in pairs(
        {
            {key = "active-provider-chest", tint = "active"},
            {key = "buffer-chest", tint = "buffer"},
            {key = "passive-provider-chest", tint = "passive"},
            {key = "requester-chest", tint = "requester"},
            {key = "storage-chest", tint = "storage"}
        }
    ) do
       local tk = "titanium-" .. k.key
       data.raw["logistic-container"][tk] = nil
       data.raw["item"][tk] = nil
       local tint = blend(tints.titanium, tints[k.tint], 70)

       local chest = table.deepcopy(data.raw["logistic-container"][k.key])
       chest.name = tk
       chest.max_health = 500
       chest.inventory_size = 96
       chest.minable.result = tk
       chest.next_upgrade = nil
       chest.animation.layers[1].filename = "__FactorioExtended-Plus-Storage__/graphics/entity/titanium-chest/aai-base.png"
       chest.animation.layers[3].tint = tint
       chest.icons[2].tint = tint
       data.extend({chest})

       local chestitem = table.deepcopy(data.raw["item"][k.key])
       chestitem.name = tk
       chestitem.icons[2].tint = tint
       chestitem.subgroup = "fb-storage"
       chestitem.order = "b[storage]-b[" .. tk .. "]"
       chestitem.place_result = tk
       chestitem.stack_size = 50
       data.extend({chestitem})
    end
end

--[[ for _, k in pairs(
    {
        "logistic-chest-active-provider",
        "logistic-chest-buffer",
        "logistic-chest-passive-provider",
        "logistic-chest-requester",
        "logistic-chest-storage"
    }
) do
    local k2 = "titanium-" .. k
    if not data.raw["logistic-container"][k].fast_replaceable_group then
        data.raw["logistic-container"][k].fast_replaceable_group = "container"
        data.raw["logistic-container"][k2].fast_replaceable_group = "container"
    else
        data.raw["logistic-container"][k2].fast_replaceable_group = data.raw["logistic-container"][k].fast_replaceable_group
    end
    if not data.raw["logistic-container"][k].next_upgrade then
        data.raw["logistic-container"][k].next_upgrade = k2
    end
end

if not data.raw["container"]["steel-chest"].fast_replaceable_group then
    data.raw["container"]["steel-chest"].fast_replaceable_group = "container"
    data.raw["container"]["titanium-chest"].fast_replaceable_group = "container"
else
    data.raw["container"]["titanium-chest"].fast_replaceable_group = data.raw["container"]["steel-chest"].fast_replaceable_group
end
if not data.raw["container"]["steel-chest"].next_upgrade then
    data.raw["container"]["steel-chest"].next_upgrade = "titanium-chest"
end ]]
