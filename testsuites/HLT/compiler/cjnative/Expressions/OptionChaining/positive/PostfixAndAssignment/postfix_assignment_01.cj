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
    var m: Option<Int64> = oa?.b?.c
    var n: Option<Int64> = ob?[0]?.c
    var k: Option<Int64> = oc?(110)?.c
    var l: Option<Int64> = od? {i: Int64 => i - 1}?.c
    if (!(((m ?? -1) == 1) && ((n ?? -1) == 1) && ((k ?? -1) == 1) && ((l ?? -1) == 1))) {
        return 1
    }
    return 0
}
