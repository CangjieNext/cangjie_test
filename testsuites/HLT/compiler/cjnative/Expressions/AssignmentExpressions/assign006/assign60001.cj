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
var _ = 1

var _a_ = 1
var a__ = 1
var __a = 1
var _aa = 1
var a_ = 1
var _a = 1

main(): Int64 {
    _ = 1
    if (_a_ != 1 || a__ != 1 || __a != 1 || _aa != 1 || _a != 1) {
        return 1
    }
    return 0
}
