/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Data().Poo()
    var res2 = Data().Qoo()
    var res3 = Data().Roo(a: 4)
    if (res1 == 4 && res2 == 6 && res3 == 4) {
        return 0
    }
    return 1
}

class Data <: Base {
    public func Poo(a!: Int64 = 4) {
        return a
    }

    public func Qoo(a!: Int64 = 6) {
        return a
    }
}

interface Base {
    func Poo(a!: Int64): Int64 {
        return a
    }
    func Qoo(a!: Int64): Int64
    func Roo(a!: Int64): Int64 {
        return a
    }
}
