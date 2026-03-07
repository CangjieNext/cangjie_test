package cjworld;

public class Main {

    public static void main(String[] args) {
        GenericInterfaceImpl1 imp1 = new GenericInterfaceImpl1();
        GenericInterfaceImpl2 imp2 = new GenericInterfaceImpl2();
        System.out.println(imp1.getValue().item0());
        System.out.println(imp1.getValue().item1());
        System.out.println(imp2.getValue().item0());
        System.out.println(imp2.getValue().item1());

        TupleOfInt32Int64 tuple1 = new TupleOfInt32Int64(10, 24);
        TupleOfFloat64Int32 tuple2 = new TupleOfFloat64Int32(3.14, 159);
        imp1.setValue(tuple1);
        imp2.setValue(tuple2);
    }
}
