//
//  AlbumsViewController.swift
//  Navigation
//
//  Created by  Айя on 20.11.2025.
//

import UIKit

class AlbumsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let items: [MediaItem]=[
        MediaItem(title: "Ruby", description: "A bold and elegant solo release from BLACKPINK’s Jennie, “Ruby” blends smooth pop with minimalist production and rich vocal tone.The song reflects confidence, self-expression, and emotional depth, wrapped in Jennie’s signature charismatic style.", review: "An album that feels like a self-discovery journey. I love how every song tells a story about love, pain, and finding yourself again.", image: .ruby),
        MediaItem(title: "Lemonade", description: "A genre-blending visual album that chronicles a journey through betrayal, pain, empowerment, and liberation.Through powerful imagery and raw emotion, Beyoncé creates an anthem of resilience rooted in Black womanhood.", review: "This album stands out for its honesty and emotion. It’s bold, personal, and full of strength, a masterpiece about resilience and womanhood.", image: .lemonade),
        MediaItem(title: "Damn", description: "A Pulitzer Prize–winning exploration of morality, identity, and inner conflict.Kendrick Lamar weaves sharp lyricism with layered production to examine fear, pride, loyalty, and faith in a turbulent world.", review: "One of those albums that makes you think deeply. Every track has a message, from fame to faith, all delivered with raw emotion.", image: .damn),
        MediaItem(title: "Map of the Soul: 7", description: "A reflective, expansive album that connects BTS’s personal narratives with Carl Jung’s psychological concepts.The tracks celebrate vulnerability, growth, and the acceptance of both light and shadow within the self.", review: "A mix of confidence and vulnerability. This album explores identity and growth in such a meaningful and emotional way.", image: .BTS),
        MediaItem(title: "Positions", description: "A soft, sensual pop-R&B album centered on love, healing, and emotional maturity.Ariana Grande balances confidence and tenderness as she explores new commitments and the complexities of intimacy.", review: "Smooth and romantic, it shows how love can be both playful and deep. It’s an album that feels warm and confident at the same time.", image: .positions),
        MediaItem(title: "Good Girl Gone Bad: Reloaded", description: "A re-release of Rihanna’s breakout pop era, featuring upbeat dance tracks, emotional ballads, and iconic hits.It captures her evolution from youthful star to bold, confident artist redefining her sound.", review: "This album feels like a declaration of independence. Every track blends confidence with emotion, turning heartbreak and empowerment into unforgettable pop moments.", image: .rihanna),
        MediaItem(title: "Night Visions", description: "An energetic fusion of rock, electronic, and alternative sounds marked by anthemic choruses and introspective lyrics.The album journeys through themes of struggle, hope, and self-awakening with explosive intensity.", review: "A journey through explosive rhythms and introspective lyrics. It’s an album that makes you feel alive, pushing you to confront your fears while celebrating your strength.", image: .imagineDragons),
        MediaItem(title: "-R-", description: "Rosé’s debut solo project delivers emotional vulnerability through soft pop and acoustic soundscapes.It reflects on identity, longing, and inner strength, carried by her distinct, airy vocals.", review: "A beautifully intimate project that opens the door to her inner world. Each song is soft yet powerful, capturing vulnerability, longing, and the quiet process of rebuilding.", image: .r),
        MediaItem(title: "Hurry Up Tomorrow", description: "A dark, atmospheric concept album blending The Weeknd’s signature synth-driven R&B with futuristic pop and neo-noir storytelling.“Hurry Up Tomorrow” explores themes of escapism, fading love, and the desperate chase for a better future.Layered vocals and cinematic production create a haunting narrative about running from the past while racing toward an uncertain tomorrow.", review: "This feels like drifting through neon nights and emotional reflections. It blends melancholy and hope, creating a cinematic experience about time, desire, and second chances.", image: .thwWeeknd),
        MediaItem(title: "Nege Qaraisyn", description: "A heartfelt album that blends modern Kazakh pop with smooth melodies and emotionally expressive vocals.“Nege Qaraisyn” reflects on longing, misunderstood feelings, and the unspoken tension between two people.Akha delivers the song with warmth and vulnerability, creating an intimate, reflective listening experience.", review: "A heartfelt collection rooted in identity and feeling. The songs flow with raw sincerity, exploring connection, longing, and the quiet questions that shape who we are. Moreover, the albun is dedicated to his wife Aisha.", image: .akha)
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        // Do any additional setup after loading the view.
    }
}

extension AlbumsViewController: UITableViewDataSource, UITableViewDelegate{
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
