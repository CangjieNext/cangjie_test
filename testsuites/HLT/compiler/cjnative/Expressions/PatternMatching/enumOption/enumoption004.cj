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

func safeGetOrThrow(value: ?S1): S1 {
    value ?? S1()
}

struct S1 {
    const init() {}
}

main() {
    let e1: Option<S1> = Some(S1())
    let a = match (e1) {
        case Some(x) => 0
        case None => 1
    }
    e1 ?? S1()
    e1.getOrThrow()
    safeGetOrThrow(e1)
    a
}
