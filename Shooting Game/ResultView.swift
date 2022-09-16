//
//  ResultView.swift
//  Shooting Game
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

struct ResultView: View {
    @Binding var score: Int
    var body: some View {
        Spacer()
        Spacer()
        Text("スコア")
            .font(.title)
        Spacer()
        Text("\(score)")
            .font(.title)
        Spacer()
        Spacer()
    }
}

//struct ResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultView(score:)
//    }
//}
