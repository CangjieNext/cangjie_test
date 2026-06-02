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
    public A(let a : Int64) {}
    public operator func && (inputB:A):A{  
        var output = A(this.a && inputB.a - 1)
        return output
    }
}


main():Int64{
    var a = A(1)
    var b = A(1)
    a &&= b
    
    return (a.a - 1)
}
// ASSERT: scan parse_invalid_overloaded_operator
