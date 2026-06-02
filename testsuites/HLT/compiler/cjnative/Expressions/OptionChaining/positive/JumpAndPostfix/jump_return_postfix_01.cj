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

func testa(): Option<Int64> {
    var oa = Some(A())
    return oa?.b?.c
}

func testb(): Option<Int64> {
    var ob = Some(t)
    return ob?[0]?.c
}

func testc(): Option<Int64> {
    var oc = Some(f)
    return oc?(0)?.c
}

func testd(): Option<Int64> {
    var od = Some(g)
    return od? {i => i - 1}?.c
}

main() {
    var r1 = testa()
    var r2 = testb()
    var r3 = testc()
    var r4 = testd()
    if (!(r1 == 1 && r2 == 1 && r3 == 1 && r4 == 1)) {
        return 2
    }
    return 0
}
