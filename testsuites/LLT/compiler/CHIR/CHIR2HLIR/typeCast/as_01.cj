// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var cnt = -2

func get() {
    cnt = cnt + 1
    return Option<Array<Int64>>.Some([1, 2])
}

class CA {}

let var490: Option<Option<Int64>> = Option<Array<Int64>>.None as Option<Int64>
let var491: Option<Option<Int64>> = get() as Option<Int64>
let var492: Option<Option<CA>> = get() as Option<CA>
let var493: Option<Option<Int64>> = Option<Array<Int64>>.None as Option<Int64>

main() {
    let res1 = match (var490) {
        case Some(x) => 1
        case None => 0
    }
    let res2 = match (var491) {
        case Some(x) => 1
        case None => 0
    }
    let res3 = match (var492) {
        case Some(x) => 1
        case None => 0
    }
    let res4 = match (var493) {
        case Some(x) => 1
        case None => 0
    }
    res1 + res2 + res3 + res4 + cnt
}
