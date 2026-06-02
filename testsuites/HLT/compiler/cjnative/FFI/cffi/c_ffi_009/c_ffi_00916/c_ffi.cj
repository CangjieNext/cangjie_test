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
    public var ptrbool: CPointer<Bool>
    public var ptrchar: CPointer<Int8>
    public var ptri8: CPointer<Int8>
    public var ptrui8: CPointer<UInt8>
    public var ptri16: CPointer<Int16>
    public var ptrui16: CPointer<UInt16>
    public var ptri32: CPointer<Int32>
    public var ptrui32: CPointer<UInt32>
    public var ptri64: CPointer<Int64>
    public var ptrui64: CPointer<UInt64>
    public var ptrf32: CPointer<Float32>
    public var ptrf64: CPointer<Float64>
    public init(ptrbool!: CPointer<Bool>, ptrchar!: CPointer<Int8>, ptri8!: CPointer<Int8>, ptrui8!: CPointer<UInt8>,
        ptri16!: CPointer<Int16>, ptrui16!: CPointer<UInt16>, ptri32!: CPointer<Int32>, ptrui32!: CPointer<UInt32>,
        ptri64!: CPointer<Int64>, ptrui64!: CPointer<UInt64>, ptrf32!: CPointer<Float32>, ptrf64!: CPointer<Float64>) {
        this.ptrbool = ptrbool
        this.ptrchar = ptrchar
        this.ptri8 = ptri8
        this.ptrui8 = ptrui8
        this.ptri16 = ptri16
        this.ptrui16 = ptrui16
        this.ptri32 = ptri32
        this.ptrui32 = ptrui32
        this.ptri64 = ptri64
        this.ptrui64 = ptrui64
        this.ptrf32 = ptrf32
        this.ptrf64 = ptrf64
    }
}

foreign func testfunc1(): teststruct

foreign func free(cp: CPointer<Unit>): Unit

foreign func testfunc2(st: teststruct): Int8

unsafe main(): Int64 {
    var count: Int8 = 0
    var struct1 = testfunc1()

    if ((struct1.ptrbool.read(0) == true) && (struct1.ptrbool.read(1) == false) && (struct1.ptrbool.read(2) == true)) {
        count += 1
    }
    if ((struct1.ptrchar.read(0) == Int8(UInt32(r'a'))) && (struct1.ptrchar.read(1) == Int8(UInt32(r'b'))) && (struct1
        .ptrchar
        .read(2) == Int8(UInt32(r'c')))) {
        count += 1
    }

    if ((struct1.ptri8.read(0) == -128) && (struct1.ptri8.read(1) == 123) && (struct1.ptri8.read(2) == 127)) {
        count += 1
    }

    if ((struct1.ptrui8.read(0) == 0) && (struct1.ptrui8.read(1) == 2) && (struct1.ptrui8.read(2) == 255)) {
        count += 1
    }

    if ((struct1.ptri16.read(0) == -32768) && (struct1.ptri16.read(1) == 0) && (struct1.ptri16.read(2) == 32767)) {
        count += 1
    }

    if ((struct1.ptrui16.read(0) == 0) && (struct1.ptrui16.read(1) == 2) && (struct1.ptrui16.read(2) == 65535)) {
        count += 1
    }

    if ((struct1.ptri32.read(0) == -2147483648) && (struct1.ptri32.read(1) == 0) && (struct1.ptri32.read(2) == 2147483647)) {
        count += 1
    }

    if ((struct1.ptrui32.read(0) == 0) && (struct1.ptrui32.read(1) == 2) && (struct1.ptrui32.read(2) == 4294967295)) {
        count += 1
    }

    if ((struct1.ptri64.read(0) == -9223372036854775808) && (struct1.ptri64.read(1) == 0) && (struct1.ptri64.read(2) ==
        9223372036854775807)) {
        count += 1
    }

    if ((struct1.ptrui64.read(0) == 0) && (struct1.ptrui64.read(1) == 2) && (struct1.ptrui64.read(2) ==
        18446744073709551615)) {
        count += 1
    }

    if ((struct1.ptrf32.read(0) == 3.14) && (struct1.ptrf32.read(1) == 0.0) && (struct1.ptrf32.read(2) == -3.14)) {
        count += 1
    }

    if ((struct1.ptrf64.read(0) == 3.1415926) && (struct1.ptrf64.read(1) == 0.0) && (struct1.ptrf64.read(2) == -3.1415926)) {
        count += 1
    }

    struct1.ptrbool.write(0, false)
    struct1.ptrchar.write(0, Int8(UInt32(r'd')))
    struct1.ptri8.write(0, -127)
    struct1.ptrui8.write(0, 1)
    struct1.ptri16.write(0, -32767)
    struct1.ptrui16.write(0, 1)
    struct1.ptri32.write(0, -2147483647)
    struct1.ptrui32.write(0, 1)
    struct1.ptri64.write(0, -9223372036854775807)
    struct1.ptrui64.write(0, 1)
    struct1.ptrf32.write(0, 3.24)
    struct1.ptrf64.write(0, 3.2415926)

    if (testfunc2(struct1) == 0) {
        count += 1
    }

    free(CPointer<Unit>(struct1.ptrbool))
    free(CPointer<Unit>(struct1.ptrchar))
    free(CPointer<Unit>(struct1.ptri8))
    free(CPointer<Unit>(struct1.ptrui8))
    free(CPointer<Unit>(struct1.ptri16))
    free(CPointer<Unit>(struct1.ptrui16))
    free(CPointer<Unit>(struct1.ptri32))
    free(CPointer<Unit>(struct1.ptrui32))
    free(CPointer<Unit>(struct1.ptri64))
    free(CPointer<Unit>(struct1.ptrui64))
    free(CPointer<Unit>(struct1.ptrf32))
    free(CPointer<Unit>(struct1.ptrf64))

    if (count == 13) {
        return 0
    } else {
        return 1
    }
}
