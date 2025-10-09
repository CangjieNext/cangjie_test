/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: staticmember variable
open public class Father {}

public class Son <: Father {}

public class CC {
    public static let c1: Father = Son()
    
    static const a1 = 1
    static var a2 = 2
    static let a3 = 3

    @Deprecated["this var is deprecated", strict: false] static const b1 = 1
    @Deprecated["this var is deprecated", strict: false] static let b2 = 2
    @Deprecated["this var is deprecated", strict: false] static var b3 = 3

    public static const func f1() {
        a1
    }

    @Frozen
    public func f2() {
        a2
    }

    @Frozen
    public func f3() {
        a3
    }

    public static const func f4() {
        b1
    }

    @Frozen
    public func f5() {
        b2
    }

    @Frozen
    public func f6() {
        b3
    }
}


