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
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex pass

@C
struct teststruct {
    public var b: Bool
    public var c: Int8
    public var i8: Int8
    public var ui8: UInt8
    public var i16: Int16

    public init(b!: Bool, c!: Rune, i8!: Int8, ui8!: UInt8, i16!: Int16) {
        this.b = b
        this.c = Int8(UInt32(c))
        this.i8 = i8
        this.ui8 = ui8
        this.i16 = i16
    }
}

foreign func testfunc(st: teststruct): Int8

unsafe main(): Int64 {
    var pass = 0
    var struct1 = teststruct(b: true, c: r'a', i8: 127, ui8: 255, i16: 32767)

    if ((struct1.b == true) && (struct1.c == Int8(UInt32(r'a'))) && (struct1.i8 == 127) && (struct1.ui8 == 255) && (struct1
        .i16 == 32767)) {
        pass += 1
    }

    testfunc(struct1)

    if (pass == 1) {
        return 0
    } else {
        return 1
    }
}
