/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// ERRCHECK: %compiler %cmp_opt %ffic_opt -o %output

struct A {
    var a: Int32 = 0
    init(a: Int32) {
        this.a = a
    }
}

@C
struct S {
    var a: VArray<VArray<A, $3>, $1> = [[A(1), A(2), A(3)]]
}

foreign func test(a: CPointer<S>): Unit

foreign func cfoo1(a: CPointer<VArray<A, $4>>): Unit

foreign func cfoo2(a: VArray<VArray<A, $4>, $1>): Unit

foreign func getArrayPtr(): CPointer<VArray<A, $4>>

main() {
    return 0
}
// ASSERT: scan sema_illegal_member_of_cstruct
// ASSERT: scan sema_generic_type_argument_not_match_constraint
// ASSERT: scan sema_invalid_cfunc_arg_type
