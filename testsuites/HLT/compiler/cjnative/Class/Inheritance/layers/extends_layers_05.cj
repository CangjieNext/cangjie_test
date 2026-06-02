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

open class Base3 {
    public func foo(): Int32 {
        return 3
    }
}

open class Base2 <: Base3 {
    public func foo(a: Int32): Int32 {
        return a
    }
}

class Data <: Base2 {
    public func foo(a: Int32, b: Int32): Int32 {
        return a + b
    }
}

main(): Int64 {
    var obj = Data()
    var res: Int32 = obj.foo(1, 2)
    if (res != 3) {
        return 1
    }
    return 0
}
