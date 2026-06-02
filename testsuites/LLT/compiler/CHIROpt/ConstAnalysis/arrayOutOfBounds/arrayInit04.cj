// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %frontendCompiler %cmp_opt %f -o %n.%suffix -Woff unused %diag_json

var g0 = true

public func arrayInit01() {
    var a1: Array<Int64>
    if (g0) {
        a1 = [1, 2, 3, 4, 5]
    } else {
        a1 = [2, 2, 3, 3, 4]
    }
    var a2 = a1[5]
}

main() {}
// ASSERT: scan-1 chir_idx_out_of_bounds
