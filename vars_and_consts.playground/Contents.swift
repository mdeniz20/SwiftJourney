// Using 'var' to define variables. Variables can change their values after they're set.
var age = 43
age = 5
var number = 45

// Using 'let' to define constants. Constants are immutable and cannot be changed after they're defined.
let pi = 3.14
let e = 2.718

// Swift supports type inference, which means the compiler can automatically infer the type based on the assigned value.
// However, you can also explicitly declare the type, if needed.
let divider: Double = 23.5
var num: Int = 5
let name = "Mahmut"

// Combining strings using the '+' operator. To include a numeric value in a string, convert the number to a string using the String() initializer.
print("\nCombining Strings:")
let label = "The width of this frame is "
let width = 43
let widthLabel = label + String(width)
print(widthLabel)

// Swift offers a more straightforward way to include variables in strings using string interpolation, denoted by \(variable).
print("\nUsing string interpolation:")
let apples = 7
let oranges = 4
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print(fruitSummary)

// For multi-line strings, use triple quotes ("""). This is useful for strings that span several lines.
print("\nUsing multi-line strings:")
let quotation = """
I said "I do have \(apples) apples."
I also said "I have \(apples + oranges) pieces of fruit."
"""
print(quotation)
