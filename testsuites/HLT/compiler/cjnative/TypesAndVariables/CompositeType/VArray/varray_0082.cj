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
    var a = 0
    init(a: Int64) {
        this.a = a
    }
}

main(): Int64 {
    var varr: VArray<A, $2> = [A(1), A(1)]
    varr[0] = A(-1)
    return varr[0].a + varr[1].a
}
// ASSERT: scan sema_varray_arg_type_with_reftype
