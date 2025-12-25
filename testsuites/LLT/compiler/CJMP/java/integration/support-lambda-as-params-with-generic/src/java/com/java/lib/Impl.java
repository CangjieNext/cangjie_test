package com.java.lib;

import cj.*;

public class Impl implements IInt16Float64 {
    public Int16ToFloat64 goo(Int16ToFloat64 v) {
        System.out.println(v.call((short)4));
        Int16ToFloat64 a = b -> b*1.000000;
        return a;
    }
}