//
//  ContentView.swift
//  BreathWell
//
//  Created by cnu on 2023/02/19.
//

import SwiftUI

enum WatchStatus {
    case watchStart
    case watchStop
}

struct ContentView: View {
    @State var isStartBreath: Bool = false
    var body: some View {
        ZStack {
            Color("ButtonColor")
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 70)
                Text("00:00:00")
                    .bold()
                    .font(.system(size: 50))
                Spacer()
                    
                Button {
                    isStartBreath.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: UIScreen.main.bounds.width * 0.5)
                        .foregroundColor(Color("BackgroundColor"))
                        Text(isStartBreath ? "호흡 중지" : "호흡 시작")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
