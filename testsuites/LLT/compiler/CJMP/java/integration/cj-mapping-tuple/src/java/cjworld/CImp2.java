package cjworld;

public class CImp2 implements C {
    public void hoo(TupleOfInt8Int16Int32Int64UInt16Float32Float64Bool v) {
        System.out.println(v.item0());
        System.out.println(v.item1());
        System.out.println(v.item2());
        System.out.println(v.item3());
        System.out.println((int)v.item4());
        System.out.println(v.item5());
        System.out.println(v.item6());
        System.out.println(v.item7());
    }
}