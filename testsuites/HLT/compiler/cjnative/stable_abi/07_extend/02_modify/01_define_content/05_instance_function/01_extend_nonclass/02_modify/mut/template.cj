/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test extend: instance function
open public class Father {}
public class Son <: Father {}

public struct TestStruct {
    public const init() {}
}
extend TestStruct {
    public mut func f1() {
        1
    }
    protected mut func f2() {
        2
    }

    const mut func f3(): Int64 {
        return 3
    }
    public const mut func f4(): Int64 {
        f3()
    }

    mut func f5(): Int64 {
        return 5
    }
    @Frozen
    public mut func f6(): Int64 {
        f5()
    }

    // 被全局函数调用
    internal mut func f7(): Int64 {
        return 7
    }

    public func f8() {
        8
    }

    func f10() {
        10
    }
    internal func f11() {
        11
    }

    const func f13(): Int64 {
        return 13
    }
    public const func f14(): Int64 {
        f13()
    }

    func f15(): Int64 {
        return 5
    }
    @Frozen
    public func f16(): Int64 {
        f15()
    }
}

public func global() {
    var s1 = TestStruct()
    s1.f7()
}


