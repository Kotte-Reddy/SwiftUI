//
//  ContentView.swift
//  ViewBuilderDemo
//
//  Created by Reddanna Kotte on 23/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isEditable = false
    @State private var name = "Nilesh"
    var body: some View {
        VStack {
            
            //editableView
            
            ButtonView(text: "Nilesh Reddy", color: Color.red) {
                Text("Please welcome new page")
            }
            
            ButtonView(text: "Like", color: Color.red) {
                Text("Please like and share subscribe..")
            }
        }
        .padding()
        .type()
        
    }
    
    @ViewBuilder
    private var editableView: some View {
        if isEditable {
          //return  AnyView(TextField("Enter Name", text: $name))
          TextField("Enter Name", text: $name)
        } else {
            //return  AnyView( Text(name))
            Text(name)
        }
    }
}
extension View {
    func type() -> some View {
        print(Swift.type(of: self))
        return self

    }
    
}

#Preview {
    ContentView()
}

struct ButtonView<Content: View>: View {
    
    @State private var showModel:Bool = false
    let text:String
    let color:Color
    let content : Content
    
    init(text: String, color: Color, @ViewBuilder contentBuilder:() -> Content) {
        self.text = text
        self.color = color
        self.content = contentBuilder()
    }
    
    var body: some View {
        VStack {
            Spacer()
            Button(){
                showModel = true
            }label: {
                Text(text)
                    .padding(10)
                    .foregroundColor(color)
            }.sheet(isPresented: $showModel) {
                content
            }
            .background(Color.yellow)
        }
    }
}
