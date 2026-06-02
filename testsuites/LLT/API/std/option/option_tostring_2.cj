/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-0: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A <: ToString {
    A(public let a: String) {}

    public func toString(): String {
        return "[Object A]{a: ${a}}"
    }
}

main(): Int64 {
    let str: String = "world"
    let o1: Option<A> = Some(A(str))
    let o2: Option<A> = None

    if (o1.toString() == "Some([Object A]{a: ${str}})" && o2.toString() == "None") {
        return 0
    }
    return 1
}
