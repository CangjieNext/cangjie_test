// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify Nothing in nested and direct initializers keeps declaration continuations distinct.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class NothingObject {
    init(value: Nothing) {}
}
func stop(): Nothing { throw Exception() }
func consumeObject(value: NothingObject) {}

func local(): Int64 {
    var local = NothingObject(stop())
    println("unreachable after Nothing initializer")
    0
}

func nested(): Int64 {
    consumeObject(NothingObject(stop()))
    println("unreachable after nested Nothing call")
    0
}

main() { local(); nested() }

/* SCAN-IN
warning: unreachable function 
  ==> nothing_initializer.cj:11:10:
   | 
11 |     init(value: Nothing) {}
   |          ^^^^^ function with parameter of nothing type will never be executed
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_initializer.cj:17:5:
   | 
17 |     var local = NothingObject(stop())
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_initializer.cj:17:17:
   | 
17 |     var local = NothingObject(stop())
   |                 ^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_initializer.cj:23:5:
   | 
23 |     consumeObject(NothingObject(stop()))
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/

/* SCAN-IN
warning: unreachable expression
  ==> nothing_initializer.cj:23:19:
   | 
23 |     consumeObject(NothingObject(stop()))
   |                   ^^^^^^^^^^^^^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
