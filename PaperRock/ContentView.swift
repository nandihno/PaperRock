//
//  ContentView.swift
//  PaperRock
//
//  Created by Fernando De Leon on 14/8/2022.
//

import SwiftUI

struct ContentView: View {
    private var scissor:String = "psr-1";
    private var hand:String = "psr-3";
    private var rock:String = "psr-2";
    @State private var humanScore:Int = 0;
    @State private var cpuScore:Int = 0;
    @State private var cpuHand:Int = -1;
    private var engine:GameEngine = GameEngine();
    
    fileprivate func processHand(humanHand: Int) {
        cpuHand = Int.random(in: 1...3);
        
        let winner = engine.processWinner(hand: humanHand, hand2: cpuHand);
        if(winner == GameEngine.USER) {
            humanScore += 1;
        }
        if(winner == GameEngine.CPU) {
            cpuScore += 1;
        }
    }
    
    func resetGame() -> Void {
        humanScore = 0;
        cpuScore = 0;
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[.cyan,.green]), startPoint: .topLeading, endPoint: .bottomLeading)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
               
                Image("title3")
                Spacer()
                VStack {
                    Spacer()
                    Text("Select your hand")
                    
                    HStack {
                        //buttons
                        Button {
                            processHand(humanHand: GameEngine.scissorType);
                        } label: {
                            Image(scissor);
                        }
                        Button {
                            processHand(humanHand: GameEngine.rockType);
                        } label: {
                            Image(rock);
                        }
                        Button {
                            processHand(humanHand: GameEngine.paperType);
                        } label: {
                            Image(hand);
                        }
                    }
                    Spacer()
                    Button(action: {
                        resetGame();
                        }) {
                            Text("New Game")
                                .frame(minWidth: 0, maxWidth: 200)
                                .font(.system(size: 18))
                                .padding()
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.black, lineWidth: 2)
                            )
                        }
                    Spacer()
                    Text("Computer Chose")
                    if(cpuHand > -1) {
                        let imgText:String = "psr-"+String(cpuHand);
                        Image(imgText);
                    }
                    
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Human")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom,10.0)
                        Text(String(humanScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("Computer")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom,10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    
                }
            }
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
