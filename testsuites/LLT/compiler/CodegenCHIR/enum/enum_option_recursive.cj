// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %disableReflection -o %n.%suffix
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 12\n
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

struct SA {
    var a = Option<SA>.None
    var num = 8
    init(x: Int64) {
        num = x
    }
}

func foo(ins: Option<SA>) {
    let res = match (ins) {
        case Some(x) => x.num
        case _ => 3
    }
    println(res) // i.e., 12
}

main() {
    var ins = SA(2)
    ins.a = Option<SA>.Some(SA(12))
    foo(ins.a)
}
