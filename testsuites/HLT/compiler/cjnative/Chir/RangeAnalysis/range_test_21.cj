/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Regression test for the ICE "begin of range is zero" (error code 12): the
// VARRAY_GET intrinsic that Translator::TranslateVArrayAssign builds for the
// left-hand side of a compound assignment carried no source location, so the
// out-of-bounds report aborted on the zero DebugLocation.
// The index here is a plain mutable variable, so it is already a known
// constant for ConstAnalysis without any optimization option -- the crash
// needs no particular optimization level. range_test_19.cj / range_test_20.cj
// cover the other reporting path, where -O2 constant propagation is what makes
// the index known and RangePropagation is the pass that reports.
// One diagnostic per assignment -- the VARRAY_GET and the VARRAY_SET of a
// compound assignment now share the same loc, so their two identical reports
// are deduplicated into one. Covering all three branches of
// TranslateVArrayAssign: `|=` and `+=` take the plain compound-assign branch,
// `&&=` takes AND_ASSIGN and `||=` takes OR_ASSIGN.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-4 chir_idx_out_of_bounds
// ASSERT: scan-4 array index 4 is past the end of array (which contains 3 elements)

func bitOrAssign() {
    var b = 4
    var test: VArray<Int64, $3> = [1, 2, 3]
    test[b] |= 1
}

func addAssign() {
    var b = 4
    var test: VArray<Int64, $3> = [1, 2, 3]
    test[b] += 1
}

func andAndAssign() {
    var b = 4
    var test: VArray<Bool, $3> = [true, true, true]
    test[b] &&= false
}

func orOrAssign() {
    var b = 4
    var test: VArray<Bool, $3> = [true, true, true]
    test[b] ||= true
}

main() {
    bitOrAssign()
    addAssign()
    andAndAssign()
    orOrAssign()
}
