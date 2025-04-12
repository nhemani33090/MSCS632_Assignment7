from collections import Counter

class StatisticsCalculator:
    def __init__(self, data):
        self.data = sorted(data)

    def calculate_mean(self):
        return sum(self.data) / len(self.data)

    def calculate_median(self):
        n = len(self.data)
        mid = n // 2
        if n % 2 == 0:
            return (self.data[mid - 1] + self.data[mid]) / 2
        else:
            return self.data[mid]

    def calculate_mode(self):
        count = Counter(self.data)
        max_freq = max(count.values())
        return [k for k, v in count.items() if v == max_freq]

if __name__ == "__main__":
    data = [4, 2, 2, 3, 5, 2, 3, 4]
    calc = StatisticsCalculator(data)

    print("Mean:", round(calc.calculate_mean(), 2))
    print("Median:", round(calc.calculate_median(), 2))
    print("Mode(s):", " ".join(str(m) for m in calc.calculate_mode()))

