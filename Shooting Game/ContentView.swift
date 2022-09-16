//
//  ContentView.swift
//  Shooting Game
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

struct ContentView: View {
    @AppStorage ("high_score") var highScore=0
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("シューティングゲーム")
                    .font(.title)
                Spacer()
                Text("ハイスコア：\(highScore)")
                Spacer()
                NavigationLink(destination: gameView()){
                    Text("プレイ")
                        .font(.title)
                }
                    .navigationBarHidden(true)
//                    .navigationBarBackButtonHidden(true)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
