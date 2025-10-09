/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: staticmember function
open public class Father {}
public class Son <: Father {}

public class TestClass {
    public let check = 0

    public static func f1() {
        1
    }

    protected static func f2() {
        2
    }

    static const func f3(): Int64 {
        return 3
    }
    public static const func f4(): Int64 {
        f3()
    }

    static func f5(): Int64 {
        return 5
    }
    @Frozen
    public static func f6(): Int64 {
        f5()
    }
}


