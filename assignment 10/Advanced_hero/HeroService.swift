//
//  HeroService.swift
//  advancedHero
//
//  Created by  Айя on 02.12.2025.
//

import Foundation
import Alamofire


struct HeroModel: Codable{
    let id: Int
    let name: String
    let powerstats: PowerStats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let images: HeroImage
    
    struct PowerStats: Codable {
        let intelligence: Int?
        let strength: Int?
        let speed: Int?
        let durability: Int?
        let power: Int?
        let combat: Int?
    }

    struct Appearance: Codable {
        let gender: String?
        let race: String?
        let height: [String]
        let weight: [String]
        let eyeColor: String?
        let hairColor: String?
    }

    struct Biography: Codable {
        let fullName: String?
        let placeOfBirth: String?
        let firstAppearance: String?
        let publisher: String?
    }

    struct Work: Codable {
        let occupation: String?
    }
    
    struct HeroImage: Codable{
        let md: String
    }
}

extension HeroModel{
    var heightInCm: String{
        if appearance.height.count>1, appearance.height[1].contains("cm"){
            return appearance.height[1]
        }
        return appearance.height.first ?? "Unknown"
    }
    
    var weightInKg: String{
        if appearance.weight.count>1, appearance.weight[1].contains("kg"){
            return appearance.weight[1]
        }
        return appearance.weight.first ?? "Unknown"
    }
}

enum HeroError: Error{
    case network
    case decoding
    case noData
}



protocol HeroServiceDelegate: AnyObject{
    func onHeroDidUpdate(model: HeroModel)
    func onHeroDidFail(error: HeroError)
    
}

class HeroService{
    weak var delegate: HeroServiceDelegate?
    
    func fetchHero(){
        let randomId=Int.random(in: 1...564)
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(randomId).json"
        AF.request(urlString).responseDecodable(of:HeroModel.self){
            response in
            switch response.result{
            case .success(let hero):
                DispatchQueue.main.async {
                    self.delegate?.onHeroDidUpdate(model: hero)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async{
                    if error.isResponseSerializationError{
                        self.delegate?.onHeroDidFail(error: .decoding)
                    }
                    else{
                        self.delegate?.onHeroDidFail(error: .network)
                    }
                }
            }
        }
    }
}
