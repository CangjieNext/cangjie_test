
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  Aux file with functions
  @Structure:    complex-aux
*/

internal import utils.assert.Assert


func toUInt8(x : Int8) {
    let xU : UInt8
    if (x < 0) {
        xU = UInt8(x + Int8.Max + 1) + (1u8 << 7)
    } else {
        xU = UInt8(x)
    }
    return xU
}

func toInt8(x : UInt8) {
    let xI : Int8
    if (x > UInt8(Int8.Max)) {
        xI = Int8(x - (1u8 << 7)) + Int8.Min 
    } else {
        xI = Int8(x)
    }
    return xI
}

func getBit(x : UInt8, idx : UInt8) {
    Assert.isTrue(idx < 8)
    var val = x
    for (i in 0..idx) {
        val = val / 2
    }
    return val % 2
}

func getBit(x : Int8, idx : UInt8) {
    return toInt8(getBit(toUInt8(x), idx))
}

func toUInt16(x : Int16) {
    let xU : UInt16
    if (x < 0) {
        xU = UInt16(x + Int16.Max + 1) + (1u16 << 15)
    } else {
        xU = UInt16(x)
    }
    return xU
}

func toInt16(x : UInt16) {
    let xI : Int16
    if (x > UInt16(Int16.Max)) {
        xI = Int16(x - (1u16 << 15)) + Int16.Min 
    } else {
        xI = Int16(x)
    }
    return xI
}

func getBit(x : UInt16, idx : UInt8) {
    Assert.isTrue(idx < 16)
    var val = x
    for (i in 0..idx) {
        val = val / 2
    }
    return val % 2
}

func getBit(x : Int16, idx : UInt8) {
    return toInt16(getBit(toUInt16(x), idx))
}

func toUInt32(x : Int32) {
    let xU : UInt32
    if (x < 0) {
        xU = UInt32(x + Int32.Max + 1) + (1u32 << 31)
    } else {
        xU = UInt32(x)
    }
    return xU
}

func toInt32(x : UInt32) {
    let xI : Int32
    if (x > UInt32(Int32.Max)) {
        xI = Int32(x - (1u32 << 31)) + Int32.Min 
    } else {
        xI = Int32(x)
    }
    return xI
}

func getBit(x : UInt32, idx : UInt8) {
    Assert.isTrue(idx < 32)
    var val = x
    for (i in 0..idx) {
        val = val / 2
    }
    return val % 2
}

func getBit(x : Int32, idx : UInt8) {
    return toInt32(getBit(toUInt32(x), idx))
}

func toUInt64(x : Int64) {
    let xU : UInt64
    if (x < 0) {
        xU = UInt64(x + Int64.Max + 1) + (1u64 << 63)
    } else {
        xU = UInt64(x)
    }
    return xU
}

func toInt64(x : UInt64) {
    let xI : Int64
    if (x > UInt64(Int64.Max)) {
        xI = Int64(x - (1u64 << 63)) + Int64.Min 
    } else {
        xI = Int64(x)
    }
    return xI
}

func getBit(x : UInt64, idx : UInt8) {
    Assert.isTrue(idx < 64)
    var val = x
    for (i in 0..idx) {
        val = val / 2
    }
    return val % 2
}

func getBit(x : Int64, idx : UInt8) {
    return toInt64(getBit(toUInt64(x), idx))
}

