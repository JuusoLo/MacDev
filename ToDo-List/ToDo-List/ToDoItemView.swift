//
//  ToDoItemView.swift
//  ToDo-List
//
//  Created by Juuso on 17.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    var title:String = ""
    var createdAt:String = ""
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .font(.headline)
                Text(createdAt)
                    .font(.caption)
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider
{
    static var previews: some View {
        ToDoItemView(title: "My great todo",
                     createdAt: "Today")
    }
}
