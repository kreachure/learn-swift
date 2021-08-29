//
//  ContentView.swift
//  WeSplit
//
//  Created by Dmitry Chernyshev on 28.08.2021.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 1
    private var finalAmount: Double {           // computed property. No @State!
        let amount = Double(checkAmount) ?? 0.0 // optionals unwrapping
        let tip = amount * Double(tipPercentages[self.tipPercentage]) / 100
        let share = (amount + tip)
        return share
    }
    private var amountPerPerson: Double {
        return self.finalAmount / Double(self.numberOfPeople + 2)
    }
    
    var body: some View {
        NavigationView {  // navigation is important
            Form  {
                Section{
                    TextField("Amount", text: $checkAmount)
                    Picker("How many are you", selection: $numberOfPeople){
                        ForEach(2 ..< 100){
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) { // Section with header
                    Picker("Tip percent", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){ i in
                            Text("\(tipPercentages[i])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle()) // Picker style
                }
                Section(header: Text("Amount per person")){
                    Text("\(amountPerPerson, specifier: "%.2f")")  // Specifier for Text()
                }
                Section(header: Text("Grand total")){
                    Text("\(finalAmount, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("We Split") // navigation bar at Form - not at Navigation View
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
