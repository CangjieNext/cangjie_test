/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

class A<T>{
    public var a = 0
    public func foo1(){return 0}
}

extend<T> A<T>{
    mut prop a : T
    prop b : T
    operator func + (a: T): T
    static operator func + (a: T): T
}
    
main(): Int64 {
    return 5
}
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_missing_body
// ASSERT: scan parse_conflict_modifier
