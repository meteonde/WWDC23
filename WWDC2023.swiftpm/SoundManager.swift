//
//  SoundManager.swift
//  WWDC2023
//
//  Created by MATHEUS SOUZA on 14/04/23.
//

import Foundation
import AVKit

public class SoundManager{
    
    static let shared = SoundManager()
    var player: AVAudioPlayer?
    
    
    func playsound(sound: String, type: String){
        
        guard let path = Bundle.main.path(forResource: sound, ofType: type) else{
            print("Resource not found: \(sound)")
            return
        }
        
        do{
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player?.play()
            print("tocando")
        }
        
        catch{
            print("Error")
        }
        
        
    }
    
    func playerStop(){
        player?.stop()
    }
}
