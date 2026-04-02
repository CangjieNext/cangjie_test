package com.java.lib;

import issue.GenericDefaultInt64;

public class Main {

    public static void main(String[] args) {
        // Test: GenericDefaultInt64 - NO symbols config
        // In buggy version: constructor is mirrored (bug)
        // In fixed version: constructor is NOT mirrored
        System.out.println("Test: GenericDefaultInt64 (no symbols config)");
        
        // This line should cause compilation error in fixed version
        GenericDefaultInt64 obj = new GenericDefaultInt64();
        System.out.println("  Constructor should NOT be accessible");
    }
}
