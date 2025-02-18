//
//  TripCardView.swift
//  TripLists
//
//  Created by Polina Smirnova on 18.02.2025.
//

import SwiftUI

struct TripCard: View {
    let title: String
    let color: Color
    let iconName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Circle().fill(Color.white.opacity(0.3)))
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
            }
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
        }
        .padding()
        .frame(width: 166, height: 140)
        .background(color)
        .cornerRadius(15)
        .shadow(radius: 4)
    }
}
