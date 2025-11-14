//
//  ViewController.swift
//  TableView
//
//  Created by  Айя on 11.11.2025.
//

import UIKit
struct MediaItem{
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
}

struct CategorySection{
    let name: String
    let items: [MediaItem]
}
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let categories: [CategorySection]=[
        CategorySection(
            name: "Fav Movies",
            items: [
                MediaItem(title: "Bad Boys For Life", subtitle:"Brotherhood, chaos, and heart." , review: "A hilarious yet heartfelt action film that reminds you to value what truly matters: friendship and family.", image: .badboys),
                MediaItem(title: "White chicks", subtitle:"Comedy in disguise" , review: "This movie never gets old. Every time I watch White Chicks, I end up laughing out loud. It’s so ridiculous in the best way possible.", image: .whitechicks),
                MediaItem(title: "F1", subtitle:"Speed, envy, and the price of glory." , review: "This movie really shows the consequences of envy. I loved it not only because it’s about everyone’s favorite F1, but also because it reveals what truly happens behind those big wins", image: .F_1),
                MediaItem(title: "To All the Boys I’ve Loved Before",subtitle: "Love letters, laughter, dreams", review:"I’ve loved this movie since 8th grade. It’s such a cute rom-com that makes you laugh and fall in love with the main character. Every time I watch it, it gives me that cozy, lighthearted feeling.", image: .toAllTheBoys),
                MediaItem(title: "How to lose a guy in 10 days", subtitle:"Love, laughter, and a little bit of chaos.",review: "I really enjoyed this movie, it’s one of those rom-coms that’s funny, clever, and just makes you feel good.", image: .howToLose)
                
            ]
        ),
        CategorySection(
            name: "Fav Books",
            items: [
                MediaItem(title: "The Maze Runner", subtitle: "Action, Soulmates, Run", review: "The book that make you excited, terrified and cry. I loved this book because it shows how being next to each other and against evil is crucial during hard times.", image: .theMazeRunner),
                MediaItem(title: "And then there were none", subtitle: "Riddle, Mysticism, Revenge", review: "I'm fond of this book for how much tension it has. It will make you wondering till the last page.", image: .andthennone),
                MediaItem(title: "A walk to remember", subtitle: "Love, Hope, Run", review: "The book that make you excited, terrified and cry. I loved this book because it shows how being next to each other and against evil is crucial during hard times.", image: .walktoremember),
                MediaItem(title: "Nothing Lasts Forever", subtitle: "Action, Soulmates, Run", review: "The book that make you excited, terrified and cry. I loved this book because it shows how being next to each other and against evil is crucial during hard times.", image: .nothinglastsforever),
                MediaItem(title: "The summer I turned pretty", subtitle: "Action, Soulmates, Run", review: "The book that make you excited, terrified and cry. I loved this book because it shows how being next to each other and against evil is crucial during hard times.", image: .thesummer)
                ]
        ),
        CategorySection(
            name: "Fav Albums",
            items: [
                MediaItem(title: "Ruby", subtitle: "Pop, Emotion, Growth", review: "An album that feels like a self-discovery journey. I love how every song tells a story about love, pain, and finding yourself again.", image: .ruby),
                MediaItem(title: "Lemonade", subtitle: "Power, Truth, Identity", review: "This album stands out for its honesty and emotion. It’s bold, personal, and full of strength, a masterpiece about resilience and womanhood.", image: .lemonade),
                MediaItem(title: "Damn", subtitle: "Rap, Reflection, Reality", review: "One of those albums that makes you think deeply. Every track has a message, from fame to faith, all delivered with raw emotion.", image: .damn),
                MediaItem(title: "Map of the Soul: 7", subtitle: "Introspection, Art, Balance", review: "A mix of confidence and vulnerability. This album explores identity and growth in such a meaningful and emotional way.", image: .BTS),
                MediaItem(title: "Positions", subtitle: "Love, Maturity, Rhythm", review: "Smooth and romantic, it shows how love can be both playful and deep. It’s an album that feels warm and confident at the same time.", image: .positions),
                
            ]
        ),
        CategorySection(
            name: "Fav Courses",
            items: [
                MediaItem(title: "Statistics", subtitle: "Numbers, Logic, Prediction", review: "I enjoyed this course because it makes sense of randomness. It’s all about finding patterns that explain real-world behavior.", image: .statistics),
                MediaItem(title: "Software engineering", subtitle: "Design, Teamwork, Innovation", review: "It’s fascinating to see how large systems are built step by step. This course taught me how planning and structure create great software.", image: .software),
                MediaItem(title: "Data gethering and collection", subtitle: "Insight, Research, Accuracy", review: "A course that makes you value how data is collected and cleaned before analysis. It’s the foundation of every reliable project.", image: .dataanalytics),
                MediaItem(title: "Linear Algebra", subtitle: "Logic, Vectors, Clarity", review: "Challenging but rewarding. I like how it connects abstract math to real applications like AI and graphics.", image: .algebra),
                MediaItem(title: "iOS Development", subtitle: "Creativity, Code, Design", review: "My favorite course because it combines logic and creativity. It’s amazing to turn an idea into a working app on your phone.", image: .ios),
                
            ]
        )
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource=self
        tableView.delegate=self
        
    }
}
extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
           return categories.count
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories[section].items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell") as! MediaTableViewCell
        let currentItem=categories[indexPath.section].items[indexPath.row]
        cell.configure(with: currentItem)
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return categories[section].name
    }
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.section) | \(indexPath.row)")
    }
}

    
    
