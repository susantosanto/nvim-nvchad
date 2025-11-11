const name = "Neovim Debug Test";
console.log("Starting debug test:", name);

function calculate(x, y) {
  const result = x + y;  // Breakpoint here to test debugging
  console.log("Calculation result:", result);
  return result;
}

const a = 5;
const b = 3;
const sum = calculate(a, b);

console.log("Final sum:", sum);
console.log("Debug test completed!");