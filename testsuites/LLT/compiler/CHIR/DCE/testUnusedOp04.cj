// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func unusedConstShift() {
    1 << 2
    8 >> 1
    0
}

func unusedVarShift(a: Int64, b: Int64) {
    a << b
    a >> 1
    1 << b
    0
}

main() {
    unusedConstShift()
    unusedVarShift(1, 2)
    0
}

/* SCAN
warning: unused result of the operator:'<<'
  ==> testUnusedOp04.cj:10:7:
   | 
10 |     1 << 2
   |       ^^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused result of the operator:'>>'
  ==> testUnusedOp04.cj:11:7:
   | 
11 |     8 >> 1
   |       ^^ unused result of the operator
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
