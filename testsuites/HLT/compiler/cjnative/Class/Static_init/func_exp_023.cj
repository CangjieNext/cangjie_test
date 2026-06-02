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
        let foo = {i: Int64 => i + 1}
        let f1 = Option<(Int64) -> Int64>.Some(foo)
        let r3 = f1?(0)
        a = match (r3) {
            case Some(x) => x
            case _ => 0
        }
    }
}

main(): Int64 {
    if (rec.a == 1) {
        return 0
    }
    return 1
}
