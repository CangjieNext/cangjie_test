// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE) EXEC: %interpreter %n.cj 2>&1 | compare %f
// (not not CJNATIVE) EXEC: %compiler %cmp_opt %n.cj -o %output
// (not not CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A {}

func foo() {
    let obj: Any = A()
    match (obj) {
        case x: A => true
        case _ => false
    }
}

main() {
    foo()
    0
}
