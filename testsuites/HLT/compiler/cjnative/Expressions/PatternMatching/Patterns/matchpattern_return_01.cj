/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    if (case01() != 0) {
        return 1
    }
    if (case02() != 0) {
        return 1
    }
    return 0
}

func case01() {
    let score = 80
    var result = match (80) {
        case 40 => Int64(0)
        case _ => Int32(1)
    }
    return result
}

func case02() {
    let score = 80
    var result = match (80) {
        case 40 => Float64(0)
        case _ => Int64(1)
    }
    return result
}
// ASSERT: scan sema_type_incompatible
