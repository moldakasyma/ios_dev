//
//  ViewController.swift
//  HerosApp
//
//  Created by  Айя on 27.11.2025.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var firstAppearanceLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
    
    let modernService = HeroServiceModern()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rollTap(_ sender: Any) {
        let randomId = Int.random(in: 1...563)
        
        Task { @MainActor in
            do {
                let model = try await modernService.fetchHero(by: randomId)
                updateUI(with: model)
            } catch {
                print("Error fetching hero: No data found")
            }
        }
    }
    private func updateUI(with model: HeroModel) {
            heroName.text = model.name

            if let url = URL(string: model.images.md) {
                heroImage.kf.setImage(with: url)
            }

            // Appearance
            genderLabel.text = "Gender: \(model.appearance.gender ?? "Unknown")"
            raceLabel.text = "Race: \(model.appearance.race ?? "Unknown")"
            heightLabel.text = "Height: \(convertHeight(model.appearance.height))"
            weightLabel.text = "Weight: \(convertWeight(model.appearance.weight))"
            eyeColorLabel.text = "Eye Color: \(model.appearance.eyeColor ?? "Unknown")"
            hairColorLabel.text = "Hair Color: \(model.appearance.hairColor ?? "Unknown")"

            // Biography
            fullNameLabel.text = "Full Name: \(model.biography.fullName ?? "Unknown")"
            placeOfBirthLabel.text = "Place of Birth: \(model.biography.placeOfBirth ?? "Unknown")"
            firstAppearanceLabel.text = "First Appearance: \(model.biography.firstAppearance ?? "Unknown")"
            publisherLabel.text = "Publisher: \(model.biography.publisher ?? "Unknown")"
        }

        private func convertHeight(_ heightArray: [String]?) -> String {
            guard let array = heightArray, !array.isEmpty else { return "Unknown" }

            if array.count > 1, array[1].contains("cm") {
                return array[1]
            }
            return array.first ?? "Unknown"
        }

        private func convertWeight(_ weightArray: [String]?) -> String {
            guard let array = weightArray, !array.isEmpty else { return "Unknown" }

            if array.count > 1, array[1].contains("kg") {
                return array[1]
            }
            return array.first ?? "Unknown"
        }
    
}
