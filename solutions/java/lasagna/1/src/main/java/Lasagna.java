public class Lasagna {

    public int expectedMinutesInOven() {
        return 40;
    }

    public int remainingMinutesInOven(int cookMinutes) {
        return expectedMinutesInOven() - cookMinutes;
    }

    public int preparationTimeInMinutes(int layers) {
        return layers * 2;
    }

    public int totalTimeInMinutes(int layers, int cookMinutes) {
        return preparationTimeInMinutes(layers) + cookMinutes;
    }
}
