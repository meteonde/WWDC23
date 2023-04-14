//
//  AboutScene.swift
//  WWDC2023
//
//  Created by MATHEUS SOUZA on 14/04/23.
//

import Foundation
import SpriteKit

class AboutScene: SKScene {
    
    let storyNames = "Storytelling"
    
    class func newScene() -> AboutScene {
        let scene = AboutScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scene.scaleMode = .aspectFill
        return scene
    }
    
    override func didMove(to view: SKView) {
        addChild(homeButton)
        addChild(nextSceneButton)
        addChild(storyBackground)
       
    }
    
    lazy var storyBackground : SKSpriteNode = {
        
        let texture = SKTexture(imageNamed: "About")

        let sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
    
        sprite.zPosition = 0
        return sprite
    }()
    
    lazy var homeButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "home1", pressedTexture: "home2"){
            SoundManager.shared.playerStop()
            self.view?.presentScene(MenuScene.newScene())
        }
        
        sprite.position = CGPoint(x: size.width / 8, y: 1200)
        sprite.zPosition = 1
        
        return sprite
    }()
    
   
    
    lazy var nextSceneButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "next1", pressedTexture: "next2"){
            SoundManager.shared.playsound(sound: "scene1",type: "mp3")
         
            self.view?.presentScene(Story1Scene.newScene())
        }
        
        sprite.position = CGPoint(x: size.width - 155, y: 147)
        sprite.zPosition = 1
        
        return sprite
    }()
}
