public class Twofer {

    public String twofer(String name) {
        if(name == null) return twofer("you");
        else return "One for " + name + ", one for me.";
    }
}
