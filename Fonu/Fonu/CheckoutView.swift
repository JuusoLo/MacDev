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
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 *
            Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
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
                Picker("Percentage:", selection: $tipAmount)
                {
                    ForEach(0 ..< Self.tipAmounts.count){
                        Text("\(Self.tipAmounts[$0])")
                            .fontWeight(.light)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header:
                Text("Total: $\(totalPrice, specifier: "%.2f")")
                    .font(.largeTitle)
            ){
                Button("Confirm order"){
                    self.showingPaymentAlert.toggle()
                    //place order
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert){
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f")- thank you!"), dismissButton: .default(Text ("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
