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
struct teststruct {
    public var i8: Int8
    public var ui8: UInt8

    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

class A {
    public static var pts: CPointer<teststruct> = CPointer<teststruct>()

    public init(pts: CPointer<teststruct>) {
        A.pts = pts
    }
}

foreign func AllocCStruct(): CPointer<teststruct>

foreign func free(cp: CPointer<teststruct>): Unit

unsafe main(): Int64 {
    var ptr = AllocCStruct()
    if (ptr.isNull()) {
        return 2
    }
    var a1 = A(ptr)

    println(A.pts.read(0).i8)
    println(A.pts.read(0).ui8)

    if ((A.pts.read(0).i8 == 1) && (A.pts.read(0).ui8 == 1)) {
        free(ptr)
        return 0
    } else {
        return 1
    }
}
