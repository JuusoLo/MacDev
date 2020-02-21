//
//  ContentView.swift
//  Calculator
//
//  Created by Juuso on 21.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case.one: return "1"
        case.two: return "2"
        default:
            return "AC"
        }
    }
    
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three,.four,.five,.six:
            return Color(.darkGray)
        case .ac,.plusMinus,.percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
    
    
}


struct ContentView: View {
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus]
    ]
    
    
    var body: some View {
        
        ZStack(alignment:.bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10){
                
                HStack{
                    Spacer()
                    Text("42").foregroundColor(.white).font(.system(size: 64))
                }.padding()
                
                
                ForEach(buttons, id: \.self){row in
                    HStack{
                        ForEach(row, id: \.self) { button in
                            Text(button.title)
                                .font(.system(size: 32))
                                .frame(width: self.buttonWidth(), height: self.buttonWidth())
                                .foregroundColor(.white)
                                .background(button.backgroundColor)
                                .cornerRadius(self.buttonWidth())
                            
                        }
                    }
                }
            }.padding(.bottom)
            
        }
    }
    
    func buttonWidth() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12 ) / 4
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
