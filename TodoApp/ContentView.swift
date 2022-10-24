//
//  ContentView.swift
//  TodoApp
//
//  Created by Victor Svensson on 2022-10-25.
//

import SwiftUI

struct ContentView: View {
    var categoryList = ["All" ,"Shopping list", "Work", "Activites"]
    var body: some View {
        NavigationStack{
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (spacing: 20) {
                    Text("Hej")
                        .padding([.bottom, .top], 10)
                        .padding([.horizontal], 20)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(50)
                    Text("Hejsan")
                }
                .padding()
            }
            List {
                
            }
            .navigationTitle("The best todo app")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
