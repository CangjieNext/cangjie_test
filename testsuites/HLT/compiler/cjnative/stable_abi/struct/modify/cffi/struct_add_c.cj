/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// Expect: API Compatible & ABI Incompatible
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-5 [ABI] Added struct C attribute without unsafe compilation error.
// ASSERT: scan-5 [ABI]
// ASSERT: scan-not [API]
// ASSERT: scan-not [API/ABI]

// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args


// test struct: add @C
package test_stable_abi

@C
public struct S1 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

@C
struct S2 {
    let x: Int64 = 0
}

@C
public struct S3 {
    let x: S2 = S2()

    public func getX(): Int64 {
        return x.x
    }
}

@C
public struct S4 {
    let x: Int64 = 0

    public func getX(): Int64 {
        return x
    }
}

@C
struct S5 {
    let x: Int64 = 0
}

@C
public struct S6 {
    let x: S5 = S5()
    static const G = 2

    @Frozen
    public func getX(): Int64 {
        return x.x
    }
}

@C
struct S7 {
    let x: Int64 = 0
}

@C
public struct S8 {
    let x: S7 = S7()

    public func getX(): Int64 {
        return x.x
    }
}

@C
struct S9 {
    let x: Int64 = 0
}

@C
public struct S10 {
    let x: S9 = S9()

    
    public func getX(): Int64 {
        return x.x
    }
}