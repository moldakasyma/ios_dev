//
//  ViewController.swift
//  player
//
//  Created by  Айя on 02.11.2025.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var player: AVAudioPlayer?
    var currentSongIndex=0
    let songFiles=["track1", "track2", "track3", "track4", "track5"]
    let songs=["Buy a heart","drinks or coffee","Just keep watching","KETPE","kick it"]
    let artists=["Nicki Minaj ft.Meek Mill", "ROSÉ","Tate McRae", "Dasdinlovee", "BLACKPINK"]
    let cover=[#imageLiteral(resourceName: "Track1"), #imageLiteral(resourceName: "Track2"), #imageLiteral(resourceName: "Track3"), #imageLiteral(resourceName: "Track4"), #imageLiteral(resourceName: "Track5")]
    
  
    @IBOutlet weak var songCoverUI: UIImageView!
    
    @IBOutlet weak var songNameLabel: UILabel!
    
    
   
    @IBOutlet weak var songArtistLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playButton.layer.cornerRadius=12
        prevButton.layer.cornerRadius=12
        nextButton.layer.cornerRadius=12
    }
    func loadSongs(index: Int){
        let songFile=songFiles[index]
        let songName=songs[index]
        let artistName=artists[index]
        let songCover=cover[index]
        
        songNameLabel.text=songName
        songArtistLabel.text=artistName
        songCoverUI.image=songCover
        
        guard let url = Bundle.main.url(forResource: songFile, withExtension: "mp3") else {
            return
        }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
        
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        if player==nil{
            loadSongs(index: currentSongIndex)
        }
        if player? .isPlaying==true{
            player?.pause()
        }
        else{
            player? .play()
        }
       
        
    }

    @IBAction func prevButton(_ sender: UIButton) {
        currentSongIndex-=1
        if currentSongIndex<0{
            currentSongIndex=songs.count-1
        }
        loadSongs(index: currentSongIndex)
        player? .play()
    }
    @IBAction func nextButton(_ sender: UIButton) {
        currentSongIndex+=1
        if currentSongIndex>=songs.count{
            currentSongIndex=0
        }
        loadSongs(index: currentSongIndex)
        player? .play()
    }
  
}

