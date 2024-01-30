//
//  ContentView.swift
//  7Dots_Task
//
//  Created by CHINAM DWARIKANATH PATRA on 30/01/24.
//

//import SwiftUI
//
//struct ContentView: View {
//    @State private var totalTime = 20
//    @State private var timeRemaining = 20
//    @State private var isActive = false
//
//    var formattedTime: String {
//        let minutes = timeRemaining / 60
//        let seconds = timeRemaining % 60
//        return String(format: "%02d : %02d", minutes, seconds)
//    }
//    var body: some View {
//        VStack {
//            ZStack {
//                Circle()
//                    .stroke(lineWidth: 10)
//                    .opacity(0.3)
//                    .foregroundColor(.gray)
//
//                Circle()
//                    .trim(from: 0.0, to: CGFloat(timeRemaining) / CGFloat(totalTime)) // Assuming the total time is 120 seconds
//                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//                    .foregroundColor(.blue)
//                    .rotationEffect(Angle(degrees: -90))
//                    .animation(.easeInOut)
//
//                Text(formattedTime)
//                    .font(.system(size: 30)) // Adjust the font size as needed
//                    .fontWeight(.bold)
//            }
//            .padding()
//
//            HStack {
//                Button(action: {
//                    timeRemaining += 10
//                    if timeRemaining > totalTime {
//                        totalTime += 10
//                    }
//                    startTimer()
//                }) {
//                    Text("+10 sec")
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//
//                Button(action: {
//                    resetTimer()
//                }) {
//                    Text("Skip")
//                        .padding()
//                        .background(Color.red)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//            }
//            .padding()
//        }
//        .onAppear {
//            startTimer()
//        }
//    }
//
//    func startTimer() {
//        isActive = true
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            if timeRemaining > 0 && isActive {
//                timeRemaining -= 1
//            } else {
//                timer.invalidate()
//                isActive = false
//            }
//        }
//    }
//
//    func resetTimer() {
//        timeRemaining = 0
//        isActive = false
//    }
//}

import SwiftUI

struct ContentView: View {
    @State private var totalTime = 120
    @State private var timeRemaining = 120
    @State private var isActive = false
    
    var formattedTime: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d : %02d", minutes, seconds)
    }
    
    var body: some View {
        VStack {
            Text("Routine starting in...")
                .font(.system(size: 30))
                .padding()
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(timeRemaining) / CGFloat(totalTime))
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.blue)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut)
                Text(formattedTime)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
            }
            .padding()
            
            HStack {
                Button("+10 sec") {
                    //                    timeRemaining += 10
                    if timeRemaining+10 > totalTime {
                        totalTime += 10
                        timeRemaining += 10
                    } else {
                        timeRemaining += 10
                    }
                    if !isActive {
                        isActive.toggle()
                    }
                }
                .padding()
                .fontWeight(.bold)
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button("Skip") {
                    timeRemaining = 0
                    totalTime = 120
                    isActive = false
                }
                .padding()
                .fontWeight(.bold)
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .onAppear {
            isActive.toggle()
        }
        .padding()
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            if isActive && timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
}
#Preview {
    ContentView()
}
