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

func safeGetOrThrow(value: ?E1): E1 {
    value ?? A2(0)
}

enum E1 {
    | A1 | A2(Int64) | ...
}

main() {
    let e1: Option<E1> = None<E1>
    let a = match (e1) {
        case Some(x) => 1
        case None => 0
    }
    e1 ?? A1
    safeGetOrThrow(e1)
    a
}
