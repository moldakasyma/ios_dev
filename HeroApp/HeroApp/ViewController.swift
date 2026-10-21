
m//
//  ViewController.swift
//  HeroApp
//
//  Created by Arman Myrzakanurov on 22.11.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroImage: UIImageView!
    var service = HeroService()
    var modernService = HeroServiceModern()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
    }

    @IBAction private func rollTap(_ sender: Any) {
        let randomId = Int.random(in: 1...563)
        // GCD - Grand Central Dispatch - with Delegate Pattern
//        service.fetchHero(by: randomId)

        // Modern Conccurency
        Task { @MainActor in
            let model = try await modernService.fetchHero(by: randomId)
            heroName.text = model.name
            heroImage.kf.setImage(with: URL(string: model.images.md))
        }
    }

    private func configureHero(heroName: String, imageData: Data) {
        self.heroImage.image = UIImage(data: imageData)
        self.heroName.text = heroName
    }
}

extension ViewController: HeroServiceDelegate {
    func onHeroDidUpdate(model: HeroModel, heroImage: Data) {
        configureHero(heroName: model.name, imageData: heroImage)
    }
}
