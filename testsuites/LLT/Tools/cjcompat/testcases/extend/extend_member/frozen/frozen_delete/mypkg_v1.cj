// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// test extend: instancemember function
open public class Father {}
public class Son <: Father {}

open public class TestClass {
    public const init() {}
}
extend TestClass {
    public func f1() {
        1
    }

    protected func f2() {
        2
    }

    public mut prop p1: Int64 {
        get() {
            1
        }
        set(value) {}
    }

    protected mut prop p2: Int64 {
        get() {
            1
        }
        set(value) {}
    }
}

public struct TestStruct {
    public const init() {}
}
extend TestStruct{
    public func f1() {
        1
    }

    protected func f2() {
        2
    }

    @Frozen
    public func f3() {
        f2()
    }

    public mut prop p1: Int64 {
        get() {
            1
        }
        set(value) {}
    }

    protected mut prop p2: Int64 {
        get() {
            1
        }
        set(value) {}
    }
}