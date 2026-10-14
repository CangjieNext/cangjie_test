// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify the successor of resource cleanup that cannot complete normally.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class BadRes <: Resource {
    public func isClosed(): Bool { false }
    public func close(): Nothing { throw Exception() }
}

main() {
    try (r = BadRes()) { println("using") }
    println("dead after twr")
}

/* SCAN-IN
warning: unreachable expression
  ==> resource_nothing_close.cj:17:5:
   | 
16 |     try (r = BadRes()) { println("using") }
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
17 |     println("dead after twr")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
