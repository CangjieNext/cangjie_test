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
    var add8 = a8.wrappingAdd(1)
    var sub8 = b8.wrappingSub(1)
    var mul8 = a8.wrappingMul(2)
    var div8 = b8.wrappingDiv(-1)
    var mod8 = a8.wrappingMod(1)
    var inc8 = a8.wrappingInc()
    var dec8 = b8.wrappingDec()
    var neg8 = b8.wrappingNeg()
    if (add8 != Int8.Min || sub8 != Int8.Max || mul8 != -2) {
        return 1
    }
    if (div8 != Int8.Min || mod8 != 0) {
        return 1
    }
    if (inc8 != Int8.Min || dec8 != Int8.Max || neg8 != Int8.Min) {
        return 1
    }

    var a16: Int16 = Int16.Max
    var b16: Int16 = Int16.Min
    var add16 = a16.wrappingAdd(1)
    var sub16 = b16.wrappingSub(1)
    var mul16 = a16.wrappingMul(2)
    var div16 = b16.wrappingDiv(-1)
    var mod16 = a16.wrappingMod(1)
    var inc16 = a16.wrappingInc()
    var dec16 = b16.wrappingDec()
    var neg16 = b16.wrappingNeg()
    if (add16 != Int16.Min || sub16 != Int16.Max || mul16 != -2) {
        return 1
    }
    if (div16 != Int16.Min || mod16 != 0) {
        return 1
    }
    if (inc16 != Int16.Min || dec16 != Int16.Max || neg16 != Int16.Min) {
        return 1
    }

    var a32: Int32 = Int32.Max
    var b32: Int32 = Int32.Min
    var add32 = a32.wrappingAdd(1)
    var sub32 = b32.wrappingSub(1)
    var mul32 = a32.wrappingMul(2)
    var div32 = b32.wrappingDiv(-1)
    var mod32 = a32.wrappingMod(1)
    var inc32 = a32.wrappingInc()
    var dec32 = b32.wrappingDec()
    var neg32 = b32.wrappingNeg()
    if (add32 != Int32.Min || sub32 != Int32.Max || mul32 != -2) {
        return 1
    }
    if (div32 != Int32.Min || mod32 != 0) {
        return 1
    }
    if (inc32 != Int32.Min || dec32 != Int32.Max || neg32 != Int32.Min) {
        return 1
    }

    var a64: Int64 = Int64.Max
    var b64: Int64 = Int64.Min
    var add64 = a64.wrappingAdd(1)
    var sub64 = b64.wrappingSub(1)
    var mul64 = a64.wrappingMul(2)
    var div64 = b64.wrappingDiv(-1)
    var mod64 = a64.wrappingMod(1)
    var pow64 = b64.wrappingPow(UInt64(2))
    var inc64 = a64.wrappingInc()
    var dec64 = b64.wrappingDec()
    var neg64 = b64.wrappingNeg()
    if (add64 != Int64.Min || sub64 != Int64.Max || mul64 != -2) {
        return 1
    }
    if (div64 != Int64.Min || mod64 != 0 || pow64 != 0) {
        return 1
    }
    if (inc64 != Int64.Min || dec64 != Int64.Max || neg64 != Int64.Min) {
        return 1
    }

    var ana: IntNative = IntNative.Max
    var bna: IntNative = IntNative.Min
    var addn = ana.wrappingAdd(1)
    var subn = bna.wrappingSub(1)
    var muln = ana.wrappingMul(2)
    var divn = bna.wrappingDiv(-1)
    var modn = ana.wrappingMod(1)
    var incn = ana.wrappingInc()
    var decn = bna.wrappingDec()
    var negn = bna.wrappingNeg()
    if (addn != IntNative.Min || subn != IntNative.Max || muln != -2) {
        return 1
    }
    if (divn != IntNative.Min || modn != 0) {
        return 1
    }
    if (incn != IntNative.Min || decn != IntNative.Max || negn != IntNative.Min) {
        return 1
    }

    var au8: UInt8 = UInt8.Max
    var bu8: UInt8 = UInt8.Min
    var addu8 = au8.wrappingAdd(1)
    var subu8 = bu8.wrappingSub(1)
    var mulu8 = au8.wrappingMul(2)
    var divu8 = au8.wrappingDiv(1)
    var modu8 = au8.wrappingMod(1)
    var incu8 = au8.wrappingInc()
    var decu8 = bu8.wrappingDec()
    var negu8 = au8.wrappingNeg()
    if (addu8 != UInt8.Min || subu8 != UInt8.Max || mulu8 != (UInt8.Max - 1)) {
        return 1
    }
    if (divu8 != UInt8.Max || modu8 != 0) {
        return 1
    }
    if (incu8 != UInt8.Min || decu8 != UInt8.Max || negu8 != 1) {
        return 1
    }

    var au16: UInt16 = UInt16.Max
    var bu16: UInt16 = UInt16.Min
    var addu16 = au16.wrappingAdd(1)
    var subu16 = bu16.wrappingSub(1)
    var mulu16 = au16.wrappingMul(2)
    var divu16 = au16.wrappingDiv(1)
    var modu16 = au16.wrappingMod(1)
    var incu16 = au16.wrappingInc()
    var decu16 = bu16.wrappingDec()
    var negu16 = au16.wrappingNeg()
    if (addu16 != UInt16.Min || subu16 != UInt16.Max || mulu16 != (UInt16.Max - 1)) {
        return 1
    }
    if (divu16 != UInt16.Max || modu16 != 0) {
        return 1
    }
    if (incu16 != UInt16.Min || decu16 != UInt16.Max || negu16 != 1) {
        return 1
    }

    var au32: UInt32 = UInt32.Max
    var bu32: UInt32 = UInt32.Min
    var addu32 = au32.wrappingAdd(1)
    var subu32 = bu32.wrappingSub(1)
    var mulu32 = au32.wrappingMul(2)
    var divu32 = au32.wrappingDiv(1)
    var modu32 = au32.wrappingMod(1)
    var incu32 = au32.wrappingInc()
    var decu32 = bu32.wrappingDec()
    var negu32 = au32.wrappingNeg()
    if (addu32 != UInt32.Min || subu32 != UInt32.Max || mulu32 != (UInt32.Max - 1)) {
        return 1
    }
    if (divu32 != UInt32.Max || modu32 != 0) {
        return 1
    }
    if (incu32 != UInt32.Min || decu32 != UInt32.Max || negu32 != 1) {
        return 1
    }

    var au64: UInt64 = UInt64.Max
    var bu64: UInt64 = UInt64.Min
    var addu64 = au64.wrappingAdd(1)
    var subu64 = bu64.wrappingSub(1)
    var mulu64 = au64.wrappingMul(2)
    var divu64 = au64.wrappingDiv(1)
    var modu64 = au64.wrappingMod(1)
    var incu64 = au64.wrappingInc()
    var decu64 = bu64.wrappingDec()
    var negu64 = au64.wrappingNeg()
    if (addu64 != UInt64.Min || subu64 != UInt64.Max || mulu64 != (UInt64.Max - 1)) {
        return 1
    }
    if (divu64 != UInt64.Max || modu64 != 0) {
        return 1
    }
    if (incu64 != UInt64.Min || decu64 != UInt64.Max || negu64 != 1) {
        return 1
    }

    var aun: UIntNative = UIntNative.Max
    var bun: UIntNative = UIntNative.Min
    var addun = aun.wrappingAdd(1)
    var subun = bun.wrappingSub(1)
    var mulun = aun.wrappingMul(2)
    var divun = aun.wrappingDiv(1)
    var modun = aun.wrappingMod(1)
    var incun = aun.wrappingInc()
    var decun = bun.wrappingDec()
    var negun = aun.wrappingNeg()
    if (addun != UIntNative.Min || subun != UIntNative.Max || mulun != (UIntNative.Max - 1)) {
        return 1
    }
    if (divun != UIntNative.Max || modun != 0) {
        return 1
    }
    if (incun != UIntNative.Min || decun != UIntNative.Max || negun != 1) {
        return 1
    }
    return 0
}
