class DifferenceOfSquaresCalculator {

    int computeSquareOfSumTo(int n) {
        int n2 = (n * (n+1)) / 2;
        return n2 * n2;
    }

    int computeSumOfSquaresTo(int n) {
        return n*(n + 1)*(2*n + 1) / 6;
    }

    int computeDifferenceOfSquares(int n) {
        return computeSquareOfSumTo(n) - computeSumOfSquaresTo(n);
    }

}
