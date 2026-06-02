// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var x: Int64 = 1
var y: Int64 = 2
let z = x + y

func test(): Int64 {
    return -1
}

main(): Int64 {
    var a: Int64
    let b: Int64 = z
    a = y
    return a + b - 5
}

var aaaa = 1
let bbbb = 1
