// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

internal import std.random.*

main() {
    var list: Array<UInt64> = [1, 45, 18446744073709551614, 18446744073709551615]
    var r = Random(UInt64(65))
    var r1 = Random()
    var seed = r.seed
    var seed1 = r1.seed
    for (i in list) {
        seed = i
        seed1 /= i
    }

    return 0
}
