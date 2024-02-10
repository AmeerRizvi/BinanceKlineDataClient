# BinanceKlineDataClient

BinanceKlineDataClient is a Swift package for fetching candlestick (kline) data from Binance API.

## Installation

### Swift Package Manager

You can use Swift Package Manager to integrate BinanceKlineDataClient into your Xcode project.

1. In Xcode, select File > Swift Packages > Add Package Dependency.
2. Enter the repository URL: https://github.com/AmeerRizvi/BinanceKlineDataClient
3. Follow the prompts to specify the version and options.

### Manual

You can also manually integrate BinanceKlineDataClient into your project by copying the source files.

## Usage

```swift
import BinanceKlineDataClient

let client = BinanceKlineDataClient()

async {
    do {
        let candles = try await client.fetchCandles(symbol: "BTCUSDT")
        print(candles)
    } catch {
        print("Error fetching data: \(error)")
    }
}
```

### Symbols

You can fetch data for various trading pairs supported by Binance. For a comprehensive list of symbols, refer to the [official Binance documentation](https://developers.binance.com/docs/derivatives/coin-margined-futures/market-data/Continuous-Contract-Kline-Candlestick-Data).

### Interval and limit

The fetchCandles function requires specifying the symbol, interval, and limit. Interval refers to the duration between data points, and limit specifies the maximum number of data points to fetch.

"1m", "3m", "5m", "15m", "30m", "1h", "2h", "4h", "6h", "8h", "12h",
    "1d", "3d", "1w", "1M"
