//
//  CoursesViewController.swift
//  Navigation
//
//  Created by  Айя on 20.11.2025.
//

import UIKit

class CoursesViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    let items: [MediaItem]=[
        MediaItem(title: "Statistics", description: "An introduction to data analysis, probability, and statistical reasoning.Students learn how to collect, summarize, interpret, and draw conclusions from data using mathematical tools.The course builds a foundation for research, decision-making, and quantitative problem-solving in various fields.", review: "I enjoyed this course because it makes sense of randomness. It’s all about finding patterns that explain real-world behavior.", image: .statistics),
        MediaItem(title: "Software engineering", description: "A comprehensive study of methods and principles used to design, build, and maintain software systems.Topics include software development life cycles, testing, requirements engineering, and project management.Students learn to create scalable, reliable, and user-centered applications.", review: "It’s fascinating to see how large systems are built step by step. This course taught me how planning and structure create great software.", image: .software),
        MediaItem(title: "Data gethering and collection", description: "A practical course focused on techniques for obtaining accurate and meaningful data.Students explore surveys, interviews, sensors, digital traces, sampling methods, and ethical considerations.The course emphasizes designing effective data collection strategies for research and industry.", review: "A course that makes you value how data is collected and cleaned before analysis. It’s the foundation of every reliable project.", image: .dataanalytics),
        MediaItem(title: "Linear Algebra", description: "A mathematical foundation course centered on vectors, matrices, transformations, and systems of equations.Students learn concepts used in computer graphics, machine learning, physics, and engineering.The course develops analytical thinking and problem-solving skills through abstract mathematical reasoning.", review: "Challenging but rewarding. I like how it connects abstract math to real applications like AI and graphics.", image: .algebra),
        MediaItem(title: "iOS Development", description: "A hands-on course covering the fundamentals of building mobile applications for Apple devices.Students learn Swift programming, Xcode tools, UI frameworks, APIs, and best practices for app design and performance.The course culminates in developing functional, polished iOS apps.", review: "My favorite course because it combines logic and creativity. It’s amazing to turn an idea into a working app on your phone.", image: .ios),
        MediaItem(title: "UI/UX Design", description: "An exploration of user interface and user experience principles to design intuitive and visually appealing digital products.Students study usability, accessibility, wireframing, prototyping, and user research.The course emphasizes creating designs that balance aesthetics with seamless user interaction.", review: "I enjoyed this course because it turns ideas into meaningful experiences. It’s all about understanding people and designing solutions that feel natural, beautiful, and intuitive.", image: .uiUx),
        MediaItem(title: "Web Development", description: "A course focused on building modern websites and web applications using front-end and back-end technologies.Students learn HTML, CSS, JavaScript, databases, frameworks, and deployment tools.The course emphasizes responsive design, performance, and real-world development workflows.", review: "I loved this course because it teaches you how to build anything from the ground up. It’s all about transforming logic into living, interactive environments on the web.", image:.webdev),
        MediaItem(title: "Object-Oriented Programming", description: "An introduction to programming using the principles of classes, objects, inheritance, and polymorphism.Students learn how to design reusable, modular, and maintainable software.The course provides hands-on experience with OOP languages such as Java, Python, or C++.", review: "I found this course interesting because it makes complex systems feel manageable. It’s all about breaking problems into parts and building clean, scalable solutions.", image:.oop ),
        MediaItem(title: "IT Audit", description: "A specialized course examining how information systems are evaluated for security, compliance, and efficiency.Students learn auditing standards, risk assessment, internal controls, and technological safeguards.The course prepares learners to ensure that digital environments remain reliable and secure.", review: "I was keen on this course because it reveals how systems stay trustworthy. It’s all about examining risks, strengthening processes, and ensuring everything works as intended.", image: .audit),
        MediaItem(title: "Kazakh Language", description: "A language course focused on developing reading, writing, listening, and speaking skills in Kazakh.Students learn grammar, vocabulary, pronunciation, and cultural context.The course supports practical communication and deeper understanding of Kazakh heritage.", review: "I enjoyed this course because it connects you to heritage through words. It’s all about understanding meaning, discovering tradition, and finding your voice in a new language.", image: .kazakh)
        
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        // Do any additional setup after loading the view.
    }
}

extension CoursesViewController: UITableViewDataSource, UITableViewDelegate{
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
