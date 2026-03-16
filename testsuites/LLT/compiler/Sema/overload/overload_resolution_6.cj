// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// Regression test: overload resolution with lambda argument when the () -> Unit
// overload is declared before (Int64, Int64) -> Unit. Previously, stale negative
// cache entries in SynthesizeWithNegCache caused the 2-param lambda to be rejected
// after the 0-param candidate was tried first.

class B {
    public init(list: () -> Unit) {
        list()
    }
    public init(list: (Int64, Int64) -> Unit) {
        this() {list(0, 0)}
    }
}

func limit(size: Int64, offset: Int64): (Int64, Int64) {
    return (size, offset)
}

public class A {
    public func add(arg: Array<Byte>): A {
        this
    }
    public func add(arg: Int64): A {
        this
    }

    func page(): Int64 {
        B() {
            size, offset =>
                let (x, y) = limit(size, offset)
                add(x).add(y)
                return
        }
        0
    }
}

main(): Int64 {
    let a = A()
    let result = a.page()
    if (result == 0) {
        return 0
    }
    return 1
}
