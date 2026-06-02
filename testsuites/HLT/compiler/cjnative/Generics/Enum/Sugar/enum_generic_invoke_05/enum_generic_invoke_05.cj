/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: enum_generic_invoke_05_a.cj
// EXEC: %compiler %cmp_opt %f enum_generic_invoke_05_a.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package enum_generic_invoke_05

func run(): Int64 {
    var time = TimeUnit.Year(4)
    var month = Month(3)
    var res1 = match (time) {
        case Year(x) => 2020
        case Month(x) => 9
    }
    var res2 = match (month) {
        case Year(x) => 2020
        case Month(x) => 9
    }
    if (res1 == 2020 && res2 == 9) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
