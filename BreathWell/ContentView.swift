import SwiftUI

struct ContentView: View {
    @State var isStartBreath: Bool = false
    var stopWatch: StopWatch = StopWatch()
    @State var elapsedTime: Double = 0
    
    private static var formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = [.pad]
        formatter.allowsFractionalUnits = true
        
        return formatter
    }()
    @ObservedObject var stopwatch: Stopwatch2
    var body: some View {
        ZStack {
            Color("ButtonColor")
                .ignoresSafeArea()
            VStack {
                Spacer()
                    .frame(height: 70)
                Text(self.elapsedTimeStr(timeInterval: self.stopwatch.elapsedTime))
//                Text(elapsedTime.description)
                    .bold()
                    .font(.system(size: 50))
                Spacer()
                
                Button {
                    self.stopwatch.isRunning.toggle()
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: UIScreen.main.bounds.width * 0.5)
                            .foregroundColor(Color("BackgroundColor"))
                        self.playPauseText
                    }
                }
                HStack {
                    Button {
                        self.stopwatch.reset()
                    } label: {
                        Text("Reset")
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
    private var playPauseText: Text {
        return Text(self.stopwatch.isRunning ? "호흡 중지" : "호흡 시작")
            .font(.title)
            .foregroundColor(.black)
    }
    
    private func elapsedTimeStr(timeInterval: TimeInterval) -> String {
        return ContentView.formatter.string(from: timeInterval) ?? ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(stopwatch: Stopwatch2())
    }
}
