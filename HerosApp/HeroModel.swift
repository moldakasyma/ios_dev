struct HeroModel: Decodable {
    let id: Int
    let name: String
    let powerstats: PowerStats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let images: Images

    struct PowerStats: Decodable {
        let intelligence: Int?
        let strength: Int?
        let speed: Int?
        let durability: Int?
        let power: Int?
        let combat: Int?
    }

    struct Appearance: Decodable {
        let gender: String?
        let race: String?
        let height: [String]
        let weight: [String]
        let eyeColor: String?
        let hairColor: String?
    }

    struct Biography: Decodable {
        let fullName: String?
        let placeOfBirth: String?
        let firstAppearance: String?
        let publisher: String?
    }

    struct Work: Decodable {
        let occupation: String?
    }

    struct Images: Decodable {
        let md: String
    }
}
