//
//  StockService.swift
//  stocksScreener
//
//  Created by Farjad Ahmed on 31.12.25.
//

import Foundation

class StockService {
    
    func fetchTopStocks(for country: Country) async -> [Stock] {
        // Simulate network delay
        try? await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
        
        // Return mock data based on country
        // In a real app, this would fetch from an API
        return getMockStocks(for: country)
    }
    
    private func getMockStocks(for country: Country) -> [Stock] {
        let stocks: [Stock]
        
        switch country.name {
        case "United States":
            stocks = [
                Stock(symbol: "NVDA", name: "NVIDIA Corporation", return12M: 245.3, sector: "Technology"),
                Stock(symbol: "META", name: "Meta Platforms Inc", return12M: 189.2, sector: "Technology"),
                Stock(symbol: "AMD", name: "Advanced Micro Devices", return12M: 167.8, sector: "Technology"),
                Stock(symbol: "TSLA", name: "Tesla, Inc.", return12M: 142.5, sector: "Consumer Cyclical"),
                Stock(symbol: "AMZN", name: "Amazon.com Inc", return12M: 98.3, sector: "Consumer Cyclical"),
                Stock(symbol: "MSFT", name: "Microsoft Corporation", return12M: 87.6, sector: "Technology"),
                Stock(symbol: "GOOGL", name: "Alphabet Inc", return12M: 76.4, sector: "Technology"),
                Stock(symbol: "AAPL", name: "Apple Inc", return12M: 65.2, sector: "Technology"),
                Stock(symbol: "NFLX", name: "Netflix, Inc.", return12M: 58.9, sector: "Communication Services"),
                Stock(symbol: "CRM", name: "Salesforce, Inc.", return12M: 54.1, sector: "Technology")
            ]
        case "United Kingdom":
            stocks = [
                Stock(symbol: "SHEL", name: "Shell plc", return12M: 45.2, sector: "Energy"),
                Stock(symbol: "BP", name: "BP p.l.c.", return12M: 38.7, sector: "Energy"),
                Stock(symbol: "GSK", name: "GSK plc", return12M: 32.1, sector: "Healthcare"),
                Stock(symbol: "AZN", name: "AstraZeneca plc", return12M: 28.9, sector: "Healthcare"),
                Stock(symbol: "ULVR", name: "Unilever plc", return12M: 24.3, sector: "Consumer Defensive"),
                Stock(symbol: "RIO", name: "Rio Tinto Group", return12M: 21.5, sector: "Basic Materials"),
                Stock(symbol: "BHP", name: "BHP Group Limited", return12M: 19.8, sector: "Basic Materials"),
                Stock(symbol: "DGE", name: "Diageo plc", return12M: 17.2, sector: "Consumer Defensive"),
                Stock(symbol: "BT", name: "BT Group plc", return12M: 15.6, sector: "Communication Services"),
                Stock(symbol: "VOD", name: "Vodafone Group plc", return12M: 13.4, sector: "Communication Services")
            ]
        case "Germany":
            stocks = [
                Stock(symbol: "SAP", name: "SAP SE", return12M: 52.3, sector: "Technology"),
                Stock(symbol: "SIE", name: "Siemens AG", return12M: 48.7, sector: "Industrials"),
                Stock(symbol: "BMW", name: "Bayerische Motoren Werke", return12M: 42.1, sector: "Consumer Cyclical"),
                Stock(symbol: "VOW3", name: "Volkswagen AG", return12M: 38.9, sector: "Consumer Cyclical"),
                Stock(symbol: "BAYN", name: "Bayer AG", return12M: 35.2, sector: "Healthcare"),
                Stock(symbol: "ALV", name: "Allianz SE", return12M: 31.6, sector: "Financial Services"),
                Stock(symbol: "DBK", name: "Deutsche Bank AG", return12M: 28.4, sector: "Financial Services"),
                Stock(symbol: "MUV2", name: "Munich Re", return12M: 25.8, sector: "Financial Services"),
                Stock(symbol: "FME", name: "Fresenius Medical Care", return12M: 22.3, sector: "Healthcare"),
                Stock(symbol: "HEI", name: "HeidelbergCement AG", return12M: 19.7, sector: "Basic Materials")
            ]
        case "Japan":
            stocks = [
                Stock(symbol: "7203", name: "Toyota Motor Corporation", return12M: 68.4, sector: "Consumer Cyclical"),
                Stock(symbol: "6758", name: "Sony Group Corporation", return12M: 62.1, sector: "Technology"),
                Stock(symbol: "9984", name: "SoftBank Group Corp.", return12M: 58.7, sector: "Financial Services"),
                Stock(symbol: "6861", name: "Keyence Corporation", return12M: 54.3, sector: "Technology"),
                Stock(symbol: "6098", name: "Recruit Holdings", return12M: 49.8, sector: "Industrials"),
                Stock(symbol: "8035", name: "Tokyo Electron Limited", return12M: 46.2, sector: "Technology"),
                Stock(symbol: "4503", name: "Astellas Pharma Inc", return12M: 42.9, sector: "Healthcare"),
                Stock(symbol: "4063", name: "Shin-Etsu Chemical", return12M: 39.5, sector: "Basic Materials"),
                Stock(symbol: "8306", name: "Mitsubishi UFJ Financial", return12M: 36.1, sector: "Financial Services"),
                Stock(symbol: "8058", name: "Mitsubishi Corporation", return12M: 33.7, sector: "Industrials")
            ]
        case "India":
            stocks = [
                Stock(symbol: "RELIANCE", name: "Reliance Industries", return12M: 78.5, sector: "Energy"),
                Stock(symbol: "TCS", name: "Tata Consultancy Services", return12M: 72.3, sector: "Technology"),
                Stock(symbol: "HDFCBANK", name: "HDFC Bank Limited", return12M: 68.9, sector: "Financial Services"),
                Stock(symbol: "INFY", name: "Infosys Limited", return12M: 65.4, sector: "Technology"),
                Stock(symbol: "ICICIBANK", name: "ICICI Bank Limited", return12M: 61.2, sector: "Financial Services"),
                Stock(symbol: "HINDUNILVR", name: "Hindustan Unilever", return12M: 57.8, sector: "Consumer Defensive"),
                Stock(symbol: "SBIN", name: "State Bank of India", return12M: 54.6, sector: "Financial Services"),
                Stock(symbol: "BHARTIARTL", name: "Bharti Airtel Limited", return12M: 51.3, sector: "Communication Services"),
                Stock(symbol: "ITC", name: "ITC Limited", return12M: 48.7, sector: "Consumer Defensive"),
                Stock(symbol: "KOTAKBANK", name: "Kotak Mahindra Bank", return12M: 45.9, sector: "Financial Services")
            ]
        default:
            // Generic stocks for other countries
            stocks = [
                Stock(symbol: "STK1", name: "Top Stock 1", return12M: 45.2, sector: "Technology"),
                Stock(symbol: "STK2", name: "Top Stock 2", return12M: 42.8, sector: "Financial Services"),
                Stock(symbol: "STK3", name: "Top Stock 3", return12M: 39.5, sector: "Healthcare"),
                Stock(symbol: "STK4", name: "Top Stock 4", return12M: 36.1, sector: "Consumer Cyclical"),
                Stock(symbol: "STK5", name: "Top Stock 5", return12M: 33.7, sector: "Energy"),
                Stock(symbol: "STK6", name: "Top Stock 6", return12M: 31.2, sector: "Industrials"),
                Stock(symbol: "STK7", name: "Top Stock 7", return12M: 28.9, sector: "Basic Materials"),
                Stock(symbol: "STK8", name: "Top Stock 8", return12M: 26.4, sector: "Communication Services"),
                Stock(symbol: "STK9", name: "Top Stock 9", return12M: 24.1, sector: "Consumer Defensive"),
                Stock(symbol: "STK10", name: "Top Stock 10", return12M: 21.8, sector: "Real Estate")
            ]
        }
        
        // Return top 10 sorted by return
        return Array(stocks.sorted { $0.return12M > $1.return12M }.prefix(10))
    }
}

