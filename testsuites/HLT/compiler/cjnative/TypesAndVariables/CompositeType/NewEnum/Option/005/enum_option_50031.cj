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

var A: Array<Option<Option<Int64>>> = [Some(Some(1))]
var b = 0
var C: Array<Option<Int64>> = [Some(1)]
var d = 0

func test(): Option<Int64> {
    var a: ?Array<Option<Option<Int64>>> = A
    var c: ?Array<Option<Int64>> = C
    a?[b] ?? c?[d]
    return Some(0)
}

main(): Int64 {
    return test() ?? 1
}
