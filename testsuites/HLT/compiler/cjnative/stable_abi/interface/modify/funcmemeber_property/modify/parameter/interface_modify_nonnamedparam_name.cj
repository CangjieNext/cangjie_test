/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// Expect: API Compatible & ABI Compatible
// DEPENDENCE: ../../main.cj, ../../template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix


// TEST ABI Compatibility
// RUN-EXEC: %run %run_opt %output %run_args
// TEST API Compatibility
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test_stable_abi

// test interface: interface funcmember & property
@Annotation
public class Version {
    let code: String
    const init(code: String) {
        this.code = code
    }
}

open public class Father {}
public class Son <: Father {}

public interface I1 {
    @Deprecated["This API will be deprecated soon"]
    public static func f7() {
        7
    }
    @Deprecated["This API is deprecated", strict: true]
    public static func f8() {
        8
    }

    @Frozen
    public static func f9(): Int64 {
        return 9
    }

    public static unsafe func f13(): Int64 {
        return 13
    }
    public static const func f14(): Int64 {
        14
    }

    public static func g1<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Y <: ToString, Z <: Son {
        a.toString() + b.toString()
    }
    public static func g2<X, Y, Z>(a: X, b: Y, c: Z): String where X <: ToString, Z <: Father {
        a.toString()
    }

    @Version["1.1"]
    public static func p1(a1: Int64, b!: Int64) {
        a1 + b
    }
    @Version["1.0"]
    public static func p2(a1: Son, b!: Son): Son {
        b
    }
    public static func p3(a1: Father, b!: Father): Father {
        b
    }

    /*------------------------------------------------*/
    @Deprecated["This API will be deprecated soon"]
    public func in_f7() {
        7
    }
    @Deprecated["This API is deprecated", strict: true]
    public func in_f8() : Int64 

    @Frozen
    public func in_f9(): Int64 
    
    public unsafe func in_f13(): Int64 
    public const func in_f14(): Int64 {
        14
    }
    public mut func in_f15(): Int64 {
        15
    }

    @Version["1.1"]
    public func in_p1(a: Int64, b!: Int64) {
        a + b
    }
    @Version["1.0"]
    public func in_p2(a: Son, b!: Son): Son 
    public func in_p3(a: Father, b!: Father): Father 

    /*------------------------------------------------*/
    @Version["1.1"]
    public static prop prop_v1: Int64 {
        get() {
            1
        }
    }
    @Version["1.1"]
    public static prop prop_v2: Int64 

    @Deprecated["This API will be deprecated soon"]
    public static prop prop_v3: Int64 {
        get() {
            3
        }
    }

    @Deprecated["This API is deprecated", strict: true]
    public static prop prop_v4: Int64 {
        get() {
            4
        }
    }

    @Frozen
    public static prop prop_v5: Int64 {
        get() {
            5
        }
    }

    public static mut prop prop_v6: Int64 {
        get() {
            6
        }
        set(v) {

        }
    }

    /*------------------------------------------------*/
    @Version["1.1"]
    public prop in_prop_v1: Int64 {
        get() {
            1
        }
    }
    @Version["1.1"]
    public prop in_prop_v2: Int64 

    @Deprecated["This API will be deprecated soon"]
    public prop in_prop_v3: Int64 {
        get() {
            3
        }
    }

    @Deprecated["This API is deprecated", strict: true]
    public prop in_prop_v4: Int64 {
        get() {
            4
        }
    }

    @Frozen
    public prop in_prop_v5: Int64 {
        get() {
            5
        }
    }

    public mut prop in_prop_v6: Int64 {
        get() {
            5
        }
        set(v) {
            
        }
    }
}
