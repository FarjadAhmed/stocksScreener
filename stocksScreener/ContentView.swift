//
//  ContentView.swift
//  stocksScreener
//
//  Created by Farjad Ahmed on 31.12.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = StockViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Country Selection
                    CountrySelectionView(
                        selectedCountry: Binding(
                            get: { viewModel.selectedCountry },
                            set: { newCountry in
                                if let country = newCountry {
                                    viewModel.selectCountry(country)
                                }
                            }
                        ),
                        countries: Country.allCountries
                    )
                    .padding(.top, 8)
                    
                    // Market Index Card
                    if let country = viewModel.selectedCountry {
                        IndexCardView(
                            index: country.marketIndex,
                            countryFlag: country.flag
                        )
                        .padding(.horizontal)
                        .transition(.move(edge: .top).combined(with: .opacity))
                        
                        // Top Stocks Section
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("Top 10 Stocks")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Spacer()
                                
                                if viewModel.isLoading {
                                    ProgressView()
                                        .scaleEffect(0.8)
                                }
                            }
                            .padding(.horizontal)
                            
                            if viewModel.isLoading {
                                VStack(spacing: 12) {
                                    ForEach(0..<5, id: \.self) { _ in
                                        HStack {
                                            ProgressView()
                                            Spacer()
                                        }
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color(.secondarySystemBackground))
                                        )
                                    }
                                }
                                .padding(.horizontal)
                            } else if let errorMessage = viewModel.errorMessage {
                                VStack(spacing: 12) {
                                    Image(systemName: "exclamationmark.triangle")
                                        .font(.largeTitle)
                                        .foregroundColor(.orange)
                                    
                                    Text(errorMessage)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(.secondarySystemBackground))
                                )
                                .padding(.horizontal)
                            } else if !viewModel.topStocks.isEmpty {
                                VStack(spacing: 12) {
                                    ForEach(Array(viewModel.topStocks.enumerated()), id: \.element.id) { index, stock in
                                        StockRowView(stock: stock, rank: index + 1)
                                            .transition(.move(edge: .trailing).combined(with: .opacity))
                                    }
                                }
                                .padding(.horizontal)
                            } else {
                                VStack(spacing: 12) {
                                    Image(systemName: "chart.line.uptrend.xyaxis")
                                        .font(.largeTitle)
                                        .foregroundColor(.secondary)
                                    
                                    Text("Select a country to view top stocks")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                            }
                        }
                        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: viewModel.isLoading)
                        .animation(.spring(response: 0.5, dampingFraction: 0.8), value: viewModel.topStocks.count)
                    } else {
                        // Empty state
                        VStack(spacing: 20) {
                            Image(systemName: "globe.americas.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.accentColor.opacity(0.6))
                            
                            Text("Stock Screener")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("Select a country to view its main equity market index and top performing stocks")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 60)
                    }
                }
                .padding(.bottom, 24)
            }
            .navigationTitle("Stock Screener")
            .navigationBarTitleDisplayMode(.large)
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    ContentView()
}
