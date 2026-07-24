// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.

// A selectorless wildcard is an unconditional true condition and covers every following sibling.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt %typecheck %f 2>&1 | compare %f


main() {
    let result = match {
        case _ => 0
        case true => 1
        case false => 2
    }
    println(result)
}

/* SCAN
warning: unreachable pattern
  ==> selectorless_match_wildcard.cj:12:14:
   | 
12 |         case true => 1
   |              ^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> selectorless_match_wildcard.cj:13:14:
   | 
13 |         case false => 2
   |              ^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused function:'main'
  ==> selectorless_match_wildcard.cj:9:1:
   | 
9  |   main() {
   |  _^
10 | |     let result = match {
   | | ...
16 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
