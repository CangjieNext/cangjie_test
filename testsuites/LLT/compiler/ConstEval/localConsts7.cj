// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler -O2 %n.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

main() {
    const cMatch1 = match(2) {
        case 1 | 3 => 1
        case _ => 2
    }
    const tup = (1, "2", cMatch1)
    const cMatch2 = match(tup) {
        case (x, "1", y) => 1
        case (1, "2", y) where false => 2
        case (x, y, z) => 3
    }

    const cTry = try {
        const cThrow = "throw"
    } catch (_) {
    } finally {
    }

    const cIs = Some(1) is ?Int64
    const cAs = 1 as Int64

    println(cMatch1)
    println(cMatch2)
    println(cIs)
    println(cAs)
    0
}

/*  SCAN
2
3
true
Some(1)
*/