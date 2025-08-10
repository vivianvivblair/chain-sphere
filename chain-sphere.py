import sys
from chainsphere.analyzer import ChainSphereAnalyzer

def main():
    if len(sys.argv) < 2:
        print("Использование: python -m chainsphere <symbol>")
        print("Пример: python -m chainsphere BTC")
        sys.exit(1)

    symbol = sys.argv[1].upper()
    analyzer = ChainSphereAnalyzer(symbol)
    score, details = analyzer.calculate_health_score()

    print(f"\n🔗 Chain-Sphere Health Index для {symbol}: {score}/100\n")
    print(details)

if __name__ == "__main__":
    main()
