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
let f1 = {n: Int64, _: Int64 => return n * n}(0, 0)
let f2 = {_: Int64 => return 0}(0)
let f3 = {
    _: Int64 => return 0
}(0)
let f4 = {
    _: Int64 => return 0
}(0)

main(): Int64 {
    return f1 + f2 + f3 + f4
}
