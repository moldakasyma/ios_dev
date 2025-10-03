import Foundation

struct Address{
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    var formattedAddress: String {
        return "\(country),\(city)\n\(street), \(country)"
    }
}
