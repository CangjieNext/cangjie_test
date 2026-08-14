/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Regression test for the ICE "begin of range is zero" (error code 12).
// The VARRAY_GET intrinsic that Translator::TranslateVArrayAssign creates for
// the left-hand side of a compound assignment used to be built without a source
// location. Once -O2 folded the index into an out-of-bounds constant,
// RangePropagation hit the zero DebugLocation and aborted instead of reporting
// the access. `|=` goes through the plain compound-assign branch of that
// function.
// The index has to stay opaque to Sema: a literal index is rejected earlier
// with sema_builtin_index_in_bound and never reaches CHIR.

// LEVEL: 2
// (O2) ERRCHECK: %compiler %cmp_opt %f -o %output
// (O2) ASSERT: scan-1 chir_idx_out_of_bounds
// (not O2) EXEC: %compiler %cmp_opt %f -o %output

const func constIndex(): Int64 {
    4
}

main() {
    var m = VArray<Int64, $10>(repeat: 0)
    // 42 / 4 == 10, one past the last element of VArray<Int64, $10>.
    m[42 / constIndex()] |= 42
}
