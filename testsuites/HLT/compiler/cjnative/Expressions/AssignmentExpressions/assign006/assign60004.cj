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
main(): Int64 {
    let _ = 1
    let _a_ = 1
    let __a = 1
    let _aa = 1
    let _a = 1

    let `_a_a` = 1
    let `_a__a` = 1
    let `__aa` = 1
    let `_aaa` = 1
    let `a_a` = 1
    _ = 1
    if (_a_ != 1 || __a != 1 || _aa != 1 || _a != 1) {
        return 1
    }

    if (`_a_a` != 1 || `_a__a` != 1 || `__aa` != 1 || `_aaa` != 1 || `a_a` != 1) {
        return 1
    }
    return 0
}
