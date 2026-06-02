// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-ERRCHECK: %run %run_opt %output %run_args
// ASSERT:scan Out of memory

import std.collection.*
import std.runtime.*

class A {
    let width: Int64 = 10
    let hieght: Int64 = 10
    var a1: Int64 = 10
    var a2: Int64 = 10
    var a3: Int64 = 10
    var a4: Int64 = 10
    var a5: Int64 = 10
    var a6: Int64 = 10
    var a7: Int64 = 10
    var a8: Int64 = 10
    var a9: Int64 = 10
    var a10: Int64 = 10
    var a11: Int64 = 10
    var a12: Int64 = 10
    var a13: Int64 = 10
    var a14: Int64 = 10
    var a15: Int64 = 10
    var a16: Int64 = 10
    var a17: Int64 = 10
    var a18: Int64 = 10
    var a19: Int64 = 10
    var a20: Int64 = 10
    var a21: Int64 = 10
    var a22: Int64 = 10
    var a23: Int64 = 10
    var a24: Int64 = 10
    var a25: Int64 = 10
    var a26: Int64 = 10
    var a27: Int64 = 10
    var a28: Int64 = 10
    var a29: Int64 = 10
    var a30: Int64 = 10
    var a31: Int64 = 10
    var a32: Int64 = 10
    var a33: Int64 = 10
    var a34: Int64 = 10
    var a35: Int64 = 10
    var a36: Int64 = 10
}

main() {
    var array = Array<Int64>(25000000, repeat: 103)
    let list = ArrayList<A>()
    for (i in 0..1000000) {
        list.add(A())
    }
}
