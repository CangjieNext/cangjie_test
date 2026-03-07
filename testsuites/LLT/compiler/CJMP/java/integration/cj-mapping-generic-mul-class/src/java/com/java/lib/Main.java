package com.java.lib;

import genericClass.GenericClassInt32Int64;
import genericClass.GenericClassFloat64Int32;

public class Main {

    public static void main(String[] args) {

        long a = 1000;
        long b = 3000;
        GenericClassInt32Int64 instance1 = new GenericClassInt32Int64(10, a);
        System.out.println("init-T(Int32): " + instance1.getValueT());
        System.out.println("init-U(Int64): " + instance1.getValueU());
        System.out.println("setUGetValueT-T(Int32): " + instance1.setUGetValueT(b));
        System.out.println("init-U(Int64): " + instance1.getValueU());
        System.out.println("setTGetValueU-U(Int64): " + instance1.setTGetValueU(1000));
        System.out.println("init-T(Int32): " + instance1.getValueT());

        double c = 10.88;
        double d = 0.999;
        GenericClassFloat64Int32 instance2 = new GenericClassFloat64Int32(c, 100);
        System.out.println("init-T(Float64): " + instance2.getValueT());
        System.out.println("init-U(Int32): " + instance2.getValueU());
        System.out.println("setUGetValueT-T(Float64): " + instance2.setUGetValueT(201));
        System.out.println("init-U(Int32): " + instance2.getValueU());
        System.out.println("setTGetValueU-U(Int32): " + instance2.setTGetValueU(d));
        System.out.println("init-T(Float64): " + instance2.getValueT());
    }
}
