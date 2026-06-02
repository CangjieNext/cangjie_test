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
    var b = Some(B())
}

class B {
    var c = 1
    var c1 = false
}

let t = (Some(B()), 300)
let t1 = (Some(B()), 300)
let f = {i: Int64 => Some(B())}
let f1 = {i: Int64 => Some(B())}
let g = {i: (Int64) -> Int64 => Some(B())}
let g1 = {i: (Int64) -> Bool => Some(B())}

main() {
    var oa = Some(A())
    var ob = Some(t)
    var ob1 = Some(t1)
    var oc = Some(f)
    var oc1 = Some(f1)
    var od = Some(g)
    var od1 = Some(g1)
    if ((-(oa?.b?.c) ?? -2) != -1) {
        return 1
    }
    if ((!(oa?.b?.c1) ?? false) != true) {
        return 2
    }
    if ((-(ob?[0]?.c) ?? -2) != -1) {
        return 3
    }
    if ((!(ob1?[0]?.c1) ?? false) != true) {
        return 4
    }
    if ((-(oc?(0)?.c) ?? -2) != -1) {
        return 5
    }
    if ((!(oc1?(0)?.c1) ?? false) != true) {
        return 6
    }
    if ((-(od? {i => i - 1}?.c) ?? -2) != -1) {
        return 7
    }
    if ((!(od1? {i => false}?.c1) ?? false) != true) {
        return 8
    }
    return 0
}
// ASSERT: scan sema_invalid_unary_expr
