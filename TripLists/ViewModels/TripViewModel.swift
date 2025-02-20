//
//  TripViewModel.swift
//  TripLists
//
//  Created by Polina Smirnova on 18.02.2025.
//

import SwiftUI

class TripViewModel: ObservableObject {
    @Published var trips: [Trip] = []
    
    init() {
        self.trips = [
            Trip(id: UUID(), title: "Beach Vacation", color: .green, iconName: "sun.max.fill", itemsToBring: ["Swimsuits", "Sunscreen", "Beach towel"]),
            Trip(id: UUID(), title: "Mountain Hiking", color: .blue, iconName: "leaf.fill", itemsToBring: ["Hiking boots", "Map", "Water bottle"]),
            Trip(id: UUID(), title: "City Tour", color: .purple, iconName: "building.2.fill", itemsToBring: ["Camera", "Map", "Comfortable shoes"]),
            Trip(id: UUID(), title: "Camping Trip", color: .orange, iconName: "tent.fill", itemsToBring: ["Sleeping bag", "Flashlight", "Cooking supplies"])
        ]
    }
    
    // Example method to add a new trip
    func addTrip(title: String, color: Color, iconName: String) {
        let newTrip = Trip(id: UUID(), title: title, color: color, iconName: iconName, itemsToBring: [])
        trips.append(newTrip)
    }
}
