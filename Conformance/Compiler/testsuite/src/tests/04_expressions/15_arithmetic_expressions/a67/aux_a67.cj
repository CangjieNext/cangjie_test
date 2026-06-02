
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:  Aux file with functions in the package
  @Structure:    complex-aux
*/

func add(lhs : UInt64, rhs : UInt64) {
    let lhsLow = lhs & 0xFFFFFFFF
    let lhsHigh = lhs >> 32
    let rhsLow = rhs & 0xFFFFFFFF
    let rhsHigh = rhs >> 32
    var sumLow = lhsLow + rhsLow
    var sumHigh = lhsHigh + rhsHigh
    sumHigh += sumLow >> 32
    sumLow &= 0xFFFFFFFF
    sumHigh &= 0xFFFFFFFF
    return sumLow + (sumHigh << 32)
}

func neg(x : UInt64) {
  if (x == 0) {
    return 0u64
  }
  return UInt64.Max - x + 1
}

func sub(lhs : UInt64, rhs : UInt64) {
    add(lhs, neg(rhs))
}

func mul(lhs : UInt64, rhs : UInt64) {
    let lhsLow = lhs & 0xFFFFFFFF
    let lhsHigh = lhs >> 32
    let rhsLow = rhs & 0xFFFFFFFF
    let rhsHigh = rhs >> 32
    let mulHigh1 = (lhsHigh * rhsLow) & 0xFFFFFFFF
    let mulHigh2 = (rhsHigh * lhsLow) & 0xFFFFFFFF
    var mulLow = lhsLow * rhsLow
    var mulHigh = add(mulLow >> 32, add(mulHigh1, mulHigh2))
    mulLow &= 0xFFFFFFFF
    mulHigh &= 0xFFFFFFFF
    return mulLow + (mulHigh << 32)
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

func add(lhs : Int64, rhs : Int64) {
    toInt64(add(toUInt64(lhs), toUInt64(rhs)))
}

func sub(lhs : Int64, rhs : Int64) {
    toInt64(sub(toUInt64(lhs), toUInt64(rhs)))
}

func mul(lhs : Int64, rhs : Int64) {
    toInt64(mul(toUInt64(lhs), toUInt64(rhs)))
}
