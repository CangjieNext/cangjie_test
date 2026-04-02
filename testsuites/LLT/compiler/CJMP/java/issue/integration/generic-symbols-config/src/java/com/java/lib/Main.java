package com.java.lib;

import issue.AllSymbolsInt64;
import issue.OnlyInitInt64;

public class Main {

    public static void main(String[] args) {
        // Test 1: OnlyInitInt64 - has symbols = ["init"], should have constructor
        System.out.println("Test 1: OnlyInitInt64 (symbols = [init])");
        try {
            OnlyInitInt64 obj = new OnlyInitInt64(1);
            System.out.println("  OnlyInitInt64: Constructor works");
            
            // Methods should not be accessible
            // long value = obj.getValue();
            System.out.println("  OnlyInitInt64: Methods should not be accessible");
        } catch (Exception e) {
            System.out.println("  OnlyInitInt64: Error - " + e.getMessage());
        }

        // Test 2: AllSymbolsInt64 - has symbols = ["init", "getValue", "setValue"]
        System.out.println("\nTest 2: AllSymbolsInt64 (symbols = [init, getValue, setValue])");
        try {
            AllSymbolsInt64 obj = new AllSymbolsInt64(1);
            System.out.println("  AllSymbolsInt64: Constructor works");
            
            long value = obj.getValue();
            System.out.println("  AllSymbolsInt64: getValue() = " + value);
            
            obj.setValue(600);
            value = obj.getValue();
            System.out.println("  AllSymbolsInt64: After setValue(600), getValue() = " + value);
        } catch (Exception e) {
            System.out.println("  AllSymbolsInt64: Error - " + e.getMessage());
        }
    }
}
