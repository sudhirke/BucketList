//
//  BetterRestView.swift
//  BucketList
//
//  Created by Sudhir Kesharwani on 28/12/23.
//

import SwiftUI

struct BetterRestView: View {
    @Environment(\.presentationMode) var presentationMode // environment object that keeps track of what is shown

    @State private var wakeup = defaultWakeUpTime
    @State private var sleeepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    static var defaultWakeUpTime:Date{
        var component = DateComponents()
        component.hour = 5
        component.minute = 0
        return Calendar.current.date(from: component) ?? Date()
    }
    
    var body: some View {
        
        NavigationView{
            Form{
                
                VStack(alignment:.leading, spacing: 0 ){
                    Text("When do you want to wakeup?")
                        .font(.headline)
                    DatePicker("Please enter time",
                               selection: $wakeup,
                               displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                }
                
                VStack(alignment:.leading, spacing: 0 ){
                    Text("Desired amount of sleep?")
                        .font(.headline)
                    Stepper(value: $sleeepAmount,in: 4...12,step:0.25){
                        Text("\(sleeepAmount,specifier:"%g") hours")
                    }
                }
                
                
                VStack(alignment:.leading, spacing: 0 ){
                    Text("Daily coffee intake?")
                        .font(.headline)
                    Stepper(value: $coffeeAmount,in: 1...8,step:1){
                        Text("\(coffeeAmount) cups")
                    }
                }
        

            }
            .padding()
            .navigationTitle("Better Rest")
            .navigationBarBackButtonHidden(true) // hide the back button
            .onTapGesture {
                // adding a tapGesture
                    self.presentationMode.wrappedValue.dismiss() // dismissing current view once the text is tabbed
            }
            .navigationBarItems(trailing:
                    Button("Calculate",action: calculateBedtime)
                 )
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
                })
        }
        
    }
    
    func calculateBedtime() {
        
        let sleepTime = wakeup - 6.5
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        alertTitle = "Your ideal bed time is:"
        alertMessage = "You should go to bed at \(formatter.string(from: sleepTime))"
        showAlert = true

    }
}

#Preview {
    BetterRestView()
}
