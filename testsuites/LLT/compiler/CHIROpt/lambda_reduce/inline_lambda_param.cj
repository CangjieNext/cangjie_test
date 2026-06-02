// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %enableFuncInlining %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// RUN-EXEC-PIPE-0: %run %output
// ASSERT: scan-2 The Apply node in the line:31 and the column:5, was optimized by functionInlineForLambda
// ASSERT: scan-2 The Apply node in the line:35 and the column:13, was optimized by functionInlineForLambda

class Part {
    public var a = 3
}

func goo(a: Int64, b: Int64, x: (Int64) -> Unit) {
    var p: Part = Part()
    for (i in 0..100) {
        if (i > 3) {
            p.a = p.a + i
        }
    }
    return x(a + b)
}

func caller() {
    let c = 3
    func foo(a: Int64) {
        print(a + c)
    }
    goo(1, 2, foo)
}

main() {
    let f = caller()
    0
}
