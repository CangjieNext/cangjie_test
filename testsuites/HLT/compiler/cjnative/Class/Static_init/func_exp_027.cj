/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct rec {
    static var a: Int64
    static init() {
        let v1 = Option<Int64>.Some(1)
        let v2 = Option<Int64>.None
        let r1 = v1 ?? 0
        let r2 = v2 ?? 0
        a = r1 + r2
    }
}

main(): Int64 {
    if (rec.a == 1) {
        return 0
    }
    return 1
}
