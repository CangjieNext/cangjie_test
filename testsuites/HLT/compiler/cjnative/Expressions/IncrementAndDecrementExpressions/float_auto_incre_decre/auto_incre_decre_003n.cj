/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

var x: Float16 = 1.01
var y: Float32 = 1.001
var z: Float64 = 1.0001

class A {
    var a: Unit = x++
    var b: Unit = x--
    var c: Unit = y++
    var d: Unit = y--
    var e: Unit = z++
    var f: Unit = z--
}

main() {
    return 1
}
// ASSERT: scan sema_mismatched_types
