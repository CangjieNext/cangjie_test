// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -O2 %disableReflection -o %n.%suffix
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan blue\ngreen\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func foo() {
    var x = 2
    match (x) {
        case 1 => println("red")
        case 2 => println("blue")
        case _ => println("green")
    }
    x = 5
    match (x) {
        case 1 => println("red")
        case 2 => println("blue")
        case _ => println("green")
    }
}

main() {
    foo() // should print "blue\ngreen\n"
    0
}
