//
//  ContentView.swift
//  MyCalculator
//
//  Created by Thapat Auechaikasem on 30/7/67.
//

import SwiftUI

struct ContentView: View {
    
    @State var display = "0"
    
    var button: [[String]] = [
        ["7", "8", "9", "÷"],
        ["4", "5", "6", "×"],
        ["1", "2", "3", "-"],
        ["C", "0", ".", "+"],
        ["="]
    ]
    
    var body: some View {
        ZStack {
            
        }
    }
}

#Preview {
    ContentView()
}
