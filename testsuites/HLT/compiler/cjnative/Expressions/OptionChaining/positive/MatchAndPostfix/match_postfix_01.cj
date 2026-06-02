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
    var b = Some(B(true))
}

class B {
    var c = false
    init(x: Bool) {
        this.c = x
    }
}

let t = (Some(B(true)), 300)
let f = {i: Int64 => Some(B(true))}
let g = {i: (Int64) -> Bool => Some(B(true))}

main() {
    var oa = Some(A())
    var ob = Some(t)
    var oc = Some(f)
    var od = Some(g)
    match (oa?.b?.c) {
        case Some(x) =>
            if (x != true) {
                return 1
            }
        case None => ()
    }
    match (ob?[0]?.c) {
        case Some(x) =>
            if (x != true) {
                return 2
            }
        case None => ()
    }
    match (oc?(0)?.c) {
        case Some(x) =>
            if (x != true) {
                return 3
            }
        case None => ()
    }
    match (od? {i => true}?.c) {
        case Some(x) =>
            if (x != true) {
                return 4
            }
        case None => ()
    }
    return 0
}
