package com.java.lib;

import genericClass.GenericClassInt8;
import genericClass.GenericClassInt16;

public class Main {

    public static void main(String[] args) {
        byte a = 1;
        byte b = 2;
        GenericClassInt8 longInstance = new GenericClassInt8(a);
        longInstance.getValue();
        longInstance.setValue(b);
        longInstance.getValue();

        short c = 2;
        short d = 18;
        GenericClassInt16 intInstance = new GenericClassInt16(c);
        intInstance.getValue();
        intInstance.setValue(d);
        intInstance.getValue();
    }
}
