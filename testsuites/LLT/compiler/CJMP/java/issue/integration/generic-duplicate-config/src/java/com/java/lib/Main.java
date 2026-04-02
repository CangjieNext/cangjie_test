package com.java.lib;

import issue.GInt64;
import issue.HBool;

public class Main {

    public static void main(String[] args) {
        // Test 1: HBool - has symbols = ["init"], should have constructor
        System.out.println("Test 1: HBool (symbols = [init])");
        try {
            HBool obj = new HBool();
            System.out.println("  HBool: Constructor works");
            
            // Methods should not be accessible
            // boolean result = obj.g(true);
            System.out.println("  HBool: Methods should not be accessible");
        } catch (Exception e) {
            System.out.println("  HBool: Error - " + e.getMessage());   
        }

        // Test 2: GInt64 - NO symbols config, should NOT have public constructor
        // This line should cause compilation error in fixed version
        GInt64 obj = new GInt64();
        System.out.println("  GInt64: Constructor should NOT be accessible");
    }
}
