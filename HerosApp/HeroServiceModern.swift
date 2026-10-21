
import Foundation

struct HeroServiceModern {
    func fetchHero(by id: Int) async throws -> HeroModel {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json" // 1
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        let urlRequest = URLRequest(url: url)

        let (data, _) = try await URLSession.shared.data(for: urlRequest)

        let decodedModel = try JSONDecoder().decode(HeroModel.self, from: data)
        return decodedModel
    }
}

enum NetworkError: Error {
    case invalidURL
}
