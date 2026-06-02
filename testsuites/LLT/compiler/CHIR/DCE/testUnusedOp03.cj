// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

private func foo() {
    (return 99) + 1
}

private func bar() {
    1 + (return 99)
}

private func test(a: Int64, b: Int64) {
    a + b
}

@OverflowWrapping
private func hoo() {
    foo() + bar()
    0
}

main() {
    hoo()
    test(return 0, foo() + 1)

    return 0
}

/* SCAN
warning: unreachable 'operator'
  ==> testUnusedOp03.cj:10:19:
   | 
10 |     (return 99) + 1
   |      ~~~~~~~~~    ^ unreachable 'operator'
   |      |
   |      any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused expression
  ==> testUnusedOp03.cj:14:5:
   | 
14 |     1 + (return 99)
   |     ^ unused expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable 'operator'
  ==> testUnusedOp03.cj:14:7:
   | 
14 |     1 + (return 99)
   |       ^  ~~~~~~~~~ any code following this expression is unreachable
   |       |
   |       unreachable 'operator'
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused function:'test'
  ==> testUnusedOp03.cj:17:1:
   | 
17 |   private func test(a: Int64, b: Int64) {
   |  _^
18 | |     a + b
19 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused result of the operator:'+'
  ==> testUnusedOp03.cj:23:11:
   | 
23 |     foo() + bar()
   |           ^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable expression
  ==> testUnusedOp03.cj:29:20:
   | 
29 |     test(return 0, foo() + 1)
   |          ~~~~~~~~  ^^^^^^^^^ unreachable expression
   |          |
   |          any code following this expression is unreachable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

6 warnings generated, 6 warnings printed.
*/
