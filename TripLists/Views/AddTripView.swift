//
//  AddTripView.swift
//  TripLists
//
//  Created by Polina Smirnova on 18.02.2025.
//
import SwiftUI

struct AddTripView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TripViewModel
    
    @State private var title: String = ""
    @State private var selectedColor: Color = .green // default color
    @State private var selectedIconName: String = "sun.max.fill" // default icon
    
    // Predefined options
    let availableColors: [Color] = [.green, .blue, .purple, .orange, .red, .yellow, .pink, .indigo, .brown]
    let availableIcons: [String] = ["sun.max.fill", "leaf.fill", "building.2.fill", "tent.fill", "car.fill", "airplane"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Trip Name")) {
                    TextField("Enter trip name", text: $title)
                }
                
                Section(header: Text("Select Color")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(availableColors, id: \.self) { color in
                                Circle()
                                    .fill(color)
                                    .frame(width: 40, height: 50)
                                    .overlay(
                                        Circle()
                                            .stroke(selectedColor == color ? Color.black : Color.clear, lineWidth: 4)
                                    )
                                    .onTapGesture {
                                        selectedColor = color
                                    }
                                    .padding(4)
                            }
                        }
                    }
                }
                
                Section(header: Text("Select Icon")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(availableIcons, id: \.self) { icon in
                                Image(systemName: icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .padding(8)
                                    .background(selectedIconName == icon ? Color.gray.opacity(0.3) : Color.clear)
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        selectedIconName = icon
                                    }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Add New Trip")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        if !title.isEmpty {
                            viewModel.addTrip(title: title, color: selectedColor, iconName: selectedIconName)
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
        }
    }
}
// MARK: - Preview

#Preview {
    AddTripView(viewModel: TripViewModel())
}
