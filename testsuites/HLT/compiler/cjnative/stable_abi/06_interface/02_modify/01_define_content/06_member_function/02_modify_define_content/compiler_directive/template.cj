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

    @Deprecated["this function is deprecated", strict: false]
    public static func testOne(): Unit {

    }

    @Deprecated["this function is deprecated", strict: true]
    public func testTwo(): Unit {
        
    }

    public static func testThree(): String {
          "interface testThree"
    }

    @Frozen
    public static func testFour(): String {
          "interface testThree"
    }
}


