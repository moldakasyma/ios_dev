//
//  MoviesViewController.swift
//  Navigation
//
//  Created by  Айя on 20.11.2025.
//

import UIKit

class MoviesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let items: [MediaItem]=[
        MediaItem(title: "Bad Boys For Life", description:"Detectives Mike Lowrey and Marcus Burnett reunite once again when a dangerous figure from Mike’s past resurfaces.As the pair return to action—this time with the help of a young tactical team—they face their most personal and explosive case yet.", review: "A hilarious yet heartfelt action film that reminds you to value what truly matters: friendship and family.", image: .badboys),
        MediaItem(title: "White chicks", description:"Two FBI agents go undercover as wealthy socialite sisters after their original protectees are threatened.What follows is a chaotic, comedic series of misadventures as the agents struggle to keep their disguises intact and solve the case." , review: "This movie never gets old. Every time I watch White Chicks, I end up laughing out loud. It’s so ridiculous in the best way possible.", image: .whitechicks),
        MediaItem(title: "F1", description:"A fictional story set inside the world of Formula 1 racing, following a veteran driver who returns to the sport to mentor a rising rookie.The film blends high-speed racing, intense competition, and behind-the-scenes drama on the global F1 circuit." , review: "This movie really shows the consequences of envy. I loved it not only because it’s about everyone’s favorite F1, but also because it reveals what truly happens behind those big wins", image: .F_1),
        MediaItem(title: "To All the Boys I’ve Loved Before",description: "Lara Jean Covey’s secret love letters are accidentally mailed out, throwing her quiet high-school life into chaos.To regain control, she enters a fake relationship with one of the recipients—only to discover unexpected real feelings.", review:"I’ve loved this movie since 8th grade. It’s such a cute rom-com that makes you laugh and fall in love with the main character. Every time I watch it, it gives me that cozy, lighthearted feeling.", image: .toAllTheBoys),
        MediaItem(title: "How to lose a guy in 10 days", description:"A magazine writer attempts to drive a man away in ten days as part of an article assignment.Unbeknownst to her, the man she chooses is simultaneously trying to make a woman fall in love with him for a bet, leading to comedic clashes and romantic tension.",review: "I really enjoyed this movie, it’s one of those rom-coms that’s funny, clever, and just makes you feel good.", image: .howToLose),
        MediaItem(title: "The Amazing Spider-Man", description: "After discovering clues about his father’s mysterious past, Peter Parker gains spider-like abilities and uncovers a dangerous transformation experiment gone wrong.As Spider-Man, he faces the Lizard while navigating young love and newfound responsibility.", review: "A thrilling and emotional superhero film that blends humor, action, and vulnerability. It reminds me that even in chaos, love and doing the right thing matter most.", image: .spiderMan),
        MediaItem(title: "Avatar: The Way of Water", description: "Jake Sully and Neytiri build a family on Pandora, but are forced to seek refuge with a water-based Na’vi clan when a familiar threat returns.The story explores new environments, deep emotional stakes, and breathtaking ocean ecosystems.", review: "A visually stunning and deeply moving adventure,that make you imerse into movie for 3 hours.It shows how loyalty and connection can guide you through danger, reminding me to protect the people—and the world—you love.", image: .avatar),
        MediaItem(title: "Now You See Me 2", description: "The Four Horsemen return for another elaborate illusion-driven adventure, this time battling a tech prodigy who forces them into an impossible heist.As secrets unravel, the magicians must outsmart powerful enemies using misdirection and spectacle.", review: "Movie is clever, and fast-paced ride that filled with surprises and charm. It highlights how sticking together, even when everything goes wild, is the real magic, that really impressed me.", image: .nowyousee),
        MediaItem(title: "Escape Room", description: "A group of strangers is invited to participate in what appears to be an elaborate escape-room challenge.They quickly realize the puzzles are deadly, forcing them to confront their fears and work together to survive.", review: "The movie that I love rewatching. A tense and gripping thriller that keeps your heart racing. Despite the danger, it shows how teamwork and trust become your strongest tools in the darkest moments.", image: .escaperoom),
        MediaItem(title: "Freaky Friday 2", description: "A continuation of the beloved body-swap comedy, reuniting mother and daughter whose lives once again become entangled in magical chaos.As they navigate adulthood, parenting, and generational differences, a new switch forces them to rediscover empathy and understanding.", review: "A funny, warm, and energetic story that blends magical mix-ups with real emotion. It reminded me that even in the craziest moments, family ties hold everything together. And i really loved the cast. ", image: .friday)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        
        // Do any additional setup after loading the view.
    }
   
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell") as! MediaTableViewCell
        let item=items[indexPath.row]
        cell.configureMinimal(with: item)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected=items[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: selected)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="showDetail",
            let destinationVC=segue.destination as? DetailViewController,
            let item=sender as? MediaItem{
            destinationVC.item=item
        }
    }
}
