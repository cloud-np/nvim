local helpers = {};

function helpers.concatArrays(a1, a2)
    local result = {}

    -- Insert all elements from the first array
    for _, v in ipairs(a1) do
        table.insert(result, v)
    end

    -- Insert all elements from the second array
    for _, v in ipairs(a2) do
        table.insert(result, v)
    end

    return result
end

return helpers
