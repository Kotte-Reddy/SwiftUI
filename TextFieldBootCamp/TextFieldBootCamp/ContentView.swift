//
//  ContentView.swift
//  TextFieldBootCamp
//
//  Created by Reddanna Kotte on 01/08/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text: String = ""
    @State private var dataArray: [String] = []
    
    var body: some View {
        VStack {
            TextField("Title", text: $text)
               // .textFieldStyle(PlainTextFieldStyle())
                .padding()
                .frame(height: 55.0)
                .frame(maxWidth: .infinity)
                
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10.0)
                .foregroundColor(.red)
               
            
            Button("SAVE") {
                saveText()
            }
            .font(.title)
            .fontWeight(.bold)
            .frame(height: 55.0)
            .frame(maxWidth: .infinity)
            .cornerRadius(10.0)
            .background(validText() ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(10.0)
            .disabled(!validText())
            
            ForEach(dataArray, id: \.self) { item in
                Text(item)
                    .font(.largeTitle)
            }
            
            Spacer()
        }
        .padding()
    }
    
    func validText() -> Bool {
        if text.count >= 3 {
            return  true
        }
        return false
    }
    
    func saveText() {
        if !text.isEmpty {
            dataArray.append(text)
            text = ""
        }
    }
}

#Preview {
    ContentView()
}
