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
            Trip(id: UUID(), title: "Beach Vacation", color: .green, iconName: "sun.max.fill"),
            Trip(id: UUID(), title: "Mountain Hiking", color: .blue, iconName: "leaf.fill"),
            Trip(id: UUID(), title: "City Tour", color: .purple, iconName: "building.2.fill"),
            Trip(id: UUID(), title: "Camping Trip", color: .orange, iconName: "tent.fill")
        ]
    }
    
    // Example method to add a new trip
    func addTrip(title: String, color: Color, iconName: String) {
        let newTrip = Trip(id: UUID(), title: title, color: color, iconName: iconName)
        trips.append(newTrip)
    }
}
