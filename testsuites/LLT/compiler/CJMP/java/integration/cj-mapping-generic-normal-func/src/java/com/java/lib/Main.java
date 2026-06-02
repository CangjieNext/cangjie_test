package com.java.lib;

import genericClass.GenericClassFloat64;
import genericClass.GenericClassInt32;

public class Main {

    public static void main(String[] args) {

        GenericClassFloat64 doubleInstance = new GenericClassFloat64();
        doubleInstance.normalFunc(10);

        GenericClassInt32 intInstance = new GenericClassInt32();
        intInstance.normalFunc(1000);
    }
}