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

func add<String>(a: String) {
    return a
}

func add<str>(a: str) {
    return a
}

main(): Int64 {
    if (add<String>("1") == "1" && add<str>("3") == "3") {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_overload_conflicts
// ASSERT: scan sema_ambiguous_match
