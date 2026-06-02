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
//boolean operators
// troubleshooting
main(): Int64 {
    var t: Bool = true
    var f: Bool = false
    f ||= f
    if (f != false) {
        return 1
    }
    t ||= t
    if (t == false) {
        return 1
    }
    t ||= f
    if (t == false) {
        return 1
    }
    f ||= t
    if (f == false) {
        return 1
    }
    return 0 ////STATUS_PASSED
}
