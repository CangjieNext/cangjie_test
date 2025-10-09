/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 3.2.1.5.2
  @Scene: delete
  @Visibility: used in public struct instance var
  @Object: struct
  @Behavior: delete interface 
  @Expect: api incompatible & abi incompatible
*/
// LEVEL: 1
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Deleted public member function of struct visible outside the module.
// ASSERT: scan-1 [API/ABI] Deleted interfaces that struct implemented.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-2 [API/ABI]


package test_stable_abi


open class Base {}
public class c1 <: Base {}

interface I {
    func f(): Base
}

interface Addable {
    func add(other: Int64): Int64
}

interface Subtractable {
    func sub(other: Int64): Int64
}

interface Multiplicable {
    func add(other: Int64): Int64
}

public struct MyInt <: Addable & Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

}


struct MyInt1 <: Addable  {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }

}

struct S2 <: Addable {
    var value = 0
    public const init() {}

    public func add(other: Int64): Int64 {
        value + other
    }

}

public struct MyInt2 <: Addable & Subtractable {
    let x = S2();
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

    public func getX(): Int64 {
        return x.value
    }

}

struct S3 <: Addable & Subtractable  {
    var value = 0
    public const init() {}

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

}

public struct MyInt3 <: Addable & Subtractable {
    let x = S3();
    var value = 0
    public const init() {}

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }


    public const func getX(): Int64 {
        return x.value
    }

}

struct S4 <: Addable & Subtractable  {
    var value = 0
    public const init() {}

    public func add(other: Int64): Int64 {
        value + other
    }

    public func sub(other: Int64): Int64 {
        value - other
    }

}

public struct MyInt4 <: Addable & Subtractable {
    let x = S4();
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    
    public func sub(other: Int64): Int64 {
        value - other
    }

    @Frozen
    public func getX(): Int64 {
        return x.value
    }

}