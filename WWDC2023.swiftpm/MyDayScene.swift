//
//  MyDayScene.swift
//  WWDC2023
//
//  Created by MATHEUS SOUZA on 17/04/23.
//

import Foundation
import SpriteKit

class MyDayScene: SKScene {
    
    class func newScene() -> MyDayScene {
        let scene = MyDayScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scene.scaleMode = .aspectFill
        return scene
    }
    
    override func didMove(to view: SKView) {
        StoryController.shared.storyIndex = 1
        StoryController.shared.animationIndex = 0
        addChild(menuBackground)
        addChild(playButton)
        addChild(homeButton)
    }
    
    lazy var homeButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "home1", pressedTexture: "home2"){
            SoundManager.shared.playerStop()
            self.view?.presentScene(MenuScene.newScene())
        }
        
        
        sprite.position = CGPoint(x: size.width / 8, y: 1200)
        sprite.zPosition = 1
        
        return sprite
    }()
    lazy var menuBackground : SKSpriteNode = {
        
        let texture : [SKTexture] = [
            SKTexture(imageNamed: "TakeSomeTime1"),
            SKTexture(imageNamed: "TakeSomeTime2"),
            SKTexture(imageNamed: "TakeSomeTime3"),
            SKTexture(imageNamed: "TakeSomeTime4")
        ]
        
        let sprite = SKSpriteNode(texture: texture[0], size:  texture[0].size())
        
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        sprite.run(.repeatForever(.animate(with: texture, timePerFrame: 0.1)))
        
        return sprite
    }()
    
    lazy var playButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "MyDay1", pressedTexture: "MyDay2"){
            self.view?.presentScene(PickView.newScene())
        }
        
        sprite.position = CGPoint(x: size.width / 2, y: 247)
        
        return sprite
    }()
}
