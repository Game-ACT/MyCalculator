//
//  ContentView.swift
//  MyCalculator
//
//  Created by Thapat Auechaikasem on 30/7/67.
//

import SwiftUI

struct ContentView: View {
    
    @State var display = "0"
    
    var buttons: [[String]] = [
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "-"],
        ["C", "0", ".", "+"],
        ["="]
    ]
    
    private func buttonTapped(_ button: String) {
        switch button {
        case "0"..."9", "." :
            if display == "0" {
                display = button
            } else {
                display.append(button)
            }
        case "÷", "×", "-", "+" :
            display.append("\(button)")
        case "=" :
            eval()
        case "C" :
            display = "0"
        default :
            break
        }
    }
    
    private func eval() {
        let expression = display.replacingOccurrences(of: "÷", with: "/")
            .replacingOccurrences(of: "×", with: "*")
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text(display)
                .font(.largeTitle)
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self ) { button in
                        Button(action: {
                            self.buttonTapped(button)
                        }) {
                            Text(button)
                                .font(.largeTitle)
                                .frame(width: 80, height: 80)
                                .background(button == "C" ?
                                            Color.red.opacity(0.1) :
                                                Color.blue.opacity(0.1))
                                .cornerRadius(20)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
