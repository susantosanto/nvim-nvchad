#!/usr/bin/env lua

-- Read file and check for brace matching
local file = io.open("/home/xcode/.config/nvim/lua/plugins/init.lua", "r")
if not file then
  print("Could not open file")
  return
end

local content = file:read("*all")
file:close()

-- Count braces
local open_count = 0
local close_count = 0
local line_num = 1
local pos = 1

-- Go through character by character to track braces
for i = 1, #content do
  local char = content:sub(i, i)
  local next_char = i < #content and content:sub(i + 1, i + 1) or ""
  
  if char == '\n' then
    line_num = line_num + 1
  end
  
  if char == '{' then
    open_count = open_count + 1
    print("Line " .. line_num .. ": Found opening brace (total: " .. open_count .. ")")
  elseif char == '}' then
    close_count = close_count + 1
    print("Line " .. line_num .. ": Found closing brace (total: " .. close_count .. ")")
    if close_count > open_count then
      print("ERROR: More closing braces than opening braces at line " .. line_num)
      break
    end
  end
end

print("\nTotal counts:")
print("Opening braces: " .. open_count)
print("Closing braces: " .. close_count)
print("Difference (open - close): " .. (open_count - close_count))