import Foundation


// Functions for conversions
func unitSwitched(from value: Double, unit: String) -> Double? {
    switch unit {
    case "C":
        return value
    case "F":
        return (value - 32) * 5 / 9
    case "K":
        return value - 273.15
    default:
        return nil
    }
}

func toFahrenheit(fromCelsius celsius: Double) -> Double {
    return celsius * 9 / 5 + 32
}

func toKelvin(fromCelsius celsius: Double) -> Double {
    return celsius + 273.15
}

while true {
    // ask for temperature
    print("Enter a temperature value:")
    guard let tempInput = readLine(), let tempValue = Double(tempInput) else {
        print("Invalid value")
        break
    }

    // ask for unit
    print("Enter the unit (C, F, K):")
    guard let tempUnit = readLine()?.uppercased() else {
        print("Invalid unit. Please try again")
        continue
    }

    // convert to Celsius first
    guard let celsius = unitSwitched(from: tempValue, unit: tempUnit) else {
        print("Invalid Unit. Please enter C, F, or K")
        continue
    }

    let fahrenheit = toFahrenheit(fromCelsius: celsius)
    let kelvin = toKelvin(fromCelsius: celsius)

    print("\nYou entered: \(tempValue) \(tempUnit)")
    print("Converted temperatures:")
    print("Celsius: \(celsius)")
    print("Fahrenheit: \(fahrenheit)")
    print("Kelvin: \(kelvin)")

    // ask if user wants to continue
    print("\nDo you want to convert another temperature? (y/n):")
    if let answer = readLine()?.lowercased(), answer != "y" {
        print("Goodbye!")
        break
    }
}
