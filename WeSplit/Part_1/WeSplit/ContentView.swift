//
//  ContentView.swift
//  WeSplit
//
//  Created by Dmitry Chernyshev on 28.08.2021.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        VStack {
            Picker("Select your student", selection: $selectedStudent){
                ForEach(0 ..< students.count){ id in
                    Text(students[id])
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
