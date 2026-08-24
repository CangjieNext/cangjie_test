// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression test for the ICE "begin of range is zero" (error code 12), in the
// shape reported in issue 3351. The VARRAY_GET intrinsic that
// Translator::TranslateVArrayAssign builds for the left-hand side of a compound
// assignment carried no source location, so the out-of-bounds report aborted on
// the zero DebugLocation.
// Hiding the index behind a const function keeps it opaque until -O2 constant
// propagation folds it, so the report comes from RangePropagation rather than
// from ConstAnalysis as in varrayAsg02.cj. The assignment has to sit directly
// in main: moving it into a function that main calls lets -O2 inline it, and
// the intrinsic then inherits the call site's location, which hides the defect.

// LEVEL: 0
// EXEC-PIPE-1: %compiler -Woff all %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f

const func constIndex(): Int64 {
    4
}

main() {
    var m = VArray<Int64, $10>(repeat: 0)
    // 42 / 4 == 10, one past the last element of VArray<Int64, $10>.
    m[42 / constIndex()] |= 42
}

/* SCAN
error: array index is out of bounds
  ==> varrayAsg03.cj:28:5:
   | 
28 |     m[42 / constIndex()] |= 42
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^ range of index 0 is (10), however the size of varray is 10
   | 

1 error generated, 1 error printed.
*/
