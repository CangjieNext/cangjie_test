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

type arr = Array<Bool>

extend<T> Array<T> {
    public operator func +(a: arr) {
        a
    }
}

class A {
    public var a: arr = [true, false]
}

main(): Int64 {
    var bb = ([true, false] + [true, false])
    var cc = bb.get(1)

    var dd: Bool = match (cc) {
        case Some(x) => x
        case _ => true
    }

    var ee = bb.clone()

    ee[1] = true

    var gg: Bool = match (ee.get(1)) {
        case Some(x) => x
        case _ => false
    }

    if (bb.size == 2 && !bb.isEmpty() && !dd && gg) {
        return 0
    } else {
        return 1
    }
}
