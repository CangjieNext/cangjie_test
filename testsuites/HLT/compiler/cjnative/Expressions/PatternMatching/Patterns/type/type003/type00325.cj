/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(): Int64 {
    var i: Int32 = 1
    let j: Int32 = 1
    var res = match (i) {
        case a: Int8 => 2
        case 1 => 1
    }
    if (res == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    return test()
}
// ASSERT: scan sema_nonexhuastive_patterns
// ASSERT: scan sema_unreachable_pattern
