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

var count = 0

@C
struct teststruct {
    public var i8: Int8
    public var ui8: UInt8

    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

foreign func getCPointer(): CPointer<teststruct>

foreign func getCPointer1(): CPointer<teststruct>

unsafe main(): Int64 {
    var cptr1: CPointer<teststruct> = getCPointer()
    var cptr2: CPointer<teststruct> = getCPointer1()
    if (cptr1.isNull() || cptr2.isNull()) {
        return 2
    }
    cptr2.write(0, teststruct(0, 0))
    cptr2.write(1, teststruct(1, 1))
    cptr2.write(2, teststruct(2, 2))

    var arr1: Array<CPointer<teststruct>> = [cptr1, cptr2, cptr1, cptr2, cptr1]

    if (arr1.size == 5) {
        count += 1
    }

    if (arr1.isEmpty() == false) {
        count += 1
    }

    if ((arr1[0].read(0).i8 == 1) && (arr1[0].read(0).ui8 == 1)) {
        count += 1
    }

    if (count == 3) {
        return 0
    } else {
        return 1
    }
}
