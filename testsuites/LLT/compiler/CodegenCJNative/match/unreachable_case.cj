// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

main(): Int64 {
    // Unreachable cases should not be generated.

    let x: Int64 = 1;
    var ret: Int64 = match (x) {
        case 2 => 1
        case v => 0 // var pattern is a default case, below should be unreachable.
        case _ => (1, 2, 3)[1]
        case 1 => 3
    };
    if (ret != 0) {
        return 1;
    }

    ret = match {
        case _ => 0 // wildcard pattern is a default case, below should be unreachable.
        case x == 1 => (1, 2)[1]
        case x == 2 => 1
    }
    if (ret != 0) {
        return 2;
    }

    return 0;
}
