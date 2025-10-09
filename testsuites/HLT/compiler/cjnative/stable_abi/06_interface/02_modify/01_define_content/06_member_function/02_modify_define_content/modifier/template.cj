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

    public func testOne(): Unit {

    }

    public func testTwo(): Unit {
        
    }

    public func testThree(): String {
          "interface testThree"
    }

    public static func testFour(): String {
          "interface testFour"
    }

    public const func testFive(): String {
          "interface testFive"
    }

    unsafe public func testSix(): String {
          "interface testSix"
    }

    public mut func testSeven(): String {
          "interface testSeven"
    }
}


