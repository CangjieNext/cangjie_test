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
    var a: VArray<CString, $3> = VArray<CString, $3>({i => unsafe { LibC.mallocCString("${i}") }})
}

foreign func test(a: CPointer<S>): Unit

foreign func cfoo1(a: CPointer<CString>): Unit

foreign func cfoo2(a: CPointer<CString>): Unit

foreign func cfoo3(a: VArray<CString, $4>): Unit

foreign func cfoo4(a: VArray<CString, $4>): Unit

foreign func getArrayPtr(): CPointer<CString>

main() {
    var s = S()
    unsafe {
        test(inout s)
        var a: VArray<CString, $4> = VArray<CString, $4>({i => unsafe { LibC.mallocCString("${i}") }})
        var b = getArrayPtr()
        cfoo1(inout a)
        cfoo2(inout a)
        cfoo3(inout a)
        cfoo4(inout a)
        cfoo1(b)
        cfoo2(b)
        var sum1 = a[0].toString() + a[1].toString() + a[2].toString() + a[3].toString()
        var sum2 = b.read(0).toString() + b.read(1).toString() + b.read(2).toString() + b.read(3).toString()
        var sum3 = s.a[0].toString() + s.a[1].toString() + s.a[2].toString()
        if (sum1 == "0000" && sum2 == "0023" && sum3 == "012") {
            return 0
        }
        return 1
    }
}
