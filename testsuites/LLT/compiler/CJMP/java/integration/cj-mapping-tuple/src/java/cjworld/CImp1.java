package cjworld;

public class CImp1 implements C {
    public void hoo(TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool v) {
        System.out.println(v.item0());
        System.out.println(v.item1());
        System.out.println(v.item2());
        System.out.println(v.item3());
        System.out.println((int) v.item4());
        System.out.println(v.item5());
        System.out.println(v.item6());
        System.out.println(v.item7());
    }

    public TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool koo() {
        TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool a = new TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool(
                (byte) 0, (short) 2, 3, 4, (char) 5, 6, 7, true);
        return a;
    }
}