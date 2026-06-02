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

type arr = Array<Bool>

class A {
    public var a: arr = [true, false]
}

main(): Int64 {
    var b: arr = A().a
    var c = b.get(1)
    var d: Bool = match (c) {
        case Some(x) => x
        case _ => true
    }
    var e = b.clone()
    e[1] = true
    var g: Bool = match (e.get(1)) {
        case Some(x) => x
        case _ => false
    }
    if (b.size == 2 && !b.isEmpty() && !d && g) {
        return 0
    } else {
        return 1
    }
}
