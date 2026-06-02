// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %frontendCompiler %cmp_opt %f -o %n.%suffix -Woff unused %diag_json

public func arraySlice01() {
    var a1 = [1, 2, 3, 4, 5, 6, 7]
    var a2 = a1.slice(1, 3)
    a2[3] = 4
    var a3 = a2.get(-2)
}

main() {}
// ASSERT: scan chir_idx_out_of_bounds
