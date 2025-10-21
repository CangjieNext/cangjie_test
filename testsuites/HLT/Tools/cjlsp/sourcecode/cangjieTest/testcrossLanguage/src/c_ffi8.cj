/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
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

foreign func tests(a: CPointer<S>): Unit
foreign func cfoos1(a: CPointer<VArray<A, $4>>): Unit
foreign func cfoos2(a: VArray<VArray<A, $4>, $1>): Unit
foreign func getArrayPtrs(): CPointer<VArray<A, $4>>

func mains() {
    var s = S()
    unsafe {
        tests(inout s)
        var a: VArray<VArray<A, $4>, $1> = [[A(1), A(2), A(3), A(4)]]
        var b = getArrayPtrs()
        cfoos1(inout a)
        cfoos2(inout a)
        cfoos1(b)
        var sum1 = a[0][0].a + a[0][1].a + a[0][2].a + a[0][3].a
        var sum2 = b.read(0)[0].a + b.read(0)[1].a + b.read(0)[2].a + b.read(0)[3].a
        var sum3 = s.a[0][0].a + s.a[0][1].a + s.a[0][2].a
        return sum1 + sum2 + sum3 - 21
    }
}
