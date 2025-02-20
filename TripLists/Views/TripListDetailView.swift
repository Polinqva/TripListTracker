//
//  ListDetailView.swift
//  TripLists
//
//  Created by Polina Smirnova on 18.02.2025.
//
import SwiftUI

struct TripListDetailView: View {
    @Environment(\.dismiss) var dismiss
    let trip: Trip
    @State private var selectedItems: [String: Bool] = [:]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(trip.title)
                    .font(.title2)
                    .padding()
                
                List(trip.itemsToBring, id: \.self) { item in
                                    HStack {
                                        Text(item)
                                        Spacer()
                                        Image(systemName: selectedItems[item, default: false] ? "checkmark.square.fill" : "square")
                                            .foregroundColor(.purple)
                                            .onTapGesture {
                                                selectedItems[item, default: false].toggle()
                                            }
                                    }
                                    .padding(.vertical, 5)
                                }
                            }
              
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        if !trip.title.isEmpty {
                        }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            Button(action: {
                // Your action here
            }) {
                Text("Add Item")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity) // Makes it stretch across the screen
                    .background(Color.purple)
                    .cornerRadius(12) // Rounded corners
                    .shadow(radius: 4) // Adds a subtle shadow
            }
            .padding(.horizontal)
        }
    }
}
#Preview {
    TripListDetailView(trip: Trip(id: UUID(), title: "Beach Vacation", color: .blue, iconName: "sun.max", itemsToBring: ["Sunscreen", "Swimsuit", "Towel"]))
}
