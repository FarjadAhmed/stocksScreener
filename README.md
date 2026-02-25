# StocksScreener

An iOS app for browsing top-performing stocks across 12 countries. Select a country, see its market index performance, and view the top 10 stocks ranked by 12-month returns with sector breakdowns.

## Screenshots

<p align="center">
  <img src="Screenshots/Simulator%20Screenshot%20-%20iPhone%2017%20Pro%20-%202026-02-25%20at%2010.54.57.png" width="200" alt="Country Selection">
  <img src="Screenshots/Simulator%20Screenshot%20-%20iPhone%2017%20Pro%20-%202026-02-25%20at%2010.55.00.png" width="200" alt="Stock Rankings">
</p>

## Features

- **12 Countries** - United States, United Kingdom, Germany, France, Japan, China, India, Canada, Australia, South Korea, Brazil, Switzerland
- **Market Indices** - Country-specific index cards (S&P 500, FTSE 100, DAX, Nikkei 225, etc.) with 12-month return data
- **Stock Rankings** - Top 10 stocks per country sorted by performance, with gold/silver/bronze rank badges
- **Sector Labels** - Each stock tagged with its sector (Technology, Healthcare, Financials, Energy, etc.)
- **Color-Coded Returns** - Green for positive, red for negative performance at a glance

## Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Architecture:** MVVM
- **Concurrency:** Async/Await

## Requirements

- macOS with Xcode 15.0+
- iOS 16.0+ device or simulator

## Getting Started

1. Open `stocksScreener.xcodeproj` in Xcode
2. Configure signing with your Apple Developer team
3. Select your device or simulator
4. Press `Cmd+R` to build and run

## Project Structure

```
stocksScreener/
├── stocksScreener.xcodeproj
└── stocksScreener/
    ├── stocksScreenerApp.swift     # App entry point
    ├── ContentView.swift           # Main screen layout
    ├── Models.swift                # Country, MarketIndex, Stock data models
    ├── StockService.swift          # Data provider (mock data)
    ├── StockViewModel.swift        # State management
    └── Views/
        ├── CountrySelectionView.swift  # Horizontal scrolling country picker
        ├── IndexCardView.swift         # Market index display card
        └── StockRowView.swift          # Individual stock list item
```

## How It Works

1. A horizontal carousel shows 12 countries with flag icons
2. Selecting a country loads its market index card and top stocks
3. Stocks are displayed in a ranked list with return percentages and sector tags
4. Loading states and error handling are built in for when a real API is connected

## Current Status

The app uses **mock data** with realistic stock tickers, company names, sectors, and plausible return figures. The `StockService` is designed as a clean abstraction layer — swapping in a real API (Alpha Vantage, Finnhub, etc.) requires changing only the service implementation without touching the views or view model.

## License

All Rights Reserved. See [LICENSE](LICENSE) for details.
