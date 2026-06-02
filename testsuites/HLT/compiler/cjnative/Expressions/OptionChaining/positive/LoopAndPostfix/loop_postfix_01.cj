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
class A {
    var b = Some(B(1))
}

class B {
    var c = 0
    init(x: Int64) {
        this.c = x
    }
}

let t = (Some(B(1)), 300)
let f = {i: Int64 => Some(B(1))}
let g = {i: (Int64) -> Int64 => Some(B(i(2)))}

main() {
    var oa = Some(A())
    var ob = Some(t)
    var oc = Some(f)
    var od = Some(g)
    var v1 = 0
    var v2 = 0
    var v3 = 0
    var v4 = 0
    for (i in 0..(oa?.b?.c ?? -1)) {
        v1 = oa?.b?.c ?? -1
    }
    for (i in 0..(ob?[0]?.c ?? -1)) {
        v2 = ob?[0]?.c ?? -1
    }
    for (i in 0..(oc?(0)?.c ?? -1)) {
        v3 = oc?(0)?.c ?? -1
    }
    for (i in 0..(od? {i => i - 1}?.c ?? -1)) {
        v4 = od? {i => i - 1}?.c ?? -1
    }
    if (!(v1 == 1 && v2 == 1 && v3 == 1 && v4 == 1)) {
        return 1
    }
    var r1 = 0
    var r2 = 0
    var r3 = 0
    var r4 = 0
    while (r1 < (oa?.b?.c ?? -1)) {
        v1 = oa?.b?.c ?? -1
        r1++
    }
    while (r2 < (ob?[0]?.c ?? -1)) {
        v1 = ob?[0]?.c ?? -1
        r2++
    }
    while (r3 < (oc?(0)?.c ?? -1)) {
        v1 = oc?(0)?.c ?? -1
        r3++
    }
    while (r4 < (od? {i => i - 1}?.c ?? -1)) {
        v1 = od? {i => i - 1}?.c ?? -1
        r4++
    }
    if (!(r1 == 1 && r2 == 1 && r3 == 1 && r4 == 1)) {
        return 2
    }
    return 0
}
