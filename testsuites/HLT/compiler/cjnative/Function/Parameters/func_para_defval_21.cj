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
    var res = Foo()
    if (res == "-8-16-32-64816326416.15625032.32000064.640000") {
        return 0
    }
    return 1
}

func Foo(c!: Int8 = -8, d!: Int16 = -16, e!: Int32 = -32, f!: Int64 = -64, g!: UInt8 = 8, h!: UInt16 = 16,
    i!: UInt32 = 32, j!: UInt64 = 64, k!: Float16 = 16.16, l!: Float32 = 32.32, m!: Float64 = 64.64): String {
    var res = c.toString() + d.toString() + e.toString() + f.toString() + g.toString() + h.toString() + i.toString() +
        j.toString() + k.toString() + l.toString() + m.toString()
    return res
}
