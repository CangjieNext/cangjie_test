/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I {
    func test() {
        1
    }
}

class A <: I {}

class B <: I {
    public func test() {
        -1
    }
}

main(): Int64 {
    var varr: VArray<I, $2> = [A(), A()]
    varr[1] = B()
    return varr[0].test() + varr[1].test()
}
// ASSERT: scan sema_varray_arg_type_with_reftype
