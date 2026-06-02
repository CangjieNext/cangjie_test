// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %n.cj -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan 12245
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func foo(x: Array<Int64>) {
    x[0] = 5
}

main() {
    let a0 = Array<Int64>(1, repeat: 1)
    print(a0[0].toString()) // 1
    a0[0] = 2
    print(a0[0].toString()) // 2
    var a1 = Array<Int64>(1, repeat: 3)
    a1 = a0
    print(a1[0].toString()) // 2
    a0[0] = 4
    print(a1[0].toString()) // 4
    foo(a1)
    print(a0[0].toString()) // 5
    0
}
