// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Return completion is unreachable when its operand cannot complete, including nested calls.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func stop(): Nothing { throw Exception() }
func consume(value: Int64): Int64 { value }
func call(value: Int64): Int64 { value }

func directNothing(): Int64 {
    return stop()
}

func nestedNothing(): Int64 {
    return consume(stop())
}

func nestedReturn(): Int64 {
    return call(return 1)
}

func normalReturn(): Int64 {
    return consume(call(1))
}

main() {
    println(directNothing() + nestedNothing() + nestedReturn() + normalReturn())
}

// ASSERT: scan-3 warning: unreachable expression
// ASSERT: scan-2 warning: unreachable 'call'

/* SCAN-IN
warning: unreachable expression
  ==> nothing_return_operand.cj:15:5:
   | 
15 |     return stop()
   |     ^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_return_operand.cj:19:5:
   | 
19 |     return consume(stop())
   |     ^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable 'call'
  ==> nothing_return_operand.cj:19:12:
   | 
19 |     return consume(stop())
   |            ^^^^^^^ ~~~~~~ any code following this expression is unreachable
   |            |
   |            unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_return_operand.cj:23:5:
   | 
23 |     return call(return 1)
   |     ^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable 'call'
  ==> nothing_return_operand.cj:23:12:
   | 
23 |     return call(return 1)
   |            ^^^^ ~~~~~~~~ any code following this expression is unreachable
   |            |
   |            unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
