/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) DEPENDENCE: mock_libfuzzer.c
// (CJNATIVE and Unix) EXEC: %clang -c -fPIC mock_libfuzzer.c -o mock_libfuzzer.o
// (CJNATIVE and Unix) EXEC: %compiler %import-stdx-fuzz %cmp_opt -o %n.%suffix %f mock_libfuzzer.o
// (CJNATIVE and Unix) EXEC: %set_stdx_path %run %n.%suffix
import stdx.fuzz.*

main(): Int32 {
    let data = Array<UInt8>(1024, {i => UInt8(i & 0xFF)})
    let dp1 = FuzzDataProvider.withCangjieData(data)

    let ptr: CPointer<UInt8> = LibC.malloc<UInt8>(count: 1024)
    unsafe {
        for (i in 0..1024) {
            ptr.write(i, UInt8(i & 0xFF))
        }
    }

    let dp2 = unsafe { FuzzDataProvider.withNativeData(ptr, 1024) }
    let ret = check(dp1) & check2(dp2)
    unsafe { LibC.free(ptr) }

    if (FuzzDataProvider.withCangjieData(data).consumeAll() != data) {
        return -4
    }
    if (FuzzDataProvider.withCangjieData("Hello".toArray()).consumeAllAsAscii() != "Hello") {
        return -5
    }
    if (FuzzDataProvider.withCangjieData("仓颉".toArray()).consumeAllAsString() != "仓颉") {
        return -6
    }

    return ret
}

func check(dp: FuzzDataProvider): Int32 {
    if (dp.consumeBool() != false) {
        return -1
    }
    if (dp.consumeBools(1) != [true]) {
        return -1
    }
    if (dp.consumeUInt8() != 0x2) {
        return -1
    }
    if (dp.consumeUInt8s(1) != [0x3]) {
        return -1
    }
    if (dp.consumeUInt16() != 0x0504) {
        return -1
    }
    if (dp.consumeUInt16s(1) != [0x0706]) {
        return -1
    }
    if (dp.consumeUInt32() != 0x0B0A0908) {
        return -1
    }
    if (dp.consumeUInt32s(1) != [0x0F0E0D0C]) {
        return -1
    }
    if (dp.consumeUInt64() != 0x1716151413121110) {
        return -1
    }
    if (dp.consumeUInt64s(1) != [0x1F1E1D1C1B1A1918]) {
        return -1
    }
    if (dp.consumeFloat32() != Float32.fromBits(0x27262524)) {
        return -1
    }
    if (dp.consumeFloat64() != Float64.fromBits(0x2F2E2D2C2B2A2928)) {
        return -1
    }
    if (dp.consumeAsciiString(8) != "01234567") {
        return -1
    }
    return 0
}

func check2(dp: FuzzDataProvider): Int32 {
    if (dp.consumeBool() != false) {
        return -2
    }
    if (dp.consumeBools(1) != [true]) {
        return -2
    }
    if (dp.consumeInt8() != 0x2) {
        return -2
    }
    if (dp.consumeInt8s(1) != [0x3]) {
        return -2
    }
    if (dp.consumeInt16() != 0x0504) {
        return -2
    }
    if (dp.consumeInt16s(1) != [0x0706]) {
        return -2
    }
    if (dp.consumeInt32() != 0x0B0A0908) {
        return -2
    }
    if (dp.consumeInt32s(1) != [0x0F0E0D0C]) {
        return -2
    }
    if (dp.consumeInt64() != 0x1716151413121110) {
        return -2
    }
    if (dp.consumeInt64s(1) != [0x1F1E1D1C1B1A1918]) {
        return -2
    }
    return 0
}
