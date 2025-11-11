public class Main {

    public static void main(String[] args) {
        double tmp1 = 10.11;
        double tmp2 = 21.92;
        GenericStruct<Double> doubleInstance = new GenericStruct<>(tmp1);
        doubleInstance.getValue();
        doubleInstance.setValue(tmp2);
        doubleInstance.getValue();

        long tmp3 = 20;
        long tmp4 = 35;
        GenericStruct<Long> intInstance = new GenericStruct<>(tmp3);
        longInstance.getValue();
        longInstance.setValue(tmp4);
        longInstance.getValue();
    }
}