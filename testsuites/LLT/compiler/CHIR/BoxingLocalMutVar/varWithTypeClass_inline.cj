// LEVEL: 0
// (DEBUG_OPTION) EXEC-PIPE: %compiler %cmp_opt %debugCHIROpt %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION) ASSERT: scan The apply node in the line:18 and the column:5 was optimized by The opt: Function Inline
// (DEBUG_OPTION) ASSERT: scan-not core dumped
// (DEBUG_OPTION) ASSERT: scan-not stack trace

class A {
    var x = 1
}

func foo() {
    var obj = A()

    func goo() {
        obj = A()
        obj.x = 10
    }
    goo()

    println(obj.x)
    0
}

main() { foo() }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
