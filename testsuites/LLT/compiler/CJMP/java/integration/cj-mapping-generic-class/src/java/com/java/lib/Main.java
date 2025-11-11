public class Main {

    public static void main(String[] args) {
        GenericClass<Float> floatInstance = new GenericClass<>(10.8);
        floatInstance.getValue();
        floatInstance.setValue(35.9);
        floatInstance.getValue();

        GenericClass<Integer> intInstance = new GenericClass<>(2);
        intInstance.getValue();
        intInstance.setValue(18);
        intInstance.getValue();
    }
}