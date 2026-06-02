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

main(): Int64 {
    var a = "0Aa !~\n".toArray()
    var b = a.iterator()
    if (a.size != 7) {
        return 2
    }
    if (a.isEmpty()) {
        return 3
    }
    var r2 = foo(b.next())
    if (r2 != 48) {
        return 4
    }
    if (foo(b.next()) != 65) {
        return 5
    }
    var r3 = a.iterator()
    if (foo(r3.next()) != 48) {
        return 6
    }
    return 0
}

func foo(x: Option<UInt8>) {
    var a = match (x) {
        case Some(v) => v
        case None => UInt8(255)
    }
    return a
}
