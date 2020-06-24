//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Danny Vo on 2020-06-06.
//  Copyright © 2020 Danny Vo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature = ""
    @State private var orig_value = 0
    @State private var new_value = 1
    
    let unit = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var converted: Double{
        let temp = Double(temperature) ?? 0
        var converted_temp = 0.00
        
        if orig_value == new_value{
            return temp
        }

        if orig_value == 0{
            if new_value == 1{
                converted_temp = (temp * 9/5) + 32
            } else if new_value == 2{
                converted_temp = (temp + 273.15)
            }
        } else if orig_value == 1{
            if new_value == 0{
                converted_temp = (temp - 32) * 5/9
            } else if new_value == 2{
                converted_temp = (temp - 32) * 5/9 + 273.15
            }
        } else if orig_value == 2{
            if new_value == 0{
                converted_temp = (temp - 273.15)
            } else if new_value == 1{
                converted_temp = (temp - 273.15) * 9/5 + 32
            }
        }
        return converted_temp
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Enter temperature")){
                    TextField("Temperature", text: $temperature)
                        .keyboardType(.decimalPad)
                    
                    Picker("Original Unit", selection: $orig_value){
                        ForEach(0 ..< unit.count){
                            Text("\(self.unit[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Convert to")){
                    Picker("Convert to", selection: $new_value){
                        ForEach(0 ..< unit.count){
                            Text("\(self.unit[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("\(converted, specifier: "%.2f") \(self.unit[new_value])")
                }
            }
            .navigationBarTitle("Temperature Conversion", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
