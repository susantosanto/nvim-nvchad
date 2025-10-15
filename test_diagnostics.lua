-- This is a test file to verify diagnostic icons
local x = 5
local y = nil

print(x)
print(y)

-- Intentional error: undefined variable
print(undefined_variable)

-- This will trigger hint/info diagnostics as well
local unused_var = "This variable is not used"