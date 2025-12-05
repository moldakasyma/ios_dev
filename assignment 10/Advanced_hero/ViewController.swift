//
//  ViewController.swift
//  advancedHero
//
//  Created by  Айя on 02.12.2025.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
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
    
    var heroService=HeroService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heroService.delegate=self
        setupInitialHeroIfNeeded()

    }
    
    @IBAction func rollHero(_ sender: Any) {
        heroService.fetchHero()
    }
}

extension ViewController: HeroServiceDelegate{
    func onHeroDidUpdate(model: HeroModel) {
        configure(model: model)
        storeLocally(model: model)
        
    }
    
    func onHeroDidFail(error: HeroError) {
        switch error {
           case .network:
               showAlert("Network error. Please check your internet connection.")
           case .decoding:
               showAlert("Failed to decode hero data.")
           case .noData:
               showAlert("The server returned no data.")
           }
    }
    private func configure(model: HeroModel){
        nameLabel.text=model.name
        coverImage.kf.setImage(with: URL(string: model.images.md))
        
        genderLabel.text = "Gender: \(model.appearance.gender ?? "Unknown")"
        raceLabel.text = "Race: \(model.appearance.race ?? "Unknown")"
        heightLabel.text = "Height: \(model.heightInCm)"
        weightLabel.text = "Weight: \(model.weightInKg)"
        eyeColorLabel.text = "Eye Color: \(model.appearance.eyeColor ?? "Unknown")"
        hairColorLabel.text = "Hair Color: \(model.appearance.hairColor ?? "Unknown")"

        // Biography
        fullNameLabel.text = "Full Name: \(model.biography.fullName ?? "Unknown")"
        placeOfBirthLabel.text = "Place of Birth: \(model.biography.placeOfBirth ?? "Unknown")"
        firstAppearanceLabel.text = "First Appearance: \(model.biography.firstAppearance ?? "Unknown")"
        publisherLabel.text = "Publisher: \(model.biography.publisher ?? "Unknown")"
        
    }
    
    private func storeLocally(model: HeroModel) {
        let heroData = try? JSONEncoder().encode(model)
        UserDefaults.standard.set(heroData, forKey: "heroData")
    }
    
    private func setupInitialHeroIfNeeded() {
        guard
            let heroData = UserDefaults.standard.data(forKey: "heroData"),
            let heroModel = try? JSONDecoder().decode(HeroModel.self, from: heroData)
        else { return }
        
        configure(model: heroModel)
    }
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    

}

