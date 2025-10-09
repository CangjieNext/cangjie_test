/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!
package test_stable_abi
import std.random.*
open public class A {
    let a: Int64 = 10
}

public class B <: A {
    let b: Int64 = 20
}
public interface I1 {
    public static func typename(): String {
        "interface I1"
    }

    public func testOne<T, U>(): Unit {

    }

    public func testTwo<T, U>(a: T, b: U): String where T <: B, U <: Random {
        "interface testTwo"
    }

    public func testThree<T>(): String {
          "interface testThree"
    }

    public static func testFour<B, T>(a: B, b: T): String {
          "interface testFour"
    }

    public func testFive<T, U>(a: T, b: U): String {
          "interface testFive"
    }
}


