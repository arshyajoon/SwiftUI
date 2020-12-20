//
//  ContentView.swift
//  WeSplit.swift
//
//  Created by Arshya GHAVAMI on 12/9/20.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    var totalAmount: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(Int(numberOfPeople) ?? 0 + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        let stringValue = "0.5"
        let doubleValue = Double(stringValue)
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    var body: some View {
        NavigationView {
        Form {
            Section {
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                
                TextField("Number of people", text: $numberOfPeople)
                    .keyboardType(.numberPad)
                
                Picker("Number of people", selection: $numberOfPeople) {
                       ForEach(2 ..< 100) {
                           Text("\($0) people")
                       }
                   }
            }
            Section(header: Text("How much tip do you want to leave?")) {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Amount per person")) {
                   Text("$\(totalPerPerson, specifier: "%.2f")")
            }
            Section(header: Text("Total amount for check")) {
               Text("$\(totalAmount, specifier: "%.2f")")
            }
        }
        .navigationBarTitle("WeSplit")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
