//
//  ToDoItem.swift
//  ToDo-List
//
//  Created by Juuso on 14.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import Foundation
import CoreData


public class ToDoItem:NSManagedObject, Identifiable {
    
    @NSManaged public  var createdAt:Date?
    @NSManaged public var title:String?
}

extension ToDoItem {
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as!
        NSFetchRequest<ToDoItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        
        return request
        
    }
}
