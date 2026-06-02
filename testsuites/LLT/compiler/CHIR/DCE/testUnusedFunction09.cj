// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

@C
private func foo(ptr: CPointer<Int8>) {
    return ptr
}

main() {
    return 0
}

/* SCAN
warning: unused function:'foo'
  ==> testUnusedFunction09.cj:11:1:
   | 
11 |   private func foo(ptr: CPointer<Int8>) {
   |  _^
12 | |     return ptr
13 | | }
   | |_^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
