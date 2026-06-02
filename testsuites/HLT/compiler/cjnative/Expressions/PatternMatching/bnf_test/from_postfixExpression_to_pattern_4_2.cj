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
    var c =  -(match(1){case _ =>A()}.a)++ 
    if ( c != -1){
        return 1
    }
    return 0
}

class A{
    public var a: Int64 = 1
}
// ASSERT: scan parse_invalid_incre_expr
