// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %enableO2 %cmp_opt %chir2llvm %f -o %n.%suffix -Woff unused 2>&1 | compare %f

@OverflowThrowing
func test(a:Int8, b:Int8) {
    return a/b // inline to [23, 20]
}

main() {
    let x1 = Int64(test(-128,-1) - 127)
}


/* SCAN-IN
error: arithmetic operation '/' overflow
  ==> ArithThrow.cj:15:20:
   | 
15 |     let x1 = Int64(test(-128,-1) - 127)
   |                    ^^^^^^^^^^^^^ operation 'Int8(-128) / Int8(-1)' would overflow
   | 
   # note: range of Int8 is -128 ~ 127

1 error generated, 1 error printed.
*/
