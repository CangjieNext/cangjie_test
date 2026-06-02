/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (Boo.foo(1) != 3) {
        return 1
    }
    return 0
}

open class Aoo {
    public static func foo(x: Int64) {
        return Base().a
    }
}

class Boo <: Aoo {
    public static redef func foo(x: Int64) {
        return Data().b
    }
}

open class Base {
    public var a: Int64 = 1
}

class Data <: Base {
    public var b = 3
}
