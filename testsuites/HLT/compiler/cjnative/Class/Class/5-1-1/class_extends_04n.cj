/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    public var one : Int32 = 1
}

class Data extend Base {
    public var res: Int32 = one
}
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_unexpected_declaration_in_scope
