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
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

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
    public static var pts: CPointer<teststruct> = CPointer<teststruct>(0, 0)

    public init(pts: CPointer<teststruct>) {
        A.pts = pts
    }
}

foreign func AllocCStruct(): CPointer<teststruct>

unsafe main(): Int64 {
    var a1 = A(AllocCStruct())

    if ((A.pts.read(0).i8 == 1) && (A.pts.read(0).ui8 == 1)) {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan sema_pointer_too_much_argument
