//
//  ContentView.swift
//  ToDo-List
//
//  Created by Juuso on 14.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    
    
    @State private var newTodoItem =  ""
    
    
    
    
    
    var body: some View {
        
        NavigationView {
            List{
                Section(header: Text("whats next?")){
                    HStack{
                        TextField("New item", text: self.$newTodoItem)
                        Button(action:{
                            
                        }){
                            Image(systemName: "plus.circle.fill")
                            foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
            }
        }
        .navigationBarTitle(Text("ToDo List"))
        .navigationBarItems(trailing: EditButton())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
