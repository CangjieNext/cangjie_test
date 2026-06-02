/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum Test {
    Do | Ho
}

func foo(): Int64 {
    var test1 = match (Test.Do) {
        case Do => "a"
        case Ho => r'b'
    }
    var test2 = match (Test.Ho) {
        case Do => r'a'
        case Ho => "b"
    }
    if (test1 == "a" && test2 == "b") {
        return 0
    }
    return 1
}

main(): Int64 {
    return foo()
}
// ASSERT: scan sema_type_incompatible
