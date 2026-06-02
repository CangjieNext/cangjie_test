/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

@C
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
    var s = S()
    unsafe {
        test(inout s)
        var a: VArray<VArray<A, $4>, $1> = [[A(1), A(2), A(3), A(4)]]
        var b = getArrayPtr()
        cfoo1(inout a)
        cfoo2(inout a)
        cfoo1(b)
        var sum1 = a[0][0].a + a[0][1].a + a[0][2].a + a[0][3].a
        var sum2 = b.read(0)[0].a + b.read(0)[1].a + b.read(0)[2].a + b.read(0)[3].a
        var sum3 = s.a[0][0].a + s.a[0][1].a + s.a[0][2].a
        return sum1 + sum2 + sum3 - 21
    }
}
