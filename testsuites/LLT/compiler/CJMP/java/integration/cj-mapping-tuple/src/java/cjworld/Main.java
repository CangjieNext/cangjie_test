package cjworld;

public class Main {

    public static void main(String[] args) {
        TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool tuple1 = new TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool(
                (byte) 1, (short) 2, 3, 4, (char) 5, 6, 7, false);
        A aImp = new A(tuple1);
        TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool tuple2 = aImp.getValue();
        B bImp = new B(tuple2);
        TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool tuple3 = bImp.getValue();
        TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool tuple4 = new TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool(
                (byte) 8, (short) 7, 6, 5, (char) 4, 3, 2, true);
        bImp.setValue(tuple4);
        TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool tuple5 = bImp.getValue();
        bImp.printTuple(tuple2);
        bImp.printTuple(tuple3);
        bImp.printTuple(tuple5);
        B1 b1Imp = new B1(tuple5);
        b1Imp.printTuple(b1Imp.getValue());
        CImp1 cImp1 = new CImp1();
        CImp2 cImp2 = new CImp2();
        D dImp = new D();
        dImp.foo(cImp1);
        dImp.foo(cImp2);
    }
}
