// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: testMutableInImport_pkg.cj
// EXEC: %compiler %compile_lib_opt testMutableInImport_pkg.cj -o pkg.%middle
// EXEC: %compiler %n.cj pkg.%middle -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
// ASSERT: scan 12245
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import pkg.*

main() {
    print(c0.t0.toString())
    c0.t0 = 2
    print(c0.t0.toString())
    c1 = c0
    print(c1.t0.toString())
    c0.t0 = 4
    print(c1.t0.toString())
    foo(c1)
    print(c0.t0.toString())
    0
}
