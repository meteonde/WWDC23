//
//  AnimationScene.swift
//  WWDC2023
//
//  Created by MATHEUS SOUZA on 13/04/23.
//

import Foundation
import SpriteKit

class AnimationScene: SKScene {
    
    let animationNames = ["intro", "scene", "Cigana", "Cigana"]
    
    class func newScene() -> AnimationScene {
        let scene = AnimationScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scene.scaleMode = .aspectFill
        return scene
    }
    
    override func didMove(to view: SKView) {
        addChild(backButton)
        addChild(nextSceneButton)
        addChild(storyBackground)
    }
    
    lazy var storyBackground : SKSpriteNode = {
        
        let sprite = SKSpriteNode(texture: SKTexture(imageNamed: "\(animationNames[StoryController.shared.animationIndex])1"), size:  SKTexture(imageNamed: "\(animationNames[StoryController.shared.animationIndex])1").size())
        
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        sprite.run(.repeatForever(.animate(with: .init(whithFormat: "\(animationNames[StoryController.shared.animationIndex])%@", range: 1...30), timePerFrame: 0.1)))
        sprite.zPosition = 0
        return sprite
    }()
    
    lazy var backButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "back1", pressedTexture: "back2"){
            self.view?.presentScene(Story1Scene.newScene())
        }
        
        sprite.position = CGPoint(x: size.width / 8, y: 147)
        sprite.zPosition = 1
        
        return sprite
    }()
    
    lazy var nextSceneButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "next1", pressedTexture: "next2"){
            StoryController.shared.storyIndex += 2
            StoryController.shared.animationIndex += 1
            self.view?.presentScene(Story1Scene.newScene())
        }
        
        sprite.position = CGPoint(x: size.width - 155, y: 147)
        sprite.zPosition = 1
        
        return sprite
    }()
}
