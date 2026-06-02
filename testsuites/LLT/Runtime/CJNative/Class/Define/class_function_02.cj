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
    var obj3: Sun = Sun()
    var obj4: Sun = Moon()
    var res1: Int64 = obj1.foo(obj4)
    var res2: Int64 = obj2.foo(obj3)

    if (res1 == 4 && res2 == 3) {
        return 0
    }
    return 1
}

open class Base {
    public open func foo(parm1: Sun): Int64 {
        let ret = parm1.getFoo() + 1
        return ret
    }
}

class Data <: Base {
    public override func foo(parm1: Sun): Int64 {
        let ret = parm1.getFoo() + 2
        return ret
    }
}

open class Sun {
    public open func getFoo(){
        return 2
    }
}

class Moon <: Sun {}
