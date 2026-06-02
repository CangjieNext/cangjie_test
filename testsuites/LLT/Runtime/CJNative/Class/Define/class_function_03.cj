// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var obj1: Base = Data()
    var obj2: Base = Base()
    var res1: Sun = obj1.foo(1)
    var res2: Sun = obj2.foo(1)

    if (res1.a == 4 && res2.a == 3) {
        return 0
    }
    return 1
}

open class Base {
    public open func foo(parm1: Int32): Sun {
        var obj = Sun()
        obj.a = parm1 + 2
        return obj
    }
}

class Data <: Base {
    public override func foo(parm1: Int32): Sun {
        var obj = Moon()
        obj.a = parm1 + 3
        return obj
    }
}

open class Sun {
    public var a: Int32 = 2
}

class Moon <: Sun {}
