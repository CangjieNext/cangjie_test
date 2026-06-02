// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %frontendCompiler %cmp_opt %f -o %n.%suffix -Woff unused %diag_json

var g0: Int64 = 1

public func arrayInit01() {
    var a1 = [1]
    g0 = a1[1]
    a1 = [1, 2, 3]
    g0 = a1[1]
    g0 = a1[-1]
    a1 = [4]
    g0 = a1[1]
}

public func arrayInit02(temp: Array<Int64>) {
    var a1 = [1]
    a1 = temp
    g0 = a1[1]
}

main() {}
// ASSERT: scan-3 chir_idx_out_of_bounds
