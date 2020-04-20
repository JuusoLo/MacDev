//
//  ContentView.swift
//  Laskin
//
//  Created by Juuso on 2.3.2020.
//  Copyright © 2020 Juuso. All rights reserved.
//

import SwiftUI

struct CalculationState {
    var currentNumber: Double = 0
    
    var storedNumber: Double?
    var storedAction: ActionView.Action?
    
    mutating func appendNumber(_ number: Double){
        if number.truncatingRemainder(dividingBy: 1) == 0
            && currentNumber.truncatingRemainder(dividingBy: 1) == 0 {
            currentNumber = 10 * currentNumber + number
        }else{
            currentNumber = number
        }
    }
}

struct ContentView: View {
    
    @State var state = CalculationState()
    
    var displayedString : String {
        return String(format: "%.2f", arguments: [state.currentNumber])
    }
    
    
    var body: some View {
        
        VStack(alignment: .trailing, spacing: 20){
            Spacer()
            Text(displayedString)
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(3)
                .padding(.bottom, 64)
            
            HStack{
                FunctionView(state: $state, function: .cosinus)
                Spacer()
                FunctionView(state: $state, function: .sinus)
                Spacer()
                FunctionView(state: $state, function: .tanges)
                Spacer()
                ActionView(action: .multiply, state: $state)
                Spacer()
                ActionView(action: .square, state: $state)
                
            }
            
            HStack{
                NumberView(number: 7, state: $state)
                Spacer()
                NumberView(number: 8, state: $state)
                Spacer()
                NumberView(number: 9, state: $state)
                Spacer()
                ActionView(action: .divide, state: $state)
                
            }
            HStack{
                NumberView(number: 4,state: $state)
                Spacer()
                NumberView(number: 5, state: $state)
                Spacer()
                NumberView(number: 6, state: $state)
                Spacer()
                ActionView(action: .plus, state: $state)
                
            }
            HStack{
                NumberView(number: 1, state: $state)
                Spacer()
                NumberView(number: 2, state: $state)
                Spacer()
                NumberView(number: 3, state: $state)
                Spacer()
                ActionView(action: .minus, state: $state)
                
            }
            HStack{
                ActionView(action: .clear, state: $state)
                Spacer()
                NumberView(number: 0, state: $state)
                
                Spacer()
                NumberView(number: .pi, state: $state)
                Spacer()
                ActionView(action: .equal, state: $state)
            }
            
        }.padding(32)
    }
}

struct NumberView: View {
    let number: Double
    @Binding var state: CalculationState
    var numberString: String{
        if number == .pi {
            return "π"
        }
        return String(Int(number))
    }
    
    var body: some View {
        Text (numberString)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.orange)
            .cornerRadius(40)
            .onTapGesture {
                self.state.appendNumber(self.number)
        }
        
        
        
        
    }
}

struct FunctionView: View {
    enum MathFuction{
        case sinus, cosinus, tanges
        
        func string() -> String {
            switch self {
            case .sinus: return "sin"
            case .cosinus: return "cos"
            case .tanges: return "tan"
                
            }
        }
        
        func operation(_ input: Double) -> Double {
            switch self{
            case .sinus: return sin(input)
            case .cosinus: return cos(input)
            case .tanges: return tan(input)
            }
        }
        
    }
    
    @Binding var state: CalculationState
    var function: MathFuction
    
    var body: some View{
        return Text(function.string())
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .frame(width: 64, height: 64)
            .background(Color.gray)
            .cornerRadius(40)
            .onTapGesture {
                self.state.currentNumber =
                    self.function.operation(self.state.currentNumber)
        }
        
    }
}

struct ActionView: View {
    
    enum Action {
        case equal, clear, plus, minus, multiply, divide, square, power
        
        func image() -> Image {
            switch self{
            case .equal:
                return Image(systemName: "equal")
            case.clear:
                return Image(systemName: "xmark.circle")
            case.plus:
                return Image(systemName: "plus")
            case.minus:
                return Image(systemName: "minus")
            case.multiply:
                return Image(systemName: "multiply")
            case.divide:
                return Image(systemName: "divide")
            case.square:
                return Image(systemName: "multiply.square")
            case.power:
                return Image(systemName: "textformat.superscript")
            }
        }
        
        func calculate(_ input1: Double, _ input2: Double) -> Double? {
            switch self {
            case .plus:
                return input1+input2
            case .minus:
                return input1-input2
            case .multiply:
                return input1*input2
            case .divide:
                return input1/input2
            case .square:
                return input1 * input1
            case .power:
                return (input1 * input1)*input2
                
            default:
                return nil
            }
        }
    }
    
    let action: Action
    @Binding var state: CalculationState
    
    var body: some View{
        action.image()
            .font(Font.title.weight(.bold))
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.black)
            .cornerRadius(40)
            .onTapGesture {
                self.tapped()
        }
    }
    
    public func tapped() {
        
        switch action{
        case .clear:
            state.currentNumber = 0
            state.storedNumber = nil
            state.storedAction = nil
            break
            
        case .equal:
            guard let storedAction =
                state.storedAction
                else {
                    return
                
            }
            
            guard let storedNumber =
                state.storedNumber
                else{
                    return
            }
            
            guard let result = storedAction.calculate(storedNumber, state.currentNumber) else {
                return
            }
            
            state.currentNumber = result
            state.storedNumber = nil
            state.storedAction = nil
            break
        default:
            
            state.currentNumber = state.currentNumber
            state.currentNumber = 0
            state.storedAction = action
            break
        }
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
