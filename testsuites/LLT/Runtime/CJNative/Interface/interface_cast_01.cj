// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface CallInterface {
    func foo(): Int32
}

open class Parent <: CallInterface {
    public open func foo(): Int32 {
        return 1
    }
}

class Child <: Parent {
    public override func foo(): Int32 {
        return 2
    }
}

class Call <: CallInterface {
    public func foo(): Int32 {
        return 3
    }

    public func foo2(c1: CallInterface): Int32 {
        if (c1.foo() == 1) {
            return foo3()
        }
        return 0
    }

    public func foo3(): Int32 {
        return 4
    }
}

main(): Int64 {
    var c1: CallInterface = Parent()
    var ret1 = Call().foo2(c1)
    c1 = Child()
    var ret2 = Call().foo2(c1)
    if (ret1 == 4 && ret2 == 0) {
        return 0
    }
    return 1
}
