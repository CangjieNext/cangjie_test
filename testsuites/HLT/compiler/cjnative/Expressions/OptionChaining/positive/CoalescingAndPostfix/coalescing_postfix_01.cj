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
    var b = Some(B())
}

class B {
    var c = true
}

let t = (Some(B()), 300)
let f = {i: Int64 => Some(B())}
let g = {i: (Int64) -> Bool => Some(B())}

main() {
    var oa = Some(A())
    var ob = Some(t)
    var oc = Some(f)
    var od = Some(g)
    if (!((oa?.b?.c ?? false) && (ob?[0]?.c ?? false) && (oc?(0)?.c ?? false) && (od? {i => true}?.c ?? false))) {
        return 1
    }
    return 0
}
