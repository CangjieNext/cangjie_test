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

open class Super {
    var a = 1
}

class Base <: Super {
    init() {
        a = 2
    }
}

interface Data2 {
    static func foo(a: Int64): Super {
        return Super()
    }
}

class Data3 <: Data2 {
    public static func foo(a: Int64): Base {
        return Base()
    }
}

main(): Int64 {
    var a = Data3.foo(1).a
    return Int64(a - 2)
}
