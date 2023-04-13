//
//  MenuScene.swift
//  WWDC2023
//
//  Created by MATHEUS SOUZA on 13/04/23.
//

import Foundation
import SpriteKit

class MenuScene: SKScene {
    
    class func newScene() -> MenuScene {
        let scene = MenuScene(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scene.scaleMode = .aspectFill
        return scene
    }
    
    override func didMove(to view: SKView) {
        addChild(menuBackground)
        addChild(playButton)
    }
    
    lazy var menuBackground : SKSpriteNode = {
        
        let texture : [SKTexture] = [
            SKTexture(imageNamed: "play_1"),
            SKTexture(imageNamed: "play_2")
        ]
        
        let sprite = SKSpriteNode(texture: texture[0], size:  texture[0].size())
        
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        sprite.run(.repeatForever(.animate(with: texture, timePerFrame: 0.1)))
        
        return sprite
    }()
    
    lazy var playButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "Start_1", pressedTexture: "Start_2"){
            self.view?.presentScene(Story1Scene.newScene())
        }
        
        sprite.position = CGPoint(x: size.width / 2, y: 247)
        
        return sprite
    }()
}
