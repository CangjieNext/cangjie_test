/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package tmp_test

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.runtime.*

class CA {}

struct SA {}

public func f(): Int64 {
    var b = CA()
    blackBox(b)
    var c = 1
    blackBox(c)
    var d = blackBox(c) + 1
    blackBox(d)
    var e = SA()
    blackBox(e)
    var f = {=> 1}
    blackBox(f)

    let bb = CA()
    blackBox(bb)
    let cc = 1
    blackBox(cc)
    let dd = blackBox(cc) + 1
    blackBox(dd)
    let ee = SA()
    blackBox(ee)
    let ff = {=> 1}
    blackBox(ff)
    0
}

main(): Int64 {
    f()
    return 0
}
