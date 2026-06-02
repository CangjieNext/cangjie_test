/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
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
    if ((oa?.b?.c++ ?? -1) != 2) {
        return 1
    }
    if ((oa?.b?.c-- ?? -1) != 0) {
        return 2
    }
    if ((ob?[0]?.c++ ?? -1) != 2) {
        return 3
    }
    if ((ob?[0]?.c-- ?? -1) != 0) {
        return 4
    }
    if ((oc?(0)?.c++ ?? -1) != 2) {
        return 5
    }
    if ((oc?(0)?.c-- ?? -1) != 0) {
        return 6
    }
    if ((od? {i => i - 1}?.c++ ?? -1) != 2) {
        return 7
    }
    if ((od? {i => i - 1}?.c-- ?? -1) != 0) {
        return 8
    }
    return 0
}
// ASSERT: scan sema_invalid_coalescing
