//
//  Models.swift
//  stocksScreener
//
//  Created by Farjad Ahmed on 31.12.25.
//

import Foundation

struct Country: Identifiable, Hashable {
    let id: UUID
    let name: String
    let flag: String
    let marketIndex: MarketIndex
    
    init(name: String, flag: String, marketIndex: MarketIndex) {
        self.id = UUID()
        self.name = name
        self.flag = flag
        self.marketIndex = marketIndex
    }
    
    // Custom Hashable conformance (excluding id from hash)
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(flag)
        hasher.combine(marketIndex)
    }
    
    // Custom Equatable conformance (excluding id from comparison)
    static func == (lhs: Country, rhs: Country) -> Bool {
        lhs.name == rhs.name && lhs.flag == rhs.flag && lhs.marketIndex == rhs.marketIndex
    }
    
    static let allCountries: [Country] = [
        Country(name: "United States", flag: "🇺🇸", marketIndex: MarketIndex(name: "S&P 500", symbol: "SPX", return12M: 15.8)),
        Country(name: "United Kingdom", flag: "🇬🇧", marketIndex: MarketIndex(name: "FTSE 100", symbol: "FTSE", return12M: 8.2)),
        Country(name: "Germany", flag: "🇩🇪", marketIndex: MarketIndex(name: "DAX", symbol: "DAX", return12M: 12.5)),
        Country(name: "France", flag: "🇫🇷", marketIndex: MarketIndex(name: "CAC 40", symbol: "CAC", return12M: 10.3)),
        Country(name: "Japan", flag: "🇯🇵", marketIndex: MarketIndex(name: "Nikkei 225", symbol: "N225", return12M: 18.7)),
        Country(name: "China", flag: "🇨🇳", marketIndex: MarketIndex(name: "Shanghai Composite", symbol: "SSEC", return12M: -5.2)),
        Country(name: "India", flag: "🇮🇳", marketIndex: MarketIndex(name: "Nifty 50", symbol: "NIFTY", return12M: 22.4)),
        Country(name: "Canada", flag: "🇨🇦", marketIndex: MarketIndex(name: "S&P/TSX Composite", symbol: "TSX", return12M: 9.6)),
        Country(name: "Australia", flag: "🇦🇺", marketIndex: MarketIndex(name: "ASX 200", symbol: "ASX", return12M: 7.3)),
        Country(name: "South Korea", flag: "🇰🇷", marketIndex: MarketIndex(name: "KOSPI", symbol: "KOSPI", return12M: 14.1)),
        Country(name: "Brazil", flag: "🇧🇷", marketIndex: MarketIndex(name: "Bovespa", symbol: "BVSP", return12M: 11.9)),
        Country(name: "Switzerland", flag: "🇨🇭", marketIndex: MarketIndex(name: "SMI", symbol: "SSMI", return12M: 6.8))
    ]
}

struct MarketIndex: Identifiable, Hashable {
    let id: UUID
    let name: String
    let symbol: String
    let return12M: Double
    
    init(name: String, symbol: String, return12M: Double) {
        self.id = UUID()
        self.name = name
        self.symbol = symbol
        self.return12M = return12M
    }
    
    // Custom Hashable conformance (excluding id from hash)
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(symbol)
        hasher.combine(return12M)
    }
    
    // Custom Equatable conformance (excluding id from comparison)
    static func == (lhs: MarketIndex, rhs: MarketIndex) -> Bool {
        lhs.name == rhs.name && lhs.symbol == rhs.symbol && lhs.return12M == rhs.return12M
    }
}

struct Stock: Identifiable {
    let id: UUID
    let symbol: String
    let name: String
    let return12M: Double
    let sector: String
    
    init(symbol: String, name: String, return12M: Double, sector: String) {
        self.id = UUID()
        self.symbol = symbol
        self.name = name
        self.return12M = return12M
        self.sector = sector
    }
}
