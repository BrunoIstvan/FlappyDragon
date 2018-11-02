//
//  GameViewController.swift
//  FlappyDragon
//
//  Created by Usuário Convidado on 21/08/2018.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVKit

class GameViewController: UIViewController {

    var stage: SKView!
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stage = view as! SKView
        stage.ignoresSiblingOrder = true
        presentScene()
        playMusic()
    }
    
    func playMusic() {
        guard let musicURL = Bundle.main.url(forResource: "music", withExtension: "m4a") else {
            return
        }
        musicPlayer = try! AVAudioPlayer(contentsOf: musicURL)
        musicPlayer.numberOfLoops = -1
        musicPlayer.volume = 0.4
        musicPlayer.play()
        
    }
    
    func presentScene() {
        let scene = GameScene(size: CGSize(width: 320, height: 568))
        scene.scaleMode = .aspectFill
        scene.gameViewController = self
        stage.presentScene(scene, transition: SKTransition.doorway(withDuration: 0.5))
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}







