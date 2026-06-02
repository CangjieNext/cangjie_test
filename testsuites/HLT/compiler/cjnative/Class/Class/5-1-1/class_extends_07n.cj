/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f

open class Base {
    public var one : Int32 = 1
}

open class Base1 {
    public var two : Int32 = 2
}

class Data <: Base & Data <: Base1 { 
    public var res: Int32 = one
    public var res1: Int32 = two
}
// ASSERT: scan parse_decl_cannot_inherit_their_self
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_decl
