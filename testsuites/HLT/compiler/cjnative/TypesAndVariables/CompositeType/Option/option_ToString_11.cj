/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
main() {
    let a: Option<Bool> = false
    let b: ?Bool = None
    if (a.toString() != "Some(false)") {
        return 1
    }
    if (b.toString() != "None") {
        return 2
    }
    return 0
}
