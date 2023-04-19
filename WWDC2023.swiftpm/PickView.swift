//
//  PickView.swift
//  WWDC2023
//
//  Created by MATHEUS SOUZA on 17/04/23.
//

import Foundation
import SpriteKit

class PickView: SKScene {
    
    let randomCardIndex = Int.random(in: 1...220)
    var clickedOneMoreTime = false
    
    class func newScene() -> PickView {
        let scene = PickView(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scene.scaleMode = .aspectFill
        return scene
    }
    
    override func didMove(to view: SKView) {
        addChild(menuBackground)
        addChild(nextSceneButton)
        addChild(backButton)
        addChild(homeButton)
        
        homeButton.isHidden = true
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
        
        let texture = SKTexture(imageNamed: "MyDay \(randomCardIndex)")
        
        let sprite = SKSpriteNode(texture: texture, size:  texture.size())
        
        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        
        return sprite
    }()
    
    lazy var nextSceneButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "finish1", pressedTexture: "finish2"){
         
            let textures : [SKTexture] = [
                SKTexture(imageNamed: "WhenclickFinish1"),
                SKTexture(imageNamed: "WhenclickFinish2")
            ]
            
            self.menuBackground.texture = textures[0]
            
            self.menuBackground.run(.repeatForever(.animate(with: textures, timePerFrame: 0.1)))
            self.nextSceneButton.removeFromParent()
            self.backButton.removeFromParent()
            self.homeButton.isHidden = false
        }
        
        sprite.position = CGPoint(x: size.width - 255, y: 147)
        sprite.zPosition = 1
        
        return sprite
    }()
    
    lazy var backButton : SKSpriteNode = {
        let sprite = ButtonNode(defaultTexture: "voltar1", pressedTexture: "voltar2"){
            if self.clickedOneMoreTime{
                self.view?.presentScene(MyDayScene.newScene())
            }else {
                self.menuBackground.texture = SKTexture(imageNamed: "InCaseOfReturn")
                self.clickedOneMoreTime = true
            }
        }
        
        sprite.position = CGPoint(x: size.width / 8, y: 147)
        sprite.zPosition = 1
        
        return sprite
    }()
}

