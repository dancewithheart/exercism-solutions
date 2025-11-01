public class Twofer {

    public String twofer(String name) {
        if(name == null) return twofer("you");
        else return String.format("One for %s, one for me.", name);
    }
}
