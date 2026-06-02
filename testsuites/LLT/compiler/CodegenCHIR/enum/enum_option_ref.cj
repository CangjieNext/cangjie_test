// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 6\n2\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class CA {
    var a = 6
}

main() {
    var ins = Option<CA>.Some(CA())
    var res = match (ins) {
        case Some(x) => x.a
        case _ => 2
    }
    println(res) // 6
    ins = Option<CA>.None
    res = match (ins) {
        case Some(x) => x.a
        case _ => 2
    }
    println(res) // 2
}
