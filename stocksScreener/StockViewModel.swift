//
//  StockViewModel.swift
//  stocksScreener
//
//  Created by Farjad Ahmed on 31.12.25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class StockViewModel: ObservableObject {
    @Published var selectedCountry: Country?
    @Published var topStocks: [Stock] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let stockService = StockService()
    
    func selectCountry(_ country: Country) {
        selectedCountry = country
        loadStocks()
    }
    
    func loadStocks() {
        guard let country = selectedCountry else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let stocks = await stockService.fetchTopStocks(for: country)
                topStocks = stocks
                isLoading = false
            } catch {
                errorMessage = "Failed to load stocks: \(error.localizedDescription)"
                isLoading = false
            }
        }
    }
}

