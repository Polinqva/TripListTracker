//
//  ContentView.swift
//  TripLists
//
//  Created by Polina Smirnova on 18.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TripViewModel()
    @State private var searchText = ""
    @State private var isShowingAddTripSheet = false
    
    @State private var selectedTrip: Trip? = nil
    @State private var isShowingTripDetailSheet = false
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        VStack {
            // Search bar and add button
            HStack {
                TextField("Search for trips", text: $searchText)
                    .font(.system(size: 16, weight: .medium))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                    .foregroundStyle(.pink)
                
                Button(action: {
                    isShowingAddTripSheet = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.pink)
                        .padding(.horizontal, 10)
                }
            }
            .padding()
            
            // Vertical scroll view with grid of trip cards
            ScrollView(.vertical, showsIndicators: true) {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.trips) { trip in
                        TripCard(
                            title: trip.title,
                            color: trip.color,
                            iconName: trip.iconName)
                        .onTapGesture {
                            selectedTrip = trip
                            isShowingTripDetailSheet = true
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        // 1) Sheet for adding a new trip
        .sheet(isPresented: $isShowingAddTripSheet) {
            AddTripView(viewModel: viewModel)
        }
        // 2) Sheet for viewing trip details
        .sheet(item: $selectedTrip) { trip in
            TripListDetailView(trip: trip)
        }
    }
}

#Preview {
    ContentView()
}
