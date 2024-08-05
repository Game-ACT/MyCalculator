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
        let exp: NSExpression = NSExpression(format: expression)
        let result: NSNumber = exp.expressionValue(with: nil, context: nil) as! NSNumber
        display = result.stringValue
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
                                            Color.orange.opacity(1) :
                                                Color.blue.opacity(1))
                                .cornerRadius(20)
                                .foregroundStyle(.white)
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
