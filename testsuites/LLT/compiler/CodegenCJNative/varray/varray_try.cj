// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

// EXEC-PIPE: %compiler %cmp_opt %enableO2 -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
let var_1688625711642_1409: VArray<Int32, $9> = [Int32(35), Int32(-60), Int32(109), Int32(69), Int32(112), Int32(-13),
    Int32(52), Int32(10), Int32(125)];

main(): Int64 {
    var x = try {
        var_1688625711642_1409
    } finally { // block id: 1411
        var_1688625711642_1409
    }[0]
    if (x != Int32(35)) {
        return 1
    }
    return 0
}
