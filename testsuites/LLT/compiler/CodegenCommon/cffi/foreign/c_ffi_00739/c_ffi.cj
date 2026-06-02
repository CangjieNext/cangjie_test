// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt -L . -l %n %n.cj -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Try to write a null CPointer

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
    public var pts: CPointer<teststruct>
    public init(pts: CPointer<teststruct>) {
        this.pts = pts
    }
}

foreign func AllocCStruct(): CPointer<teststruct>

foreign func free(cp: CPointer<UInt16>): Unit

unsafe main(): Int64 {
    var pointer1 = CPointer<teststruct>()
    if (pointer1.isNull()) {
        throw Exception("Try to write a null CPointer")
    }
    pointer1.write(0, teststruct(0, 0)) // null pointer to write will case coredump here.

    var a1 = A(pointer1)
    var a2 = A(AllocCStruct())

    if ((a1.pts.read(0).i8 == a2.pts.read(0).i8) && (a1.pts.read(0).ui8 == a2.pts.read(0).ui8)) {
        println("pass")
        return 0
    } else {
        return 1
    }
}
