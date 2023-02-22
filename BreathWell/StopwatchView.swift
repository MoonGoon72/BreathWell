import SwiftUI
struct StopwatchView: View {
    private static var formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [ .hour, .minute, .second ]
        formatter.zeroFormattingBehavior = [ .pad ]
        formatter.allowsFractionalUnits = true
        return formatter
    }()
    
    @ObservedObject var stopwatch: Stopwatch2
    var body: some View {
        HStack {
            Spacer()
            Text(self.elapsedTimeStr(timeInterval: self.stopwatch.elapsedTime))
            .font(.system(.body, design: .monospaced))
            Spacer()
            Button(action: {
                self.stopwatch.isRunning.toggle()
            }) {
                self.playPauseImage
            }
            
            Button(action: {
                self.stopwatch.reset()
            }) {
                Image(systemName: "gobackward")
               }.disabled(self.stopwatch.isRunning)
            Spacer()
       }.padding().background(Capsule().fill(Color.orange))
    }
    private var playPauseImage: Image {
        return Image(systemName: self.stopwatch.isRunning ? "pause":"play")
    }
    private func elapsedTimeStr(timeInterval: TimeInterval) -> String {
        return StopwatchView.formatter.string(from: timeInterval) ?? ""
    }
}
struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView(stopwatch: Stopwatch2())
    }
}
