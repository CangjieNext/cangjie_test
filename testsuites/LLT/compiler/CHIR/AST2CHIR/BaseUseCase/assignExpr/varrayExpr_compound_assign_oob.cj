// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression test for the ICE "begin of range is zero" (error code 12): the
// VARRAY_GET intrinsic that Translator::TranslateVArrayAssign builds for the
// left-hand side of a compound assignment carried no source location, so the
// out-of-bounds report aborted on the zero DebugLocation instead of naming the
// access. varrayAsg01.cj already covers the plain assignment and the read, and
// missed exactly this case.
// The index is a plain mutable variable, so ConstAnalysis already knows it is
// out of bounds without any optimization option. One diagnostic per assignment
// -- the VARRAY_GET and the VARRAY_SET now share the same loc, so their two
// identical reports are deduplicated into one. All three branches of
// TranslateVArrayAssign are covered: `|=` and `+=` take the plain
// compound-assign branch, `&&=` takes AND_ASSIGN and `||=` takes OR_ASSIGN.

// LEVEL: 0
// EXEC-PIPE-1: %frontendCompiler %cmp_opt %f -o %n.%suffix -Woff unused %diag_json 2>&1 | compare %f
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
