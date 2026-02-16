//
//  ReservationForm.swift
//  
//
//  Created by Ashley Randle on 2/11/26.
//

import SwiftUI

struct ReservationForm: View {
    
        
    let restaurantName = "Little Lemon"
    let maxGuest = 10
        
    @State private var userName = ""
    @State private var guestCount = 1
    @State private var phoneNumber = ""
    @State private var previewText = ""
    @State private var children = 0
    @State private var outdoorSeating = false
    @State private var occasion = ""
    
        
    var body: some View {
        Form {
            Section{
                Text(restaurantName)
                    .font(.title2)
                    .bold()
                
                Text("Reservation Form")
                    .foregroundColor(.primary)
                
                
            }
            
            Section(header: Text("Reservation Details")){
                TextField("Name", text: $userName)
                    .textInputAutocapitalization(.words)
                    .autocorrectionDisabled(true)
                
                if userName.isEmpty {
                    Text("Please enter name")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                Stepper("Guest: \(guestCount)", value: $guestCount, in: 1...maxGuest)
                
                if guestCount >= 8 {
                    Text("Large Group - Please Call Ahead")
                        .font(.footnote)
                        .foregroundColor(.orange)
                }
                
                TextField("Occasion (Birtday, Anniversary, etc.)", text: $occasion)
                    .textInputAutocapitalization(.sentences)
                    .autocorrectionDisabled(true)
                
                
            }
            
            Section(header: Text ("Contact")) {
                TextField("Phone Number", text: $phoneNumber)
                    .keyboardType(.numberPad)
            }
            
            Section(header: Text("Optional")) {
                Stepper("Children: \(children)", value: $children, in: 0...10)
                
                if children > 0 {
                    Text("Children's Special Available")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                
                Toggle("Outdoor Seating", isOn: $outdoorSeating)
                
                if outdoorSeating {
                    Text("Note: Outdoor seating selected")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
            }
            
            Section{
                Button("Preview Reservation") {
                    previewText =
                    """
                    Name: \(userName)
                    Phone: \(phoneNumber)
                    Children: \(children)
                    Outdoor Seating: \(outdoorSeating)
                    """
                }
                .disabled(userName.isEmpty)
            }
            
            Section(header: Text("Preview")){
                Text(previewText)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .textSelection(.enabled)
            }
            
            
        }

        

    }
}

#Preview {
   ReservationForm()
}
