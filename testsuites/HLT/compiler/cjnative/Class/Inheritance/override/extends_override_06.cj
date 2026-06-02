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
    var obj2 = Base()
    var res1: Int32 = obj1.getFoo2()
    var res2: Int32 = obj2.getFoo()

    if (res1 != 4 || res2 != 3) {
        return 1
    }
    return 0
}

open class Base {
    private func foo(): Int32 {
        return 3
    }

    public func getFoo(): Int32 {
        return foo()
    }
}

class Data <: Base {
    private func foo(): Int32 {
        return 4
    }

    public func getFoo2(): Int32 {
        return foo()
    }
}
