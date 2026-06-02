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
    var ooa = Some(oa)
    var oob = Some(ob)
    var ooc = Some(oc)
    var ood = Some(od)
    match (ooa) {
        case Some(x) => x?.b?.c
        case None => ()
    }
    match (oob) {
        case Some(x) => x?[0]?.c
        case None => ()
    }
    match (ooc) {
        case Some(x) => x?(1)?.c
        case None => ()
    }
    match (ood) {
        case Some(x) => x? {i: Int64 => true}?.c
        case None => ()
    }
    return 0
}
