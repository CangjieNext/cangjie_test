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
    var add8 = a8.saturatingAdd(1)
    var sub8 = b8.saturatingSub(1)
    var mul8 = a8.saturatingMul(2)
    var div8 = b8.saturatingDiv(-1)
    var mod8 = a8.saturatingMod(1)
    var inc8 = a8.saturatingInc()
    var dec8 = b8.saturatingDec()
    var neg8 = b8.saturatingNeg()
    if (add8 != Int8.Max || sub8 != Int8.Min || mul8 != Int8.Max) {
        return 1
    }
    if (div8 != Int8.Max || mod8 != 0) {
        return 1
    }
    if (inc8 != Int8.Max || dec8 != Int8.Min || neg8 != Int8.Max) {
        return 1
    }

    var a16: Int16 = Int16.Max
    var b16: Int16 = Int16.Min
    var add16 = a16.saturatingAdd(1)
    var sub16 = b16.saturatingSub(1)
    var mul16 = a16.saturatingMul(2)
    var div16 = b16.saturatingDiv(-1)
    var mod16 = a16.saturatingMod(1)
    var inc16 = a16.saturatingInc()
    var dec16 = b16.saturatingDec()
    var neg16 = b16.saturatingNeg()
    if (add16 != Int16.Max || sub16 != Int16.Min || mul16 != Int16.Max) {
        return 1
    }
    if (div16 != Int16.Max || mod16 != 0) {
        return 1
    }
    if (inc16 != Int16.Max || dec16 != Int16.Min || neg16 != Int16.Max) {
        return 1
    }

    var a32: Int32 = Int32.Max
    var b32: Int32 = Int32.Min
    var add32 = a32.saturatingAdd(1)
    var sub32 = b32.saturatingSub(1)
    var mul32 = a32.saturatingMul(2)
    var div32 = b32.saturatingDiv(-1)
    var mod32 = a32.saturatingMod(1)
    var inc32 = a32.saturatingInc()
    var dec32 = b32.saturatingDec()
    var neg32 = b32.saturatingNeg()
    if (add32 != Int32.Max || sub32 != Int32.Min || mul32 != Int32.Max) {
        return 1
    }
    if (div32 != Int32.Max || mod32 != 0) {
        return 1
    }
    if (inc32 != Int32.Max || dec32 != Int32.Min || neg32 != Int32.Max) {
        return 1
    }

    var a64: Int64 = Int64.Max
    var b64: Int64 = Int64.Min
    var add64 = a64.saturatingAdd(1)
    var sub64 = b64.saturatingSub(1)
    var mul64 = a64.saturatingMul(2)
    var div64 = b64.saturatingDiv(-1)
    var mod64 = a64.saturatingMod(1)
    var pow64 = a64.saturatingPow(UInt64(2))
    var inc64 = a64.saturatingInc()
    var dec64 = b64.saturatingDec()
    var neg64 = b64.saturatingNeg()
    if (add64 != Int64.Max || sub64 != Int64.Min || mul64 != Int64.Max) {
        return 1
    }
    if (div64 != Int64.Max || mod64 != 0 || pow64 != Int64.Max) {
        return 1
    }
    if (inc64 != Int64.Max || dec64 != Int64.Min || neg64 != Int64.Max) {
        return 1
    }

    var an: IntNative = IntNative.Max
    var bn: IntNative = IntNative.Min
    var addn = an.saturatingAdd(1)
    var subn = bn.saturatingSub(1)
    var muln = an.saturatingMul(2)
    var divn = bn.saturatingDiv(-1)
    var modn = an.saturatingMod(1)
    var incn = an.saturatingInc()
    var decn = bn.saturatingDec()
    var negn = bn.saturatingNeg()
    if (addn != IntNative.Max || subn != IntNative.Min || muln != IntNative.Max) {
        return 1
    }
    if (divn != IntNative.Max || modn != 0) {
        return 1
    }
    if (incn != IntNative.Max || decn != IntNative.Min || negn != IntNative.Max) {
        return 1
    }

    var au8: UInt8 = UInt8.Max
    var bu8: UInt8 = UInt8.Min
    var addu8 = au8.saturatingAdd(1)
    var subu8 = bu8.saturatingSub(1)
    var mulu8 = au8.saturatingMul(2)
    var divu8 = au8.saturatingDiv(1)
    var modu8 = au8.saturatingMod(1)
    var incu8 = au8.saturatingInc()
    var decu8 = bu8.saturatingDec()
    var negu8 = au8.saturatingNeg()
    if (addu8 != UInt8.Max || subu8 != UInt8.Min || mulu8 != UInt8.Max) {
        return 1
    }
    if (divu8 != UInt8.Max || modu8 != 0) {
        return 1
    }
    if (incu8 != UInt8.Max || decu8 != UInt8.Min || negu8 != UInt8.Min) {
        return 1
    }

    var au16: UInt16 = UInt16.Max
    var bu16: UInt16 = UInt16.Min
    var addu16 = au16.saturatingAdd(1)
    var subu16 = bu16.saturatingSub(1)
    var mulu16 = au16.saturatingMul(2)
    var divu16 = au16.saturatingDiv(1)
    var modu16 = au16.saturatingMod(1)
    var incu16 = au16.saturatingInc()
    var decu16 = bu16.saturatingDec()
    var negu16 = au16.saturatingNeg()
    if (addu16 != UInt16.Max || subu16 != UInt16.Min || mulu16 != UInt16.Max) {
        return 1
    }
    if (divu16 != UInt16.Max || modu16 != 0) {
        return 1
    }
    if (incu16 != UInt16.Max || decu16 != UInt16.Min || negu16 != UInt16.Min) {
        return 1
    }

    var au32: UInt32 = UInt32.Max
    var bu32: UInt32 = UInt32.Min
    var addu32 = au32.saturatingAdd(1)
    var subu32 = bu32.saturatingSub(1)
    var mulu32 = au32.saturatingMul(2)
    var divy32 = au32.saturatingDiv(1)
    var modu32 = au32.saturatingMod(1)
    var incu32 = au32.saturatingInc()
    var decu32 = bu32.saturatingDec()
    var negu32 = au32.saturatingNeg()
    if (addu32 != UInt32.Max || subu32 != UInt32.Min || mulu32 != UInt32.Max) {
        return 1
    }
    if (divy32 != UInt32.Max || modu32 != 0) {
        return 1
    }
    if (incu32 != UInt32.Max || decu32 != UInt32.Min || negu32 != UInt32.Min) {
        return 1
    }

    var au64: UInt64 = UInt64.Max
    var bu64: UInt64 = UInt64.Min
    var addu64 = au64.saturatingAdd(1)
    var subu64 = bu64.saturatingSub(1)
    var mulu64 = au64.saturatingMul(2)
    var divu64 = au64.saturatingDiv(1)
    var modu64 = au64.saturatingMod(1)
    var incu64 = au64.saturatingInc()
    var decu64 = bu64.saturatingDec()
    var negu64 = au64.saturatingNeg()
    if (addu64 != UInt64.Max || subu64 != UInt64.Min || mulu64 != UInt64.Max) {
        return 1
    }
    if (divu64 != UInt64.Max || modu64 != 0) {
        return 1
    }
    if (incu64 != UInt64.Max || decu64 != UInt64.Min || negu64 != UInt64.Min) {
        return 1
    }

    var aun: UIntNative = UIntNative.Max
    var bun: UIntNative = UIntNative.Min
    var addun = aun.saturatingAdd(1)
    var subun = bun.saturatingSub(1)
    var mulun = aun.saturatingMul(2)
    var divun = aun.saturatingDiv(1)
    var modun = aun.saturatingMod(1)
    var incun = aun.saturatingInc()
    var decun = bun.saturatingDec()
    var negun = aun.saturatingNeg()
    if (addun != UIntNative.Max || subun != UIntNative.Min || mulun != UIntNative.Max) {
        return 1
    }
    if (divun != UIntNative.Max || modun != 0) {
        return 1
    }
    if (incun != UIntNative.Max || decun != UIntNative.Min || negun != UIntNative.Min) {
        return 1
    }
    return 0
}
