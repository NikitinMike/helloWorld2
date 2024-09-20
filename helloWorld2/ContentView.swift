//
//  ContentView.swift
//  helloWorld2
//
//  Created by МИХАИЛ on 19.09.2024.
//

import SwiftUI

struct ContentView: View {
        
    @State private var pressed : String = ""
//    Date.now.formatted(date: .omitted, time: .shortened)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    @State private var currentDate = Date.now
    @State var timeRemaining = 0
    @State var dots = 0
//        .formatted(date: .omitted, time: .shortened)

    var body: some View {

        VStack {
            Image(systemName: "rublesign.bank.building").imageScale(.medium)
            Text("БАНК")
                .font(.callout)
                .fontWeight(.medium)
            Text("Йошкар-Ола")
        }
        .padding()
        .font(.custom("Georgia-Bold", size: 36, relativeTo: .headline))
        .foregroundColor(.blue)

        HStack {
            Image(systemName: dots % 5 < 1 ? "circle.dotted" : "circle.dotted.circle.fill")
            Image(systemName: dots % 5 < 2 ? "circle.dotted" : "circle.dotted.circle.fill")
            Image(systemName: dots % 5 < 3 ? "circle.dotted" : "circle.dotted.circle.fill")
            Image(systemName: dots % 5 < 4 ? "circle.dotted" : "circle.dotted.circle.fill")
        }
        
        if #available(iOS 16.0, *) {
            VStack {
                HStack {
                    Button("", systemImage: "1.circle", action:{pressButton(s:"1")})
                    Button("", systemImage: "2.circle", action:{pressButton(s:"2")})
                    Button("", systemImage: "3.circle", action:{pressButton(s:"3")})
                }
                HStack {
                    Button("", systemImage: "4.circle", action:{pressButton(s:"4")})
                    Button("", systemImage: "5.circle", action:{pressButton(s:"5")})
                    Button("", systemImage: "6.circle", action:{pressButton(s:"6")})
                }
                HStack {
                    Button("", systemImage: "7.circle", action:{pressButton(s:"7")})
                    Button("", systemImage: "8.circle", action:{pressButton(s:"8")})
                    Button("", systemImage: "9.circle", action:{pressButton(s:"9")})
                }
                HStack{
                    Button("", systemImage: "face.dashed", action:{pressButton(s:"face")})
                    Button("", systemImage: "0.circle", action:{pressButton(s:"0")})
                    Button("", systemImage: "arrow.left.circle.dotted", action:{pressButton(s:"back")})
                }

                Text(pressed).font(.footnote).foregroundColor(Color.red)

                Text("\(timeRemaining)").foregroundColor(.yellow).font(.system(size: 44))
                    .onReceive(timer) { _ in if timeRemaining > 0 {timeRemaining -= 1 }
                    else { pressed = Date.now.formatted(date: .omitted, time: .shortened)}
                }
            }
            .imageScale(.large)
            .font(.system(size: 66))
            .fontWeight(.thin)
            .foregroundColor(.green)
            .padding()
        } else {
            // Fallback on earlier versions
        }
    }
    func pressButton(s:String) {
        pressed = "Button \(s) pressed"
        timeRemaining = 9
        dots += 1
    }
}

#Preview {
    ContentView()
}
