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
    var b: ??????Int64 = 1
    var c: ?????Int64 = b ?? 4
    var d: ????Int64 = c ?? 5
    var e: ???Int64 = d ?? 6
    var f: ??Int64 = e ?? 7
    var g: ?Int64 = f ?? 8
    var h: Int64 = g ?? 9
    return 0
}
