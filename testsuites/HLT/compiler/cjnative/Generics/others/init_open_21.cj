/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main(): Int64 {
    var a:A = A()
    return 0
}

interface B {
    open func foo(){ 
        return 1
    }
    init(){
        var a = foo()
    }
}

class A<: B
// ASSERT: scan parse_redundant_modifier
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_left_brace
