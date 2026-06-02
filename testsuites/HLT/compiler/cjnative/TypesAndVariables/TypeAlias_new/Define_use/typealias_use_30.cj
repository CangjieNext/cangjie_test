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

type li<T> = Array<T>

type flo = Float64

var list: li<flo> = [1.001, 2.002, 3.003, 4.004]

main(): Int64 {
    if (Int64(list[0]) == 1 && Int64(list[1]) == 2) {
        return 0
    } else {
        return 1
    }
}
