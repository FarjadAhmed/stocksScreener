//
//  CountrySelectionView.swift
//  stocksScreener
//
//  Created by Farjad Ahmed on 31.12.25.
//

import SwiftUI

struct CountrySelectionView: View {
    @Binding var selectedCountry: Country?
    let countries: [Country]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Select Country")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(countries) { country in
                        CountryButton(
                            country: country,
                            isSelected: selectedCountry?.id == country.id
                        ) {
                            selectedCountry = country
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CountryButton: View {
    let country: Country
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Text(country.flag)
                    .font(.system(size: 40))
                
                Text(country.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .frame(width: 100, height: 100)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(isSelected ? Color.accentColor.opacity(0.2) : Color(.secondarySystemBackground))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(isSelected ? Color.accentColor : Color.clear, lineWidth: 2)
                    )
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CountrySelectionView(
        selectedCountry: .constant(Country.allCountries.first),
        countries: Country.allCountries
    )
}

