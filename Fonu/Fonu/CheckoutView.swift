//
//  CheckoutView.swift
//  Fonu
//
//  Created by Juuso on 10.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "Fonu Points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    @State private var paymentType = 0
    @State private var addLoyalityDetails = false
    @State private var loyalityNumber =  ""
    @State private var timpAmount = 1
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection:
                $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                            .fontWeight(.light)
                    }
                }
                Toggle(isOn: $addLoyalityDetails.animation()){
                    Text("Add Fonu loyality card")
                }
                if addLoyalityDetails{
                    TextField("Enter your Fonu ID", text: $loyalityNumber)
                }
            }
            Section(header: Text("Add a tip?")){
                Picker("Percentage:", selection: $timpAmount)
                {
                    ForEach(0 ..< Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])")
                            .fontWeight(.light)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header:
                Text("Total: $100")
            ){
                Button("Confirm order"){
                    //place order
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
