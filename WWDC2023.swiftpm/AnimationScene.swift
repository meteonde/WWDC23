//
//  AnimationScene.swift
//  WWDC2023
//
//  Created by MATHEUS SOUZA on 13/04/23.
//

import Foundation
import SpriteKit

class AnimationScene: SKScene {
    
   
    let x = [30,60,32,23]
    let animationNames = ["intro", "scene", "Cigana", "cena"]
    
  
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
        
        let sprite = SKSpriteNode(texture: SKTexture(imageNamed: "\(animationNames[StoryController.shared.animationIndex])1"), size: CGSize(width: 1024, height: 1366))
        
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        print(StoryController.shared.animationIndex)
        if(animationNames[StoryController.shared.animationIndex] == "cena"){
            if StoryController.shared.animationIndex != 3{
                sprite.run(.repeatForever(.animate(with: .init(whithFormat: "\(animationNames[StoryController.shared.animationIndex]) %@", range: 1...x[StoryController.shared.animationIndex]), timePerFrame: 0.1)))
            }else {
                sprite.run(.repeatForever(.animate(with: .init(whithFormat: "\(animationNames[StoryController.shared.animationIndex]) %@", range: 1...x[StoryController.shared.animationIndex]), timePerFrame: 0.2)))
            }
           
        }
        else{
            sprite.run(.repeatForever(.animate(with: .init(whithFormat: "\(animationNames[StoryController.shared.animationIndex])%@", range: 1...x[StoryController.shared.animationIndex]), timePerFrame: 0.1)))
         
        }
       
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
            
            if StoryController.shared.animationIndex < 4{
                self.view?.presentScene(Story1Scene.newScene())
            }else {
                self.view?.presentScene(ExploreScene.newScene())
            }
        }
        
        sprite.position = CGPoint(x: size.width - 155, y: 147)
        sprite.zPosition = 1
        
        return sprite
    }()
}
