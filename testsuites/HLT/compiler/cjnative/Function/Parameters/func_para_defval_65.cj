/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Data.Poo()
    var res2 = Data.Pooo()
    print(res1.toString() + "\n" + res2.toString())
    if (res1 == 6 && res2 == 4) {
        return 0
    }
    return 1
}

class Data <: Base {
    public static redef func Poo(a!: Int64 = 1) {
        var b: Int64 = Base.Poo()
        return a + b
    }
}

open class Base {
    protected static func Poo(a!: Int64 = 2): Int64 {
        return a + Po()
    }
    private static func Po(a!: Int64 = 3): Int64 {
        return a
    }
    public static func Pooo(a!: Int64 = 4): Int64 {
        return a
    }
}
