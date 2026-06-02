/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class A {}

interface I {}

class B <: A & I {}

var scoreResult: String = match (B()) {
    case _: I => "A"
    case _: A => "A"
    case _ => "A"
}

main() {
    return 0
}
// ASSERT: scan sema_unreachable_pattern
