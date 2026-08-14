/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Companion of range_test_19.cj for the other two dimensions of the same fix:
// `||=` takes the short-circuit branch of Translator::TranslateVArrayAssign,
// and the folded index is negative instead of past the end, so the lower bound
// of the range check is the one that reports. Both used to ICE with
// "begin of range is zero" (error code 12) because the VARRAY_GET intrinsic
// carried no source location.

// LEVEL: 2
// (O2) ERRCHECK: %compiler %cmp_opt %f -o %output
// (O2) ASSERT: scan-1 chir_idx_out_of_bounds
// (not O2) EXEC: %compiler %cmp_opt %f -o %output

const func constIndex(): Int64 {
    4
}

main() {
    var m = VArray<Bool, $10>(repeat: false)
    // 4 - 12 == -8, below the first element of VArray<Bool, $10>.
    m[constIndex() - 12] ||= true
}
