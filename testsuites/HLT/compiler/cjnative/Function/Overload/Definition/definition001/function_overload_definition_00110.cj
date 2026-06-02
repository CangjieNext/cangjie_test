/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(a: Int16): Int64 {
    return 1
}

var test: (Int8) -> Int64 = {a: Int16 => return 1}

main(): Int64 {
    func test1(a: Int16): Int64 {
        return 3
    }
    var test1: (Int8) -> Int64 = {a: Int16 => return 1}
    return 1
}
// ASSERT: scan sema_redefinition
// ASSERT: scan sema_mismatched_types
