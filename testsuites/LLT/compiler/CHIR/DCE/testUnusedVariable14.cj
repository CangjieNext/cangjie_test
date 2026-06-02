// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

const func test1() {
    1
}

func test() {
    1
}

private var bbb = 2
private var bbb_1 = 2
private var bbb_2 = test
private var bbb_3 = test
private let ccc = 2
private let ccc_1 = test

const func temp() {
    const aa = test1
    const aa_1 = 2
}

main() {
    bbb = 3
    bbb_3 = test
    temp()
    return 0
}

/* SCAN
warning: unused variable:'bbb_1'
  ==> testUnusedVariable14.cj:19:13:
   | 
19 | private var bbb_1 = 2
   |             ^^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'bbb_2'
  ==> testUnusedVariable14.cj:20:13:
   | 
20 | private var bbb_2 = test
   |             ^^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'ccc'
  ==> testUnusedVariable14.cj:22:13:
   | 
22 | private let ccc = 2
   |             ^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'ccc_1'
  ==> testUnusedVariable14.cj:23:13:
   | 
23 | private let ccc_1 = test
   |             ^^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'aa'
  ==> testUnusedVariable14.cj:26:11:
   | 
26 |     const aa = test1
   |           ^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'aa_1'
  ==> testUnusedVariable14.cj:27:11:
   | 
27 |     const aa_1 = 2
   |           ^^^^ unused variable
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

6 warnings generated, 6 warnings printed.
*/
