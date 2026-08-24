// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Companion of varrayAsg03.cj: same fix, same RangePropagation reporting path
// reached through -O2 constant propagation, but the folded index is negative
// instead of past the end, so the lower bound of the range check is the one
// that reports. The assignment sits directly in main for the same reason as in
// varrayAsg03.cj.

// LEVEL: 0
// EXEC-PIPE-1: %compiler -Woff all %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f

const func constIndex(): Int64 {
    4
}

main() {
    var m = VArray<Int64, $10>(repeat: 0)
    // 4 - 12 == -8, below the first element of VArray<Int64, $10>.
    m[constIndex() - 12] |= 42
}

/* SCAN
error: array index is out of bounds
  ==> varrayAsg04.cj:23:5:
   | 
23 |     m[constIndex() - 12] |= 42
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^ range of index 0 is (-8), however the size of varray is 10
   | 

1 error generated, 1 error printed.
*/
