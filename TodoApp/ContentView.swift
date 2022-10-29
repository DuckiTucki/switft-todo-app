//
//  ContentView.swift
//  TodoApp
//
//  Created by Victor Svensson on 2022-10-25.
//

import SwiftUI

struct TodoTask: Hashable, Codable {
    let title: String
    let category: String
    var isDone = false
}

struct ContentView: View {
    @AppStorage("todos") private var todos : Data = Data()
    
    @State private var selectedCategory = 0;
    let categoryList = ["General", "Shopping", "Work", "Activites", "School"]
    
    @State private var inputText = ""
    @State private var todoList: [TodoTask] = []
    //onappear onchange
    
    func saveTodos (todosToSave: [TodoTask]) {
        guard let todosData = try? JSONEncoder().encode(todosToSave) else {
            return
        }
        self.todos = todosData
    }
    func getTodos() -> [TodoTask]{
        guard let todoData = try? JSONDecoder().decode([TodoTask].self, from: todos) else { return [] }
        
        return todoData;
    }

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
                            .onTapGesture {
                                selectedCategory = i
                            }
                    }
                }
                .padding()
            }
            List {
                ForEach(todoList, id: \.self) { object in
                    if(object.category == categoryList[selectedCategory]){
                        HStack {
                            Image(systemName: object.isDone ? "checkmark.square" : "square")
                            Text(object.title)
                                
                        }
                        .onTapGesture {
                            if let index = todoList.firstIndex(of: object){
                                todoList[index].isDone.toggle()
                            }
                            
                            saveTodos(todosToSave: todoList)
                        }
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        todoList.remove(at: index)
                    }
                    saveTodos(todosToSave: todoList)
                }
            }
            .onAppear{
                todoList = getTodos()
            }
            HStack {
                TextField("New todo", text: $inputText)
                    .onSubmit {
                        todoList.append(TodoTask(title: inputText, category: categoryList[selectedCategory]))
                        inputText = "";
                        
                        saveTodos(todosToSave: todoList)
                    }
                    .padding([.horizontal], 20)
                    .padding([.vertical], 10)
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
