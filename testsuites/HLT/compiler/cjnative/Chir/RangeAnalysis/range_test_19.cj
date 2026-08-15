/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Regression test for the ICE "begin of range is zero" (error code 12), in the
// shape reported in the issue (with its generic const function simplified
// away): the VARRAY_GET intrinsic that Translator::TranslateVArrayAssign
// creates for the left-hand side of a compound assignment carried no source
// location, so the out-of-bounds report aborted on the zero DebugLocation.
// Hiding the index behind a const function keeps it opaque until -O2 constant
// propagation folds it, which puts the report in RangePropagation rather than
// in ConstAnalysis -- a different reporting path from range_test_21.cj, hence
// the (O2) guard. `|=` takes the plain compound-assign branch.
// The index also has to stay opaque to Sema: a literal index is rejected
// earlier with sema_builtin_index_in_bound and never reaches CHIR.

// LEVEL: 0
// (O2) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 1>/dev/null | compare %f
// (O2) ASSERT: scan-1 chir_idx_out_of_bounds
// (O2) ASSERT: scan-1 range of index 0 is (10), however the size of varray is 10

const func constIndex(): Int64 {
    4
}

main() {
    var m = VArray<Int64, $10>(repeat: 0)
    // 42 / 4 == 10, one past the last element of VArray<Int64, $10>.
    m[42 / constIndex()] |= 42
}
