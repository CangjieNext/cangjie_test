/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

type str = String

func add<T>(a: T, b: String) {
    return a
}

func add<k>(a: str, b: k) {
    return a
}

main(): Int64 {
    if (add<String>("1", "2") == "1" && add<str>("3", "4") == "3") {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_ambiguous_match
