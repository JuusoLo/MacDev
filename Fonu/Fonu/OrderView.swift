//
//  OrderView.swift
//  Fonu
//
//  Created by Juuso on 10.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationView{
            List {
                Section{
                    ForEach(order.items) {
                        item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                Section{
                    NavigationLink(destination:
                    CheckoutView()) {
                        Text("Place Order")
                            .fontWeight(.light)
                            .padding(5)
                        Spacer()
                    }
                }.disabled(order.items.isEmpty)
            }
            .navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
