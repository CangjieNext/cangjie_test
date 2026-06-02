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

class A<T> {
    public operator func ()(input: T) {}
}

@C
struct teststruct {
    public var i8: Int8
    public var ui8: UInt8

    public init(i8: Int8, ui8: UInt8) {
        this.i8 = i8
        this.ui8 = ui8
    }
}

func foo<T>(input: T): Int64 {
    var a: A<T> = A<T>()
    a(input)
    return 0
}

unsafe main(): Int64 {
    var ts1 = teststruct(1, 1)
    var pts1 = CPointer<teststruct>()

    if (foo<CPointer<teststruct>>(pts1) == 0) {
        return 0
    } else {
        return 1
    }
}
