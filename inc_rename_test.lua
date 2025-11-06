-- Test file for inc-rename.nvim functionality
-- This file can be used to test the incremental rename feature

local function test_function_name()
    print("This is a test function for rename testing")
    local test_variable = "test"
    return test_variable
end

local another_function = function()
    local result = test_function_name()
    print("Result: " .. result)
    return result
end

-- You can place your cursor on 'test_function_name' and try the rename feature
-- with the keymap <leader>rn to see if it works incrementally with noice.nvim