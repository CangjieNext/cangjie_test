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
    var a: VArray<CPointer<A>, $3> = VArray<CPointer<A>, $3>({i => unsafe { getArrayPtr().read(i) }})
}

foreign func test(a: CPointer<S>): Unit

foreign func cfoo1(a: CPointer<CPointer<A>>): Unit

foreign func cfoo2(a: CPointer<CPointer<A>>): Unit

foreign func cfoo3(a: VArray<CPointer<A>, $4>): Unit

foreign func cfoo4(a: VArray<CPointer<A>, $4>): Unit

foreign func getArrayPtr(): CPointer<CPointer<A>>

main() {
    var s = S()
    unsafe {
        test(inout s)
        var sum = s.a[0].read(0).a + s.a[1].read(0).a + s.a[2].read(0).a
        return sum - 5
    }
}
