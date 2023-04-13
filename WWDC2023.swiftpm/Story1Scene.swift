//
//  Story1Scene.swift
//  WWDC2023
//
//  Created by MATHEUS SOUZA on 13/04/23.
//

import Foundation
import SpriteKit

class Story1Scene: SKScene {
    
    let storyNames = "Storytelling"
    
    class func newScene() -> Story1Scene {
        let scene = Story1Scene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scene.scaleMode = .aspectFill
        return scene
    }
    
    override func didMove(to view: SKView) {
        addChild(homeButton)
        addChild(nextSceneButton)
        addChild(storyBackground)
        addChild(soundButton)
    }
    
    lazy var storyBackground : SKSpriteNode = {
        
        let texture : [SKTexture] = [
            SKTexture(imageNamed: "\(storyNames)\(StoryController.shared.storyIndex)"),
            SKTexture(imageNamed: "\(storyNames)\(StoryController.shared.storyIndex+1)")
        ]
        
        let sprite = SKSpriteNode(texture: texture[0], size:  texture[0].size())
        
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        sprite.run(.repeatForever(.animate(with: texture, timePerFrame: 0.1)))
        sprite.zPosition = 0
        return sprite
    }()
    
    lazy var homeButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "home1", pressedTexture: "home2"){
            self.view?.presentScene(MenuScene.newScene())
        }
        
        sprite.position = CGPoint(x: size.width / 8, y: 1200)
        sprite.zPosition = 1
        
        return sprite
    }()
    
    lazy var soundButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "sound1", pressedTexture: "sound2"){
            print("Som Mutado")
            //colocar a função de som aqui :)
        }
        
        sprite.position = CGPoint(x: size.width - 155, y: 1200)
        sprite.zPosition = 1
        
        return sprite
    }()
    
    lazy var nextSceneButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "next1", pressedTexture: "next2"){
            self.view?.presentScene(AnimationScene.newScene())
        }
        
        sprite.position = CGPoint(x: size.width - 155, y: 147)
        sprite.zPosition = 1
        
        return sprite
    }()
}
