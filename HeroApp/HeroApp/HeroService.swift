"import Foundation

protocol HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel, heroImage: Data)
}

struct HeroService {

    var delegate: HeroServiceDelegate?

    func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json" // 1

        let session = URLSession(configuration: .default) // 2
        guard let url = URL(string: urlString) else { return } // 3

        let urlRequest = URLRequest(url: url) // 4
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error {
                print("Error: \(error)")
            }

            guard let data else { return }

            do {
                let decodedModel = try JSONDecoder().decode(HeroModel.self, from: data)
                guard
                    let imageUrl = URL(string: decodedModel.images.md),
                    let imageData = try? Data(contentsOf: imageUrl)
                else {
                    return
                }

                DispatchQueue.main.async {
                    delegate?.onHeroDidUpdate(model: decodedModel, heroImage: imageData)
                }
            } catch {
                print("Parsing error: \(error)")
            }
        } // 5
        task.resume() // 6
    }
}
