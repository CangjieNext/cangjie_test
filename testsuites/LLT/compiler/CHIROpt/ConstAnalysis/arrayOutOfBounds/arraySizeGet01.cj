// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %frontendCompiler %cmp_opt %f -o %n.%suffix -Woff unused %diag_json

public func foo() {
    let arr = ["1", "2", "3", "4", "5"]
    let idx = arr.size
    arr[idx]
}

main() {
    0
}
// ASSERT: scan-1 chir_idx_out_of_bounds
