//
//  StoryController.swift
//  WWDC2023
//
//  Created by MATHEUS SOUZA on 13/04/23.
//

import Foundation

class StoryController {
    static var shared: StoryController = {
        return StoryController()
    }()
    
    var storyIndex: Int = 1
    var animationIndex: Int = 0
}
