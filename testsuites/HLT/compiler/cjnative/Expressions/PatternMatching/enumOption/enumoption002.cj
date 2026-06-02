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
    let e1: Option<Any> = None<Any>
    let a = match (e1) {
        case Some(x) => 1
        case None => 0
    }
    e1 ?? 0
    try {
        e1.getOrThrow()
    } catch (_) {}
    safeGetOrThrow(e1)
    a
}
