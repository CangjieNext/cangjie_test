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
    var varr1: VArray<Float16, $3> = [1.0, 2.0, 3.0]
    var varr2: VArray<Float32, $3> = [1.0, 2.0, 3.0]
    var varr3: VArray<Float64, $3> = [1.0, 2.0, 3.0]
    varr1[0] = 0.0
    varr2[0] = 0.0
    varr3[0] = 0.0
    var sum = 0.0
    sum = sum + Float64(varr1[0] + varr1[1] + varr1[2])
    sum = sum + Float64(varr2[0] + varr2[1] + varr2[2])
    sum = sum + Float64(varr3[0] + varr3[1] + varr3[2])
    if (sum < 15.0001 && sum > 14.9999) {
        return 0
    }
    return 1
}
