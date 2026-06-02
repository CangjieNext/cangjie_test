/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func safeGetOrThrow(value: ?Any): Any {
    value ?? 0
}

main() {
    let obj = Object()
    let e1: Option<Any> = Option<Any>.Some(obj)
    let a = match (e1) {
        case Some(x) => 0
        case None => 1
    }
    e1 ?? obj
    e1.getOrThrow()
    safeGetOrThrow(e1)
    a
}
