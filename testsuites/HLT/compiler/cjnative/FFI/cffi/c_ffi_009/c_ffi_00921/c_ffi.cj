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
    public var b: Bool
    public var c: UInt32
    public var i8: Int8
    public var ui8: UInt8
    public var i16: Int16
    public var ui16: UInt16

    public init(b: Bool, c: Rune, i8: Int8, ui8: UInt8, i16: Int16, ui16: UInt16) {
        this.b = b
        this.c = UInt32(c)
        this.i8 = i8
        this.ui8 = ui8
        this.i16 = i16
        this.ui16 = ui16
    }
}

foreign {
    func testfunc(n: Int32, pst: CPointer<teststruct>): CPointer<teststruct>

    func MallocWithZero(size: UIntNative): CPointer<Int32>

    func free(cp: CPointer<Unit>): Unit
}

unsafe main(): Int64 {
    var struct1 = teststruct(true, r'a', 127, 255, 32767, 65535)

    var pa = CPointer<teststruct>(MallocWithZero(16))
    pa.write(struct1)

    var pb = testfunc(11, pa)
    if ((pb.read().b == false) && (pb.read().c == UInt32(r'b')) && (pb.read().i8 == 116) && (pb.read().ui8 == 244) && (pb
        .read()
        .i16 == 32756) && (pb.read().ui16 == 65524)) {
        free(CPointer<Unit>(pb))
        return 0
    } else {
        return 1
    }
}
