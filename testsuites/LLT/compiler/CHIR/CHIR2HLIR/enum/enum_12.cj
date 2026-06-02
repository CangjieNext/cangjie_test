// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum Kind <: ToString {
    A | B | C

    public func toString(): String {
        return match (this) {
            case A => "a"
            case B => "b"
            case C => "c"
        }
    }
}

func println(msg: ToString) {
    print(msg.toString() + "\n")
}

main(): Int64 {
    var a = A
    println(a)
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
