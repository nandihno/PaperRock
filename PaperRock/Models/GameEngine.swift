//
//  GameEngine.swift
//  psr
//
//  Created by Fernando De Leon on 2/8/2022.
//

import Foundation

struct GameEngine: Identifiable {
    let id = UUID();
    
    static let scissorType:Int = 1;
    static let paperType:Int = 3;
    static let rockType:Int = 2;
    
    static let USER:String = "user";
    static let CPU:String = "cpu";
    static let DRAW:String = "draw";
    
    
    
    //if paper vs rock --> hand wins
    //if paper vs scissor --> scissor wins
    //if paper vs paper --> 0
    func processWinner(hand:Int, hand2:Int) -> String {
        if(hand == GameEngine.paperType)  {
            if(hand2 == GameEngine.rockType) {
                return GameEngine.USER;
            }
            if(hand2 == GameEngine.scissorType) {
                return GameEngine.CPU;
            }
            if(hand2 == GameEngine.paperType) {
                return GameEngine.DRAW;
            }
        }
        if(hand == GameEngine.rockType) {
            if(hand2 == GameEngine.rockType) {
                return GameEngine.DRAW;
            }
            if(hand2 == GameEngine.scissorType) {
                return GameEngine.USER;
            }
            if(hand2 == GameEngine.paperType) {
                return GameEngine.CPU;
            }
        }
        if(hand == GameEngine.scissorType) {
            if(hand2 == GameEngine.rockType) {
                return GameEngine.CPU;
            }
            if(hand2 == GameEngine.scissorType) {
                return GameEngine.DRAW;
            }
            if(hand2 == GameEngine.paperType) {
                return GameEngine.USER;
            }
            
        }
        return GameEngine.DRAW;
    }
    
    
    
    
    
}

