//
//  IndexCardView.swift
//  stocksScreener
//
//  Created by Farjad Ahmed on 31.12.25.
//

import SwiftUI

struct IndexCardView: View {
    let index: MarketIndex
    let countryFlag: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(countryFlag)
                    .font(.system(size: 32))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(index.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(index.symbol)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            
            HStack {
                Text("12M Return")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text("\(index.return12M, specifier: "%.1f")%")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(index.return12M >= 0 ? .green : .red)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 2)
        )
    }
}

#Preview {
    IndexCardView(
        index: MarketIndex(name: "S&P 500", symbol: "SPX", return12M: 15.8),
        countryFlag: "🇺🇸"
    )
    .padding()
}

