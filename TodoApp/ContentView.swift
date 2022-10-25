//
//  ContentView.swift
//  TodoApp
//
//  Created by Victor Svensson on 2022-10-25.
//

import SwiftUI

struct todoList: Hashable {
    let title: String
    let cateogory: String
    var isDone = false
}

struct ContentView: View {
    let selectedCategory = 0;
    let categoryList = ["All", "Shopping", "Work", "Activites", "School"]
    var body: some View {
        NavigationStack{
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (spacing: 10) {
                    ForEach(categoryList.indices) {i in
                        Text(categoryList[i])
                            .padding([.bottom, .top], 10)
                            .padding([.horizontal], 20)
                            .background(selectedCategory == i ? .blue : Color(UIColor.lightGray))
                            .foregroundColor(.white)
                            .cornerRadius(50)
                    }
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
