/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


interface A{
    let a : Int32 = 1
    operator func +(inputB:A):Int32{
        return 0
    }
}

class B <: A{}


main():Int64{
    let a : A = B()
    return a+a 
}
// ASSERT: scan parse_unexpected_declaration_in_scope
