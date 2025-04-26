let a = 1
//A method to convert int to double
print(Double(a))
//Decimal
import Foundation

let decimal: Decimal = 1
let decimal2 = Decimal(3.24)
//! means optional
//Correctly deal with the value
let decimal4 = Decimal(string: "3.24")!
print(decimal4)
let decimal5: Decimal = 0.1
let decimal6: Decimal = 0.2
print(decimal6 + decimal5)
let decimal7 = Decimal(string: "0.1")!
let decimal8 = Decimal(string: "3.24")!
print(decimal7 + decimal8)
