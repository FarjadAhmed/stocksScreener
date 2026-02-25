//
//  StockRowView.swift
//  stocksScreener
//
//  Created by Farjad Ahmed on 31.12.25.
//

import SwiftUI

struct StockRowView: View {
    let stock: Stock
    let rank: Int
    
    var body: some View {
        HStack(spacing: 16) {
            // Rank badge
            ZStack {
                Circle()
                    .fill(rankColor.opacity(0.15))
                    .frame(width: 40, height: 40)
                
                Text("\(rank)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(rankColor)
            }
            
            // Stock info
            VStack(alignment: .leading, spacing: 4) {
                Text(stock.symbol)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(stock.name)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                Text(stock.sector)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // Return
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(stock.return12M, specifier: "%.1f")%")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(stock.return12M >= 0 ? .green : .red)
                
                Text("12M Return")
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.secondarySystemBackground))
        )
    }
    
    private var rankColor: Color {
        switch rank {
        case 1: return .yellow
        case 2: return .gray
        case 3: return Color(red: 0.8, green: 0.5, blue: 0.2) // Bronze
        default: return .blue
        }
    }
}

#Preview {
    VStack(spacing: 12) {
        StockRowView(stock: Stock(symbol: "NVDA", name: "NVIDIA Corporation", return12M: 245.3, sector: "Technology"), rank: 1)
        StockRowView(stock: Stock(symbol: "META", name: "Meta Platforms Inc", return12M: 189.2, sector: "Technology"), rank: 2)
        StockRowView(stock: Stock(symbol: "AMD", name: "Advanced Micro Devices", return12M: 167.8, sector: "Technology"), rank: 3)
    }
    .padding()
}

