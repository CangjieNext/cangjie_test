/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1
// ASSERT:regex-begin .*PASSED.*: 11,.*SKIPPED.*: 0,.*ERROR.*: 0
// ASSERT:regex-next .*FAILED.*: 0

internal import std.overflow.*
internal import std.math.*

main() {
    var a8: Int8 = Int8.Max
    var b8: Int8 = Int8.Min
    var add8 = a8.checkedAdd(1)
    var sub8 = b8.checkedSub(1)
    var mul8 = a8.checkedMul(2)
    var div8 = b8.checkedDiv(-1)
    var mod8 = a8.checkedMod(1)
    var inc8 = a8.checkedInc()
    var dec8 = b8.checkedDec()
    var neg8 = b8.checkedNeg()
    if (add8 != None || sub8 != None || mul8 != None) {
        return 1
    }
    if (div8 != None || mod8 != 0) {
        return 1
    }
    if (inc8 != None || dec8 != None || neg8 != None) {
        return 1
    }

    var a16: Int16 = Int16.Max
    var b16: Int16 = Int16.Min
    var add16 = a16.checkedAdd(1)
    var sub16 = b16.checkedSub(1)
    var mul16 = a16.checkedMul(2)
    var div16 = b16.checkedDiv(-1)
    var mod16 = a16.checkedMod(1)
    var inc16 = a16.checkedInc()
    var dec16 = b16.checkedDec()
    var neg16 = b16.checkedNeg()
    if (add16 != None || sub16 != None || mul16 != None) {
        return 1
    }
    if (div16 != None || mod16 != 0) {
        return 1
    }
    if (inc16 != None || dec16 != None || neg16 != None) {
        return 1
    }

    var a32: Int32 = Int32.Max
    var b32: Int32 = Int32.Min
    var add32 = a32.checkedAdd(1)
    var sub32 = b32.checkedSub(1)
    var mul32 = a32.checkedMul(2)
    var div32 = b32.checkedDiv(-1)
    var mod32 = a32.checkedMod(1)
    var inc32 = a32.checkedInc()
    var dec32 = b32.checkedDec()
    var neg32 = b32.checkedNeg()
    if (add32 != None || sub32 != None || mul32 != None) {
        return 1
    }
    if (div32 != None || mod32 != 0) {
        return 1
    }
    if (inc32 != None || dec32 != None || neg32 != None) {
        return 1
    }

    var a64: Int64 = Int64.Max
    var b64: Int64 = Int64.Min
    var add64 = a64.checkedAdd(1)
    var sub64 = b64.checkedSub(1)
    var mul64 = a64.checkedMul(2)
    var div64 = b64.checkedDiv(-1)
    var mod64 = a64.checkedMod(1)
    var pow64 = a64.checkedPow(UInt64(2))
    var inc64 = a64.checkedInc()
    var dec64 = b64.checkedDec()
    var neg64 = b64.checkedNeg()
    if (add64 != None || sub64 != None || mul64 != None) {
        return 1
    }
    if (div64 != None || mod64 != 0 || pow64 != None) {
        return 1
    }
    if (inc64 != None || dec64 != None || neg64 != None) {
        return 1
    }

    var ana: IntNative = IntNative.Max
    var bna: IntNative = IntNative.Min
    var addn = ana.checkedAdd(1)
    var subn = bna.checkedSub(1)
    var muln = ana.checkedMul(2)
    var divn = bna.checkedDiv(-1)
    var modn = ana.checkedMod(1)
    var incn = ana.checkedInc()
    var decn = bna.checkedDec()
    var negn = bna.checkedNeg()
    if (addn != None || subn != None || muln != None) {
        return 1
    }
    if (divn != None || modn != 0) {
        return 1
    }
    if (incn != None || decn != None || negn != None) {
        return 1
    }

    var au8: UInt8 = UInt8.Max
    var bu8: UInt8 = UInt8.Min
    var addu8 = au8.checkedAdd(1)
    var subu8 = bu8.checkedSub(1)
    var mulu8 = au8.checkedMul(2)
    var divu8 = au8.checkedDiv(1)
    var modu8 = au8.checkedMod(1)
    var incu8 = au8.checkedInc()
    var decu8 = bu8.checkedDec()
    var negu8 = au8.checkedNeg()
    if (addu8 != None || subu8 != None || mulu8 != None) {
        return 1
    }
    if (divu8 != UInt8.Max || modu8 != 0) {
        return 1
    }
    if (incu8 != None || decu8 != None || negu8 != None) {
        return 1
    }

    var au16: UInt16 = UInt16.Max
    var bu16: UInt16 = UInt16.Min
    var addu16 = au16.checkedAdd(1)
    var subu16 = bu16.checkedSub(1)
    var mulu16 = au16.checkedMul(2)
    var divu16 = au16.checkedDiv(1)
    var modu16 = au16.checkedMod(1)
    var incu16 = au16.checkedInc()
    var decu16 = bu16.checkedDec()
    var negu16 = au16.checkedNeg()
    if (addu16 != None || subu16 != None || mulu16 != None) {
        return 1
    }
    if (divu16 != UInt16.Max || modu16 != 0) {
        return 1
    }
    if (incu16 != None || decu16 != None || negu16 != None) {
        return 1
    }

    var au32: UInt32 = UInt32.Max
    var bu32: UInt32 = UInt32.Min
    var addu32 = au32.checkedAdd(1)
    var subu32 = bu32.checkedSub(1)
    var mulu32 = au32.checkedMul(2)
    var dibu32 = au32.checkedDiv(1)
    var modu32 = au32.checkedMod(1)
    var incu32 = au32.checkedInc()
    var decu32 = bu32.checkedDec()
    var negu32 = au32.checkedNeg()
    if (addu32 != None || subu32 != None || mulu32 != None) {
        return 1
    }
    if (dibu32 != UInt32.Max || modu32 != 0) {
        return 1
    }
    if (incu32 != None || decu32 != None || negu32 != None) {
        return 1
    }

    var au64: UInt64 = UInt64.Max
    var bu64: UInt64 = UInt64.Min
    var addu64 = au64.checkedAdd(1)
    var subu64 = bu64.checkedSub(1)
    var mulu64 = au64.checkedMul(2)
    var divu64 = au64.checkedDiv(1)
    var modu64 = au64.checkedMod(1)
    var incu64 = au64.checkedInc()
    var decu64 = bu64.checkedDec()
    var negu64 = au64.checkedNeg()
    if (addu64 != None || subu64 != None || mulu64 != None) {
        return 1
    }
    if (divu64 != UInt64.Max || modu64 != 0) {
        return 1
    }
    if (incu64 != None || decu64 != None || negu64 != None) {
        return 1
    }

    var aun: UIntNative = UIntNative.Max
    var bun: UIntNative = UIntNative.Min
    var addun = aun.checkedAdd(1)
    var subun = bun.checkedSub(1)
    var mulun = aun.checkedMul(2)
    var divun = aun.checkedDiv(1)
    var modun = aun.checkedMod(1)
    var incun = aun.checkedInc()
    var decun = bun.checkedDec()
    var negun = aun.checkedNeg()
    if (addun != None || subun != None || mulun != None) {
        return 1
    }
    if (divun != UIntNative.Max || modun != 0) {
        return 1
    }
    if (incun != None || decun != None || negun != None) {
        return 1
    }
    return 0
}
