// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Base {
    public func foo(){
        return 1
    }
}

class Data <: Base {
    public func foo(a: Int64){
        return a
    }
}

main(): Int64 {
    var obj1 = Base()
    var obj2 = Data()

    var res1: Int64 = obj1.foo()
    var res2: Int64 = obj2.foo(2)
    if (res1 == 1 && res2 == 2) {
        return 0
    }
    return 1
}
