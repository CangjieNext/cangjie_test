package com.java.lib;

import cj.*;

public class Impl2 implements IInt16Float64 {

    public void foo(Int16ToFloat64 v) {
        System.out.println(v.call((short)4));
    }
}