/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!
package test_stable_abi

public interface I1 {
    public static func typename(): String {
        "interface I1"
    }

    public func testOne(a: Int64): Unit {

    }

     public func funcOne(): Int64

     public func funcTwo(a: Int64, b: Int64): Int64 {
            a
     }

      @Frozen
     public func funcThree(a: Int64, b: Int64): Int64 {
            a
     }

     public const func funcFour(a: Int64, b: Int64): Int64 {
            a
     }

     public func funcFive(a!: Int64, b!: Int64): Int16 {
            0
     }
}


