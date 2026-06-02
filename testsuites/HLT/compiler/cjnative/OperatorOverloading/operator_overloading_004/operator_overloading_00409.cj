/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct A{
    public operator func - (inputB:A):Int32{
        return 1
    }
    public let a: Int32 = - 
}

class C{
    public operator func - (inputB:C):Int32{
        return 1
    }
    public let a: Int32 = - 
}

interface I{
    operator func - (inputB:I):Int32{
        return 1
    }
    let a = - 
}

class B <: I{}

main():Int64{
    return 1
}
// ASSERT: scan parse_expected_no_newline_after
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_unexpected_declaration_in_scope
