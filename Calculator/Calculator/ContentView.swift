//
//  ContentView.swift
//  Calculator
//
//  Created by Juuso on 21.2.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent, bracket, comma
    
    var title: String {
        switch self {
        case .zero: return "0"
        case.one: return "1"
        case.two: return "2"
        case .three: return "3"
        case.four: return "4"
        case.five: return "5"
        case .six: return "6"
        case.seven: return "7"
        case.eight: return "8"
        case .nine: return "9"
        case.plus: return "+"
        case.minus: return "-"
        case .multiply: return "x"
        case.plusMinus: return "+/-"
        case.percent: return "%"
        case.bracket: return"()"
        case.comma: return","
        case.divide: return"÷"
        case.equals: return"="
        default:
            return "AC"
        }
    }
    
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three,.four,.five,.six,.seven,.eight,.nine, .bracket, .comma:
            return Color(.darkGray)
        case .ac,.plusMinus,.percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
    
    
}

class GlobalEnvironment: ObservableObject{
    
    @Published var display = ""
    
    func receiveInput(calculatorButton: CalculatorButton){
        self.display = calculatorButton.title
    }
}



struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.comma, .zero, .bracket, .equals]
    ]
    
    
    var body: some View {
        
        ZStack(alignment:.bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 10){
                
                HStack{
                    Spacer()
                    Text(env.display).foregroundColor(.white).font(.system(size: 64))
                }.padding()
                
                
                ForEach(buttons, id: \.self){row in
                    HStack{
                        ForEach(row, id: \.self) { button in
                            
                            Button(action: {
                                self.env.receiveInput(calculatorButton: <#T##CalculatorButton#>)
                            }){
                                
                                Text(button.title)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(), height: self.buttonWidth())
                                    .foregroundColor(.white)
                                    .background(button.backgroundColor)
                                    .cornerRadius(self.buttonWidth())
                            }
                            
                            
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
        ContentView().environmentObject(GlobalEnvironment())
    }
}
