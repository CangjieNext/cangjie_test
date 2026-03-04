package cjworld;

public class Main {

    public static void main(String[] args) {
        long a = 1000;
        long b = 3000;
        TupleOfInt32Int64 tuple1 = new TupleOfInt32Int64(10, a);
        TupleOfInt32Int64 tuple2 = new TupleOfInt32Int64(1000, b);
        GenericClassInt32Int64 instance1 = new GenericClassInt32Int64(tuple1);
        System.out.println("init-T(Int32): " + instance1.getValue().item0());
        System.out.println("init-U(Int64): " + instance1.getValue().item1());
        instance1.setValue(tuple2);
        System.out.println("getValue-U(Int64): " + instance1.getValue().item1());
        System.out.println("getValue-T(Int32): " + instance1.getValue().item0());

        double c = 10.88;
        double d = 0.999;
        TupleOfFloat64Int32 tuple3 = new TupleOfFloat64Int32(c, 100);
        TupleOfFloat64Int32 tuple4 = new TupleOfFloat64Int32(d, 201);
        GenericClassFloat64Int32 instance2 = new GenericClassFloat64Int32(tuple3);
        System.out.println("init-T(Float64): " + instance2.getValue().item0());
        System.out.println("init-U(Int32): " + instance2.getValue().item1());
        instance2.setValue(tuple4);
        System.out.println("getValue-U(Int32): " + instance2.getValue().item1());
        System.out.println("getValue-T(Float64): " + instance2.getValue().item0());
    }
}
