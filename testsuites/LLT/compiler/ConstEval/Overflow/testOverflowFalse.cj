// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION) EXEC: %cjc %compile_exe_opt %debugCHIROpt %n.cj %cmp_opt -o %output 2>&1 | compare %f
// ASSERT: scan-not OverflowException
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const MAX_UINT8:  UInt8 = 255
const MAX_UINT16: UInt16 = 65535
const MAX_UINT32: UInt32 = 4294967295
const MAX_UINT64: UInt64 = 18446744073709551615

const MAX_INT8:  Int8 = 127
const MAX_INT16: Int16 = 32767
const MAX_INT32: Int32 = 2147483647
const MAX_INT64: Int64 = 9223372036854775807

const MIN_INT8: Int8 = -128
const MIN_INT16: Int16 = -32768
const MIN_INT32: Int32 = -2147483648
const MIN_INT64: Int64 = -9223372036854775808

@OverflowThrowing
const func testThrowingAdd(x: UInt8, y: UInt8): UInt8 {
    return x + y
}
@OverflowThrowing
const func testThrowingAdd(x: UInt16, y: UInt16): UInt16 {
    return x + y
}
@OverflowThrowing
const func testThrowingAdd(x: UInt32, y: UInt32): UInt32 {
    return x + y
}
@OverflowThrowing
const func testThrowingAdd(x: UInt64, y: UInt64): UInt64 {
    return x + y
}

@OverflowThrowing
const func testThrowingAdd(x: Int8, y: Int8): Int8 {
    return x + y
}
@OverflowThrowing
const func testThrowingAdd(x: Int16, y: Int16): Int16 {
    return x + y
}
@OverflowThrowing
const func testThrowingAdd(x: Int32, y: Int32): Int32 {
    return x + y
}
@OverflowThrowing
const func testThrowingAdd(x: Int64, y: Int64): Int64 {
    return x + y
}

@OverflowThrowing
const func testThrowingShiftLeft(x: UInt8, y: UInt8): UInt8 {
    return x << y
}
@OverflowThrowing
const func testThrowingShiftLeft(x: UInt16, y: UInt16): UInt16 {
    return x << y
}
@OverflowThrowing
const func testThrowingShiftLeft(x: UInt32, y: UInt32): UInt32 {
    return x << y
}
@OverflowThrowing
const func testThrowingShiftLeft(x: UInt64, y: UInt64): UInt64 {
    return x << y
}

@OverflowThrowing
const func testThrowingShiftLeft(x: Int8, y: Int8): Int8 {
    return x << y
}
@OverflowThrowing
const func testThrowingShiftLeft(x: Int16, y: Int16): Int16 {
    return x << y
}
@OverflowThrowing
const func testThrowingShiftLeft(x: Int32, y: Int32): Int32 {
    return x << y
}
@OverflowThrowing
const func testThrowingShiftLeft(x: Int64, y: Int64): Int64 {
    return x << y
}

@OverflowThrowing
const func testThrowingSub(x: UInt8, y: UInt8): UInt8 {
    return x - y
}
@OverflowThrowing
const func testThrowingSub(x: UInt16, y: UInt16): UInt16 {
    return x - y
}
@OverflowThrowing
const func testThrowingSub(x: UInt32, y: UInt32): UInt32 {
    return x - y
}
@OverflowThrowing
const func testThrowingSub(x: UInt64, y: UInt64): UInt64 {
    return x - y
}

@OverflowThrowing
const func testThrowingSub(x: Int8, y: Int8): Int8 {
    return x - y
}
@OverflowThrowing
const func testThrowingSub(x: Int16, y: Int16): Int16 {
    return x - y
}
@OverflowThrowing
const func testThrowingSub(x: Int32, y: Int32): Int32 {
    return x - y
}
@OverflowThrowing
const func testThrowingSub(x: Int64, y: Int64): Int64 {
    return x - y
}

@OverflowThrowing
const func testThrowingMul(x: UInt8, y: UInt8): UInt8 {
    return x * y
}
@OverflowThrowing
const func testThrowingMul(x: UInt16, y: UInt16): UInt16 {
    return x * y
}
@OverflowThrowing
const func testThrowingMul(x: UInt32, y: UInt32): UInt32 {
    return x * y
}
@OverflowThrowing
const func testThrowingMul(x: UInt64, y: UInt64): UInt64 {
    return x * y
}

@OverflowThrowing
const func testThrowingMul(x: Int8, y: Int8): Int8 {
    return x * y
}
@OverflowThrowing
const func testThrowingMul(x: Int16, y: Int16): Int16 {
    return x * y
}
@OverflowThrowing
const func testThrowingMul(x: Int32, y: Int32): Int32 {
    return x * y
}
@OverflowThrowing
const func testThrowingMul(x: Int64, y: Int64): Int64 {
    return x * y
}

@OverflowThrowing
const func testThrowingNeg(x: Int8): Int8 {
    return -x
}
@OverflowThrowing
const func testThrowingNeg(x: Int16): Int16 {
    return -x
}
@OverflowThrowing
const func testThrowingNeg(x: Int32): Int32 {
    return -x
}
@OverflowThrowing
const func testThrowingNeg(x: Int64): Int64 {
    return -x
}

public const my_const_no_overflow_add1 = testThrowingAdd(MAX_UINT8 - 17, 16)
public const my_const_no_overflow_add2 = testThrowingAdd(MAX_UINT16 - 17, 16)
public const my_const_no_overflow_add3 = testThrowingAdd(MAX_UINT32 - 17, 16)
public const my_const_no_overflow_add4 = testThrowingAdd(MAX_UINT64 - 17, 16)

public const my_const_no_overflow_add5 = testThrowingAdd(MAX_INT8 - 17, 16)
public const my_const_no_overflow_add6 = testThrowingAdd(MAX_INT16 - 17, 16)
public const my_const_no_overflow_add7 = testThrowingAdd(MAX_INT32 - 17, 16)
public const my_const_no_overflow_add8 = testThrowingAdd(MAX_INT64 - 17, 16)

public const my_const_no_overflow_mul1 = testThrowingMul(Int8(3), Int8(3))
public const my_const_no_overflow_mul2 = testThrowingMul(Int16(3), Int16(3))
public const my_const_no_overflow_mul3 = testThrowingMul(Int32(3), Int32(3))
public const my_const_no_overflow_mul4 = testThrowingMul(Int64(3), Int64(3))

public const my_const_no_overflow_mul5 = testThrowingMul(UInt8(3), UInt8(3))
public const my_const_no_overflow_mul6 = testThrowingMul(UInt16(3), UInt16(3))
public const my_const_no_overflow_mul7 = testThrowingMul(UInt32(3), UInt32(3))
public const my_const_no_overflow_mul8 = testThrowingMul(UInt64(3), UInt64(3))

public const my_const_no_overflow_sub1 = testThrowingSub(Int8(3), Int8(3))
public const my_const_no_overflow_sub2 = testThrowingSub(Int16(3), Int16(3))
public const my_const_no_overflow_sub3 = testThrowingSub(Int32(3), Int32(3))
public const my_const_no_overflow_sub4 = testThrowingSub(Int64(3), Int64(3))

public const my_const_no_overflow_sub5 = testThrowingSub(UInt8(3), UInt8(3))
public const my_const_no_overflow_sub6 = testThrowingSub(UInt16(3), UInt16(3))
public const my_const_no_overflow_sub7 = testThrowingSub(UInt32(3), UInt32(3))
public const my_const_no_overflow_sub8 = testThrowingSub(UInt64(3), UInt64(3))

public const my_const_no_overflow_neg1 = testThrowingNeg(MIN_INT8 + 2)
public const my_const_no_overflow_neg2 = testThrowingNeg(MIN_INT16 + 2)
public const my_const_no_overflow_neg3 = testThrowingNeg(MIN_INT32 + 2)
public const my_const_no_overflow_neg4 = testThrowingNeg(MIN_INT64 + 2)

public const my_const_no_overflow_shl1 = testThrowingShiftLeft(MAX_UINT8 >> 3, 2)
public const my_const_no_overflow_shl2 = testThrowingShiftLeft(MAX_UINT16 >> 3, 2)
public const my_const_no_overflow_shl3 = testThrowingShiftLeft(MAX_UINT32 >> 3, 2)
public const my_const_no_overflow_shl4 = testThrowingShiftLeft(MAX_UINT64 >> 3, 2)

public const my_const_no_overflow_shl5 = testThrowingShiftLeft(MAX_INT8 >> 3, 2)
public const my_const_no_overflow_shl6 = testThrowingShiftLeft(MAX_INT16 >> 3, 2)
public const my_const_no_overflow_shl7 = testThrowingShiftLeft(MAX_INT32 >> 3, 2)
public const my_const_no_overflow_shl8 = testThrowingShiftLeft(MAX_INT64 >> 3, 2)

main() {
    my_const_no_overflow_add1
    my_const_no_overflow_add2
    my_const_no_overflow_add3
    my_const_no_overflow_add4
    my_const_no_overflow_add5
    my_const_no_overflow_add6
    my_const_no_overflow_add7
    my_const_no_overflow_add8

    my_const_no_overflow_shl1
    my_const_no_overflow_shl2
    my_const_no_overflow_shl3
    my_const_no_overflow_shl4
    my_const_no_overflow_shl5
    my_const_no_overflow_shl6
    my_const_no_overflow_shl7
    my_const_no_overflow_shl8

    my_const_no_overflow_sub1
    my_const_no_overflow_sub2
    my_const_no_overflow_sub3
    my_const_no_overflow_sub4
    my_const_no_overflow_sub5
    my_const_no_overflow_sub6
    my_const_no_overflow_sub7
    my_const_no_overflow_sub8

    my_const_no_overflow_mul1
    my_const_no_overflow_mul2
    my_const_no_overflow_mul3
    my_const_no_overflow_mul4
    my_const_no_overflow_mul5
    my_const_no_overflow_mul6
    my_const_no_overflow_mul7
    my_const_no_overflow_mul8

    my_const_no_overflow_neg1
    my_const_no_overflow_neg2
    my_const_no_overflow_neg3
    my_const_no_overflow_neg4
}