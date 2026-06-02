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
    var a: VArray<A, $3> = VArray<A, $3>({i => unsafe { A(Int32(i + 1)) }})
}

foreign func test(a: CPointer<S>): Unit

foreign func cfoo1(a: CPointer<A>): Unit

foreign func cfoo2(a: CPointer<A>): Unit

foreign func cfoo3(a: VArray<A, $4>): Unit

foreign func cfoo4(a: VArray<A, $4>): Unit

foreign func getArrayPtr(): CPointer<A>

main() {
    var s = S()
    unsafe {
        test(inout s)
        var a: VArray<A, $4> = VArray<A, $4>({i => unsafe { A(Int32(i + 1)) }})
        var b = getArrayPtr()
        cfoo1(inout a)
        cfoo2(inout a)
        cfoo3(inout a)
        cfoo4(inout a)
        cfoo1(b)
        cfoo2(b)
        var sum1 = a[0].a + a[1].a + a[2].a + a[3].a
        var sum2 = b.read(0).a + b.read(1).a + b.read(2).a + b.read(3).a
        var sum3 = s.a[0].a + s.a[1].a + s.a[2].a
        if (sum1 == 0 && sum2 == 7 && sum3 == 5) {
            return 0
        }
        return 1
    }
}
