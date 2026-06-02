/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1
internal import std.overflow.*
internal import std.math.*

main() {
    var a8: Int8 = Int8.Max
    var b8: Int8 = Int8.Min
    var n8 = 0
    try {
        a8.throwingAdd(1)
    } catch (e: OverflowException) {
        n8++
    }
    try {
        b8.throwingSub(1)
    } catch (e: OverflowException) {
        n8++
    }
    try {
        a8.throwingMul(2)
    } catch (e: OverflowException) {
        n8++
    }
    try {
        b8.throwingDiv(-1)
    } catch (e: OverflowException) {
        n8++
    }
    try {
        a8.throwingMod(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        a8.throwingInc()
    } catch (e: OverflowException) {
        n8++
    }
    try {
        b8.throwingDec()
    } catch (e: OverflowException) {
        n8++
    }
    try {
        b8.throwingNeg()
    } catch (e: OverflowException) {
        n8++
    }
    if (n8 != 7) {
        return 1
    }

    var a16: Int16 = Int16.Max
    var b16: Int16 = Int16.Min
    var n16 = 0
    try {
        a16.throwingAdd(1)
    } catch (e: OverflowException) {
        n16++
    }
    try {
        b16.throwingSub(1)
    } catch (e: OverflowException) {
        n16++
    }
    try {
        a16.throwingMul(2)
    } catch (e: OverflowException) {
        n16++
    }
    try {
        b16.throwingDiv(-1)
    } catch (e: OverflowException) {
        n16++
    }
    try {
        a16.throwingMod(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        a16.throwingInc()
    } catch (e: OverflowException) {
        n16++
    }
    try {
        b16.throwingDec()
    } catch (e: OverflowException) {
        n16++
    }
    try {
        b16.throwingNeg()
    } catch (e: OverflowException) {
        n16++
    }
    if (n16 != 7) {
        return 1
    }

    var a32: Int32 = Int32.Max
    var b32: Int32 = Int32.Min
    var n32 = 0
    try {
        a32.throwingAdd(1)
    } catch (e: OverflowException) {
        n32++
    }
    try {
        b32.throwingSub(1)
    } catch (e: OverflowException) {
        n32++
    }
    try {
        a32.throwingMul(2)
    } catch (e: OverflowException) {
        n32++
    }
    try {
        b32.throwingDiv(-1)
    } catch (e: OverflowException) {
        n32++
    }
    try {
        a32.throwingMod(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        a32.throwingInc()
    } catch (e: OverflowException) {
        n32++
    }
    try {
        b32.throwingDec()
    } catch (e: OverflowException) {
        n32++
    }
    try {
        b32.throwingNeg()
    } catch (e: OverflowException) {
        n32++
    }
    if (n32 != 7) {
        return 1
    }

    var a64: Int64 = Int64.Max
    var b64: Int64 = Int64.Min
    var n64 = 0
    try {
        a64.throwingAdd(1)
    } catch (e: OverflowException) {
        n64++
    }
    try {
        b64.throwingSub(1)
    } catch (e: OverflowException) {
        n64++
    }
    try {
        a64.throwingMul(2)
    } catch (e: OverflowException) {
        n64++
    }
    try {
        b64.throwingDiv(-1)
    } catch (e: OverflowException) {
        n64++
    }
    try {
        a64.throwingMod(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        a64.throwingPow(UInt64(2))
    } catch (e: OverflowException) {
        n64++
    }
    try {
        a64.throwingInc()
    } catch (e: OverflowException) {
        n64++
    }
    try {
        b64.throwingDec()
    } catch (e: OverflowException) {
        n64++
    }
    try {
        b64.throwingNeg()
    } catch (e: OverflowException) {
        n64++
    }
    if (n64 != 8) {
        return 1
    }

    var an: IntNative = IntNative.Max
    var bn: IntNative = IntNative.Min
    var nn = 0
    try {
        an.throwingAdd(1)
    } catch (e: OverflowException) {
        nn++
    }
    try {
        bn.throwingSub(1)
    } catch (e: OverflowException) {
        nn++
    }
    try {
        an.throwingMul(2)
    } catch (e: OverflowException) {
        nn++
    }
    try {
        bn.throwingDiv(-1)
    } catch (e: OverflowException) {
        nn++
    }
    try {
        an.throwingMod(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        an.throwingInc()
    } catch (e: OverflowException) {
        nn++
    }
    try {
        bn.throwingDec()
    } catch (e: OverflowException) {
        nn++
    }
    try {
        bn.throwingNeg()
    } catch (e: OverflowException) {
        nn++
    }
    if (nn != 7) {
        return 1
    }

    var ua8: UInt8 = UInt8.Max
    var ub8: UInt8 = UInt8.Min
    var un8 = 0
    try {
        ua8.throwingAdd(1)
    } catch (e: OverflowException) {
        un8++
    }
    try {
        ub8.throwingSub(1)
    } catch (e: OverflowException) {
        un8++
    }
    try {
        ua8.throwingMul(2)
    } catch (e: OverflowException) {
        un8++
    }
    try {
        ua8.throwingDiv(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        ua8.throwingMod(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        ua8.throwingInc()
    } catch (e: OverflowException) {
        un8++
    }
    try {
        ub8.throwingDec()
    } catch (e: OverflowException) {
        un8++
    }
    try {
        ua8.throwingNeg()
    } catch (e: OverflowException) {
        un8++
    }
    if (un8 != 6) {
        return 1
    }

    var ua16: UInt16 = UInt16.Max
    var ub16: UInt16 = UInt16.Min
    var un16 = 0
    try {
        ua16.throwingAdd(1)
    } catch (e: OverflowException) {
        un16++
    }
    try {
        ub16.throwingSub(1)
    } catch (e: OverflowException) {
        un16++
    }
    try {
        ua16.throwingMul(2)
    } catch (e: OverflowException) {
        un16++
    }
    try {
        ua16.throwingDiv(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        ua16.throwingMod(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        ua16.throwingInc()
    } catch (e: OverflowException) {
        un16++
    }
    try {
        ub16.throwingDec()
    } catch (e: OverflowException) {
        un16++
    }
    try {
        ua16.throwingNeg()
    } catch (e: OverflowException) {
        un16++
    }
    if (un16 != 6) {
        return 1
    }

    var ua32: UInt32 = UInt32.Max
    var ub32: UInt32 = UInt32.Min
    var un32 = 0
    try {
        ua32.throwingAdd(1)
    } catch (e: OverflowException) {
        un32++
    }
    try {
        ub32.throwingSub(1)
    } catch (e: OverflowException) {
        un32++
    }
    try {
        ua32.throwingMul(2)
    } catch (e: OverflowException) {
        un32++
    }
    try {
        ua32.throwingDiv(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        ua32.throwingMod(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        ua32.throwingInc()
    } catch (e: OverflowException) {
        un32++
    }
    try {
        ub32.throwingDec()
    } catch (e: OverflowException) {
        un32++
    }
    try {
        ua32.throwingNeg()
    } catch (e: OverflowException) {
        un32++
    }
    if (un32 != 6) {
        return 1
    }

    var ua64: UInt64 = UInt64.Max
    var ub64: UInt64 = UInt64.Min
    var un64 = 0
    try {
        ua64.throwingAdd(1)
    } catch (e: OverflowException) {
        un64++
    }
    try {
        ub64.throwingSub(1)
    } catch (e: OverflowException) {
        un64++
    }
    try {
        ua64.throwingMul(2)
    } catch (e: OverflowException) {
        un64++
    }
    try {
        ua64.throwingDiv(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        ua64.throwingMod(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        ua64.throwingInc()
    } catch (e: OverflowException) {
        un64++
    }
    try {
        ub64.throwingDec()
    } catch (e: OverflowException) {
        un64++
    }
    try {
        ua64.throwingNeg()
    } catch (e: OverflowException) {
        un64++
    }
    if (un64 != 6) {
        return 1
    }

    var uan: UIntNative = UIntNative.Max
    var ubn: UIntNative = UIntNative.Min
    var unn = 0
    try {
        uan.throwingAdd(1)
    } catch (e: OverflowException) {
        unn++
    }
    try {
        ubn.throwingSub(1)
    } catch (e: OverflowException) {
        unn++
    }
    try {
        uan.throwingMul(2)
    } catch (e: OverflowException) {
        unn++
    }
    try {
        uan.throwingDiv(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        uan.throwingMod(1)
    } catch (e: OverflowException) {
        return 1
    }
    try {
        uan.throwingInc()
    } catch (e: OverflowException) {
        unn++
    }
    try {
        ubn.throwingDec()
    } catch (e: OverflowException) {
        unn++
    }
    try {
        uan.throwingNeg()
    } catch (e: OverflowException) {
        unn++
    }
    if (unn != 6) {
        return 1
    }
    print(0)
    return 0
}
