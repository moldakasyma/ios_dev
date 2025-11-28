//
//  BooksViewController.swift
//  Navigation
//
//  Created by  Айя on 20.11.2025.
//

import UIKit

class BooksViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let items: [MediaItem]=[
        MediaItem(title: "The Maze Runner", description: "Thomas wakes up in a mysterious maze with no memory of his past.Surrounded by other boys trapped in the same shifting labyrinth, he must uncover the truth behind the creators, survive deadly creatures, and find a way out before time runs out.", review: "The book that make you excited, terrified and cry. I loved this book because it shows how being next to each other and against evil is crucial during hard times.", image: .theMazeRunner),
        MediaItem(title: "And then there were none", description: "Ten strangers are invited to a remote island under false pretenses.One by one, they are accused of past crimes—and begin dying in ways that mirror a chilling nursery rhyme.With no escape and no trust left, paranoia mounts in this classic locked-room mystery.", review: "I'm fond of this book for how much tension it has. It will make you wondering till the last page.", image: .andthennone),
        MediaItem(title: "A walk to remember", description: "Landon Carter, a rebellious teen, unexpectedly forms a deep bond with Jamie Sullivan, the quiet, kind daughter of a local pastor.As their relationship unfolds, Landon discovers the meaning of love, sacrifice, and courage in the face of heartbreaking circumstances.", review: "The book that make you excited, terrified and cry. I loved this book because it shows how being next to each other and against evil is crucial during hard times.", image: .walktoremember),
        MediaItem(title: "Nothing Lasts Forever", description: "Three young doctors navigate ambition, rivalry, romance, and corruption in a prestigious San Francisco hospital.Each woman faces life-altering decisions as secrets, pressures, and moral dilemmas collide in Sheldon’s fast-paced medical drama.", review: "The book that make you excited, terrified and cry. I loved this book because it shows how being next to each other and against evil is crucial during hard times.", image: .nothinglastsforever),
        MediaItem(title: "The summer I turned pretty", description: "Every summer, Belly returns to the beach house that feels like home—along with the two brothers she’s grown up with.As she faces first love, heartbreak, and changing relationships, one summer becomes the turning point that reshapes everything.", review: "The book that make you excited, terrified and cry. I loved this book because it shows how being next to each other and against evil is crucial during hard times.", image: .thesummer),
        MediaItem(title: "Fahrenheit 451", description: "In a dystopian future where books are outlawed and “firemen” burn them, Guy Montag begins questioning the society he once served.His awakening sets him on a dangerous path toward knowledge, rebellion, and the fragile hope of preserving human thought.", review: "A book that makes you think, fear, and hope. I loved it because it shows how standing up for truth and holding onto ideas can save you in a world built on silence.", image: ._451),
        MediaItem(title: "The Little Prince", description: "A stranded pilot meets a mysterious young prince who recounts his travels across distant planets.Through poetic encounters and gentle wisdom, the story explores love, loss, innocence, and what it means to truly see with the heart.", review: "A story that warms your heart, breaks it gently, and puts it back together. I love how it reminds us that love, friendship, and imagination matter far more than what we see on the surface.", image: .prince),
        MediaItem(title: "Little Women", description: "The four March sisters—Meg, Jo, Beth, and Amy—navigate childhood, independence, dreams, and family struggles during the American Civil War.Their intertwined journeys form a timeless story of growth, sisterhood, and resilience.", review: "The book that makes you smile, ache, and believe again. I loved it because it shows how family, courage, and staying true to yourself guide you through every hardship.", image: .women),
        MediaItem(title: "The Picture of Dorian Gray", description: "Dorian Gray, enchanted by his own beauty, makes a dark wish that his portrait age while he remains young.As he descends into vanity, temptation, and moral corruption, the painting reveals the true cost of his soul.", review: "A story that fascinates, frightens, and lingers long after the last page. I loved it because it reveals how beauty, choices, and hidden truths can shape—or destroy—the soul.", image: .pictureDorian),
        MediaItem(title: "Blackberry Winter", description: "A sudden, rare snowstorm in Seattle links two women across different eras: a modern-day journalist investigating a missing child, and a 1930s mother searching for her lost son.Their stories intertwine in a tale of mystery, grief, and hope.", review: "A book that moves you, chills you, and gives you hope. I loved it because it shows how uncovering the past and holding onto compassion can change the future in unexpected ways.", image: .blackberryWinter)
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        // Do any additional setup after loading the view.
    }
}

extension BooksViewController: UITableViewDataSource, UITableViewDelegate{
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
