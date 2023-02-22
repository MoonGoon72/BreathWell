//
//  ContentView.swift
//  BreathWell
//
//  Created by cnu on 2023/02/19.
//

import SwiftUI

struct ContentView: View {
    @State var isStartBreath: Bool = false
    private var stopWatch: StopWatch = StopWatch()
    @State var elapsedTime: Double = 0
    
    private static var formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        formatter.allowsFractionalUnits = true
        
        return formatter
    }()
    var body: some View {
        ZStack {
            Color("ButtonColor")
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 70)
                Text(elapsedTime.description)
                    .bold()
                    .font(.system(size: 50))
                Spacer()
                
                Button {
                    isStartBreath.toggle()
                    isStartBreath ? stopWatch.start() : stopWatch.stop()
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
                HStack {
                    Button {
                        elapsedTime = stopWatch.getElapsedTime()
                    } label: {
                        Text("Time elapsed")
                    }

                    Button {
                        self.stopWatch.reset()
                    } label: {
                        Text("Reset")
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
    private func elapsedTimeStr(timeInterval: TimeInterval) -> String {
        return ContentView.formatter.string(from: timeInterval) ?? ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
