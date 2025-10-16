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

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    func geta<T, U>(): Int64 {
        return 0
    }

    public func getb<T, U>(): Int64 where T <: ToString, U <: Random {
        return 0
    }

    public func getc<T, U>(): Int64 where T <: Random {
        return 0
    }

    func geta1<T, U>(): Int64 where T <: B {
        return 0
    }

    @Frozen
    public func geta2() {
        let x = geta1<B, Random>()
        return 1
    }

    public func geta3<T, U>(): Int64 where T <: B {
        return 1
    }
}

