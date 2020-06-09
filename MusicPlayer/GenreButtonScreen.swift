//
//  GenreButtonScreen.swift
//  MusicPlayer
//
//  Created by Дубынин Семён on 09.06.2020.
//  Copyright © 2020 Дубынин Семён. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func genreButtonPressed(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization {(status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    func playGenre(genre: String) {
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
