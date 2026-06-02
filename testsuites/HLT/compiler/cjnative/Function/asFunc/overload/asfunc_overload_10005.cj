/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    public operator func ()() {
        1
    }
    public operator func ()(input: Int64) {
        2
    }
    public operator func ()(input: Int32) {
        3
    }
}

extend A {
    public operator func ()() {
        4
    }
    public operator func ()(input_b: Int64) {
        5
    }
    public operator func ()(input_b: Int32) {
        6
    }
}

main() {
    var a: A = A()
    return a() + a(1) - 3
}
// ASSERT: scan sema_extend_member_cannot_shadow
// ASSERT: scan sema_no_match_operator_function_call
