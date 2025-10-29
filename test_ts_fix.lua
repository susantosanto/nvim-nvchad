-- Simple test to verify TreeSitter highlighting works without error
local test_var = "This is a test string for TreeSitter"
local test_table = {
  key1 = "value1",
  key2 = "value2",
  nested = {
    inner_key = "inner_value"
  }
}

function test_function(param1, param2)
  local result = param1 .. param2
  return result
end

print(test_function("Hello, ", "World!"))