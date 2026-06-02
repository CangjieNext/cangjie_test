// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var obj1 = Data()
    var obj2 = Base()
    var res1: Int32 = obj1.foo(2, 3, 4)
    var res2: Int32 = obj2.foo(2, 3, 4)

    if (res1 == 11 || res2 == 10) {
        return 0
    }
    return 1
}

open class Base {
    public open func foo(parm1: Int32, parm2: Int32, parm3: Int32): Int32 {
        let ret = parm1 + parm2 + parm3 + 1
        return ret
    }
}

class Data <: Base {
    public override func foo(parm1: Int32, parm2: Int32, parm3: Int32): Int32 {
        let ret = parm1 + parm2 + parm3 + 2
        return ret
    }
}
