// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %enableCompileDebug %f %diag_json -o %n.%suffix 2>&1 | compare %f

main() {
    var arr = Array<Int64>(3, {i => i})
    let res = arr.get(-1)
    let cmp = match (res) {
        case None => 0
        case _ => 1
    }
    if (cmp != 0) {
        print("fail\n")
    }
    arr[-1]
    return 0
}
// ASSERT: scan chir_idx_out_of_bounds
