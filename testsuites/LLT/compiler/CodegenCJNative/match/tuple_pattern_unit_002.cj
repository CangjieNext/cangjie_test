// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

let var8: (Unit, Int64, Unit) = ((), 81, ());

main(): Int64 {
    match (var8) {
        case (_, _, _) => 55
        case _ => 55
    }
    return 0;
}
