/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var obj1 = Data()
    var obj2 = Data2()
    var res1: Int32 = obj1.getFoo()
    var res2: Int32 = obj2.getFoo()

    if (res1 != 4 || res2 != 3) {
        return 1
    }
    return 0
}

open class Base {
    protected open func foo(): Int32 {
        return 3
    }
}

class Data <: Base {
    public override func foo(): Int32 {
        return 4
    }

    public open func getFoo(): Int32 {
        return foo()
    }
}

class Data2 <: Base {
    public open func getFoo(): Int32 {
        return foo()
    }
}
