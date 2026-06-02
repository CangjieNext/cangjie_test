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

interface Ioo {}

class Coo <: Ioo {
    public var b: Int32 = 3
}

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var coo: Coo = Coo()
    var time: Time<Ioo> = Time<Ioo>.Day(coo)
    var res: Int32 = match (time) {
        case Day(x) =>
            var a = match (x) {
                case y: Coo => y.b
                case _ => Int32(1)
            }
            var b: Int32 = match (x) {
                case y: Ioo => 2
                case _ => 1
            }
            a + b
    }
    if (res == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
