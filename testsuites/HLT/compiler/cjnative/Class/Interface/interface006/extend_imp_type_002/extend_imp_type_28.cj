/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type ran = Range<Int64>

type A = I

interface I {
    func a() {
        1
    }
}

extend<T> Range<T> <: A {}

class C {
    public var item: ran = 1..2
}

let c = C()
let c1 = Option<C>.Some(c)
let ran1: Option<Int64> = c1?.item.a()

main(): Int64 {
    var r1: Int64 = match (ran1) {
        case Some(x) => x
        case _ => 0
    }

    if (r1 == 1) {
        return 0
    } else {
        return 1
    }
}
