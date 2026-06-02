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
struct S {
    var a: VArray<Float32, $3> = [1.0, 2.0, 3.0]
}

foreign func test(a: CPointer<S>): Unit

foreign func cfoo1(a: CPointer<Float32>): Unit

foreign func cfoo2(a: CPointer<Float32>): Unit

foreign func cfoo3(a: VArray<Float32, $4>): Unit

foreign func cfoo4(a: VArray<Float32, $4>): Unit

foreign func getArrayPtr(): CPointer<Float32>

main() {
    var s = S()
    unsafe {
        test(inout s)
        var a: VArray<Float32, $4> = [1.0, 2.0, 3.0, 4.0]
        var b = getArrayPtr()
        cfoo1(inout a)
        cfoo2(inout a)
        cfoo3(inout a)
        cfoo4(inout a)
        cfoo1(b)
        cfoo2(b)
        var sum1 = a[0] + a[1] + a[2] + a[3]
        var sum2 = b.read(0) + b.read(1) + b.read(2) + b.read(3)
        var sum3 = s.a[0] + s.a[1] + s.a[2]
        if (sum1 + sum2 + sum3 < 12.0001 && sum1 + sum2 + sum3 > 11.9999) {
            return 0
        }
        return 1
    }
}
