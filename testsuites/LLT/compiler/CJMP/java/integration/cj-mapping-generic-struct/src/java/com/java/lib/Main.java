package com.java.lib;

import genericStruct.GenericStructFloat64;
import genericStruct.GenericStructInt32;

public class Main {

    public static void main(String[] args) {
        double tmp1 = 10.11;
        double tmp2 = 21.92;
        GenericStructFloat64 doubleInstance = new GenericStructFloat64(tmp1);
        doubleInstance.getValue();
        doubleInstance.setValue(tmp2);
        doubleInstance.getValue();

        GenericStructInt32 intInstance = new GenericStructInt32(20);
        intInstance.getValue();
        intInstance.setValue(35);
        intInstance.getValue();
    }
}