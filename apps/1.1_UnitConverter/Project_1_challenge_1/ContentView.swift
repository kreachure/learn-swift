//
//  ContentView.swift
//  Project_1_challenge_1
//
//  Created by Dmitry Chernyshev on 29.08.2021.
//

import SwiftUI

struct ContentView: View {
    let units = ["m", "cm", "mm", "km", "miles", "feet"]
    let coeffs = ["m": 1.0, "cm": 0.01, "mm": 0.001, "km": 1000.0, "miles": 2400.0, "feet": 0.3048]
    @State private var convertFrom: String = "miles"
    @State private var convertTo: String = "km"
    @State private var sourceData: String = "10"
    
    private var sourceValue: Double {
        return Double(sourceData) ?? 0.0
    }
    
    private var meters: Double {
        let coeff = coeffs[convertFrom] ?? 0.0
        return self.sourceValue * coeff
    }
    
    private var target: Double {
        let coeff = coeffs[convertTo] ?? 0.0
        return self.meters / coeff
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Source units")){
                    TextField("Source units", text: $sourceData)
                    Picker("Convert from", selection: $convertFrom) {
                        ForEach(units, id: \.self){ unit in
                            Text(unit)
                        }
                    }
                    Picker("Convert to", selection: $convertTo) {
                        ForEach(units, id: \.self){ unit in
                            Text(unit)
                        }
                    }
                }
                Section(header: Text("Target")){
                    Text("\(target, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Unit converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
