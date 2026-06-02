// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %frontendCompiler %cmp_opt %f -o %n.%suffix -Woff unused %diag_json

public func arrayInit01() {
    var a1 = Array<Int64>()
    var a2 = Array<Int64>(1, repeat: 2)
    var a3: Array<Int64> = [1, 2, 3]
    var a4 = Array<Int64>(4, {i => unsafe { zeroValue<Int64>() }})
    var a5 = a1[0] + a2[1] + a3[3] + a4[4]
}

main() {}
// ASSERT: scan-4 chir_idx_out_of_bounds
