// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: virtual member calls with Nothing arguments must preserve the call continuation.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    public open func consume(a: Int64, b: Nothing) {}
}
class Child <: Base {
    public override func consume(a: Int64, b: Nothing) {}
}

func stop(): Nothing { throw Exception() }
func next(): Int64 { 1 }

main() {
    let base: Base = Child()
    base.consume(next(), stop())
    println("unreachable after invoke")
}

/* SCAN-IN
warning: unreachable function 
  ==> nothing_invoke_argument.cj:11:40:
   | 
11 |     public open func consume(a: Int64, b: Nothing) {}
   |                                        ^ function with parameter of nothing type will never be executed
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable function 
  ==> nothing_invoke_argument.cj:14:44:
   | 
14 |     public override func consume(a: Int64, b: Nothing) {}
   |                                            ^ function with parameter of nothing type will never be executed
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable 'call'
  ==> nothing_invoke_argument.cj:22:5:
   | 
22 |     base.consume(next(), stop())
   |     ^^^^^^^^^^^^         ~~~~~~ any code following this expression is unreachable
   |     |
   |     unreachable 'call'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_invoke_argument.cj:23:5:
   | 
22 |     base.consume(next(), stop())
   |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ any code following this expression is unreachable
23 |     println("unreachable after invoke")
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
