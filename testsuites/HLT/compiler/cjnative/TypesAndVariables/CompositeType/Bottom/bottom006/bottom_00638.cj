/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXE-1: %compiler %cmp_opt %f -o %output
// DEPRECATED ?:

func test() : Bool {(return true) ? (false):(false)}

main(): Int64 {
    if (test()) { // true
        return 0
    }
    return 1
}
