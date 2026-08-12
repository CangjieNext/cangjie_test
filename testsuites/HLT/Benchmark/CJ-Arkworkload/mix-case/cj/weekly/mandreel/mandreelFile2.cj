/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
import std.overflow.*

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE11createProxyERK9btVector3S3_iPvssP12btDispatcherS4_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var r17: Int64 = 0
    var r18: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-56)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = r0 >> 2
    f0 = Float64(heapClassInst.heapFloat[(r1)])
    f1 = Float64(heapClassInst.heapFloat[(r1 + 1)])
    f2 = Float64(heapClassInst.heapFloat[(r1 + 2)])
    r1 = Int64(heapClassInst.heap32[(fp)])
    r2 = sp + (-6)
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
    heapClassInst.heapFloat[(g0 + 3)] = Float32(f1)
    heapClassInst.heapFloat[(g0 + 4)] = Float32(f2)
    heapClassInst.heap32[(g0 + 5)] = 0
    r2 = Int64(heapClassInst.heap32[(fp + 2)])
    _ZNK20btAxisSweep3InternalItE8quantizeEPtRK9btVector3i(i7);
    r3 = r2 >> 2
    f0 = Float64(heapClassInst.heapFloat[(r3)])
    f1 = Float64(heapClassInst.heapFloat[(r3 + 1)])
    f2 = Float64(heapClassInst.heapFloat[(r3 + 2)])
    r3 = sp + (-12)
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heap32[(g0 + 1)] = Int32(r3)
    heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
    heapClassInst.heapFloat[(g0 + 3)] = Float32(f1)
    heapClassInst.heapFloat[(g0 + 4)] = Float32(f2)
    heapClassInst.heap32[(g0 + 5)] = 1
    _ZNK20btAxisSweep3InternalItE8quantizeEPtRK9btVector3i(i7);
    r3 = Int64(heapClassInst.heapU16[(r1 + 64) >> 1])
    if (r3 != 0) {
        r4 = Int64(heapClassInst.heap32[(fp + 4)])
        r5 = Int64(heapClassInst.heap32[(fp + 5)])
        r6 = Int64(heapClassInst.heap32[(fp + 6)])
        r7 = Int64(heapClassInst.heap32[(fp + 7)])
        r8 = Int64(heapClassInst.heap32[(fp + 8)])
        r9 = r1 >> 2
        r10 = r3 << 6
        r11 = Int64(heapClassInst.heap32[(r9 + 15)])
        r10 = (r11 + r10) | 0
        r11 = Int64(heapClassInst.heapU16[(r10 + 48) >> 1])
        heapClassInst.heap16[(r1 + 64) >> 1] = Int16(r11)
        r11 = Int64(heapClassInst.heapU16[(r1 + 56) >> 1])
        r11 = (r11 + 1) | 0
        r12 = r10 >> 2
        heapClassInst.heap16[(r1 + 56) >> 1] = Int16(r11)
        heapClassInst.heap32[(r12 + 3)] = Int32(r3)
        heapClassInst.heap32[(r12)] = Int32(r4)
        heapClassInst.heap16[(r10 + 4) >> 1] = Int16(r5)
        heapClassInst.heap16[(r10 + 6) >> 1] = Int16(r6)
        heapClassInst.heap32[(r12 + 2)] = Int32(r8)
        r8 = Int64(heapClassInst.heap32[(r9 + 15)])
        r11 = Int64(heapClassInst.heapU16[(r1 + 56) >> 1])
        r11 = r11 << 1
        r12 = Int64(heapClassInst.heapU16[(r8 + 54) >> 1])
        r13 = r11 & 65534
        r12 = (r12 + 2) | 0
        r14 = (r13 + (-1)) | 0
        heapClassInst.heap16[(r8 + 54) >> 1] = Int16(r12)
        r8 = r14 << 2
        r12 = Int64(heapClassInst.heap32[(r9 + 17)])
        r14 = (r12 + r8) | 0
        r15 = r13 | 1
        r14 = Int64(heapClassInst.heapU16[(r14 + 2) >> 1])
        r16 = Int64(heapClassInst.heapU16[(r12 + r8) >> 1])
        r15 = r15 << 2
        r17 = (r12 + r15) | 0
        heapClassInst.heap16[(r12 + r15) >> 1] = Int16(r16)
        heapClassInst.heap16[(r17 + 2) >> 1] = Int16(r14)
        r12 = Int64(heapClassInst.heap32[(r9 + 17)])
        r14 = Int64(heapClassInst.heapU16[(sp + (-6)) >> 1])
        heapClassInst.heap16[(r12 + r8) >> 1] = Int16(r14)
        r12 = Int64(heapClassInst.heap32[(r9 + 17)])
        r12 = (r12 + r8) | 0
        heapClassInst.heap16[(r12 + 2) >> 1] = Int16(r3)
        r12 = Int64(heapClassInst.heap32[(r9 + 17)])
        r14 = Int64(heapClassInst.heapU16[(sp + (-12)) >> 1])
        r13 = r13 << 2
        heapClassInst.heap16[(r12 + r13) >> 1] = Int16(r14)
        r12 = Int64(heapClassInst.heap32[(r9 + 17)])
        r12 = (r12 + r13) | 0
        r14 = (r11 + (-1)) | 0
        heapClassInst.heap16[(r12 + 2) >> 1] = Int16(r3)
        heapClassInst.heap16[(r10 + 48) >> 1] = Int16(r14)
        heapClassInst.heap16[(r10 + 54) >> 1] = Int16(r11)
        r12 = Int64(heapClassInst.heap32[(r9 + 15)])
        r16 = Int64(heapClassInst.heapU16[(r12 + 56) >> 1])
        r16 = (r16 + 2) | 0
        heapClassInst.heap16[(r12 + 56) >> 1] = Int16(r16)
        r12 = Int64(heapClassInst.heap32[(r9 + 18)])
        r16 = (r12 + r8) | 0
        r16 = Int64(heapClassInst.heapU16[(r16 + 2) >> 1])
        r17 = Int64(heapClassInst.heapU16[(r12 + r8) >> 1])
        r18 = (r12 + r15) | 0
        heapClassInst.heap16[(r12 + r15) >> 1] = Int16(r17)
        heapClassInst.heap16[(r18 + 2) >> 1] = Int16(r16)
        r12 = Int64(heapClassInst.heap32[(r9 + 18)])
        r16 = Int64(heapClassInst.heapU16[(sp + (-4)) >> 1])
        heapClassInst.heap16[(r12 + r8) >> 1] = Int16(r16)
        r12 = Int64(heapClassInst.heap32[(r9 + 18)])
        r12 = (r12 + r8) | 0
        heapClassInst.heap16[(r12 + 2) >> 1] = Int16(r3)
        r12 = Int64(heapClassInst.heap32[(r9 + 18)])
        r16 = Int64(heapClassInst.heapU16[(sp + (-10)) >> 1])
        heapClassInst.heap16[(r12 + r13) >> 1] = Int16(r16)
        r12 = Int64(heapClassInst.heap32[(r9 + 18)])
        r12 = (r12 + r13) | 0
        heapClassInst.heap16[(r12 + 2) >> 1] = Int16(r3)
        heapClassInst.heap16[(r10 + 50) >> 1] = Int16(r14)
        heapClassInst.heap16[(r10 + 56) >> 1] = Int16(r11)
        r12 = Int64(heapClassInst.heap32[(r9 + 15)])
        r16 = Int64(heapClassInst.heapU16[(r12 + 58) >> 1])
        r16 = (r16 + 2) | 0
        heapClassInst.heap16[(r12 + 58) >> 1] = Int16(r16)
        r12 = Int64(heapClassInst.heap32[(r9 + 19)])
        r16 = (r12 + r8) | 0
        r16 = Int64(heapClassInst.heapU16[(r16 + 2) >> 1])
        r17 = Int64(heapClassInst.heapU16[(r12 + r8) >> 1])
        r18 = (r12 + r15) | 0
        heapClassInst.heap16[(r12 + r15) >> 1] = Int16(r17)
        heapClassInst.heap16[(r18 + 2) >> 1] = Int16(r16)
        r12 = Int64(heapClassInst.heap32[(r9 + 19)])
        r15 = Int64(heapClassInst.heapU16[(sp + (-2)) >> 1])
        heapClassInst.heap16[(r12 + r8) >> 1] = Int16(r15)
        r12 = Int64(heapClassInst.heap32[(r9 + 19)])
        r8 = (r12 + r8) | 0
        heapClassInst.heap16[(r8 + 2) >> 1] = Int16(r3)
        r8 = Int64(heapClassInst.heap32[(r9 + 19)])
        r12 = Int64(heapClassInst.heapU16[(sp + (-8)) >> 1])
        heapClassInst.heap16[(r8 + r13) >> 1] = Int16(r12)
        r8 = Int64(heapClassInst.heap32[(r9 + 19)])
        r8 = (r8 + r13) | 0
        heapClassInst.heap16[(r8 + 2) >> 1] = Int16(r3)
        heapClassInst.heap16[(r10 + 52) >> 1] = Int16(r14)
        heapClassInst.heap16[(r10 + 58) >> 1] = Int16(r11)
        r8 = Int64(heapClassInst.heapU16[(r10 + 48) >> 1])
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = 0
        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
        heapClassInst.heap32[(g0 + 3)] = 0
        _ZN20btAxisSweep3InternalItE11sortMinDownEitP12btDispatcherb(i7);
        r8 = Int64(heapClassInst.heapU16[(r10 + 54) >> 1])
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = 0
        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
        heapClassInst.heap32[(g0 + 3)] = Int32(r7)
        heapClassInst.heap32[(g0 + 4)] = 0
        _ZN20btAxisSweep3InternalItE11sortMaxDownEitP12btDispatcherb(i7);
        r8 = Int64(heapClassInst.heapU16[(r10 + 50) >> 1])
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = 1
        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
        heapClassInst.heap32[(g0 + 3)] = 0
        _ZN20btAxisSweep3InternalItE11sortMinDownEitP12btDispatcherb(i7);
        r8 = Int64(heapClassInst.heapU16[(r10 + 56) >> 1])
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = 1
        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
        heapClassInst.heap32[(g0 + 3)] = Int32(r7)
        heapClassInst.heap32[(g0 + 4)] = 0
        _ZN20btAxisSweep3InternalItE11sortMaxDownEitP12btDispatcherb(i7);
        r8 = Int64(heapClassInst.heapU16[(r10 + 52) >> 1])
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = 2
        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
        heapClassInst.heap32[(g0 + 3)] = 1
        _ZN20btAxisSweep3InternalItE11sortMinDownEitP12btDispatcherb(i7);
        r8 = Int64(heapClassInst.heapU16[(r10 + 58) >> 1])
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = 2
        heapClassInst.heap32[(g0 + 2)] = Int32(r8)
        heapClassInst.heap32[(g0 + 3)] = Int32(r7)
        heapClassInst.heap32[(g0 + 4)] = 1
        _ZN20btAxisSweep3InternalItE11sortMaxDownEitP12btDispatcherb(i7);
        updateMandreelStats(Timer().getTime());
        r1 = Int64(heapClassInst.heap32[(r9 + 27)])
        r8 = Int64(heapClassInst.heap32[(r9 + 15)])
        if (!(r1 == 0)) {
            r9 = Int64(heapClassInst.heap32[(fp + 3)])
            r10 = r1 >> 2
            r10 = Int64(heapClassInst.heap32[(r10)])
            r10 = r10 >> 2
            r10 = Int64(heapClassInst.heap32[(r10 + 2)])
            r11 = r3 << 6
            heapClassInst.heap32[(g0)] = Int32(r1)
            heapClassInst.heap32[(g0 + 1)] = Int32(r0)
            heapClassInst.heap32[(g0 + 2)] = Int32(r2)
            heapClassInst.heap32[(g0 + 3)] = Int32(r9)
            heapClassInst.heap32[(g0 + 4)] = Int32(r4)
            heapClassInst.heap32[(g0 + 5)] = Int32(r5)
            heapClassInst.heap32[(g0 + 6)] = Int32(r6)
            heapClassInst.heap32[(g0 + 7)] = Int32(r7)
            heapClassInst.heap32[(g0 + 8)] = 0
            r0 = (r8 + r11) | 0
            r0 = r0 >> 2
            __FUNCTION_TABLE__[(r10) >> 2](i7);
            heapClassInst.heap32[(r0 + 15)] = Int32(commonVariable.r_g0)
        }
        r0 = r3 << 6
        r0 = (r8 + r0) | 0
        commonVariable.r_g0 = r0
        return;
    } else {
        r0 = _E2_str213
        r1 = _E2_str112
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = Int32(r1)
        heapClassInst.heap32[(g0 + 2)] = 483
        _assert(i7);
    }
}

@OverflowWrapping
func _ZN20btAlignedObjectArrayI16btBroadphasePairE6resizeEiRKS0_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 1)])
    r3 = Int64(heapClassInst.heap32[(fp + 1)])
    do {
        if (!(r2 > r3)) {
            if (!(r2 >= r3)) {
                r4 = Int64(heapClassInst.heap32[(r1 + 2)])
                if (!(r4 >= r3)) {
                    if (r3 != 0) {
                        r4 = gNumAlignedAllocs
                        r4 = r4 >> 2
                        r5 = Int64(heapClassInst.heap32[(r4)])
                        r6 = r3 << 4
                        r5 = (r5 + 1) | 0
                        r6 = r6 | 3
                        heapClassInst.heap32[(r4)] = Int32(r5)
                        r4 = (r6 + 16) | 0
                        heapClassInst.heap32[(g0)] = Int32(r4)
                        mallocNew(i7);
                        r4 = commonVariable.r_g0
                        if (r4 != 0) {
                            r5 = 0
                            r6 = (r4 + 4) | 0
                            r5 = (r5 - r6) | 0
                            r5 = r5 & 15
                            r5 = (r4 + r5) | 0
                            r6 = (r5 + 4) | 0
                            r5 = r5 >> 2
                            heapClassInst.heap32[(r5)] = Int32(r4)
                            r4 = r6
                        }
                    } else {
                        r4 = 0
                    }
                    r5 = (r0 + 12) | 0
                    if (r2 < 1) {
                        r6 = r5 >> 2
                        r8 = Int64(heapClassInst.heap32[(r6)])
                    } else {
                        r6 = 0
                        r7 = (r6 - r2) | 0
                        while (true) {
                            r8 = r5 >> 2
                            r8 = Int64(heapClassInst.heap32[(r8)])
                            r9 = r6 << 4
                            r10 = (r8 - r9) | 0
                            r10 = r10 >> 2
                            r9 = (r4 - r9) | 0
                            r11 = Int64(heapClassInst.heap32[(r10)])
                            r9 = r9 >> 2
                            heapClassInst.heap32[(r9)] = Int32(r11)
                            r11 = Int64(heapClassInst.heap32[(r10 + 1)])
                            heapClassInst.heap32[(r9 + 1)] = Int32(r11)
                            r11 = Int64(heapClassInst.heap32[(r10 + 2)])
                            heapClassInst.heap32[(r9 + 2)] = Int32(r11)
                            r10 = Int64(heapClassInst.heap32[(r10 + 3)])
                            r6 = (r6 + (-1)) | 0
                            heapClassInst.heap32[(r9 + 3)] = Int32(r10)
                            if (!(r7 != r6)) {
                                break
                            }
                        }
                        r5 = (r0 + 12) | 0
                    }
                    if (!(r8 == 0)) {
                        r6 = Int64(heapClassInst.heapU8[r0 + 16])
                        if (!(r6 == 0)) {
                            r6 = gNumAlignedFree
                            r6 = r6 >> 2
                            r7 = Int64(heapClassInst.heap32[(r6)])
                            r7 = (r7 + 1) | 0
                            r8 = r8 >> 2
                            heapClassInst.heap32[(r6)] = Int32(r7)
                            r6 = Int64(heapClassInst.heap32[(r8 + (-1))])
                            heapClassInst.heap32[(g0)] = Int32(r6)
                            free(i7);
                        }
                        r6 = r5 >> 2
                        heapClassInst.heap32[(r6)] = 0
                    }
                    r6 = 1
                    r5 = r5 >> 2
                    heapClassInst.heap8[r0 + 16] = Int8(r6)
                    heapClassInst.heap32[(r5)] = Int32(r4)
                    heapClassInst.heap32[(r1 + 2)] = Int32(r3)
                    if (r2 >= r3) {
                        break
                    }
                }
                r0 = Int64(heapClassInst.heap32[(fp + 2)])
                while (true) {
                    r4 = r0 >> 2
                    r5 = r2 << 4
                    r6 = Int64(heapClassInst.heap32[(r1 + 3)])
                    r5 = (r6 + r5) | 0
                    r6 = Int64(heapClassInst.heap32[(r4)])
                    r5 = r5 >> 2
                    heapClassInst.heap32[(r5)] = Int32(r6)
                    r6 = Int64(heapClassInst.heap32[(r4 + 1)])
                    heapClassInst.heap32[(r5 + 1)] = Int32(r6)
                    r6 = Int64(heapClassInst.heap32[(r4 + 2)])
                    heapClassInst.heap32[(r5 + 2)] = Int32(r6)
                    r4 = Int64(heapClassInst.heap32[(r4 + 3)])
                    r2 = (r2 + 1) | 0
                    heapClassInst.heap32[(r5 + 3)] = Int32(r4)
                    if (r3 != r2) {
                        continue
                    } else {
                        break
                    }
                }
            }
        }
    } while (false);
    heapClassInst.heap32[(r1 + 1)] = Int32(r3)
    return
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItE25calculateOverlappingPairsEP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-48)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0 + 23)])
    r2 = r1 >> 2
    r2 = Int64(heapClassInst.heap32[(r2)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 14)])
    heapClassInst.heap32[(g0)] = Int32(r1)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    r1 = commonVariable.r_g0
    if (!(r1 == 0)) {
        r1 = Int64(heapClassInst.heap32[(fp + 1)])
        r2 = Int64(heapClassInst.heap32[(r0 + 23)])
        r3 = r2 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3 + 7)])
        heapClassInst.heap32[(g0)] = Int32(r2)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r2 = commonVariable.r_g0
        r3 = r2 >> 2
        r3 = Int64(heapClassInst.heap32[(r3 + 1)])
        if (r3 > 1) {
            r3 = (r3 + (-1)) | 0
            heapClassInst.heap32[(g0)] = Int32(r2)
            heapClassInst.heap32[(g0 + 1)] = 0
            heapClassInst.heap32[(g0 + 2)] = Int32(r3)
            r3 = r2 >> 2
            _ZN20btAlignedObjectArrayI16btBroadphasePairE17quickSortInternalI29btBroadphasePairSortPredicateEEvT_ii(i7);
            r3 = Int64(heapClassInst.heap32[(r3 + 1)])
        }
        r4 = sp + (-32)
        r5 = r4 >> 2
        heapClassInst.heap32[(fp + (-8))] = 0
        heapClassInst.heap32[(r5 + 1)] = 0
        heapClassInst.heap32[(r5 + 2)] = 0
        heapClassInst.heap32[(r5 + 3)] = 0
        r5 = Int64(heapClassInst.heap32[(r0 + 26)])
        r3 = (r3 - r5) | 0
        heapClassInst.heap32[(g0)] = Int32(r2)
        heapClassInst.heap32[(g0 + 1)] = Int32(r3)
        heapClassInst.heap32[(g0 + 2)] = Int32(r4)
        r3 = 0
        _ZN20btAlignedObjectArrayI16btBroadphasePairE6resizeEiRKS0_(i7)
        heapClassInst.heap32[(r0 + 26)] = 0
        r4 = r3
        r5 = r3
        r6 = r3
        r7 = r3
        while (true) {
            r8 = r2 >> 2
            r9 = Int64(heapClassInst.heap32[(r8 + 1)])
            if (r9 > r7) {
                r8 = Int64(heapClassInst.heap32[(r8 + 3)])
                r9 = r7 << 4
                r9 = (r8 + r9) | 0
                r9 = r9 >> 2
                r10 = Int64(heapClassInst.heap32[(r9)])
                r11 = r7 << 2
                r12 = Int64(heapClassInst.heap32[(r9 + 1)])
                if (r10 != r5) {
                    __label__ = 6
                } else {
                    if (r12 == r6) {
                        r4 = Int64(heapClassInst.heap32[(r9 + 2)])
                        if (r4 == 0) {
                            __label__ = 13
                        } else {
                            __label__ = 12
                            break
                        }
                    } else {
                        __label__ = 6
                    }
                }
                if (__label__ == 6) {
                    r5 = (r12 + 54) | 0
                    r6 = (r10 + 48) | 0
                    r9 = 0
                    while (true) {
                        if (r9 < 3) {
                            r13 = Int64(heapClassInst.heapU16[(r6 + 6) >> 1])
                            r14 = Int64(heapClassInst.heapU16[(r5 + (-6)) >> 1])
                            if (`UIntNative`(r13) < `UIntNative`(r14)) {
                                __label__ = 13
                                break
                            } else {
                                r13 = Int64(heapClassInst.heapU16[(r5) >> 1])
                                r14 = Int64(heapClassInst.heapU16[(r6) >> 1])
                                if (`UIntNative`(r13) < `UIntNative`(r14)) {
                                    __label__ = 13
                                    break
                                } else {
                                    r9 = (r9 + 1) | 0
                                    r5 = (r5 + 2) | 0
                                    r6 = (r6 + 2) | 0
                                }
                            }
                        } else {
                            __label__ = 14
                            break
                        }
                    }
                }
                if (__label__ == 13) {
                    r4 = Int64(heapClassInst.heap32[(r0 + 23)])
                    r5 = r4 >> 2
                    r5 = Int64(heapClassInst.heap32[(r5)])
                    r5 = r5 >> 2
                    r5 = Int64(heapClassInst.heap32[(r5 + 8)])
                    r6 = (r8 + r3) | 0
                    r9 = r11 << 2
                    heapClassInst.heap32[(g0)] = Int32(r4)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r6)
                    heapClassInst.heap32[(g0 + 2)] = Int32(r1)
                    r4 = (r8 + r9) | 0
                    r4 = r4 >> 2
                    __FUNCTION_TABLE__[(r5) >> 2](i7);
                    heapClassInst.heap32[(r4)] = 0
                    heapClassInst.heap32[(r4 + 1)] = 0
                    r4 = Int64(heapClassInst.heap32[(r0 + 26)])
                    r4 = (r4 + 1) | 0
                    r5 = gOverlappingPairs
                    r5 = r5 >> 2
                    heapClassInst.heap32[(r0 + 26)] = Int32(r4)
                    r6 = Int64(heapClassInst.heap32[(r5)])
                    r6 = (r6 + (-1)) | 0
                    heapClassInst.heap32[(r5)] = Int32(r6)
                }
                r7 = (r7 + 1) | 0
                r3 = (r3 + 16) | 0
                r5 = r10
                r6 = r12
            } else {
                __label__ = 16
                break
            }
        }
        match (__label__) {
            case 16 =>
                if (r9 > 1) {
                    r4 = (r9 + (-1)) | 0
                    heapClassInst.heap32[(g0)] = Int32(r2)
                    heapClassInst.heap32[(g0 + 1)] = 0
                    heapClassInst.heap32[(g0 + 2)] = Int32(r4)
                    _ZN20btAlignedObjectArrayI16btBroadphasePairE17quickSortInternalI29btBroadphasePairSortPredicateEEvT_ii(
                        i7);
                    r9 = Int64(heapClassInst.heap32[(r8 + 1)])
                    r4 = Int64(heapClassInst.heap32[(r0 + 26)])
                }
                r1 = sp + (-16)
                r3 = r1 >> 2
                heapClassInst.heap32[(fp + (-4))] = 0
                heapClassInst.heap32[(r3 + 1)] = 0
                heapClassInst.heap32[(r3 + 2)] = 0
                heapClassInst.heap32[(r3 + 3)] = 0
                r3 = (r9 - r4) | 0
                heapClassInst.heap32[(g0)] = Int32(r2)
                heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                heapClassInst.heap32[(g0 + 2)] = Int32(r1)
                _ZN20btAlignedObjectArrayI16btBroadphasePairE6resizeEiRKS0_(i7);
                heapClassInst.heap32[(r0 + 26)] = 0
            case 12 =>
                r8 = _E2_str314
                r0 = _E2_str112
                heapClassInst.heap32[(g0)] = Int32(r8)
                heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                heapClassInst.heap32[(g0 + 2)] = 687
                _assert(i7);
            case _ => println("break623")
        }
    }
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItED2Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV20btAxisSweep3InternalItE
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 27)])
    if (!(r1 == 0)) {
        r1 = Int64(heapClassInst.heap32[(r2 + 28)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r2 + 28)])
        if (!(r1 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
        r1 = Int64(heapClassInst.heap32[(r2 + 27)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r2 + 27)])
        if (!(r1 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
    }
    r1 = 0
    while (true) {
        r3 = r1 << 2
        r3 = (r0 + r3) | 0
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3 + 22)])
        if (!(r3 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        r1 = (r1 + (-1)) | 0
        if (r1 != (-3)) {
            continue
        } else {
            break
        }
    }
    r1 = Int64(heapClassInst.heap32[(r2 + 15)])
    if (!(r1 == 0)) {
        r3 = gNumAlignedFree
        r3 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r3)])
        r4 = (r4 + 1) | 0
        r1 = r1 >> 2
        heapClassInst.heap32[(r3)] = Int32(r4)
        r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
        heapClassInst.heap32[(g0)] = Int32(r1)
        free(i7);
    }
    r0 = Int64(heapClassInst.heapU8[r0 + 100])
    if (!(r0 == 0)) {
        r0 = Int64(heapClassInst.heap32[(r2 + 23)])
        r1 = r0 >> 2
        r1 = Int64(heapClassInst.heap32[(r1)])
        r1 = r1 >> 2
        r1 = Int64(heapClassInst.heap32[(r1)])
        heapClassInst.heap32[(g0)] = Int32(r0)
        __FUNCTION_TABLE__[(r1) >> 2](i7);
        r0 = Int64(heapClassInst.heap32[(r2 + 23)])
        if (!(r0 == 0)) {
            r1 = gNumAlignedFree
            r1 = r1 >> 2
            r2 = Int64(heapClassInst.heap32[(r1)])
            r2 = (r2 + 1) | 0
            r0 = r0 >> 2
            heapClassInst.heap32[(r1)] = Int32(r2)
            r0 = Int64(heapClassInst.heap32[(r0 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r0)
            free(i7);
        }
    }
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItED1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN20btAxisSweep3InternalItED2Ev(i7);
    return;
}

@OverflowWrapping
func _ZN20btAxisSweep3InternalItED0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV20btAxisSweep3InternalItE
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 27)])
    if (!(r1 == 0)) {
        r1 = Int64(heapClassInst.heap32[(r2 + 28)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r2 + 28)])
        if (!(r1 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
        r1 = Int64(heapClassInst.heap32[(r2 + 27)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r2 + 27)])
        if (!(r1 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
    }
    r1 = 0
    while (true) {
        r3 = r1 << 2
        r3 = (r0 + r3) | 0
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3 + 22)])
        if (!(r3 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        r1 = (r1 + (-1)) | 0
        if (r1 != (-3)) {
            continue
        } else {
            break
        }
    }
    r1 = Int64(heapClassInst.heap32[(r2 + 15)])
    if (!(r1 == 0)) {
        r3 = gNumAlignedFree
        r3 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r3)])
        r4 = (r4 + 1) | 0
        r1 = r1 >> 2
        heapClassInst.heap32[(r3)] = Int32(r4)
        r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
        heapClassInst.heap32[(g0)] = Int32(r1)
        free(i7);
    }
    r0 = Int64(heapClassInst.heapU8[r0 + 100])
    if (!(r0 == 0)) {
        r0 = Int64(heapClassInst.heap32[(r2 + 23)])
        r1 = r0 >> 2
        r1 = Int64(heapClassInst.heap32[(r1)])
        r1 = r1 >> 2
        r1 = Int64(heapClassInst.heap32[(r1)])
        heapClassInst.heap32[(g0)] = Int32(r0)
        __FUNCTION_TABLE__[(r1) >> 2](i7);
        r0 = Int64(heapClassInst.heap32[(r2 + 23)])
        if (!(r0 == 0)) {
            r1 = gNumAlignedFree
            r1 = r1 >> 2
            r3 = Int64(heapClassInst.heap32[(r1)])
            r3 = (r3 + 1) | 0
            r0 = r0 >> 2
            heapClassInst.heap32[(r1)] = Int32(r3)
            r0 = Int64(heapClassInst.heap32[(r0 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r0)
            free(i7);
        }
    }
    r0 = gNumAlignedFree
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r1 = (r1 + 1) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    r0 = Int64(heapClassInst.heap32[(r2 + (-1))])
    heapClassInst.heap32[(g0)] = Int32(r0)
    free(i7);
    return;
}

@OverflowWrapping
func _ZN12btAxisSweep3D0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV12btAxisSweep3
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN20btAxisSweep3InternalItED2Ev(i7);
    if (!(r0 == 0)) {
        r0 = gNumAlignedFree
        r0 = r0 >> 2
        r1 = Int64(heapClassInst.heap32[(r0)])
        r1 = (r1 + 1) | 0
        heapClassInst.heap32[(r0)] = Int32(r1)
        r0 = Int64(heapClassInst.heap32[(r2 + (-1))])
        heapClassInst.heap32[(g0)] = Int32(r0)
        free(i7);
    }
    return;
}

@OverflowWrapping
func _ZN12btAxisSweep3D1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV12btAxisSweep3
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN20btAxisSweep3InternalItED2Ev(i7);
    return;
}

@OverflowWrapping
func _ZN20btCollisionAlgorithmD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV20btCollisionAlgorithm
    r0 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    return;
}

@OverflowWrapping
func _ZN20btCollisionAlgorithmD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV20btCollisionAlgorithm
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZN6btDbvt8ICollide7ProcessEPK10btDbvtNodeS3_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN6btDbvt8ICollide7ProcessEPK10btDbvtNodef(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r1)])
    r1 = r1 >> 2
    r1 = Int64(heapClassInst.heap32[(r1 + 3)])
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
}

@OverflowWrapping
func _ZN6btDbvt8ICollide7DescentEPK10btDbvtNode(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 1
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN6btDbvt8ICollide9AllLeavesEPK10btDbvtNode(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 1
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZL10insertleafP6btDbvtP10btDbvtNodeS2_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 2)])
    r0 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r0)])
    if (r2 != 0) {
        r2 = Int64(heapClassInst.heap32[(fp + 1)])
        r3 = r2 >> 2
        r3 = Int64(heapClassInst.heap32[(r3 + 10)])
        if (r3 != 0) {
            r4 = r1 >> 2
            f0 = Float64(heapClassInst.heapFloat[(r4 + 2)])
            f1 = Float64(heapClassInst.heapFloat[(r4 + 6)])
            f2 = Float64(heapClassInst.heapFloat[(r4 + 1)])
            f3 = Float64(heapClassInst.heapFloat[(r4 + 5)])
            f4 = Float64(heapClassInst.heapFloat[(r4)])
            f5 = Float64(heapClassInst.heapFloat[(r4 + 4)])
            f0 = f0 + f1
            f1 = f2 + f3
            f2 = f4 + f5
            while (true) {
                r4 = r2 >> 2
                r4 = Int64(heapClassInst.heap32[(r4 + 9)])
                r4 = r4 >> 2
                f3 = Float64(heapClassInst.heapFloat[(r4)])
                f4 = Float64(heapClassInst.heapFloat[(r4 + 4)])
                f5 = Float64(heapClassInst.heapFloat[(r4 + 2)])
                f6 = Float64(heapClassInst.heapFloat[(r4 + 6)])
                f7 = Float64(heapClassInst.heapFloat[(r4 + 1)])
                f8 = Float64(heapClassInst.heapFloat[(r4 + 5)])
                f3 = f3 + f4
                f4 = f5 + f6
                f5 = f7 + f8
                f3 = f2 - f3
                f4 = f0 - f4
                f5 = f1 - f5
                f6 = 0.0
                if (f3 < f6) {
                    f3 = -f3
                }
                if (f5 < f6) {
                    f5 = -f5
                }
                f3 = f3 + f5
                if (f4 < f6) {
                    f4 = -f4
                }
                r3 = r3 >> 2
                f5 = Float64(heapClassInst.heapFloat[(r3)])
                f7 = Float64(heapClassInst.heapFloat[(r3 + 4)])
                f8 = Float64(heapClassInst.heapFloat[(r3 + 2)])
                f9 = Float64(heapClassInst.heapFloat[(r3 + 6)])
                f10 = Float64(heapClassInst.heapFloat[(r3 + 1)])
                f11 = Float64(heapClassInst.heapFloat[(r3 + 5)])
                f5 = f5 + f7
                f7 = f8 + f9
                f8 = f10 + f11
                f5 = f2 - f5
                f3 = f3 + f4
                f4 = f0 - f7
                f7 = f1 - f8
                if (f5 < f6) {
                    f5 = -f5
                }
                if (f7 < f6) {
                    f7 = -f7
                }
                f5 = f5 + f7
                if (f4 < f6) {
                    f4 = -f4
                }
                f4 = f5 + f4

                if (f3 >= f4) {
                    r3 = 1
                } else {
                    r3 = 0
                }
                r3 = r3 & 1
                r3 = r3 << 2
                r2 = (r2 + r3) | 0
                r2 = r2 >> 2
                r2 = Int64(heapClassInst.heap32[(r2 + 9)])
                r3 = r2 >> 2
                r3 = Int64(heapClassInst.heap32[(r3 + 10)])
                if (!(r3 != 0)) {
                    break
                }
            }
        }
        r3 = r2 >> 2
        r4 = Int64(heapClassInst.heap32[(r0 + 1)])
        r5 = Int64(heapClassInst.heap32[(r3 + 8)])
        if (r4 == 0) {
            r4 = gNumAlignedAllocs
            r4 = r4 >> 2
            r6 = Int64(heapClassInst.heap32[(r4)])
            r6 = (r6 + 1) | 0
            heapClassInst.heap32[(r4)] = Int32(r6)
            heapClassInst.heap32[(g0)] = 63
            mallocNew(i7);
            r4 = commonVariable.r_g0
            if (r4 != 0) {
                r6 = 0
                r7 = (r4 + 4) | 0
                r6 = (r6 - r7) | 0
                r6 = r6 & 15
                r6 = (r4 + r6) | 0
                r7 = (r6 + 4) | 0
                r6 = r6 >> 2
                heapClassInst.heap32[(r6)] = Int32(r4)
                r4 = r7
            }
        } else {
            heapClassInst.heap32[(r0 + 1)] = 0
        }
        r6 = r4 >> 2
        heapClassInst.heap32[(r6 + 8)] = Int32(r5)
        heapClassInst.heap32[(r6 + 9)] = 0
        heapClassInst.heap32[(r6 + 10)] = 0
        r7 = r1 >> 2
        f0 = Float64(heapClassInst.heapFloat[(r7)])
        f1 = Float64(heapClassInst.heapFloat[(r3)])

        if (f0 >= f1) {
            f0 = f1
        }
        heapClassInst.heapFloat[(r6)] = Float32(f0)
        f0 = Float64(heapClassInst.heapFloat[(r7 + 4)])
        f1 = Float64(heapClassInst.heapFloat[(r3 + 4)])

        if (f0 <= f1) {
            f0 = f1
        }
        heapClassInst.heapFloat[(r6 + 4)] = Float32(f0)
        f0 = Float64(heapClassInst.heapFloat[(r7 + 1)])
        f1 = Float64(heapClassInst.heapFloat[(r3 + 1)])

        if (f0 >= f1) {
            f0 = f1
        }
        heapClassInst.heapFloat[(r6 + 1)] = Float32(f0)
        f0 = Float64(heapClassInst.heapFloat[(r7 + 5)])
        f1 = Float64(heapClassInst.heapFloat[(r3 + 5)])

        if (f0 <= f1) {
            f0 = f1
        }
        heapClassInst.heapFloat[(r6 + 5)] = Float32(f0)
        f0 = Float64(heapClassInst.heapFloat[(r7 + 2)])
        f1 = Float64(heapClassInst.heapFloat[(r3 + 2)])

        if (f0 >= f1) {
            f0 = f1
        }
        heapClassInst.heapFloat[(r6 + 2)] = Float32(f0)
        f0 = Float64(heapClassInst.heapFloat[(r7 + 6)])
        f1 = Float64(heapClassInst.heapFloat[(r3 + 6)])

        if (f0 <= f1) {
            f0 = f1
        }
        heapClassInst.heapFloat[(r6 + 6)] = Float32(f0)
        do {
            if (r5 == 0) {
                heapClassInst.heap32[(r6 + 9)] = Int32(r2)
                heapClassInst.heap32[(r3 + 8)] = Int32(r4)
                heapClassInst.heap32[(r6 + 10)] = Int32(r1)
                heapClassInst.heap32[(r7 + 8)] = Int32(r4)
                heapClassInst.heap32[(r0)] = Int32(r4)
            } else {
                r0 = Int64(heapClassInst.heap32[(r3 + 8)])
                r0 = r0 >> 2
                r0 = Int64(heapClassInst.heap32[(r0 + 10)])

                if (r0 == r2) {
                    r0 = 1
                } else {
                    r0 = 0
                }
                r0 = r0 & 1
                r0 = r0 << 2
                r0 = (r5 + r0) | 0
                r0 = r0 >> 2
                heapClassInst.heap32[(r0 + 9)] = Int32(r4)
                heapClassInst.heap32[(r6 + 9)] = Int32(r2)
                heapClassInst.heap32[(r3 + 8)] = Int32(r4)
                heapClassInst.heap32[(r6 + 10)] = Int32(r1)
                heapClassInst.heap32[(r7 + 8)] = Int32(r4)
                f0 = Float64(heapClassInst.heapFloat[(r6)])
                while (true) {
                    r0 = r5
                    r1 = r0 >> 2
                    f1 = Float64(heapClassInst.heapFloat[(r1)])
                    if (!(f1 > f0)) {
                        r2 = r4 >> 2
                        f0 = Float64(heapClassInst.heapFloat[(r1 + 1)])
                        f1 = Float64(heapClassInst.heapFloat[(r2 + 1)])
                        if (!(f0 > f1)) {
                            f0 = Float64(heapClassInst.heapFloat[(r1 + 2)])
                            f1 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                            if (!(f0 > f1)) {
                                f0 = Float64(heapClassInst.heapFloat[(r1 + 4)])
                                f1 = Float64(heapClassInst.heapFloat[(r2 + 4)])
                                if (!(f0 < f1)) {
                                    f0 = Float64(heapClassInst.heapFloat[(r1 + 5)])
                                    f1 = Float64(heapClassInst.heapFloat[(r2 + 5)])
                                    if (!(f0 < f1)) {
                                        f0 = Float64(heapClassInst.heapFloat[(r1 + 6)])
                                        f1 = Float64(heapClassInst.heapFloat[(r2 + 6)])
                                        if (f0 >= f1) {
                                            break
                                        }
                                    }
                                }
                            }
                        }
                    }
                    r2 = Int64(heapClassInst.heap32[(r1 + 10)])
                    r3 = Int64(heapClassInst.heap32[(r1 + 9)])
                    r2 = r2 >> 2
                    r3 = r3 >> 2
                    f0 = Float64(heapClassInst.heapFloat[(r3)])
                    f1 = Float64(heapClassInst.heapFloat[(r2)])

                    if (f0 >= f1) {
                        f0 = f1
                    }
                    heapClassInst.heapFloat[(r1)] = Float32(f0)
                    f1 = Float64(heapClassInst.heapFloat[(r3 + 4)])
                    f2 = Float64(heapClassInst.heapFloat[(r2 + 4)])

                    if (f1 <= f2) {
                        f1 = f2
                    }
                    heapClassInst.heapFloat[(r1 + 4)] = Float32(f1)
                    f1 = Float64(heapClassInst.heapFloat[(r3 + 1)])
                    f2 = Float64(heapClassInst.heapFloat[(r2 + 1)])

                    if (f1 >= f2) {
                        f1 = f2
                    }
                    heapClassInst.heapFloat[(r1 + 1)] = Float32(f1)
                    f1 = Float64(heapClassInst.heapFloat[(r3 + 5)])
                    f2 = Float64(heapClassInst.heapFloat[(r2 + 5)])

                    if (f1 <= f2) {
                        f1 = f2
                    }
                    heapClassInst.heapFloat[(r1 + 5)] = Float32(f1)
                    f1 = Float64(heapClassInst.heapFloat[(r3 + 2)])
                    f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])

                    if (f1 >= f2) {
                        f1 = f2
                    }
                    heapClassInst.heapFloat[(r1 + 2)] = Float32(f1)
                    f1 = Float64(heapClassInst.heapFloat[(r3 + 6)])
                    f2 = Float64(heapClassInst.heapFloat[(r2 + 6)])

                    if (f1 <= f2) {
                        f1 = f2
                    }
                    heapClassInst.heapFloat[(r1 + 6)] = Float32(f1)
                    r5 = Int64(heapClassInst.heap32[(r1 + 8)])
                    r4 = r0
                    if (r5 == 0) {
                        break
                    }
                }
            }
        } while (false);
        return;
    } else {
        r2 = r1 >> 2
        heapClassInst.heap32[(r0)] = Int32(r1)
        heapClassInst.heap32[(r2 + 8)] = 0
        return;
    }
}

@OverflowWrapping
func _ZL10removeleafP6btDbvtP10btDbvtNode(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var f12: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r0 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r0)])
    if (r2 != r1) {
        r2 = r1 >> 2
        r2 = Int64(heapClassInst.heap32[(r2 + 8)])
        r3 = r2 >> 2
        r4 = Int64(heapClassInst.heap32[(r3 + 10)])

        if (r4 != r1) {
            r1 = 1
        } else {
            r1 = 0
        }
        r1 = r1 & 1
        r1 = r1 << 2
        r1 = (r2 + r1) | 0
        r1 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3 + 8)])
        r1 = Int64(heapClassInst.heap32[(r1 + 9)])
        do {
            if (r3 == 0) {
                r3 = r1 >> 2
                heapClassInst .heap32[(r0)] = Int32(r1)
                heapClassInst.heap32[(r3 + 8)] = 0
                r3 = Int64(heapClassInst.heap32[(r0 + 1)])
                if (!(r3 == 0)) {
                    r1 = gNumAlignedFree
                    r1 = r1 >> 2
                    r4 = Int64(heapClassInst.heap32[(r1)])
                    r4 = (r4 + 1) | 0
                    r3 = r3 >> 2
                    heapClassInst.heap32[(r1)] = Int32(r4)
                    r3 = Int64(heapClassInst.heap32[(r3 + (-1))]
                    )
                    heapClassInst.heap32[(g0)] = Int32(r3)
                    free(i7);
                }
                heapClassInst.heap32[(r0 + 1)] = Int32(r2)
                r3 = Int64(heapClassInst.heap32[(r0)])
            } else {
                r4 = r3 >> 2
                r4 = Int64(heapClassInst.heap32[(r4 + 10)])

                if (r4 == r2) {
                    r4 = 1
                } else {
                    r4 = 0
                }
                r4 = r4 & 1
                r4 = r4 << 2
                r4 = (r3 + r4) | 0
                r4 = r4 >> 2
                r5 = r1 >> 2
                heapClassInst.heap32[(r4 + 9)] = Int32(r1)
                heapClassInst.heap32[(r5 + 8)] = Int32(r3)
                r1 = Int64(heapClassInst.heap32[(r0 + 1)])
                if (!(r1 == 0)) {
                    r4 = gNumAlignedFree
                    r4 = r4 >> 2
                    r5 = Int64(heapClassInst.heap32[(r4)])
                    r5 = (r5 + 1) | 0
                    r1 = r1 >> 2
                    heapClassInst.heap32[(r4)] = Int32(r5)
                    r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
                    heapClassInst.heap32[(g0)] = Int32(r1)
                    free(i7);
                }
                heapClassInst.heap32[(r0 + 1)] = Int32(r2)
                while (true) {
                    if (r3 != 0) {
                        r1 = r3 >> 2
                        r2 = Int64(heapClassInst.heap32[(r1 + 10)])
                        r4 = Int64(heapClassInst.heap32[(r1 + 9)])
                        r2 = r2 >> 2
                        r4 = r4 >> 2
                        f0 = Float64(heapClassInst.heapFloat[(r1 + 6)])
                        f1 = Float64(heapClassInst.heapFloat[(r1)])
                        f2 = Float64(heapClassInst.heapFloat[(r1 + 1)])
                        f3 = Float64(heapClassInst.heapFloat[(r1 + 2)])
                        f4 = Float64(heapClassInst.heapFloat[(r1 + 4)])
                        f5 = Float64(heapClassInst.heapFloat[(r1 + 5)])
                        f6 = Float64(heapClassInst.heapFloat[(r4)])
                        f7 = Float64(heapClassInst.heapFloat[(r2)])

                        if (f6 >= f7) {
                            f6 = f7
                        }
                        heapClassInst.heapFloat[(r1)] = Float32(f6)
                        f7 = Float64(heapClassInst.heapFloat[(r4 + 4)])
                        f8 = Float64(heapClassInst.heapFloat[(r2 + 4)])

                        if (f7 <= f8) {
                            f7 = f8
                        }
                        heapClassInst.heapFloat[(r1 + 4)] = Float32(f7)
                        f8 = Float64(heapClassInst.heapFloat[(r4 + 1)])
                        f9 = Float64(heapClassInst.heapFloat[(r2 + 1)])

                        if (f8 <= f9) {
                            f8 = f9
                        }
                        heapClassInst.heapFloat[(r1 + 1)] = Float32(f8)
                        f9 = Float64(heapClassInst.heapFloat[(r4 + 5)])
                        f10 = Float64(heapClassInst.heapFloat[(r2 + 5)])

                        if (f9 <= f10) {
                            f9 = f10
                        }
                        heapClassInst.heapFloat[(r1 + 5)] = Float32(f9)
                        f10 = Float64(heapClassInst.heapFloat[(r4 + 2)])
                        f11 = Float64(heapClassInst.heapFloat[(r2 + 2)])

                        if (f10 >= f11) {
                            f10 = f11
                        }
                        heapClassInst.heapFloat[(r1 + 2)] = Float32(f10)
                        f11 = Float64(heapClassInst.heapFloat[(r4 + 6)])
                        f12 = Float64(heapClassInst.heapFloat[(r2 + 6)])

                        if (f11 <= f12) {
                            f11 = f12
                        }
                        heapClassInst.heapFloat[(r1 + 6)] = Float32(f11)
                        if (!(f0 != f11)) {
                            if (f1 == f6) {
                                r2 = 1
                            } else {
                                r2 = 0
                            }

                            if (f2 == f8) {
                                r4 = 1
                            } else {
                                r4 = 0
                            }
                            r2 = r2 & r4

                            if (f3 == f10) {
                                r4 = 1
                            } else {
                                r4 = 0
                            }
                            r2 = r2 & r4

                            if (f4 == f7) {
                                r4 = 1
                            } else {
                                r4 = 0
                            }
                            r2 = r2 & r4

                            if (f5 == f9) {
                                r4 = 1
                            } else {
                                r4 = 0
                            }
                            r2 = r2 & r4
                            if (r2 != 0) {
                                break
                            }
                        }
                        r3 = Int64(heapClassInst.heap32[(r1 + 8)])
                    } else {
                        break
                    }
                }
                r0 = Int64(heapClassInst.heap32[(r0)])
                commonVariable.r_g0 = r0
                return;
            }
        } while (false);
        commonVariable.r_g0 = r3
        return;
    } else {
        heapClassInst.heap32[(r0)] = 0
        r0 = 0
        commonVariable.r_g0 = r0
        return;
    }
}

@OverflowWrapping
func _ZN6btDbvt6updateEP10btDbvtNodeR12btDbvtAabbMmRK9btVector3f(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 2)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    f0 = Float64(heapClassInst.heapFloat[(r0)])
    r2 = Int64(heapClassInst.heap32[(fp)])
    r3 = Int64(heapClassInst.heap32[(fp + 3)])
    f1 = Float64(heapClassInst.heapFloat[(fp + 4)])
    r4 = r1 >> 2
    f2 = Float64(heapClassInst.heapFloat[(r4)])
    if (f2 <= f0) {
        f2 = Float64(heapClassInst.heapFloat[(r0 + 1)])
        f3 = Float64(heapClassInst.heapFloat[(r4 + 1)])
        if (f3 <= f2) {
            f3 = Float64(heapClassInst.heapFloat[(r4 + 2)])
            f4 = Float64(heapClassInst.heapFloat[(r0 + 2)])
            if (!(f3 > f4)) {
                f3 = Float64(heapClassInst.heapFloat[(r4 + 4)])
                f4 = Float64(heapClassInst.heapFloat[(r0 + 4)])
                if (!(f3 < f4)) {
                    f3 = Float64(heapClassInst.heapFloat[(r4 + 5)])
                    f4 = Float64(heapClassInst.heapFloat[(r0 + 5)])
                    if (!(f3 < f4)) {
                        f3 = Float64(heapClassInst.heapFloat[(r4 + 6)])
                        f4 = Float64(heapClassInst.heapFloat[(r0 + 6)])
                        if (!(f3 < f4)) {
                            r0 = 0
                            commonVariable.r_g0 = r0
                            return;
                        }
                    }
                }
            }
        }
    } else {
        f2 = Float64(heapClassInst.heapFloat[(r0 + 1)])
    }
    f0 = f0 - f1
    f2 = f2 - f1
    heapClassInst.heapFloat[(r0)] = Float32(f0)
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f2)
    f3 = Float64(heapClassInst.heapFloat[(r0 + 2)])
    f3 = f3 - f1
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f3)
    f4 = Float64(heapClassInst.heapFloat[(r0 + 4)])
    f4 = f4 + f1
    heapClassInst.heapFloat[(r0 + 4)] = Float32(f4)
    f5 = Float64(heapClassInst.heapFloat[(r0 + 5)])
    f5 = f5 + f1
    heapClassInst.heapFloat[(r0 + 5)] = Float32(f5)
    f6 = Float64(heapClassInst.heapFloat[(r0 + 6)])
    f1 = f6 + f1
    r3 = r3 >> 2
    heapClassInst.heapFloat[(r0 + 6)] = Float32(f1)
    f6 = Float64(heapClassInst.heapFloat[(r3)])
    f7 = 0.0
    if (f6 <= f7) {
        f0 = f0 + f6
        heapClassInst.heapFloat[(r0)] = Float32(f0)
    } else {
        f0 = f4 + f6
        heapClassInst.heapFloat[(r0 + 4)] = Float32(f0)
    }
    f0 = Float64(heapClassInst.heapFloat[(r3 + 1)])
    if (f0 <= f7) {
        f0 = f2 + f0
        heapClassInst.heapFloat[(r0 + 1)] = Float32(f0)
    } else {
        f0 = f5 + f0
        heapClassInst.heapFloat[(r0 + 5)] = Float32(f0)
    }
    f0 = Float64(heapClassInst.heapFloat[(r3 + 2)])
    if (f0 <= f7) {
        f0 = f3 + f0
        heapClassInst.heapFloat[(r0 + 2)] = Float32(f0)
    } else {
        f0 = f1 + f0
        heapClassInst.heapFloat[(r0 + 6)] = Float32(f0)
    }
    heapClassInst.heap32[(g0)] = Int32(r2)
    heapClassInst.heap32[(g0 + 1)] = Int32(r1)
    _ZL10removeleafP6btDbvtP10btDbvtNode(i7);
    r3 = commonVariable.r_g0
    do {
        if (r3 != 0) {
            r5 = r2 >> 2
            r6 = Int64(heapClassInst.heap32[(r5 + 2)])
            if (r6 < 0) {
                r5 = Int64(heapClassInst.heap32[(r5)])
            } else {
                r7 = (-1)
                while (true) {
                    r5 = r3
                    r7 = (r7 + 1) | 0
                    if (r6 > r7) {
                        r3 = r5 >> 2
                        r3 = Int64(heapClassInst.heap32[(r3 + 8)])
                        if (r3 == 0) {
                            break
                        } else {
                            continue
                        }
                    } else {
                        break
                    }
                }
            }
        } else {
            r5 = 0
        }
    } while (false);
    heapClassInst.heap32[(r4)] = heapClassInst.heap32[(r0)]
    heapClassInst.heap32[(r4 + 1)] = heapClassInst.heap32[(r0 + 1)]
    heapClassInst.heap32[(r4 + 2)] = heapClassInst.heap32[(r0 + 2)]
    heapClassInst.heap32[(r4 + 3)] = heapClassInst.heap32[(r0 + 3)]
    heapClassInst.heap32[(r4 + 4)] = heapClassInst.heap32[(r0 + 4)]
    heapClassInst.heap32[(r4 + 5)] = heapClassInst.heap32[(r0 + 5)]
    heapClassInst.heap32[(r4 + 6)] = heapClassInst.heap32[(r0 + 6)]
    heapClassInst.heap32[(r4 + 7)] = heapClassInst.heap32[(r0 + 7)]
    heapClassInst.heap32[(g0)] = Int32(r2)
    heapClassInst.heap32[(g0 + 1)] = Int32(r5)
    heapClassInst.heap32[(g0 + 2)] = Int32(r1)
    _ZL10insertleafP6btDbvtP10btDbvtNodeS2_(i7);
    r0 = 1
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZL17recursedeletenodeP6btDbvtP10btDbvtNode(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(fp)])
    r2 = r0 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 10)])
    if (!(r3 == 0)) {
        r3 = Int64(heapClassInst.heap32[(r2 + 9)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = Int32(r3)
        _ZL17recursedeletenodeP6btDbvtP10btDbvtNode(i7);
        r2 = Int64(heapClassInst.heap32[(r2 + 10)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = Int32(r2)
        _ZL17recursedeletenodeP6btDbvtP10btDbvtNode(i7);
    }
    r1 = r1 >> 2
    r2 = Int64(heapClassInst.heap32[(r1)])
    if (!(r2 != r0)) {
        heapClassInst.heap32[(r1)] = 0
    }
    r2 = Int64(heapClassInst.heap32[(r1 + 1)])
    if (!(r2 == 0)) {
        r3 = gNumAlignedFree
        r3 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r3)])
        r4 = (r4 + 1) | 0
        r2 = r2 >> 2
        heapClassInst.heap32[(r3)] = Int32(r4)
        r2 = Int64(heapClassInst.heap32[(r2 + (-1))])
        heapClassInst.heap32[(g0)] = Int32(r2)
        free(i7);
    }
    heapClassInst.heap32[(r1 + 1)] = Int32(r0)
    return;
}

@OverflowWrapping
func _ZN6btDbvt19optimizeIncrementalEi(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(fp)])
    if (r0 < 0) {
        r0 = r1 >> 2
        r0 = Int64(heapClassInst.heap32[(r0 + 3)])
    }
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(r2)])
    do {
        if (!(r3 == 0)) {
            if (!(r0 < 1)) {
                while (true) {
                    r3 = 0
                    r4 = r1
                    while (true) {
                        r4 = r4 >> 2
                        r4 = Int64(heapClassInst.heap32[(r4)])
                        r5 = r4 >> 2
                        r6 = Int64(heapClassInst.heap32[(r5 + 10)])
                        if (r6 != 0) {
                            r6 = Int64(heapClassInst.heap32[(r5 + 8)])
                            if (`UIntNative`(r6) > `UIntNative`(r4)) {
                                r7 = r6 >> 2
                                r8 = Int64(heapClassInst.heap32[(r7 + 10)])

                                if (r8 == r4) {
                                    r8 = 1
                                } else {
                                    r8 = 0
                                }
                                r8 = r8 & 1
                                r9 = (r6 + 36) | 0
                                r10 = r8 << 2
                                r11 = (r9 + r10) | 0
                                r11 = r11 >> 2
                                r11 = Int64(heapClassInst.heap32[(r11)])
                                if (r11 == r4) {
                                    r8 = r8 ^ 1
                                    r8 = r8 << 2
                                    r9 = (r9 + r8) | 0
                                    r9 = r9 >> 2
                                    r9 = Int64(heapClassInst.heap32[(r9)])
                                    r11 = Int64(heapClassInst.heap32[(r7 + 8)])
                                    if (r11 == 0) {
                                        heapClassInst.heap32[(r2)] = Int32(r4)
                                    } else {
                                        r12 = r11 >> 2
                                        r12 = Int64(heapClassInst.heap32[(r12 + 10)])

                                        if (r12 == r6) {
                                            r12 = 1
                                        } else {
                                            r12 = 0
                                        }
                                        r12 = r12 & 1
                                        r12 = r12 << 2
                                        r12 = (r11 + r12) | 0
                                        r12 = r12 >> 2
                                        heapClassInst.heap32[(r12 + 9)] = Int32(r4)
                                    }
                                    r12 = r9 >> 2
                                    heapClassInst.heap32[(r12 + 8)] = Int32(r4)
                                    heapClassInst.heap32[(r7 + 8)] = Int32(r4)
                                    heapClassInst.heap32[(r5 + 8)] = Int32(r11)
                                    r11 = Int64(heapClassInst.heap32[(r5 + 9)])
                                    heapClassInst.heap32[(r7 + 9)] = Int32(r11)
                                    r11 = Int64(heapClassInst.heap32[(r5 + 10)])
                                    heapClassInst.heap32[(r7 + 10)] = Int32(r11)
                                    r11 = Int64(heapClassInst.heap32[(r5 + 9)])
                                    r11 = r11 >> 2
                                    heapClassInst.heap32[(r11 + 8)] = Int32(r6)
                                    r11 = Int64(heapClassInst.heap32[(r5 + 10)])
                                    r4 = (r4 + 36) | 0
                                    r10 = (r4 + r10) | 0
                                    r11 = r11 >> 2
                                    r4 = (r4 + r8) | 0
                                    r8 = r10 >> 2
                                    heapClassInst.heap32[(r11 + 8)] = Int32(r6)
                                    r4 = r4 >> 2
                                    heapClassInst.heap32[(r8)] = Int32(r6)
                                    heapClassInst.heap32[(r4)] = Int32(r9)
                                    f0 = Float64(heapClassInst.heapFloat[(r7 + 7)])
                                    f1 = Float64(heapClassInst.heapFloat[(r7 + 6)])
                                    f2 = Float64(heapClassInst.heapFloat[(r7 + 5)])
                                    f3 = Float64(heapClassInst.heapFloat[(r7 + 4)])
                                    f4 = Float64(heapClassInst.heapFloat[(r7 + 3)])
                                    f5 = Float64(heapClassInst.heapFloat[(r7 + 2)])
                                    f6 = Float64(heapClassInst.heapFloat[(r7 + 1)])
                                    f7 = Float64(heapClassInst.heapFloat[(r7)])
                                    heapClassInst.heap32[(r7)] = heapClassInst.heap32[(r5)]
                                    heapClassInst.heap32[(r7 + 1)] = heapClassInst.heap32[(r5 + 1)]
                                    heapClassInst.heap32[(r7 + 2)] = heapClassInst.heap32[(r5 + 2)]
                                    heapClassInst.heap32[(r7 + 3)] = heapClassInst.heap32[(r5 + 3)]
                                    heapClassInst.heap32[(r7 + 4)] = heapClassInst.heap32[(r5 + 4)]
                                    heapClassInst.heap32[(r7 + 5)] = heapClassInst.heap32[(r5 + 5)]
                                    heapClassInst.heap32[(r7 + 6)] = heapClassInst.heap32[(r5 + 6)]
                                    heapClassInst.heap32[(r7 + 7)] = heapClassInst.heap32[(r5 + 7)]
                                    heapClassInst.heapFloat[(r5)] = Float32(f7)
                                    heapClassInst.heapFloat[(r5 + 1)] = Float32(f6)
                                    heapClassInst.heapFloat[(r5 + 2)] = Float32(f5)
                                    heapClassInst.heapFloat[(r5 + 3)] = Float32(f4)
                                    heapClassInst.heapFloat[(r5 + 4)] = Float32(f3)
                                    heapClassInst.heapFloat[(r5 + 5)] = Float32(f2)
                                    heapClassInst.heapFloat[(r5 + 6)] = Float32(f1)
                                    heapClassInst.heapFloat[(r5 + 7)] = Float32(f0)
                                } else {
                                    break
                                }
                            } else {
                                r6 = r4
                            }
                            r4 = Int64(heapClassInst.heap32[(r2 + 4)])
                            r4 = r4 >> r3
                            r4 = r4 & 1
                            r4 = r4 << 2
                            r4 = (r6 + r4) | 0
                            r3 = (r3 + 1) | 0
                            r4 = (r4 + 36) | 0
                            r3 = r3 & 31
                        } else {
                            break
                        }
                    }
                    heapClassInst.heap32[(g0)] = Int32(r1)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r4)
                    _ZL10removeleafP6btDbvtP10btDbvtNode(i7);
                    r3 = commonVariable.r_g0
                    if (r3 != 0) {
                        r3 = Int64(heapClassInst.heap32[(r2)])
                    } else {
                        r3 = 0
                    }
                    heapClassInst.heap32[(g0)] = Int32(r1)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                    heapClassInst.heap32[(g0 + 2)] = Int32(r4)
                    _ZL10insertleafP6btDbvtP10btDbvtNodeS2_(i7);
                    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
                    r0 = (r0 + (-1)) | 0
                    r3 = (r3 + 1) | 0
                    heapClassInst.heap32[(r2 + 4)] = Int32(r3)
                    if (!(r0 != 0)) {
                        break
                    }
                }
                r4 = _E2_str22
                r0 = _E2_str1118
                heapClassInst.heap32[(g0)] = Int32(r4)
                heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                heapClassInst.heap32[(g0 + 2)] = 379
                _assert(i7);
            }
        }
    } while (false);
    return;
}

@OverflowWrapping
func _ZN18btDbvtTreeColliderD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV18btDbvtTreeCollider
    r0 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    return;
}

@OverflowWrapping
func _ZN18btDbvtTreeColliderD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV18btDbvtTreeCollider
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZN18btDbvtTreeCollider7ProcessEPK10btDbvtNodeS2_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(fp + 2)])
    if (!(r0 == r1)) {
        r2 = Int64(heapClassInst.heap32[(fp)])
        r2 = r2 >> 2
        r3 = Int64(heapClassInst.heap32[(r2 + 1)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3 + 24)])
        r4 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r4)])
        r4 = r4 >> 2
        r1 = r1 >> 2
        r0 = r0 >> 2
        r4 = Int64(heapClassInst.heap32[(r4 + 2)])
        r1 = Int64(heapClassInst.heap32[(r1 + 9)])
        r0 = Int64(heapClassInst.heap32[(r0 + 9)])
        heapClassInst.heap32[(g0)] = Int32(r3)
        heapClassInst.heap32[(g0 + 1)] = Int32(r0)
        heapClassInst.heap32[(g0 + 2)] = Int32(r1)
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r0 = Int64(heapClassInst.heap32[(r2 + 1)])
        r0 = r0 >> 2
        r1 = Int64(heapClassInst.heap32[(r0 + 30)])
        r1 = (r1 + 1) | 0
        heapClassInst.heap32[(r0 + 30)] = Int32(r1)
    }
    return;
}

@OverflowWrapping
func _ZN18btDbvtTreeCollider7ProcessEPK10btDbvtNode(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1)])
    r1 = Int64(heapClassInst.heap32[(r1 + 2)])
    r2 = r2 >> 2
    r1 = r1 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 2)])
    r1 = Int64(heapClassInst.heap32[(r1 + 12)])
    r3 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r3)
    heapClassInst.heap32[(g0 + 2)] = Int32(r1)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    return;
}

@OverflowWrapping
func _ZNK16btDbvtBroadphase7getAabbEP17btBroadphaseProxyR9btVector3S3_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(fp + 2)])
    r0 = r0 >> 2
    r1 = r1 >> 2
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r0 + 4)]
    heapClassInst.heap32[(r1 + 1)] = heapClassInst.heap32[(r0 + 5)]
    r2 = Int64(heapClassInst.heap32[(fp + 3)])
    heapClassInst.heap32[(r1 + 2)] = heapClassInst.heap32[(r0 + 6)]
    r2 = r2 >> 2
    heapClassInst.heap32[(r1 + 3)] = heapClassInst.heap32[(r0 + 7)]
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r0 + 8)]
    heapClassInst.heap32[(r2 + 1)] = heapClassInst.heap32[(r0 + 9)]
    heapClassInst.heap32[(r2 + 2)] = heapClassInst.heap32[(r0 + 10)]
    heapClassInst.heap32[(r2 + 3)] = heapClassInst.heap32[(r0 + 11)]
    return;
}

@OverflowWrapping
func _ZN19BroadphaseRayTesterD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV19BroadphaseRayTester
    r0 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    return;
}

@OverflowWrapping
func _ZN19BroadphaseRayTesterD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV19BroadphaseRayTester
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZN19BroadphaseRayTester7ProcessEPK10btDbvtNode(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 1)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(r1)])
    r1 = r1 >> 2
    r2 = r2 >> 2
    r1 = Int64(heapClassInst.heap32[(r1 + 2)])
    r2 = Int64(heapClassInst.heap32[(r2 + 9)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
}

@OverflowWrapping
func _ZN20BroadphaseAabbTesterD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV20BroadphaseAabbTester
    r0 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    return;
}

@OverflowWrapping
func _ZN20BroadphaseAabbTesterD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV20BroadphaseAabbTester
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZN20BroadphaseAabbTester7ProcessEPK10btDbvtNode(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 1)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(r1)])
    r1 = r1 >> 2
    r2 = r2 >> 2
    r1 = Int64(heapClassInst.heap32[(r1 + 2)])
    r2 = Int64(heapClassInst.heap32[(r2 + 9)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphase23getOverlappingPairCacheEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 24)])
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZNK16btDbvtBroadphase23getOverlappingPairCacheEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 24)])
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZNK16btDbvtBroadphase17getBroadphaseAabbER9btVector3S1_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var f11: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0 + 1)])
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    r3 = Int64(heapClassInst.heap32[(fp + 2)])
    r0 = Int64(heapClassInst.heap32[(r0 + 11)])
    if (r1 == 0) {
        if (r0 != 0) {
            r0 = r0 >> 2
            f0 = Float64(heapClassInst.heapFloat[(r0)])
            f2 = Float64(heapClassInst.heapFloat[(r0 + 1)])
            f4 = Float64(heapClassInst.heapFloat[(r0 + 2)])
            f6 = Float64(heapClassInst.heapFloat[(r0 + 3)])
            f1 = Float64(heapClassInst.heapFloat[(r0 + 4)])
            f3 = Float64(heapClassInst.heapFloat[(r0 + 5)])
            f5 = Float64(heapClassInst.heapFloat[(r0 + 6)])
            f7 = Float64(heapClassInst.heapFloat[(r0 + 7)])
        } else {
            f6 = 0.0
            f4 = f6
            f2 = f6
            f0 = f6
            f1 = f6
            f3 = f6
            f5 = f6
            f7 = f6
        }
    } else {
        if (r0 == 0) {
            r0 = r1 >> 2
            f0 = Float64(heapClassInst.heapFloat[(r0)])
            f2 = Float64(heapClassInst.heapFloat[(r0 + 1)])
            f4 = Float64(heapClassInst.heapFloat[(r0 + 2)])
            f6 = Float64(heapClassInst.heapFloat[(r0 + 3)])
            f1 = Float64(heapClassInst.heapFloat[(r0 + 4)])
            f3 = Float64(heapClassInst.heapFloat[(r0 + 5)])
            f5 = Float64(heapClassInst.heapFloat[(r0 + 6)])
            f7 = Float64(heapClassInst.heapFloat[(r0 + 7)])
        } else {
            r1 = r1 >> 2
            r0 = r0 >> 2
            f0 = Float64(heapClassInst.heapFloat[(r1)])
            f1 = Float64(heapClassInst.heapFloat[(r0)])
            f2 = Float64(heapClassInst.heapFloat[(r1 + 4)])
            f3 = Float64(heapClassInst.heapFloat[(r0 + 4)])
            f4 = Float64(heapClassInst.heapFloat[(r1 + 1)])
            f5 = Float64(heapClassInst.heapFloat[(r0 + 1)])
            f6 = Float64(heapClassInst.heapFloat[(r1 + 5)])
            f7 = Float64(heapClassInst.heapFloat[(r0 + 5)])
            f8 = Float64(heapClassInst.heapFloat[(r1 + 2)])
            f9 = Float64(heapClassInst.heapFloat[(r0 + 2)])
            f10 = Float64(heapClassInst.heapFloat[(r1 + 6)])
            f11 = Float64(heapClassInst.heapFloat[(r0 + 6)])

            if (f0 >= f1) {
                f0 = f1
            }
            if (f2 > f3) {
                f1 = f2
            } else {
                f1 = f3
            }
            if (f4 < f5) {
                f2 = f4
            } else {
                f2 = f5
            }
            if (f6 > f7) {
                f3 = f6
            } else {
                f3 = f7
            }
            if (f8 < f9) {
                f4 = f8
            } else {
                f4 = f9
            }
            if (f10 > f11) {
                f5 = f10
            } else {
                f5 = f11
            }
        }
    }
    r0 = r2 >> 2
    heapClassInst.heapFloat[(r0)] = Float32(f0)
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f2)
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f4)
    r1 = r3 >> 2
    heapClassInst.heapFloat[(r0 + 3)] = Float32(f6)
    heapClassInst.heapFloat[(r1)] = Float32(f1)
    heapClassInst.heapFloat[(r1 + 1)] = Float32(f3)
    heapClassInst.heapFloat[(r1 + 2)] = Float32(f5)
    heapClassInst.heapFloat[(r1 + 3)] = Float32(f7)
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphase10printStatsEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphase9resetPoolEP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = 0
    r3 = Int64(heapClassInst.heap32[(r1 + 14)])
    r4 = Int64(heapClassInst.heap32[(r1 + 4)])
    r3 = (r2 - r3) | 0
    if (!(r4 != r3)) {
        r3 = Int64(heapClassInst.heap32[(r1 + 1)])
        if (!(r3 == 0)) {
            r4 = (r0 + 4) | 0
            heapClassInst.heap32[(g0)] = Int32(r4)
            heapClassInst.heap32[(g0 + 1)] = Int32(r3)
            _ZL17recursedeletenodeP6btDbvtP10btDbvtNode(i7);
        }
        r3 = Int64(heapClassInst.heap32[(r1 + 2)])
        if (!(r3 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r1 + 2)] = 0
        heapClassInst.heap32[(r1 + 3)] = (-1)
        r3 = Int64(heapClassInst.heap32[(r1 + 9)])
        if (!(r3 == 0)) {
            r4 = Int64(heapClassInst.heapU8[r0 + 40])
            if (!(r4 == 0)) {
                r4 = gNumAlignedFree
                r4 = r4 >> 2
                r5 = Int64(heapClassInst.heap32[(r4)])
                r5 = (r5 + 1) | 0
                r3 = r3 >> 2
                heapClassInst.heap32[(r4)] = Int32(r5)
                r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
                heapClassInst.heap32[(g0)] = Int32(r3)
                free(i7);
            }
            heapClassInst.heap32[(r1 + 9)] = 0
        }
        r3 = 1
        heapClassInst.heap8[r0 + 40] = Int8(r3)
        heapClassInst.heap32[(r1 + 9)] = 0
        heapClassInst.heap32[(r1 + 7)] = 0
        heapClassInst.heap32[(r1 + 8)] = 0
        heapClassInst.heap32[(r1 + 5)] = 0
        r4 = Int64(heapClassInst.heap32[(r1 + 11)])
        if (!(r4 == 0)) {
            r5 = (r0 + 44) | 0
            heapClassInst.heap32[(g0)] = Int32(r5)
            heapClassInst.heap32[(g0 + 1)] = Int32(r4)
            _ZL17recursedeletenodeP6btDbvtP10btDbvtNode(i7);
        }
        r4 = Int64(heapClassInst.heap32[(r1 + 12)])
        if (!(r4 == 0)) {
            r5 = gNumAlignedFree
            r5 = r5 >> 2
            r6 = Int64(heapClassInst.heap32[(r5)])
            r6 = (r6 + 1) | 0
            r4 = r4 >> 2
            heapClassInst.heap32[(r5)] = Int32(r6)
            r4 = Int64(heapClassInst.heap32[(r4 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r4)
            free(i7);
        }
        heapClassInst.heap32[(r1 + 12)] = 0
        heapClassInst.heap32[(r1 + 13)] = (-1)
        r4 = Int64(heapClassInst.heap32[(r1 + 19)])
        if (!(r4 == 0)) {
            r5 = Int64(heapClassInst.heapU8[r0 + 80])
            if (!(r5 == 0)) {
                r5 = gNumAlignedFree
                r5 = r5 >> 2
                r6 = Int64(heapClassInst.heap32[(r5)])
                r6 = (r6 + 1) | 0
                r4 = r4 >> 2
                heapClassInst.heap32[(r5)] = Int32(r6)
                r4 = Int64(heapClassInst.heap32[(r4 + (-1))])
                heapClassInst.heap32[(g0)] = Int32(r4)
                free(i7);
            }
            heapClassInst.heap32[(r1 + 19)] = 0
        }
        heapClassInst.heap8[r0 + 80] = Int8(r3)
        heapClassInst.heap32[(r1 + 19)] = 0
        heapClassInst.heap32[(r1 + 17)] = 0
        heapClassInst.heap32[(r1 + 18)] = 0
        heapClassInst.heap32[(r1 + 15)] = 0
        heapClassInst.heap8[r0 + 153] = Int8(r2)
        heapClassInst.heap8[r0 + 154] = Int8(r3)
        heapClassInst.heap32[(r1 + 26)] = 0
        heapClassInst.heap32[(r1 + 31)] = 0
        heapClassInst.heap32[(r1 + 27)] = 1
        heapClassInst.heap32[(r1 + 28)] = 0
        heapClassInst.heap32[(r1 + 29)] = 10
        heapClassInst.heap32[(r1 + 30)] = 1
        heapClassInst.heap32[(r1 + 32)] = 0
        heapClassInst.heap32[(r1 + 33)] = 0
        heapClassInst.heap32[(r1 + 34)] = 0
        heapClassInst.heap32[(r1 + 37)] = 0
        heapClassInst.heap32[(r1 + 35)] = 0
        heapClassInst.heap32[(r1 + 36)] = 0
        heapClassInst.heap32[(r1 + 21)] = 0
        heapClassInst.heap32[(r1 + 22)] = 0
        heapClassInst.heap32[(r1 + 23)] = 0
    }
    return;
}

@OverflowWrapping
func _ZN6btDbvt24collideTTpersistentStackEPK10btDbvtNodeS2_RNS_8ICollideE(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    do {
        if (!(r0 == 0)) {
            r1 = Int64(heapClassInst.heap32[(fp + 2)])
            if (!(r1 == 0)) {
                r2 = Int64(heapClassInst.heap32[(fp)])
                r3 = r2 >> 2
                r4 = Int64(heapClassInst.heap32[(r3 + 6)])
                if (!(r4 > 127)) {
                    r5 = Int64(heapClassInst.heap32[(r3 + 7)])
                    if (!(r5 > 127)) {
                        r5 = gNumAlignedAllocs
                        r5 = r5 >> 2
                        r6 = Int64(heapClassInst.heap32[(r5)])
                        r6 = (r6 + 1) | 0
                        heapClassInst.heap32[(r5)] = Int32(r6)
                        heapClassInst.heap32[(g0)] = 1043
                        mallocNew(i7);
                        r5 = commonVariable.r_g0
                        if (r5 != 0) {
                            r6 = 0
                            r7 = (r5 + 4) | 0
                            r6 = (r6 - r7) | 0
                            r6 = r6 & 15
                            r6 = (r5 + r6) | 0
                            r7 = (r6 + 4) | 0
                            r6 = r6 >> 2
                            heapClassInst.heap32[(r6)] = Int32(r5)
                            r5 = r7
                        }
                        r6 = (r2 + 32) | 0
                        if (r4 < 1) {
                            r4 = r6 >> 2
                            r8 = Int64(heapClassInst.heap32[(r4)])
                        } else {
                            r7 = 0
                            while (true) {
                                r8 = r6 >> 2
                                r8 = Int64(heapClassInst.heap32[(r8)])
                                r9 = r7 << 3
                                r10 = (r8 + r9) | 0
                                r10 = r10 >> 2
                                r9 = (r5 + r9) | 0
                                r11 = Int64(heapClassInst.heap32[(r10 + 1)])
                                r10 = Int64(heapClassInst.heap32[(r10)])
                                r9 = r9 >> 2
                                r7 = (r7 + 1) | 0
                                heapClassInst.heap32[(r9)] = Int32(r10)
                                heapClassInst.heap32[(r9 + 1)] = Int32(r11)
                                if (!(r4 != r7)) {
                                    break
                                }
                            }
                            r6 = (r2 + 32) | 0
                        }
                        if (!(r8 == 0)) {
                            r4 = Int64(heapClassInst.heapU8[r2 + 36])
                            if (!(r4 == 0)) {
                                r4 = gNumAlignedFree
                                r4 = r4 >> 2
                                r7 = Int64(heapClassInst.heap32[(r4)])
                                r7 = (r7 + 1) | 0
                                r8 = r8 >> 2
                                heapClassInst.heap32[(r4)] = Int32(r7)
                                r4 = Int64(heapClassInst.heap32[(r8 + (-1))])
                                heapClassInst.heap32[(g0)] = Int32(r4)
                                free(i7);
                            }
                            r4 = r6 >> 2
                            heapClassInst.heap32[(r4)] = 0
                        }
                        r4 = 1
                        r6 = r6 >> 2
                        heapClassInst.heap8[r2 + 36] = Int8(r4)
                        heapClassInst.heap32[(r6)] = Int32(r5)
                        heapClassInst.heap32[(r3 + 7)] = 128
                    }
                }
                r4 = Int64(heapClassInst.heap32[(fp + 3)])
                heapClassInst.heap32[(r3 + 6)] = 128
                r5 = Int64(heapClassInst.heap32[(r3 + 8)])
                r5 = r5 >> 2
                r6 = 1
                r7 = 124
                heapClassInst.heap32[(r5)] = Int32(r0)
                heapClassInst.heap32[(r5 + 1)] = Int32(r1)
                while (true) {
                    r0 = r6
                    r6 = (r0 + (-1)) | 0
                    r1 = Int64(heapClassInst.heap32[(r3 + 8)])
                    r5 = r6 << 3
                    r5 = (r1 + r5) | 0
                    r5 = r5 >> 2
                    r8 = Int64(heapClassInst.heap32[(r5)])
                    r5 = Int64(heapClassInst.heap32[(r5 + 1)])
                    if (r6 > r7) {
                        r7 = Int64(heapClassInst.heap32[(r3 + 6)])
                        r9 = r7 << 1
                        do {
                            if (!(r7 > r9)) {
                                if (!(r7 >= r9)) {
                                    r10 = Int64(heapClassInst.heap32[(r3 + 7)])
                                    if (r10 < r9) {
                                        if (r9 != 0) {
                                            r10 = gNumAlignedAllocs
                                            r10 = r10 >> 2
                                            r11 = Int64(heapClassInst.heap32[(r10)])
                                            r12 = r7 << 4
                                            r11 = (r11 + 1) | 0
                                            r12 = r12 | 3
                                            heapClassInst.heap32[(r10)] = Int32(r11)
                                            r10 = (r12 + 16) | 0
                                            heapClassInst.heap32[(g0)] = Int32(r10)
                                            mallocNew(i7);
                                            r10 = commonVariable.r_g0
                                            if (r10 != 0) {
                                                r11 = 0
                                                r12 = (r10 + 4) | 0
                                                r11 = (r11 - r12) | 0
                                                r11 = r11 & 15
                                                r11 = (r10 + r11) | 0
                                                r12 = (r11 + 4) | 0
                                                r11 = r11 >> 2
                                                heapClassInst.heap32[(r11)] = Int32(r10)
                                                r10 = r12
                                            }
                                        } else {
                                            r10 = 0
                                        }
                                        if (!(r7 < 1)) {
                                            r11 = (r1 + 4) | 0
                                            r12 = (r10 + 4) | 0
                                            r13 = r7
                                            while (true) {
                                                r14 = r11 >> 2
                                                r15 = Int64(heapClassInst.heap32[(r14)])
                                                r14 = Int64(heapClassInst.heap32[(r14 + (-1))])
                                                r16 = r12 >> 2
                                                r13 = (r13 + (-1)) | 0
                                                r11 = (r11 + 8) | 0
                                                r12 = (r12 + 8) | 0
                                                heapClassInst.heap32[(r16 + (-1))] = Int32(r14)
                                                heapClassInst.heap32[(r16)] = Int32(r15)
                                                if (!(r13 != 0)) {
                                                    break
                                                }
                                            }
                                        }
                                        if (!(r1 == 0)) {
                                            r11 = Int64(heapClassInst.heapU8[r2 + 36])
                                            if (!(r11 == 0)) {
                                                r11 = gNumAlignedFree
                                                r11 = r11 >> 2
                                                r12 = Int64(heapClassInst.heap32[(r11)])
                                                r12 = (r12 + 1) | 0
                                                r1 = r1 >> 2
                                                heapClassInst.heap32[(r11)] = Int32(r12)
                                                r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
                                                heapClassInst.heap32[(g0)] = Int32(r1)
                                                free(i7);
                                            }
                                            heapClassInst.heap32[(r3 + 8)] = 0
                                        }
                                        r1 = 1
                                        heapClassInst.heap8[r2 + 36] = Int8(r1)
                                        heapClassInst.heap32[(r3 + 8)] = Int32(r10)
                                        heapClassInst.heap32[(r3 + 7)] = Int32(r9)
                                        if (!(r7 < r9)) {
                                            break
                                        }
                                    }
                                    while (true) {
                                        r7 = (r7 + (-1)) | 0
                                        if (!(r7 != 0)) {
                                            break
                                        }
                                    }
                                }
                            }
                        } while (false);
                        r7 = (r9 + (-4)) | 0
                        heapClassInst.heap32[(r3 + 6)] = Int32(r9)
                    }
                    if (r8 != r5) {
                        r1 = r8 >> 2
                        r9 = r5 >> 2
                        f0 = Float64(heapClassInst.heapFloat[(r1)])
                        f1 = Float64(heapClassInst.heapFloat[(r9 + 4)])
                        if (!(f0 > f1)) {
                            f0 = Float64(heapClassInst.heapFloat[(r1 + 4)])
                            f1 = Float64(heapClassInst.heapFloat[(r9)])
                            if (!(f0 < f1)) {
                                f0 = Float64(heapClassInst.heapFloat[(r1 + 1)])
                                f1 = Float64(heapClassInst.heapFloat[(r9 + 5)])
                                if (!(f0 > f1)) {
                                    f0 = Float64(heapClassInst.heapFloat[(r1 + 5)])
                                    f1 = Float64(heapClassInst.heapFloat[(r9 + 1)])
                                    if (!(f0 < f1)) {
                                        f0 = Float64(heapClassInst.heapFloat[(r1 + 2)])
                                        f1 = Float64(heapClassInst.heapFloat[(r9 + 6)])
                                        if (!(f0 > f1)) {
                                            f0 = Float64(heapClassInst.heapFloat[(r1 + 6)])
                                            f1 = Float64(heapClassInst.heapFloat[(r9 + 2)])
                                            if (!(f0 < f1)) {
                                                r10 = Int64(heapClassInst.heap32[(r9 + 10)])
                                                r11 = Int64(heapClassInst.heap32[(r1 + 10)])
                                                if (r11 == 0) {
                                                    if (r10 == 0) {
                                                        r0 = r4 >> 2
                                                        r0 = Int64(heapClassInst.heap32[(r0)])
                                                        r0 = r0 >> 2
                                                        r0 = Int64(heapClassInst.heap32[(r0 + 2)])
                                                        heapClassInst.heap32[(g0)] = Int32(r4)
                                                        heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                                        heapClassInst.heap32[(g0 + 2)] = Int32(r5)
                                                        __FUNCTION_TABLE__[(r0) >> 2](i7);
                                                    } else {
                                                        r5 = r0 << 3
                                                        r6 = Int64(heapClassInst.heap32[(r3 + 8)])
                                                        r6 = (r6 + r5) | 0
                                                        r1 = Int64(heapClassInst.heap32[(r9 + 9)])
                                                        r6 = r6 >> 2
                                                        heapClassInst.heap32[(r6 + (-2))] = Int32(r8)
                                                        heapClassInst.heap32[(r6 + (-1))] = Int32(r1)
                                                        r6 = Int64(heapClassInst.heap32[(r3 + 8)])
                                                        r5 = (r6 + r5) | 0
                                                        r1 = Int64(heapClassInst.heap32[(r9 + 10)])
                                                        r5 = r5 >> 2
                                                        r6 = (r0 + 1) | 0
                                                        heapClassInst.heap32[(r5)] = Int32(r8)
                                                        heapClassInst.heap32[(r5 + 1)] = Int32(r1)
                                                    }
                                                } else {
                                                    r6 = Int64(heapClassInst.heap32[(r3 + 8)])
                                                    if (r10 == 0) {
                                                        r8 = r0 << 3
                                                        r6 = (r6 + r8) | 0
                                                        r6 = r6 >> 2
                                                        r9 = Int64(heapClassInst.heap32[(r1 + 9)])
                                                        heapClassInst.heap32[(r6 + (-2))] = Int32(r9)
                                                        heapClassInst.heap32[(r6 + (-1))] = Int32(r5)
                                                        r6 = Int64(heapClassInst.heap32[(r3 + 8)])
                                                        r6 = (r6 + r8) | 0
                                                        r8 = Int64(heapClassInst.heap32[(r1 + 10)])
                                                        r9 = r6 >> 2
                                                        r6 = (r0 + 1) | 0
                                                        heapClassInst.heap32[(r9)] = Int32(r8)
                                                        heapClassInst.heap32[(r9 + 1)] = Int32(r5)
                                                    } else {
                                                        r5 = r0 << 3
                                                        r6 = (r6 + r5) | 0
                                                        r8 = Int64(heapClassInst.heap32[(r9 + 9)])
                                                        r10 = Int64(heapClassInst.heap32[(r1 + 9)])
                                                        r6 = r6 >> 2
                                                        heapClassInst.heap32[(r6 + (-2))] = Int32(r10)
                                                        heapClassInst.heap32[(r6 + (-1))] = Int32(r8)
                                                        r6 = Int64(heapClassInst.heap32[(r3 + 8)])
                                                        r6 = (r6 + r5) | 0
                                                        r8 = Int64(heapClassInst.heap32[(r9 + 9)])
                                                        r10 = Int64(heapClassInst.heap32[(r1 + 10)])
                                                        r6 = r6 >> 2
                                                        heapClassInst.heap32[(r6)] = Int32(r10)
                                                        heapClassInst.heap32[(r6 + 1)] = Int32(r8)
                                                        r6 = Int64(heapClassInst.heap32[(r3 + 8)])
                                                        r6 = (r5 + r6) | 0
                                                        r8 = Int64(heapClassInst.heap32[(r9 + 10)])
                                                        r10 = Int64(heapClassInst.heap32[(r1 + 9)])
                                                        r6 = r6 >> 2
                                                        heapClassInst.heap32[(r6 + 2)] = Int32(r10)
                                                        heapClassInst.heap32[(r6 + 3)] = Int32(r8)
                                                        r6 = Int64(heapClassInst.heap32[(r3 + 8)])
                                                        r6 = (r5 + r6) | 0
                                                        r5 = Int64(heapClassInst.heap32[(r9 + 10)])
                                                        r1 = Int64(heapClassInst.heap32[(r1 + 10)])
                                                        r8 = r6 >> 2
                                                        r6 = (r0 + 3) | 0
                                                        heapClassInst.heap32[(r8 + 4)] = Int32(r1)
                                                        heapClassInst.heap32[(r8 + 5)] = Int32(r5)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        r5 = r8 >> 2
                        r8 = Int64(heapClassInst.heap32[(r5 + 10)])
                        if (r8 != 0) {
                            r6 = r0 << 3
                            r8 = Int64(heapClassInst.heap32[(r3 + 8)])
                            r8 = (r8 + r6) | 0
                            r1 = Int64(heapClassInst.heap32[(r5 + 9)])
                            r8 = r8 >> 2
                            heapClassInst.heap32[(r8 + (-2))] = Int32(r1)
                            heapClassInst.heap32[(r8 + (-1))] = Int32(r1)
                            r8 = Int64(heapClassInst.heap32[(r3 + 8)])
                            r8 = (r8 + r6) | 0
                            r1 = Int64(heapClassInst.heap32[(r5 + 10)])
                            r8 = r8 >> 2
                            heapClassInst.heap32[(r8)] = Int32(r1)
                            heapClassInst.heap32[(r8 + 1)] = Int32(r1)
                            r8 = Int64(heapClassInst.heap32[(r3 + 8)])
                            r6 = (r6 + r8) | 0
                            r8 = Int64(heapClassInst.heap32[(r5 + 10)])
                            r5 = Int64(heapClassInst.heap32[(r5 + 9)])
                            r1 = r6 >> 2
                            r6 = (r0 + 2) | 0
                            heapClassInst.heap32[(r1 + 2)] = Int32(r5)
                            heapClassInst.heap32[(r1 + 3)] = Int32(r8)
                        }
                    }
                    if (r6 != 0) {
                        continue
                    } else {
                        break
                    }
                }
            }
        }
    } while (false);
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphase8aabbTestERK9btVector3S2_R24btBroadphaseAabbCallback(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-56)
    var g0 = i7 >> 2;
    r0 = _ZTV20BroadphaseAabbTester
    r1 = sp + (-8)
    r0 = (r0 + 8) | 0
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    r3 = r1 >> 2
    r4 = Int64(heapClassInst.heap32[(fp + 3)])
    heapClassInst.heap32[(fp + (-2))] = Int32(r0)
    r0 = sp + (-40)
    r2 = r2 >> 2
    heapClassInst.heap32[(r3 + 1)] = Int32(r4)
    r3 = r0 >> 2
    heapClassInst.heap32[(fp + (-10))] = heapClassInst.heap32[(r2)]
    heapClassInst.heap32[(r3 + 1)] = heapClassInst.heap32[(r2 + 1)]
    r4 = Int64(heapClassInst.heap32[(fp + 2)])
    heapClassInst.heap32[(r3 + 2)] = heapClassInst.heap32[(r2 + 2)]
    r4 = r4 >> 2
    heapClassInst.heap32[(r3 + 3)] = heapClassInst.heap32[(r2 + 3)]
    heapClassInst.heap32[(r3 + 4)] = heapClassInst.heap32[(r4)]
    heapClassInst.heap32[(r3 + 5)] = heapClassInst.heap32[(r4 + 1)]
    r2 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(r3 + 6)] = heapClassInst.heap32[(r4 + 2)]
    r2 = r2 >> 2
    heapClassInst.heap32[(r3 + 7)] = heapClassInst.heap32[(r4 + 3)]
    r3 = Int64(heapClassInst.heap32[(r2 + 1)])
    heapClassInst.heap32[(g0)] = Int32(r3)
    heapClassInst.heap32[(g0 + 1)] = Int32(r0)
    heapClassInst.heap32[(g0 + 2)] = Int32(r1)
    _ZN6btDbvt9collideTVEPK10btDbvtNodeRK12btDbvtAabbMmRNS_8ICollideE(i7);
    r2 = Int64(heapClassInst.heap32[(r2 + 11)])
    heapClassInst.heap32[(g0)] = Int32(r2)
    heapClassInst.heap32[(g0 + 1)] = Int32(r0)
    heapClassInst.heap32[(g0 + 2)] = Int32(r1)
    _ZN6btDbvt9collideTVEPK10btDbvtNodeRK12btDbvtAabbMmRNS_8ICollideE(i7);
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphase11createProxyERK9btVector3S2_iPvssP12btDispatcherS3_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-64)
    var g0 = i7 >> 2;
    r0 = gNumAlignedAllocs
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = (r1 + 1) | 0
    heapClassInst.heap32[(r0)] = Int32(r2)
    heapClassInst.heap32[(g0)] = 83
    mallocNew(i7);
    r2 = commonVariable.r_g0
    r3 = Int64(heapClassInst.heap32[(fp)])
    r4 = Int64(heapClassInst.heap32[(fp + 1)])
    r5 = Int64(heapClassInst.heap32[(fp + 2)])
    r6 = Int64(heapClassInst.heap32[(fp + 4)])
    r7 = Int64(heapClassInst.heap32[(fp + 5)])
    r8 = Int64(heapClassInst.heap32[(fp + 6)])
    if (r2 != 0) {
        r9 = 0
        r10 = (r2 + 4) | 0
        r9 = (r9 - r10) | 0
        r9 = r9 & 15
        r9 = (r2 + r9) | 0
        r10 = (r9 + 4) | 0
        r9 = r9 >> 2
        heapClassInst.heap32[(r9)] = Int32(r2)
        r2 = r10
    }
    r9 = r2 >> 2
    heapClassInst.heap32[(r9)] = Int32(r6)
    heapClassInst.heap16[(r2 + 4) >> 1] = Int16(r7)
    r4 = r4 >> 2
    heapClassInst.heap16[(r2 + 6) >> 1] = Int16(r8)
    f0 = Float64(heapClassInst.heapFloat[(r4)])
    heapClassInst.heapFloat[(r9 + 4)] = Float32(f0)
    f1 = Float64(heapClassInst.heapFloat[(r4 + 1)])
    heapClassInst.heapFloat[(r9 + 5)] = Float32(f1)
    f2 = Float64(heapClassInst.heapFloat[(r4 + 2)])
    heapClassInst.heapFloat[(r9 + 6)] = Float32(f2)
    f3 = Float64(heapClassInst.heapFloat[(r4 + 3)])
    r4 = r5 >> 2
    heapClassInst.heapFloat[(r9 + 7)] = Float32(f3)
    f4 = Float64(heapClassInst.heapFloat[(r4)])
    heapClassInst.heapFloat[(r9 + 8)] = Float32(f4)
    f5 = Float64(heapClassInst.heapFloat[(r4 + 1)])
    heapClassInst.heapFloat[(r9 + 9)] = Float32(f5)
    f6 = Float64(heapClassInst.heapFloat[(r4 + 2)])
    heapClassInst.heapFloat[(r9 + 10)] = Float32(f6)
    f7 = Float64(heapClassInst.heapFloat[(r4 + 3)])
    heapClassInst.heapFloat[(r9 + 11)] = Float32(f7)
    heapClassInst.heap32[(r9 + 2)] = 0
    heapClassInst.heap32[(r9 + 14)] = 0
    r4 = sp + (-32)
    heapClassInst.heap32[(r9 + 13)] = 0
    r5 = r4 >> 2
    heapClassInst.heapFloat[(fp + (-8))] = Float32(f0)
    heapClassInst.heapFloat[(r5 + 1)] = Float32(f1)
    heapClassInst.heapFloat[(r5 + 2)] = Float32(f2)
    heapClassInst.heapFloat[(r5 + 3)] = Float32(f3)
    heapClassInst.heapFloat[(r5 + 4)] = Float32(f4)
    heapClassInst.heapFloat[(r5 + 5)] = Float32(f5)
    heapClassInst.heapFloat[(r5 + 6)] = Float32(f6)
    r6 = r3 >> 2
    heapClassInst.heapFloat[(r5 + 7)] = Float32(f7)
    r5 = Int64(heapClassInst.heap32[(r6 + 26)])
    heapClassInst.heap32[(r9 + 15)] = Int32(r5)
    r5 = Int64(heapClassInst.heap32[(r6 + 37)])
    r5 = (r5 + 1) | 0
    heapClassInst.heap32[(r6 + 37)] = Int32(r5)
    heapClassInst.heap32[(r9 + 3)] = Int32(r5)
    r5 = Int64(heapClassInst.heap32[(r6 + 2)])
    r7 = (r3 + 4) | 0
    if (r5 == 0) {
        r5 = (r1 + 2) | 0
        heapClassInst.heap32[(r0)] = Int32(r5)
        heapClassInst.heap32[(g0)] = 63
        mallocNew(i7);
        r5 = commonVariable.r_g0
        if (r5 != 0) {
            r0 = 0
            r1 = (r5 + 4) | 0
            r0 = (r0 - r1) | 0
            r0 = r0 & 15
            r0 = (r5 + r0) | 0
            r1 = (r0 + 4) | 0
            r0 = r0 >> 2
            heapClassInst.heap32[(r0)] = Int32(r5)
            r5 = r1
        }
    } else {
        heapClassInst.heap32[(r6 + 2)] = 0
    }
    r0 = r5 >> 2
    heapClassInst.heap32[(r0 + 8)] = 0
    heapClassInst.heap32[(r0 + 9)] = Int32(r2)
    heapClassInst.heap32[(r0 + 10)] = 0
    heapClassInst.heapFloat[(r0)] = Float32(f0)
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f1)
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f2)
    heapClassInst.heapFloat[(r0 + 3)] = Float32(f3)
    heapClassInst.heapFloat[(r0 + 4)] = Float32(f4)
    heapClassInst.heapFloat[(r0 + 5)] = Float32(f5)
    heapClassInst.heapFloat[(r0 + 6)] = Float32(f6)
    heapClassInst.heapFloat[(r0 + 7)] = Float32(f7)
    r0 = Int64(heapClassInst.heap32[(r6 + 1)])
    heapClassInst.heap32[(g0)] = Int32(r7)
    heapClassInst.heap32[(g0 + 1)] = Int32(r0)
    heapClassInst.heap32[(g0 + 2)] = Int32(r5)
    _ZL10insertleafP6btDbvtP10btDbvtNodeS2_(i7);
    r0 = Int64(heapClassInst.heap32[(r6 + 4)])
    r0 = (r0 + 1) | 0
    heapClassInst.heap32[(r6 + 4)] = Int32(r0)
    heapClassInst.heap32[(r9 + 12)] = Int32(r5)
    r0 = Int64(heapClassInst.heap32[(r6 + 26)])
    r0 = r0 << 2
    r0 = (r3 + r0) | 0
    r0 = r0 >> 2
    heapClassInst.heap32[(r9 + 13)] = 0
    r1 = Int64(heapClassInst.heap32[(r0 + 21)])
    heapClassInst.heap32[(r9 + 14)] = Int32(r1)
    if (!(r1 == 0)) {
        r1 = r1 >> 2
        heapClassInst.heap32[(r1 + 13)] = Int32(r2)
    }
    heapClassInst.heap32[(r0 + 21)] = Int32(r2)
    r0 = Int64(heapClassInst.heapU8[r3 + 153])
    if (!(r0 != 0)) {
        r0 = _ZTV18btDbvtTreeCollider
        r0 = (r0 + 8) | 0
        r1 = sp + (-48)
        r5 = r1 >> 2
        heapClassInst.heap32[(fp + (-12))] = Int32(r0)
        heapClassInst.heap32[(r5 + 1)] = Int32(r3)
        heapClassInst.heap32[(r5 + 2)] = Int32(r2)
        r3 = Int64(heapClassInst.heap32[(r6 + 1)])
        heapClassInst.heap32[(g0)] = Int32(r3)
        heapClassInst.heap32[(g0 + 1)] = Int32(r4)
        heapClassInst.heap32[(g0 + 2)] = Int32(r1)
        _ZN6btDbvt9collideTVEPK10btDbvtNodeRK12btDbvtAabbMmRNS_8ICollideE(i7);
        r3 = Int64(heapClassInst.heap32[(r6 + 11)])
        heapClassInst.heap32[(g0)] = Int32(r3)
        heapClassInst.heap32[(g0 + 1)] = Int32(r4)
        heapClassInst.heap32[(g0 + 2)] = Int32(r1)
        _ZN6btDbvt9collideTVEPK10btDbvtNodeRK12btDbvtAabbMmRNS_8ICollideE(i7);
        heapClassInst.heap32[(fp + (-12))] = Int32(r0)
    }
    commonVariable.r_g0 = r2
    return;
}

@OverflowWrapping
func _ZNK6btDbvt15rayTestInternalEPK10btDbvtNodeRK9btVector3S5_S5_PjfS5_S5_RNS_8ICollideE(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var r17: Int64 = 0
    var r18: Int64 = 0
    var r19: Int64 = 0
    var r20: Int64 = 0
    var r21: Int64 = 0
    var r22: Int64 = 0
    var r23: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-40)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    if (!(r0 == 0)) {
        r1 = Int64(heapClassInst.heap32[(fp + 1)])
        r2 = Int64(heapClassInst.heap32[(fp + 2)])
        r3 = Int64(heapClassInst.heap32[(fp + 3)])
        f0 = Float64(heapClassInst.heapFloat[(fp + 4)])
        r4 = Int64(heapClassInst.heap32[(fp + 5)])
        r5 = Int64(heapClassInst.heap32[(fp + 6)])
        r6 = Int64(heapClassInst.heap32[(fp + 7)])
        r7 = gNumAlignedAllocs
        r7 = r7 >> 2
        r8 = Int64(heapClassInst.heap32[(r7)])
        r8 = (r8 + 1) | 0
        heapClassInst.heap32[(r7)] = Int32(r8)
        heapClassInst.heap32[(g0)] = 531
        mallocNew(i7);
        r8 = commonVariable.r_g0
        if (r8 != 0) {
            r9 = 0
            r10 = (r8 + 4) | 0
            r9 = (r9 - r10) | 0
            r9 = r9 & 15
            r9 = (r8 + r9) | 0
            r10 = (r9 + 4) | 0
            r9 = r9 >> 2
            heapClassInst.heap32[(r9)] = Int32(r8)
            r8 = r10
        }
        r9 = 0
        while (true) {
            r10 = r9 << 2
            r10 = (r8 + r10) | 0
            r9 = (r9 + 1) | 0
            r10 = r10 >> 2
            heapClassInst.heap32[(r10)] = 0
            if (!(r9 != 128)) {
                break
            }
        }
        r9 = 128
        r10 = 1
        r11 = 126
        r12 = r8 >> 2
        heapClassInst.heap32[(r12)] = Int32(r0)
        r0 = r9
        r12 = r10
        while (true) {
            r13 = r12
            r12 = (r13 + (-1)) | 0
            r14 = r12 << 2
            r14 = (r8 + r14) | 0
            r14 = r14 >> 2
            r14 = Int64(heapClassInst.heap32[(r14)])
            r15 = r14 >> 2
            r16 = r5 >> 2
            f1 = Float64(heapClassInst.heapFloat[(r15 + 2)])
            f2 = Float64(heapClassInst.heapFloat[(r16 + 2)])
            f3 = Float64(heapClassInst.heapFloat[(r15 + 1)])
            f4 = Float64(heapClassInst.heapFloat[(r16 + 1)])
            f5 = Float64(heapClassInst.heapFloat[(r15)])
            f6 = Float64(heapClassInst.heapFloat[(r16)])
            r16 = sp + (-32)
            f5 = f5 - f6
            r17 = r16 >> 2
            f3 = f3 - f4
            heapClassInst.heapFloat[(fp + (-8))] = Float32(f5)
            f1 = f1 - f2
            heapClassInst.heapFloat[(r17 + 1)] = Float32(f3)
            heapClassInst.heapFloat[(r17 + 2)] = Float32(f1)
            heapClassInst.heap32[(r17 + 3)] = 0
            r18 = r4 >> 2
            f1 = Float64(heapClassInst.heapFloat[(r15 + 6)])
            f2 = Float64(heapClassInst.heapFloat[(r18 + 2)])
            f3 = Float64(heapClassInst.heapFloat[(r15 + 5)])
            f4 = Float64(heapClassInst.heapFloat[(r18 + 1)])
            f5 = Float64(heapClassInst.heapFloat[(r15 + 4)])
            f6 = Float64(heapClassInst.heapFloat[(r18)])
            f5 = f5 - f6
            f3 = f3 - f4
            heapClassInst.heapFloat[(r17 + 4)] = Float32(f5)
            f1 = f1 - f2
            heapClassInst.heapFloat[(r17 + 5)] = Float32(f3)
            heapClassInst.heapFloat[(r17 + 6)] = Float32(f1)
            r18 = r3 >> 2
            heapClassInst.heap32[(r17 + 7)] = 0
            r17 = Int64(heapClassInst.heap32[(r18)])
            r19 = Int64(heapClassInst.heap32[(r18 + 1)])
            r20 = (r10 - r19) | 0
            r21 = r17 << 4
            r20 = r20 << 4
            r21 = (r16 + r21) | 0
            r20 = (r16 + r20) | 0
            r22 = r1 >> 2
            r21 = r21 >> 2
            r20 = r20 >> 2
            r23 = r2 >> 2
            f1 = Float64(heapClassInst.heapFloat[(r21)])
            f2 = Float64(heapClassInst.heapFloat[(r22)])
            f3 = Float64(heapClassInst.heapFloat[(r20 + 1)])
            f4 = Float64(heapClassInst.heapFloat[(r22 + 1)])
            f1 = f1 - f2
            f5 = Float64(heapClassInst.heapFloat[(r23)])
            f3 = f3 - f4
            f6 = Float64(heapClassInst.heapFloat[(r23 + 1)])
            f1 = f1 * f5
            f3 = f3 * f6
            if (!(f1 > f3)) {
                r17 = (r10 - r17) | 0
                r17 = r17 << 4
                r19 = r19 << 4
                r17 = (r16 + r17) | 0
                r19 = (r16 + r19) | 0
                r17 = r17 >> 2
                r19 = r19 >> 2
                f7 = Float64(heapClassInst.heapFloat[(r17)])
                f8 = Float64(heapClassInst.heapFloat[(r19 + 1)])
                f2 = f7 - f2
                f4 = f8 - f4
                f2 = f2 * f5
                f4 = f4 * f6
                if (f4 <= f2) {
                    r17 = Int64(heapClassInst.heap32[(r18 + 2)])
                    r18 = 1
                    r18 = (r18 - r17) | 0
                    r18 = r18 << 4
                    r18 = (r16 + r18) | 0
                    r18 = r18 >> 2
                    f5 = Float64(heapClassInst.heapFloat[(r18 + 2)])
                    f6 = Float64(heapClassInst.heapFloat[(r22 + 2)])
                    f5 = f5 - f6
                    f7 = Float64(heapClassInst.heapFloat[(r23 + 2)])

                    if (f1 < f4) {
                        f1 = f4
                    }
                    f4 = f5 * f7
                    if (!(f1 > f4)) {
                        r17 = r17 << 4
                        r16 = (r16 + r17) | 0
                        r16 = r16 >> 2
                        f5 = Float64(heapClassInst.heapFloat[(r16 + 2)])
                        f5 = f5 - f6

                        if (f3 < f2) {
                            f2 = f3
                        }
                        f3 = f5 * f7
                        if (!(f3 > f2)) {
                            if (f1 < f3) {
                                f1 = f3
                            }
                            if (!(f1 >= f0)) {
                                if (f4 < f2) {
                                    f1 = f4
                                } else {
                                    f1 = f2
                                }
                                f2 = 0.0
                                if (!(f1 <= f2)) {
                                    r16 = Int64(heapClassInst.heap32[(r15 + 10)])
                                    if (r16 == 0) {
                                        r13 = r6 >> 2
                                        r13 = Int64(heapClassInst.heap32[(r13)])
                                        r13 = r13 >> 2
                                        r13 = Int64(heapClassInst.heap32[(r13 + 3)])
                                        heapClassInst.heap32[(g0)] = Int32(r6)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r14)
                                        __FUNCTION_TABLE__[(r13) >> 2](i7);
                                    } else {
                                        if (r12 > r11) {
                                            r14 = r0 << 1
                                            do {
                                                if (r0 <= r14) {
                                                    if (!(r0 >= r14)) {
                                                        if (r9 < r14) {
                                                            if (r14 != 0) {
                                                                r9 = Int64(heapClassInst.heap32[(r7)])
                                                                r11 = r0 << 3
                                                                r9 = (r9 + 1) | 0
                                                                r11 = r11 | 3
                                                                heapClassInst.heap32[(r7)] = Int32(r9)
                                                                r9 = (r11 + 16) | 0
                                                                heapClassInst.heap32[(g0)] = Int32(r9)
                                                                mallocNew(i7);
                                                                r9 = commonVariable.r_g0
                                                                if (r9 != 0) {
                                                                    r11 = 0
                                                                    r12 = (r9 + 4) | 0
                                                                    r11 = (r11 - r12) | 0
                                                                    r11 = r11 & 15
                                                                    r11 = (r9 + r11) | 0
                                                                    r12 = (r11 + 4) | 0
                                                                    r11 = r11 >> 2
                                                                    heapClassInst.heap32[(r11)] = Int32(r9)
                                                                    r9 = r12
                                                                }
                                                            } else {
                                                                r9 = 0
                                                            }
                                                            if (!(r0 < 1)) {
                                                                r11 = r8
                                                                r12 = r9
                                                                r16 = r0
                                                                while (true) {
                                                                    r17 = r11 >> 2
                                                                    r16 = (r16 + (-1)) | 0
                                                                    r18 = (r12 + 4) | 0
                                                                    r11 = (r11 + 4) | 0
                                                                    r12 = r12 >> 2
                                                                    r17 = Int64(heapClassInst.heap32[(r17)])
                                                                    heapClassInst.heap32[(r12)] = Int32(r17)
                                                                    r12 = r18
                                                                    if (!(r16 != 0)) {
                                                                        break
                                                                    }
                                                                }
                                                            }
                                                            if (!(r8 == 0)) {
                                                                r11 = gNumAlignedFree
                                                                r11 = r11 >> 2
                                                                r12 = Int64(heapClassInst.heap32[(r11)])
                                                                r12 = (r12 + 1) | 0
                                                                r8 = r8 >> 2
                                                                heapClassInst.heap32[(r11)] = Int32(r12)
                                                                r8 = Int64(heapClassInst.heap32[(r8 + (-1))])
                                                                heapClassInst.heap32[(g0)] = Int32(r8)
                                                                free(i7);
                                                            }
                                                            if (r0 < r14) {
                                                                r8 = r9
                                                                r9 = r14
                                                            } else {
                                                                r8 = r9
                                                                r9 = r14
                                                                break
                                                            }
                                                        }
                                                        r11 = r0
                                                        while (true) {
                                                            r12 = r0 << 2
                                                            r12 = (r8 + r12) | 0
                                                            r11 = (r11 + (-1)) | 0
                                                            r0 = (r0 + 1) | 0
                                                            r12 = r12 >> 2
                                                            heapClassInst.heap32[(r12)] = 0
                                                            if (!(r11 != 0)) {
                                                                break
                                                            }
                                                        }
                                                    }
                                                }
                                            } while (false);
                                            r11 = (r14 + (-2)) | 0
                                        } else {
                                            r14 = r0
                                        }
                                        r0 = r13 << 2
                                        r0 = (r8 + r0) | 0
                                        r0 = r0 >> 2
                                        r12 = Int64(heapClassInst.heap32[(r15 + 9)])
                                        heapClassInst.heap32[(r0 + (-1))] = Int32(r12)
                                        r15 = Int64(heapClassInst.heap32[(r15 + 10)])
                                        r12 = (r13 + 1) | 0
                                        heapClassInst.heap32[(r0)] = Int32(r15)
                                        r0 = r14
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (!(r12 != 0)) {
                break
            }
        }
        if (!(r8 == 0)) {
            r0 = gNumAlignedFree
            r0 = r0 >> 2
            r1 = Int64(heapClassInst.heap32[(r0)])
            r1 = (r1 + 1) | 0
            r2 = r8 >> 2
            heapClassInst.heap32[(r0)] = Int32(r1)
            r0 = Int64(heapClassInst.heap32[(r2 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r0)
            free(i7);
        }
    }
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphase7rayTestERK9btVector3S2_R23btBroadphaseRayCallbackS2_S2_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var f0: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-40)
    var g0 = i7 >> 2;
    r0 = _ZTV19BroadphaseRayTester
    r1 = sp + (-8)
    r0 = (r0 + 8) | 0
    r2 = Int64(heapClassInst.heap32[(fp + 3)])
    r3 = Int64(heapClassInst.heap32[(fp)])
    r4 = r1 >> 2
    heapClassInst.heap32[(fp + (-2))] = Int32(r0)
    heapClassInst.heap32[(r4 + 1)] = Int32(r2)
    r0 = r2 >> 2
    r3 = r3 >> 2
    f0 = Float64(heapClassInst.heapFloat[(r0 + 8)])
    r4 = Int64(heapClassInst.heap32[(r3 + 1)])
    r5 = Int64(heapClassInst.heap32[(fp + 1)])
    r6 = (r2 + 4) | 0
    r2 = (r2 + 20) | 0
    r7 = Int64(heapClassInst.heap32[(fp + 4)])
    r8 = Int64(heapClassInst.heap32[(fp + 5)])
    heapClassInst.heap32[(g0)] = Int32(r4)
    heapClassInst.heap32[(g0 + 1)] = Int32(r5)
    heapClassInst.heap32[(g0 + 2)] = Int32(r6)
    heapClassInst.heap32[(g0 + 3)] = Int32(r2)
    heapClassInst.heapFloat[(g0 + 4)] = Float32(f0)
    heapClassInst.heap32[(g0 + 5)] = Int32(r7)
    heapClassInst.heap32[(g0 + 6)] = Int32(r8)
    heapClassInst.heap32[(g0 + 7)] = Int32(r1)
    _ZNK6btDbvt15rayTestInternalEPK10btDbvtNodeRK9btVector3S5_S5_PjfS5_S5_RNS_8ICollideE(i7);
    f0 = Float64(heapClassInst.heapFloat[(r0 + 8)])
    r0 = Int64(heapClassInst.heap32[(r3 + 11)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r5)
    heapClassInst.heap32[(g0 + 2)] = Int32(r6)
    heapClassInst.heap32[(g0 + 3)] = Int32(r2)
    heapClassInst.heapFloat[(g0 + 4)] = Float32(f0)
    heapClassInst.heap32[(g0 + 5)] = Int32(r7)
    heapClassInst.heap32[(g0 + 6)] = Int32(r8)
    heapClassInst.heap32[(g0 + 7)] = Int32(r1)
    _ZNK6btDbvt15rayTestInternalEPK10btDbvtNodeRK9btVector3S5_S5_PjfS5_S5_RNS_8ICollideE(i7);
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphase12destroyProxyEP17btBroadphaseProxyP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(fp)])
    r3 = Int64(heapClassInst.heap32[(fp + 2)])
    r4 = Int64(heapClassInst.heap32[(r1 + 12)])
    r5 = Int64(heapClassInst.heap32[(r1 + 15)])
    if (r5 != 2) {
        r5 = (r2 + 4) | 0
        heapClassInst.heap32[(g0)] = Int32(r5)
        heapClassInst.heap32[(g0 + 1)] = Int32(r4)
        r5 = r2 >> 2
        _ZL10removeleafP6btDbvtP10btDbvtNode(i7);
        r6 = Int64(heapClassInst.heap32[(r5 + 2)])
        if (!(r6 == 0)) {
            r7 = gNumAlignedFree
            r7 = r7 >> 2
            r8 = Int64(heapClassInst.heap32[(r7)])
            r8 = (r8 + 1) | 0
            r6 = r6 >> 2
            heapClassInst.heap32[(r7)] = Int32(r8)
            r6 = Int64(heapClassInst.heap32[(r6 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r6)
            free(i7);
        }
        heapClassInst.heap32[(r5 + 2)] = Int32(r4)
        r4 = Int64(heapClassInst.heap32[(r5 + 4)])
        r4 = (r4 + (-1)) | 0
        heapClassInst.heap32[(r5 + 4)] = Int32(r4)
    } else {
        r5 = (r2 + 44) | 0
        heapClassInst.heap32[(g0)] = Int32(r5)
        heapClassInst.heap32[(g0 + 1)] = Int32(r4)
        r5 = r2 >> 2
        _ZL10removeleafP6btDbvtP10btDbvtNode(i7);
        r6 = Int64(heapClassInst.heap32[(r5 + 12)])
        if (!(r6 == 0)) {
            r7 = gNumAlignedFree
            r7 = r7 >> 2
            r8 = Int64(heapClassInst.heap32[(r7)])
            r8 = (r8 + 1) | 0
            r6 = r6 >> 2
            heapClassInst.heap32[(r7)] = Int32(r8)
            r6 = Int64(heapClassInst.heap32[(r6 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r6)
            free(i7);
        }
        heapClassInst.heap32[(r5 + 12)] = Int32(r4)
        r4 = Int64(heapClassInst.heap32[(r5 + 14)])
        r4 = (r4 + (-1)) | 0
        heapClassInst.heap32[(r5 + 14)] = Int32(r4)
    }
    r4 = Int64(heapClassInst.heap32[(r1 + 13)])
    r5 = Int64(heapClassInst.heap32[(r1 + 14)])
    if (r4 == 0) {
        r4 = Int64(heapClassInst.heap32[(r1 + 15)])
        r4 = r4 << 2
        r4 = (r2 + r4) | 0
        r4 = r4 >> 2
        heapClassInst.heap32[(r4 + 21)] = Int32(r5)
    } else {
        r4 = r4 >> 2
        heapClassInst.heap32[(r4 + 14)] = Int32(r5)
    }
    r4 = Int64(heapClassInst.heap32[(r1 + 14)])
    if (!(r4 == 0)) {
        r4 = r4 >> 2
        r5 = Int64(heapClassInst.heap32[(r1 + 13)])
        heapClassInst.heap32[(r4 + 13)] = Int32(r5)
    }
    r4 = r2 >> 2
    r4 = Int64(heapClassInst.heap32[(r4 + 24)])
    r5 = r4 >> 2
    r5 = Int64(heapClassInst.heap32[(r5)])
    r5 = r5 >> 2
    r5 = Int64(heapClassInst.heap32[(r5 + 4)])
    heapClassInst.heap32[(g0)] = Int32(r4)
    heapClassInst.heap32[(g0 + 1)] = Int32(r0)
    heapClassInst.heap32[(g0 + 2)] = Int32(r3)
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    if (!(r0 == 0)) {
        r0 = gNumAlignedFree
        r0 = r0 >> 2
        r3 = Int64(heapClassInst.heap32[(r0)])
        r3 = (r3 + 1) | 0
        heapClassInst.heap32[(r0)] = Int32(r3)
        r0 = Int64(heapClassInst.heap32[(r1 + (-1))])
        heapClassInst.heap32[(g0)] = Int32(r0)
        free(i7);
    }
    r0 = 1
    heapClassInst.heap8[r2 + 154] = Int8(r0)
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphase25calculateOverlappingPairsEP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-48)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 4)])
    r3 = Int64(heapClassInst.heap32[(r1 + 28)])
    r2 = (r3 * r2) | 0
    r2 = (r2 / 100) | 0
    r3 = (r0 + 4) | 0
    r2 = (r2 + 1) | 0
    heapClassInst.heap32[(g0)] = Int32(r3)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    _ZN6btDbvt19optimizeIncrementalEi(i7);
    r2 = Int64(heapClassInst.heap32[(r1 + 31)])
    if (!(r2 == 0)) {
        r2 = Int64(heapClassInst.heap32[(r1 + 14)])
        r4 = Int64(heapClassInst.heap32[(r1 + 27)])
        r2 = (r4 * r2) | 0
        r4 = (r2 / 100) | 0
        r5 = (r0 + 44) | 0
        r4 = (r4 + 1) | 0
        heapClassInst.heap32[(g0)] = Int32(r5)
        heapClassInst.heap32[(g0 + 1)] = Int32(r4)
        _ZN6btDbvt19optimizeIncrementalEi(i7);
        r2 = (r2 / (-100)) | 0
        r4 = Int64(heapClassInst.heap32[(r1 + 31)])
        r2 = (r2 + r4) | 0
        r2 = (r2 + (-1)) | 0
        r4 = 0

        if (r2 < 0) {
            r2 = r4
        }
        heapClassInst.heap32[(r1 + 31)] = Int32(r2)
    }
    r2 = Int64(heapClassInst.heap32[(r1 + 26)])
    r2 = (r2 + 1) | 0
    r4 = r2 >> 31
    r4 = (r2 + r4) | 0
    r4 = r4 & (-2)
    r2 = (r2 - r4) | 0
    r4 = r2 << 2
    r4 = (r0 + r4) | 0
    r4 = r4 >> 2
    heapClassInst.heap32[(r1 + 26)] = Int32(r2)
    r2 = Int64(heapClassInst.heap32[(r4 + 21)])
    if (!(r2 == 0)) {
        r4 = (r0 + 44) | 0
        while (true) {
            r5 = r2 >> 2
            r6 = Int64(heapClassInst.heap32[(r5 + 13)])
            r7 = Int64(heapClassInst.heap32[(r5 + 14)])
            if (r6 == 0) {
                r6 = Int64(heapClassInst.heap32[(r5 + 15)])
                r6 = r6 << 2
                r6 = (r0 + r6) | 0
                r6 = r6 >> 2
                heapClassInst.heap32[(r6 + 21)] = Int32(r7)
            } else {
                r6 = r6 >> 2
                heapClassInst.heap32[(r6 + 14)] = Int32(r7)
            }
            r6 = Int64(heapClassInst.heap32[(r5 + 14)])
            if (!(r6 == 0)) {
                r6 = r6 >> 2
                r8 = Int64(heapClassInst.heap32[(r5 + 13)])
                heapClassInst.heap32[(r6 + 13)] = Int32(r8)
            }
            heapClassInst.heap32[(r5 + 13)] = 0
            r6 = Int64(heapClassInst.heap32[(r1 + 23)])
            heapClassInst.heap32[(r5 + 14)] = Int32(r6)
            r6 = Int64(heapClassInst.heap32[(r1 + 23)])
            if (!(r6 == 0)) {
                r6 = r6 >> 2
                heapClassInst.heap32[(r6 + 13)] = Int32(r2)
            }
            heapClassInst.heap32[(r1 + 23)] = Int32(r2)
            r6 = Int64(heapClassInst.heap32[(r5 + 12)])
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = Int32(r6)
            _ZL10removeleafP6btDbvtP10btDbvtNode(i7);
            r8 = Int64(heapClassInst.heap32[(r1 + 2)])
            if (!(r8 == 0)) {
                r9 = gNumAlignedFree
                r9 = r9 >> 2
                r10 = Int64(heapClassInst.heap32[(r9)])
                r10 = (r10 + 1) | 0
                r8 = r8 >> 2
                heapClassInst.heap32[(r9)] = Int32(r10)
                r8 = Int64(heapClassInst.heap32[(r8 + (-1))])
                heapClassInst.heap32[(g0)] = Int32(r8)
                free(i7);
            }
            heapClassInst.heap32[(r1 + 2)] = Int32(r6)
            r6 = Int64(heapClassInst.heap32[(r1 + 4)])
            r6 = (r6 + (-1)) | 0
            heapClassInst.heap32[(r1 + 4)] = Int32(r6)
            r6 = Int64(heapClassInst.heap32[(r1 + 12)])
            f0 = Float64(heapClassInst.heapFloat[(r5 + 4)])
            f1 = Float64(heapClassInst.heapFloat[(r5 + 5)])
            f2 = Float64(heapClassInst.heapFloat[(r5 + 6)])
            f3 = Float64(heapClassInst.heapFloat[(r5 + 7)])
            f4 = Float64(heapClassInst.heapFloat[(r5 + 8)])
            f5 = Float64(heapClassInst.heapFloat[(r5 + 9)])
            f6 = Float64(heapClassInst.heapFloat[(r5 + 10)])
            f7 = Float64(heapClassInst.heapFloat[(r5 + 11)])
            if (r6 == 0) {
                r6 = gNumAlignedAllocs
                r6 = r6 >> 2
                r8 = Int64(heapClassInst.heap32[(r6)])
                r8 = (r8 + 1) | 0
                heapClassInst.heap32[(r6)] = Int32(r8)
                heapClassInst.heap32[(g0)] = 63
                mallocNew(i7);
                r6 = commonVariable.r_g0
                if (r6 != 0) {
                    r8 = 0
                    r9 = (r6 + 4) | 0
                    r8 = (r8 - r9) | 0
                    r8 = r8 & 15
                    r8 = (r6 + r8) | 0
                    r9 = (r8 + 4) | 0
                    r8 = r8 >> 2
                    heapClassInst.heap32[(r8)] = Int32(r6)
                    r6 = r9
                }
            } else {
                heapClassInst.heap32[(r1 + 12)] = 0
            }
            r8 = r6 >> 2
            heapClassInst.heap32[(r8 + 8)] = 0
            heapClassInst.heap32[(r8 + 9)] = Int32(r2)
            heapClassInst.heap32[(r8 + 10)] = 0
            heapClassInst.heapFloat[(r8)] = Float32(f0)
            heapClassInst.heapFloat[(r8 + 1)] = Float32(f1)
            heapClassInst.heapFloat[(r8 + 2)] = Float32(f2)
            heapClassInst.heapFloat[(r8 + 3)] = Float32(f3)
            heapClassInst.heapFloat[(r8 + 4)] = Float32(f4)
            heapClassInst.heapFloat[(r8 + 5)] = Float32(f5)
            heapClassInst.heapFloat[(r8 + 6)] = Float32(f6)
            heapClassInst.heapFloat[(r8 + 7)] = Float32(f7)
            r2 = Int64(heapClassInst.heap32[(r1 + 11)])
            heapClassInst.heap32[(g0)] = Int32(r4)
            heapClassInst.heap32[(g0 + 1)] = Int32(r2)
            heapClassInst.heap32[(g0 + 2)] = Int32(r6)
            _ZL10insertleafP6btDbvtP10btDbvtNodeS2_(i7);
            r2 = Int64(heapClassInst.heap32[(r1 + 14)])
            r2 = (r2 + 1) | 0
            heapClassInst.heap32[(r1 + 14)] = Int32(r2)
            heapClassInst.heap32[(r5 + 12)] = Int32(r6)
            heapClassInst.heap32[(r5 + 15)] = 2
            r2 = r7
            if (!(r7 != 0)) {
                break
            }
        }
        r2 = Int64(heapClassInst.heap32[(r1 + 14)])
        r4 = 1
        heapClassInst.heap32[(r1 + 31)] = Int32(r2)
        heapClassInst.heap8[r0 + 154] = Int8(r4)
    }
    r2 = _ZTV18btDbvtTreeCollider
    r4 = sp + (-32)
    r2 = (r2 + 8) | 0
    r5 = r4 >> 2
    heapClassInst.heap32[(fp + (-8))] = Int32(r2)
    heapClassInst.heap32[(r5 + 1)] = Int32(r0)
    r5 = Int64(heapClassInst.heapU8[r0 + 153])
    if (!(r5 == 0)) {
        r5 = Int64(heapClassInst.heap32[(r1 + 11)])
        r6 = Int64(heapClassInst.heap32[(r1 + 1)])
        heapClassInst.heap32[(g0)] = Int32(r3)
        heapClassInst.heap32[(g0 + 1)] = Int32(r6)
        heapClassInst.heap32[(g0 + 2)] = Int32(r5)
        heapClassInst.heap32[(g0 + 3)] = Int32(r4)
        _ZN6btDbvt24collideTTpersistentStackEPK10btDbvtNodeS2_RNS_8ICollideE(i7);
        r5 = Int64(heapClassInst.heapU8[r0 + 153])
        if (!(r5 == 0)) {
            r5 = Int64(heapClassInst.heap32[(r1 + 1)])
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = Int32(r5)
            heapClassInst.heap32[(g0 + 2)] = Int32(r5)
            heapClassInst.heap32[(g0 + 3)] = Int32(r4)
            _ZN6btDbvt24collideTTpersistentStackEPK10btDbvtNodeS2_RNS_8ICollideE(i7);
        }
    }
    r3 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(fp + (-8))] = Int32(r2)
    r2 = Int64(heapClassInst.heapU8[r0 + 154])
    do {
        if (!(r2 == 0)) {
            r2 = Int64(heapClassInst.heap32[(r1 + 24)])
            r4 = r2 >> 2
            r4 = Int64(heapClassInst.heap32[(r4)])
            r4 = r4 >> 2
            r4 = Int64(heapClassInst.heap32[(r4 + 7)])
            heapClassInst.heap32[(g0)] = Int32(r2)
            __FUNCTION_TABLE__[(r4) >> 2](i7);
            r2 = commonVariable.r_g0
            r4 = r2 >> 2
            r4 = Int64(heapClassInst.heap32[(r4 + 1)])
            if (!(r4 < 1)) {
                r5 = Int64(heapClassInst.heap32[(r1 + 29)])
                r5 = (r5 * r4) | 0
                r6 = Int64(heapClassInst.heap32[(r1 + 30)])
                r5 = (r5 / 100) | 0

                if (r6 > r5) {
                    r5 = r6
                }

                if (r4 < r5) {
                    r5 = r4
                }
                if (r5 > 0) {
                    r4 = 0
                    while (true) {
                        r6 = r2 >> 2
                        r7 = Int64(heapClassInst.heap32[(r1 + 36)])
                        r7 = (r7 + r4) | 0
                        r8 = Int64(heapClassInst.heap32[(r6 + 1)])
                        r7 = (r7 % r8) | 0
                        r8 = Int64(heapClassInst.heap32[(r6 + 3)])
                        r7 = r7 << 4
                        r7 = (r8 + r7) | 0
                        r7 = r7 >> 2
                        r8 = Int64(heapClassInst.heap32[(r7 + 1)])
                        r7 = Int64(heapClassInst.heap32[(r7)])
                        r9 = r8 >> 2
                        r10 = r7 >> 2
                        r9 = Int64(heapClassInst.heap32[(r9 + 12)])
                        r10 = Int64(heapClassInst.heap32[(r10 + 12)])
                        r10 = r10 >> 2
                        r9 = r9 >> 2
                        f0 = Float64(heapClassInst.heapFloat[(r10)])
                        f1 = Float64(heapClassInst.heapFloat[(r9 + 4)])
                        if (f0 > f1) {
                            __label__ = 32
                        } else {
                            f0 = Float64(heapClassInst.heapFloat[(r10 + 4)])
                            f1 = Float64(heapClassInst.heapFloat[(r9)])
                            if (f0 < f1) {
                                __label__ = 32
                            } else {
                                f0 = Float64(heapClassInst.heapFloat[(r10 + 1)])
                                f1 = Float64(heapClassInst.heapFloat[(r9 + 5)])
                                if (f0 > f1) {
                                    __label__ = 32
                                } else {
                                    f0 = Float64(heapClassInst.heapFloat[(r10 + 5)])
                                    f1 = Float64(heapClassInst.heapFloat[(r9 + 1)])
                                    if (f0 < f1) {
                                        __label__ = 32
                                    } else {
                                        f0 = Float64(heapClassInst.heapFloat[(r10 + 2)])
                                        f1 = Float64(heapClassInst.heapFloat[(r9 + 6)])
                                        if (f0 > f1) {
                                            __label__ = 32
                                        } else {
                                            f0 = Float64(heapClassInst.heapFloat[(r10 + 6)])
                                            f1 = Float64(heapClassInst.heapFloat[(r9 + 2)])
                                            if (f0 < f1) {
                                                __label__ = 32
                                            } else {
                                                __label__ = 33
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        if (__label__ == 32) {
                            r9 = Int64(heapClassInst.heap32[(r1 + 24)])
                            r10 = r9 >> 2
                            r10 = Int64(heapClassInst.heap32[(r10)])
                            r10 = r10 >> 2
                            r10 = Int64(heapClassInst.heap32[(r10 + 3)])
                            heapClassInst.heap32[(g0)] = Int32(r9)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r7)
                            heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                            heapClassInst.heap32[(g0 + 3)] = Int32(r3)
                            r5 = (r5 + (-1)) | 0
                            r4 = (r4 + (-1)) | 0
                            __FUNCTION_TABLE__[(r10) >> 2](i7);
                        }
                        r4 = (r4 + 1) | 0
                        if (!(r4 < r5)) {
                            break
                        }
                    }
                    r4 = Int64(heapClassInst.heap32[(r6 + 1)])
                    if (r4 < 1) {
                        heapClassInst.heap32[(r1 + 36)] = 0
                        break
                    }
                }
                r2 = Int64(heapClassInst.heap32[(r1 + 36)])
                r2 = (r2 + r5) | 0
                r2 = (r2 % r4) | 0
                heapClassInst.heap32[(r1 + 36)] = Int32(r2)
            }
        }
    } while (false);
    r2 = Int64(heapClassInst.heap32[(r1 + 35)])
    r2 = (r2 + 1) | 0
    heapClassInst.heap32[(r1 + 35)] = Int32(r2)
    r2 = 0
    heapClassInst.heap32[(r1 + 30)] = 1
    heapClassInst.heap8[r0 + 154] = Int8(r2)
    r0 = Int64(heapClassInst.heap32[(r1 + 32)])
    if (r0 == 0) {
        heapClassInst.heap32[(r1 + 34)] = 0
        r4 = Int64(heapClassInst.heap32[(r1 + 33)])
    } else {
        r4 = Int64(heapClassInst.heap32[(r1 + 33)])
        f0 = Float64(`UIntNative`(r4))
        f1 = Float64(`UIntNative`(r0))
        f0 = f0 / f1
        heapClassInst.heapFloat[(r1 + 34)] = Float32(f0)
    }
    r4 = r4 >> 1
    r0 = r0 >> 1
    heapClassInst.heap32[(r1 + 33)] = Int32(r4)
    heapClassInst.heap32[(r1 + 32)] = Int32(r0)
    r0 = Int64(heapClassInst.heap32[(r1 + 24)])
    r4 = r0 >> 2
    r4 = Int64(heapClassInst.heap32[(r4)])
    r4 = r4 >> 2
    r4 = Int64(heapClassInst.heap32[(r4 + 14)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    __FUNCTION_TABLE__[(r4) >> 2](i7);
    r0 = commonVariable.r_g0
    if (!(r0 == 0)) {
        r0 = Int64(heapClassInst.heap32[(r1 + 24)])
        r4 = r0 >> 2
        r4 = Int64(heapClassInst.heap32[(r4)])
        r4 = r4 >> 2
        r4 = Int64(heapClassInst.heap32[(r4 + 7)])
        heapClassInst.heap32[(g0)] = Int32(r0)
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r0 = commonVariable.r_g0
        r4 = r0 >> 2
        r4 = Int64(heapClassInst.heap32[(r4 + 1)])
        if (!(r4 < 2)) {
            r4 = (r4 + (-1)) | 0
            heapClassInst.heap32[(g0)] = Int32(r0)
            heapClassInst.heap32[(g0 + 1)] = 0
            heapClassInst.heap32[(g0 + 2)] = Int32(r4)
            _ZN20btAlignedObjectArrayI16btBroadphasePairE17quickSortInternalI29btBroadphasePairSortPredicateEEvT_ii(i7);
        }
        r4 = r2
        r5 = r2
        r6 = r2
        r7 = r2
        while (true) {
            r8 = r0 >> 2
            r9 = Int64(heapClassInst.heap32[(r8 + 1)])
            if (r9 > r7) {
                r8 = Int64(heapClassInst.heap32[(r8 + 3)])
                r9 = r7 << 4
                r9 = (r8 + r9) | 0
                r9 = r9 >> 2
                r10 = Int64(heapClassInst.heap32[(r9)])
                r11 = r7 << 2
                r12 = Int64(heapClassInst.heap32[(r9 + 1)])
                if (r10 != r4) {
                    __label__ = 46
                } else {
                    if (r12 == r5) {
                        r4 = Int64(heapClassInst.heap32[(r9 + 2)])
                        if (r4 == 0) {
                            __label__ = 54
                        } else {
                            __label__ = 53
                            break
                        }
                    } else {
                        __label__ = 46
                    }
                }
                if (__label__ == 46) {
                    r4 = r12 >> 2
                    r5 = r10 >> 2
                    r4 = Int64(heapClassInst.heap32[(r4 + 12)])
                    r5 = Int64(heapClassInst.heap32[(r5 + 12)])
                    r5 = r5 >> 2
                    r4 = r4 >> 2
                    f0 = Float64(heapClassInst.heapFloat[(r5)])
                    f1 = Float64(heapClassInst.heapFloat[(r4 + 4)])
                    if (f0 > f1) {
                        __label__ = 54
                    } else {
                        f0 = Float64(heapClassInst.heapFloat[(r5 + 4)])
                        f1 = Float64(heapClassInst.heapFloat[(r4)])
                        if (f0 < f1) {
                            __label__ = 54
                        } else {
                            f0 = Float64(heapClassInst.heapFloat[(r5 + 1)])
                            f1 = Float64(heapClassInst.heapFloat[(r4 + 5)])
                            if (f0 > f1) {
                                __label__ = 54
                            } else {
                                f0 = Float64(heapClassInst.heapFloat[(r5 + 5)])
                                f1 = Float64(heapClassInst.heapFloat[(r4 + 1)])
                                if (f0 < f1) {
                                    __label__ = 54
                                } else {
                                    f0 = Float64(heapClassInst.heapFloat[(r5 + 2)])
                                    f1 = Float64(heapClassInst.heapFloat[(r4 + 6)])
                                    if (f0 > f1) {
                                        __label__ = 54
                                    } else {
                                        f0 = Float64(heapClassInst.heapFloat[(r5 + 6)])
                                        f1 = Float64(heapClassInst.heapFloat[(r4 + 2)])
                                        if (f0 < f1) {
                                            __label__ = 54
                                        } else {
                                            __label__ = 55
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (__label__ == 54) {
                    r4 = Int64(heapClassInst.heap32[(r1 + 24)])
                    r5 = r4 >> 2
                    r5 = Int64(heapClassInst.heap32[(r5)])
                    r5 = r5 >> 2
                    r5 = Int64(heapClassInst.heap32[(r5 + 8)])
                    r9 = (r8 + r2) | 0
                    r11 = r11 << 2
                    heapClassInst.heap32[(g0)] = Int32(r4)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                    heapClassInst.heap32[(g0 + 2)] = Int32(r3)
                    r4 = (r8 + r11) | 0
                    r4 = r4 >> 2
                    __FUNCTION_TABLE__[(r5) >> 2](i7);
                    r6 = (r6 + 1) | 0
                    heapClassInst.heap32[(r4)] = 0
                    heapClassInst.heap32[(r4 + 1)] = 0
                }
                r7 = (r7 + 1) | 0
                r2 = (r2 + 16) | 0
                r4 = r10
                r5 = r12
            } else {
                __label__ = 57
                break
            }
        }
        match (__label__) {
            case 57 =>
                if (r9 > 1) {
                    r9 = (r9 + (-1)) | 0
                    heapClassInst.heap32[(g0)] = Int32(r0)
                    heapClassInst.heap32[(g0 + 1)] = 0
                    heapClassInst.heap32[(g0 + 2)] = Int32(r9)
                    _ZN20btAlignedObjectArrayI16btBroadphasePairE17quickSortInternalI29btBroadphasePairSortPredicateEEvT_ii(
                        i7);
                    r9 = Int64(heapClassInst.heap32[(r8 + 1)])
                }
                r1 = sp + ( -16)
                r2 = r1 >> 2
                heapClassInst.heap32[(fp + (-4))] = 0
                heapClassInst.heap32[(r2 + 1)] = 0
                heapClassInst.heap32[(r2 + 2)] = 0
                heapClassInst.heap32[(r2 + 3)] = 0
                r2 = (r9 - r6) | 0
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                heapClassInst.heap32[(g0 + 2)] = Int32(r1)
                _ZN20btAlignedObjectArrayI16btBroadphasePairE6resizeEiRKS0_(i7);
            case 53 =>
                r8 = _E2_str314
                r0 = _E2_str18
                heapClassInst.heap32[(g0)] = Int32(r8)
                heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                heapClassInst.heap32[(g0 + 2)] = 469
                _assert(i7);
            case _ => println("break4304");
        }
    }
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphase7setAabbEP17btBroadphaseProxyRK9btVector3S4_P12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var f8: Float64 = 0.0
    var f9: Float64 = 0.0
    var f10: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-88)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 2)])
    r0 = r0 >> 2
    f0 = Float64(heapClassInst.heapFloat[(r0)])
    r1 = sp + (-32)
    heapClassInst.heapFloat[(fp + (-8))] = Float32(f0)
    f1 = Float64(heapClassInst.heapFloat[(r0 + 1)])
    r2 = r1 >> 2
    heapClassInst.heapFloat[(r2 + 1)] = Float32(f1)
    f2 = Float64(heapClassInst.heapFloat[(r0 + 2)])
    heapClassInst.heapFloat[(r2 + 2)] = Float32(f2)
    f3 = Float64(heapClassInst.heapFloat[(r0 + 3)])
    r3 = Int64(heapClassInst.heap32[(fp + 3)])
    r3 = r3 >> 2
    heapClassInst.heapFloat[(r2 + 3)] = Float32(f3)
    f4 = Float64(heapClassInst.heapFloat[(r3)])
    heapClassInst.heapFloat[(r2 + 4)] = Float32(f4)
    f5 = Float64(heapClassInst.heapFloat[(r3 + 1)])
    heapClassInst.heapFloat[(r2 + 5)] = Float32(f5)
    f6 = Float64(heapClassInst.heapFloat[(r3 + 2)])
    heapClassInst.heapFloat[(r2 + 6)] = Float32(f6)
    f7 = Float64(heapClassInst.heapFloat[(r3 + 3)])
    r4 = Int64(heapClassInst.heap32[(fp + 1)])
    r5 = Int64(heapClassInst.heap32[(fp)])
    r6 = r4 >> 2
    heapClassInst.heapFloat[(r2 + 7)] = Float32(f7)
    r7 = Int64(heapClassInst.heap32[(r6 + 15)])
    do {
        if (r7 != 2) {
            r2 = r5 >> 2
            r8 = Int64(heapClassInst.heap32[(r2 + 32)])
            r8 = (r8 + 1) | 0
            heapClassInst.heap32[(r2 + 32)] = Int32(r8)
            r8 = Int64(heapClassInst.heap32[(r6 + 12)])
            r7 = r8 >> 2
            f8 = Float64(heapClassInst.heapFloat[(r7)])
            if (!(f8 > f4)) {
                f8 = Float64(heapClassInst.heapFloat[(r7 + 4)])
                if (!(f8 < f0)) {
                    f8 = Float64(heapClassInst.heapFloat[(r7 + 1)])
                    if (!(f8 > f5)) {
                        f8 = Float64(heapClassInst.heapFloat[(r7 + 5)])
                        if (!(f8 < f1)) {
                            f8 = Float64(heapClassInst.heapFloat[(r7 + 2)])
                            if (!(f8 > f6)) {
                                f8 = Float64(heapClassInst.heapFloat[(r7 + 6)])
                                if (!(f8 < f2)) {
                                    f0 = Float64(heapClassInst.heapFloat[(r6 + 4)])
                                    f1 = Float64(heapClassInst.heapFloat[(r6 + 8)])
                                    f1 = f1 - f0
                                    f2 = 0.5
                                    f3 = Float64(heapClassInst.heapFloat[(r6 + 5)])
                                    f4 = Float64(heapClassInst.heapFloat[(r6 + 9)])
                                    f4 = f4 - f3
                                    f5 = Float64(heapClassInst.heapFloat[(r0 + 1)])
                                    f6 = Float64(heapClassInst.heapFloat[(r0)])
                                    f1 = f1 * f2
                                    f7 = Float64(heapClassInst.heapFloat[(r2 + 25)])
                                    f8 = Float64(heapClassInst.heapFloat[(r0 + 2)])
                                    f9 = Float64(heapClassInst.heapFloat[(r6 + 6)])
                                    f10 = Float64(heapClassInst.heapFloat[(r6 + 10)])
                                    r7 = sp + (-48)
                                    f10 = f10 - f9
                                    f4 = f4 * f2
                                    f1 = f1 * f7
                                    f2 = f10 * f2
                                    f4 = f4 * f7
                                    r9 = r7 >> 2
                                    heapClassInst.heapFloat[(fp + (-12))] = Float32(f1)
                                    f2 = f2 * f7
                                    heapClassInst.heapFloat[(r9 + 1)] = Float32(f4)
                                    heapClassInst.heapFloat[(r9 + 2)] = Float32(f2)
                                    heapClassInst.heap32[(r9 + 3)] = 0
                                    f0 = f6 - f0
                                    f6 = 0.0
                                    if (!(f0 >= f6)) {
                                        f0 = -f1
                                        heapClassInst.heapFloat[(fp + (-12))] = Float32(f0)
                                    }
                                    f0 = f5 - f3
                                    if (!(f0 >= f6)) {
                                        f0 = -f4
                                        heapClassInst.heapFloat[(r9 + 1)] = Float32(f0)
                                    }
                                    f0 = f8 - f9
                                    if (!(f0 >= f6)) {
                                        f0 = -f2
                                        heapClassInst.heapFloat[(r9 + 2)] = Float32(f0)
                                    }
                                    r9 = (r5 + 4) | 0
                                    heapClassInst.heap32[(g0)] = Int32(r9)
                                    heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                    heapClassInst.heap32[(g0 + 2)] = Int32(r1)
                                    heapClassInst.heap32[(g0 + 3)] = Int32(r7)
                                    heapClassInst.heap32[(g0 + 4)] = 1028443341
                                    _ZN6btDbvt6updateEP10btDbvtNodeR12btDbvtAabbMmRK9btVector3f(i7);
                                    r8 = commonVariable.r_g0
                                    if (r8 != 0) {
                                        r7 = Int64(heapClassInst.heap32[(r2 + 33)])
                                        r8 = 1
                                        r7 = (r7 + 1) | 0
                                        heapClassInst.heap32[(r2 + 33)] = Int32(r7)
                                        break
                                    } else {
                                        r8 = 0
                                        break
                                    }
                                }
                            }
                        }
                    }
                }
            }
            r1 = (r5 + 4) | 0
            heapClassInst.heap32[(g0)] = Int32(r1)
            heapClassInst.heap32[(g0 + 1)] = Int32(r8)
            _ZL10removeleafP6btDbvtP10btDbvtNode(i7);
            r9 = commonVariable.r_g0
            do {
                if (r9 != 0) {
                    r11 = Int64(heapClassInst.heap32[(r2 + 3)])
                    if (r11 < 0) {
                        r10 = Int64(heapClassInst.heap32[(r2 + 1)])
                    } else {
                        r12 = (-1)
                        while (true) {
                            r10 = r9
                            r12 = (r12 + 1) | 0
                            if (r11 > r12) {
                                r9 = r10 >> 2
                                r9 = Int64(heapClassInst.heap32[(r9 + 8)])
                                if (r9 == 0) {
                                    break
                                }
                            } else {
                                break
                            }
                        }
                    }
                } else {
                    r10 = 0
                }
            } while (false);
            heapClassInst.heapFloat[(r7)] = Float32(f0)
            heapClassInst.heapFloat[(r7 + 1)] = Float32(f1)
            heapClassInst.heapFloat[(r7 + 2)] = Float32(f2)
            heapClassInst.heapFloat[(r7 + 3)] = Float32(f3)
            heapClassInst.heapFloat[(r7 + 4)] = Float32(f4)
            heapClassInst.heapFloat[(r7 + 5)] = Float32(f5)
            heapClassInst.heapFloat[(r7 + 6)] = Float32(f6)
            heapClassInst.heapFloat[(r7 + 7)] = Float32(f7)
            heapClassInst.heap32[(g0)] = Int32(r1)
            heapClassInst.heap32[(g0 + 1)] = Int32(r10)
            heapClassInst.heap32[(g0 + 2)] = Int32(r8)
            _ZL10insertleafP6btDbvtP10btDbvtNodeS2_(i7);
            r1 = Int64(heapClassInst.heap32[(r2 + 33)])
            r8 = 1
            r1 = (r1 + 1) | 0
            heapClassInst.heap32[(r2 + 33)] = Int32(r1)
        } else {
            r1 = Int64(heapClassInst.heap32[(r6 + 12)])
            r7 = (r5 + 44) | 0
            heapClassInst.heap32[(g0)] = Int32(r7)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            r7 = r5 >> 2
            _ZL10removeleafP6btDbvtP10btDbvtNode(i7);
            r8 = Int64(heapClassInst.heap32[(r7 + 12)])
            if (!(r8 == 0)) {
                r9 = gNumAlignedFree
                r9 = r9 >> 2
                r10 = Int64(heapClassInst.heap32[(r9)])
                r10 = (r10 + 1) | 0
                r8 = r8 >> 2
                heapClassInst.heap32[(r9)] = Int32(r10)
                r8 = Int64(heapClassInst.heap32[(r8 + (-1))])
                heapClassInst.heap32[(g0)] = Int32(r8)
                free(i7);
            }
            heapClassInst.heap32[(r7 + 12)] = Int32(r1)
            r1 = Int64(heapClassInst.heap32[(r7 + 14)])
            r1 = (r1 + (-1)) | 0
            heapClassInst.heap32[(r7 + 14)] = Int32(r1)
            r1 = Int64(heapClassInst.heap32[(r7 + 2)])
            r8 = (r5 + 4) | 0
            if (r1 == 0) {
                r1 = gNumAlignedAllocs
                r1 = r1 >> 2
                r9 = Int64(heapClassInst.heap32[(r1)])
                r9 = (r9 + 1) | 0
                heapClassInst.heap32[(r1)] = Int32(r9)
                heapClassInst.heap32[(g0)] = 63
                mallocNew(i7);
                r1 = commonVariable.r_g0
                if (r1 != 0) {
                    r9 = 0
                    r10 = (r1 + 4) | 0
                    r9 = (r9 - r10) | 0
                    r9 = r9 & 15
                    r9 = (r1 + r9) | 0
                    r10 = (r9 + 4) | 0
                    r9 = r9 >> 2
                    heapClassInst.heap32[(r9)] = Int32(r1)
                    r1 = r10
                }
            } else {
                heapClassInst.heap32[(r7 + 2)] = 0
            }
            r9 = r1 >> 2
            heapClassInst.heap32[(r9 + 8)] = 0
            heapClassInst.heap32[(r9 + 9)] = Int32(r4)
            heapClassInst.heap32[(r9 + 10)] = 0
            heapClassInst.heap32[(r9)] = heapClassInst.heap32[(fp + (-8))]
            heapClassInst.heap32[(r9 + 1)] = heapClassInst.heap32[(r2 + 1)]
            heapClassInst.heap32[(r9 + 2)] = heapClassInst.heap32[(r2 + 2)]
            heapClassInst.heap32[(r9 + 3)] = heapClassInst.heap32[(r2 + 3)]
            heapClassInst.heapFloat[(r9 + 4)] = Float32(f4)
            heapClassInst.heapFloat[(r9 + 5)] = Float32(f5)
            heapClassInst.heapFloat[(r9 + 6)] = Float32(f6)
            heapClassInst.heapFloat[(r9 + 7)] = Float32(f7)
            r2 = Int64(heapClassInst.heap32[(r7 + 1)])
            heapClassInst.heap32[(g0)] = Int32(r8)
            heapClassInst.heap32[(g0 + 1)] = Int32(r2)
            heapClassInst.heap32[(g0 + 2)] = Int32(r1)
            _ZL10insertleafP6btDbvtP10btDbvtNodeS2_(i7);
            r2 = Int64(heapClassInst.heap32[(r7 + 4)])
            r2 = (r2 + 1) | 0
            r8 = 1
            heapClassInst.heap32[(r7 + 4)] = Int32(r2)
            heapClassInst.heap32[(r6 + 12)] = Int32(r1)
        }
    } while (false);
    r1 = Int64(heapClassInst.heap32[(r6 + 13)])
    r2 = Int64(heapClassInst.heap32[(r6 + 14)])
    if (r1 == 0) {
        r1 = Int64(heapClassInst.heap32[(r6 + 15)])
        r1 = r1 << 2
        r1 = (r5 + r1) | 0
        r1 = r1 >> 2
        heapClassInst.heap32[(r1 + 21)] = Int32(r2)
    } else {
        r1 = r1 >> 2
        heapClassInst.heap32[(r1 + 14)] = Int32(r2)
    }
    r1 = Int64(heapClassInst.heap32[(r6 + 14)])
    if (!(r1 == 0)) {
        r1 = r1 >> 2
        r2 = Int64(heapClassInst.heap32[(r6 + 13)])
        heapClassInst.heap32[(r1 + 13)] = Int32(r2)
    }
    heapClassInst.heap32[(r6 + 4)] = heapClassInst.heap32[(r0)]
    heapClassInst.heap32[(r6 + 5)] = heapClassInst.heap32[(r0 + 1)]
    heapClassInst.heap32[(r6 + 6)] = heapClassInst.heap32[(r0 + 2)]
    heapClassInst.heap32[(r6 + 7)] = heapClassInst.heap32[(r0 + 3)]
    heapClassInst.heap32[(r6 + 8)] = heapClassInst.heap32[(r3)]
    heapClassInst.heap32[(r6 + 9)] = heapClassInst.heap32[(r3 + 1)]
    heapClassInst.heap32[(r6 + 10)] = heapClassInst.heap32[(r3 + 2)]
    r0 = r5 >> 2
    heapClassInst.heap32[(r6 + 11)] = heapClassInst.heap32[(r3 + 3)]
    r1 = Int64(heapClassInst.heap32[(r0 + 26)])
    heapClassInst.heap32[(r6 + 15)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r0 + 26)])
    r1 = r1 << 2
    r1 = (r5 + r1) | 0
    r1 = r1 >> 2
    heapClassInst.heap32[(r6 + 13)] = 0
    r2 = Int64(heapClassInst.heap32[(r1 + 21)])
    heapClassInst.heap32[(r6 + 14)] = Int32(r2)
    r2 = Int64(heapClassInst.heap32[(r1 + 21)])
    if (!(r2 == 0)) {
        r2 = r2 >> 2
        heapClassInst.heap32[(r2 + 13)] = Int32(r4)
    }
    r2 = r8 & 1
    heapClassInst.heap32[(r1 + 21)] = Int32(r4)
    if (!(r2 == 0)) {
        r1 = 1
        heapClassInst.heap8[r5 + 154] = Int8(r1)
        r1 = Int64(heapClassInst.heapU8[r5 + 153])
        if (!(r1 != 0)) {
            r1 = _ZTV18btDbvtTreeCollider
            r2 = sp + (-64)
            r1 = (r1 + 8) | 0
            r3 = r2 >> 2
            heapClassInst.heap32[(fp + (-16))] = Int32(r1)
            heapClassInst.heap32[(r3 + 1)] = Int32(r5)
            r1 = Int64(heapClassInst.heap32[(r6 + 12)])
            r3 = Int64(heapClassInst.heap32[(r0 + 11)])
            r4 = (r5 + 44) | 0
            heapClassInst.heap32[(g0)] = Int32(r4)
            heapClassInst.heap32[(g0 + 1)] = Int32(r3)
            heapClassInst.heap32[(g0 + 2)] = Int32(r1)
            heapClassInst.heap32[(g0 + 3)] = Int32(r2)
            _ZN6btDbvt24collideTTpersistentStackEPK10btDbvtNodeS2_RNS_8ICollideE(i7);
            r1 = Int64(heapClassInst.heap32[(r6 + 12)])
            r0 = Int64(heapClassInst.heap32[(r0 + 1)])
            r3 = (r5 + 4) | 0
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = Int32(r0)
            heapClassInst.heap32[(g0 + 2)] = Int32(r1)
            heapClassInst.heap32[(g0 + 3)] = Int32(r2)
            _ZN6btDbvt24collideTTpersistentStackEPK10btDbvtNodeS2_RNS_8ICollideE(i7);
        }
    }
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphaseD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV16btDbvtBroadphase
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heapU8[r0 + 152])
    if (!(r1 == 0)) {
        r1 = Int64(heapClassInst.heap32[(r2 + 24)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r2 + 24)])
        if (!(r1 == 0)) {
            r2 = gNumAlignedFree
            r2 = r2 >> 2
            r3 = Int64(heapClassInst.heap32[(r2)])
            r3 = (r3 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r2)] = Int32(r3)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
    }
    r1 = (r0 + 4) | 0
    if (!(r1 == 0)) {
        r2 = (r1 + 80) | 0
        if (!(r2 == r1)) {
            r1 = (r0 + 44) | 0
            r2 = 0
            while (true) {
                r3 = (r0 + r2) | 0
                r4 = r3 >> 2
                r5 = Int64(heapClassInst.heap32[(r4 + 11)])
                if (!(r5 == 0)) {
                    r6 = (r1 + r2) | 0
                    heapClassInst.heap32[(g0)] = Int32(r6)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r5)
                    _ZL17recursedeletenodeP6btDbvtP10btDbvtNode(i7);
                }
                r5 = Int64(heapClassInst.heap32[(r4 + 12)])
                if (!(r5 == 0)) {
                    r6 = gNumAlignedFree
                    r6 = r6 >> 2
                    r7 = Int64(heapClassInst.heap32[(r6)])
                    r7 = (r7 + 1) | 0
                    r5 = r5 >> 2
                    heapClassInst.heap32[(r6)] = Int32(r7)
                    r5 = Int64(heapClassInst.heap32[(r5 + (-1))])
                    heapClassInst.heap32[(g0)] = Int32(r5)
                    free(i7);
                }
                heapClassInst.heap32[(r4 + 12)] = 0
                heapClassInst.heap32[(r4 + 13)] = (-1)
                r5 = Int64(heapClassInst.heap32[(r4 + 19)])
                if (!(r5 == 0)) {
                    r6 = Int64(heapClassInst.heapU8[r3 + 80])
                    if (!(r6 == 0)) {
                        r6 = gNumAlignedFree
                        r6 = r6 >> 2
                        r7 = Int64(heapClassInst.heap32[(r6)])
                        r7 = (r7 + 1) | 0
                        r5 = r5 >> 2
                        heapClassInst.heap32[(r6)] = Int32(r7)
                        r5 = Int64(heapClassInst.heap32[(r5 + (-1))])
                        heapClassInst.heap32[(g0)] = Int32(r5)
                        free(i7);
                    }
                    heapClassInst.heap32[(r4 + 19)] = 0
                }
                r5 = 1
                heapClassInst.heap32[(r4 + 15)] = 0
                heapClassInst.heap8[r3 + 80] = Int8(r5)
                heapClassInst.heap32[(r4 + 19)] = 0
                r2 = (r2 + (-40)) | 0
                heapClassInst.heap32[(r4 + 17)] = 0
                heapClassInst.heap32[(r4 + 18)] = 0
                if (r2 != (-80)) {
                    continue
                } else {
                    break
                }
            }
        }
    }
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZN16btDbvtBroadphaseD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV16btDbvtBroadphase
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heapU8[r0 + 152])
    if (!(r1 == 0)) {
        r1 = Int64(heapClassInst.heap32[(r2 + 24)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r2 + 24)])
        if (!(r1 == 0)) {
            r2 = gNumAlignedFree
            r2 = r2 >> 2
            r3 = Int64(heapClassInst.heap32[(r2)])
            r3 = (r3 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r2)] = Int32(r3)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
    }
    r1 = (r0 + 4) | 0
    if (!(r1 == 0)) {
        r2 = (r1 + 80) | 0
        if (!(r2 == r1)) {
            r1 = (r0 + 44) | 0
            r2 = 0
            while (true) {
                r3 = (r0 + r2) | 0
                r4 = r3 >> 2
                r5 = Int64(heapClassInst.heap32[(r4 + 11)])
                if (!(r5 == 0)) {
                    r6 = (r1 + r2) | 0
                    heapClassInst.heap32[(g0)] = Int32(r6)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r5)
                    _ZL17recursedeletenodeP6btDbvtP10btDbvtNode(i7);
                }
                r5 = Int64(heapClassInst.heap32[(r4 + 12)])
                if (!(r5 == 0)) {
                    r6 = gNumAlignedFree
                    r6 = r6 >> 2
                    r7 = Int64(heapClassInst.heap32[(r6)])
                    r7 = (r7 + 1) | 0
                    r5 = r5 >> 2
                    heapClassInst.heap32[(r6)] = Int32(r7)
                    r5 = Int64(heapClassInst.heap32[(r5 + (-1))])
                    heapClassInst.heap32[(g0)] = Int32(r5)
                    free(i7);
                }
                heapClassInst.heap32[(r4 + 12)] = 0
                heapClassInst.heap32[(r4 + 13)] = (-1)
                r5 = Int64(heapClassInst.heap32[(r4 + 19)])
                if (!(r5 == 0)) {
                    r6 = Int64(heapClassInst.heapU8[r3 + 80])
                    if (!(r6 == 0)) {
                        r6 = gNumAlignedFree
                        r6 = r6 >> 2
                        r7 = Int64(heapClassInst.heap32[(r6)])
                        r7 = (r7 + 1) | 0
                        r5 = r5 >> 2
                        heapClassInst.heap32[(r6)] = Int32(r7)
                        r5 = Int64(heapClassInst.heap32[(r5 + (-1))])
                        heapClassInst.heap32[(g0)] = Int32(r5)
                        free(i7);
                    }
                    heapClassInst.heap32[(r4 + 19)] = 0
                }
                r5 = 1
                heapClassInst.heap32[(r4 + 15)] = 0
                heapClassInst.heap8[r3 + 80] = Int8(r5)
                heapClassInst.heap32[(r4 + 19)] = 0
                r2 = (r2 + (-40)) | 0
                heapClassInst.heap32[(r4 + 17)] = 0
                heapClassInst.heap32[(r4 + 18)] = 0
                if (r2 != (-80)) {
                    continue
                } else {
                    break
                }
            }
        }
    }
    return;
}

@OverflowWrapping
func _ZN12btDispatcherD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV12btDispatcher
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZN12btDispatcherD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV12btDispatcher
    r0 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache23getOverlappingPairArrayEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = (r0 + 4) | 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache24setOverlapFilterCallbackEP23btOverlapFilterCallback(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(r0 + 6)] = Int32(r1)
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache18hasDeferredRemovalEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache28setInternalGhostPairCallbackEP25btOverlappingPairCallback(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(r0 + 18)] = Int32(r1)
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache20cleanOverlappingPairER16btBroadphasePairP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0 + 2)])
    if (!(r1 == 0)) {
        r2 = Int64(heapClassInst.heap32[(fp + 2)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = r2 >> 2
        r1 = Int64(heapClassInst.heap32[(r1)])
        r1 = r1 >> 2
        r1 = Int64(heapClassInst.heap32[(r1 + 13)])
        r3 = Int64(heapClassInst.heap32[(r0 + 2)])
        heapClassInst.heap32[(g0)] = Int32(r2)
        heapClassInst.heap32[(g0 + 1)] = Int32(r3)
        __FUNCTION_TABLE__[(r1) >> 2](i7);
        heapClassInst.heap32[(r0 + 2)] = 0
    }
    return;
}

@OverflowWrapping
func _ZZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherEN17CleanPairCallbackD1Ev(
    sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTVZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherE17CleanPairCallback
    r0 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    return;
}

@OverflowWrapping
func _ZZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherEN17CleanPairCallbackD0Ev(
    sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTVZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherE17CleanPairCallback
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherEN17CleanPairCallback14processOverlapER16btBroadphasePair(
    sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = Int64(heapClassInst.heap32[(r0 + 1)])
    r3 = r1 >> 2
    r4 = Int64(heapClassInst.heap32[(r3)])
    if (r4 == r2) {
        __label__ = 2
    } else {
        r3 = Int64(heapClassInst.heap32[(r3 + 1)])
        if (r3 != r2) {
            __label__ = 3
        } else {
            __label__ = 2
        }
    }
    if (__label__ == 2) {
        r2 = Int64(heapClassInst.heap32[(r0 + 2)])
        r3 = r2 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3 + 8)])
        r0 = Int64(heapClassInst.heap32[(r0 + 3)])
        heapClassInst.heap32[(g0)] = Int32(r2)
        heapClassInst.heap32[(g0 + 1)] = Int32(r1)
        heapClassInst.heap32[(g0 + 2)] = Int32(r0)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
    }
    r0 = 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherEN18RemovePairCallbackD1Ev(
    sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTVZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherE18RemovePairCallback
    r0 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    return;
}

@OverflowWrapping
func _ZZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherEN18RemovePairCallbackD0Ev(
    sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTVZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherE18RemovePairCallback
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherEN18RemovePairCallback14processOverlapER16btBroadphasePair(
    sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r0 = Int64(heapClassInst.heap32[(r0 + 1)])
    r1 = r1 >> 2
    r2 = Int64(heapClassInst.heap32[(r1)])
    if (r2 == r0) {
        r0 = 1
        commonVariable.r_g0 = r0
        return;
    } else {
        r1 = Int64(heapClassInst.heap32[(r1 + 1)])

        if (r1 == r0) {
            r0 = 1
        } else {
            r0 = 0
        }
        r0 = r0 & 1
        commonVariable.r_g0 = r0
        return;
    }
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache26getOverlappingPairArrayPtrEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 4)])
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZNK28btHashedOverlappingPairCache26getOverlappingPairArrayPtrEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 4)])
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZNK28btHashedOverlappingPairCache22getNumOverlappingPairsEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 2)])
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache26processAllOverlappingPairsEP17btOverlapCallbackP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = Int64(heapClassInst.heap32[(fp + 2)])
    r3 = 0
    r4 = r3
    var break_flag2 = 0
    while (true) {
        r5 = r4 << 2
        while (true) {
            r6 = r0 >> 2
            r7 = Int64(heapClassInst.heap32[(r6 + 2)])
            if (r7 > r4) {
                r7 = r1 >> 2
                r7 = Int64(heapClassInst.heap32[(r7)])
                r7 = r7 >> 2
                r8 = Int64(heapClassInst.heap32[(r6 + 4)])
                r7 = Int64(heapClassInst.heap32[(r7 + 2)])
                r9 = (r8 + r3) | 0
                heapClassInst.heap32[(g0)] = Int32(r1)
                heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                __FUNCTION_TABLE__[(r7) >> 2](i7);
                r7 = commonVariable.r_g0
                if (r7 == 0) {
                    break
                } else {
                    r7 = r5 << 2
                    r6 = Int64(heapClassInst.heap32[(r6)])
                    r7 = (r8 + r7) | 0
                    r7 = r7 >> 2
                    r6 = r6 >> 2
                    r6 = Int64(heapClassInst.heap32[(r6 + 3)])
                    r8 = Int64(heapClassInst.heap32[(r7 + 1)])
                    r7 = Int64(heapClassInst.heap32[(r7)])
                    heapClassInst.heap32[(g0)] = Int32(r0)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r7)
                    heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                    heapClassInst.heap32[(g0 + 3)] = Int32(r2)
                    r7 = gOverlappingPairs
                    r7 = r7 >> 2
                    __FUNCTION_TABLE__[(r6) >> 2](i7);
                    r6 = Int64(heapClassInst.heap32[(r7)])
                    r6 = (r6 + (-1)) | 0
                    heapClassInst.heap32[(r7)] = Int32(r6)
                    continue
                }
            } else {
                break_flag2 = 1
                break
            }
        }
        if (break_flag2 == 1) {
            break
        }
        r4 = (r4 + 1) | 0
        r3 = (r3 + 16) | 0
        continue
    }
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcher(
    sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-24)
    var g0 = i7 >> 2;
    r0 = _ZTVZN28btHashedOverlappingPairCache37removeOverlappingPairsContainingProxyEP17btBroadphaseProxyP12btDispatcherE18RemovePairCallback
    r1 = sp + (-8)
    r0 = (r0 + 8) | 0
    r2 = Int64(heapClassInst.heap32[(fp)])
    r3 = r1 >> 2
    r4 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(fp + (-2))] = Int32(r0)
    r0 = r2 >> 2
    heapClassInst.heap32[(r3 + 1)] = Int32(r4)
    r0 = Int64(heapClassInst.heap32[(r0)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 12)])
    r3 = Int64(heapClassInst.heap32[(fp + 2)])
    heapClassInst.heap32[(g0)] = Int32(r2)
    heapClassInst.heap32[(g0 + 1)] = Int32(r1)
    heapClassInst.heap32[(g0 + 2)] = Int32(r3)
    __FUNCTION_TABLE__[(r0) >> 2](i7);
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-32)
    var g0 = i7 >> 2;
    r0 = _ZTVZN28btHashedOverlappingPairCache19cleanProxyFromPairsEP17btBroadphaseProxyP12btDispatcherE17CleanPairCallback
    r1 = sp + (-16)
    r0 = (r0 + 8) | 0
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(fp + (-4))] = Int32(r0)
    r0 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(r2 + 1)] = Int32(r3)
    r3 = Int64(heapClassInst.heap32[(fp + 2)])
    heapClassInst.heap32[(r2 + 2)] = Int32(r0)
    r4 = r0 >> 2
    heapClassInst.heap32[(r2 + 3)] = Int32(r3)
    r2 = Int64(heapClassInst.heap32[(r4)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 12)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r1)
    heapClassInst.heap32[(g0 + 2)] = Int32(r3)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCacheD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV28btHashedOverlappingPairCache
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 16)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 68])
        if (!(r3 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 16)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 68] = Int8(r1)
    heapClassInst.heap32[(r2 + 16)] = 0
    heapClassInst.heap32[(r2 + 14)] = 0
    heapClassInst.heap32[(r2 + 15)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 11)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 48])
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 11)] = 0
    }
    heapClassInst.heap8[r0 + 48] = Int8(r1)
    heapClassInst.heap32[(r2 + 11)] = 0
    heapClassInst.heap32[(r2 + 9)] = 0
    heapClassInst.heap32[(r2 + 10)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 20])
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 4)] = 0
    }
    heapClassInst.heap8[r0 + 20] = Int8(r1)
    heapClassInst.heap32[(r2 + 4)] = 0
    heapClassInst.heap32[(r2 + 2)] = 0
    heapClassInst.heap32[(r2 + 3)] = 0
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCacheD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV28btHashedOverlappingPairCache
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 16)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 68])
        if (!(r3 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 16)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 68] = Int8(r1)
    heapClassInst.heap32[(r2 + 16)] = 0
    heapClassInst.heap32[(r2 + 14)] = 0
    heapClassInst.heap32[(r2 + 15)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 11)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 48])
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 11)] = 0
    }
    heapClassInst.heap8[r0 + 48] = Int8(r1)
    heapClassInst.heap32[(r2 + 11)] = 0
    heapClassInst.heap32[(r2 + 9)] = 0
    heapClassInst.heap32[(r2 + 10)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 20])
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 4)] = 0
    }
    heapClassInst.heap8[r0 + 20] = Int8(r1)
    heapClassInst.heap32[(r2 + 4)] = 0
    heapClassInst.heap32[(r2 + 2)] = 0
    heapClassInst.heap32[(r2 + 3)] = 0
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache18addOverlappingPairEP17btBroadphaseProxyS1_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = gAddedPairs
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = Int64(heapClassInst.heap32[(fp)])
    r1 = (r1 + 1) | 0
    r3 = r2 >> 2
    heapClassInst.heap32[(r0)] = Int32(r1)
    r0 = Int64(heapClassInst.heap32[(r3 + 6)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r4 = Int64(heapClassInst.heap32[(fp + 2)])
    if (r0 == 0) {
        r0 = Int64(heapClassInst.heapU16[(r4 + 6) >> 1])
        r5 = Int64(heapClassInst.heapU16[(r1 + 4) >> 1])
        r0 = r0 & r5
        r0 = r0 & 65535
        if (r0 == 0) {
            __label__ = 23
        } else {
            r0 = Int64(heapClassInst.heapU16[(r1 + 6) >> 1])
            r5 = Int64(heapClassInst.heapU16[(r4 + 4) >> 1])
            r0 = r0 & r5
            r0 = r0 & 65535
            r5 = 0

            if (r0 != r5) {
                r0 = 1
            } else {
                r0 = 0
            }
            r0 = r0 & 1
            __label__ = 4
        }
    } else {
        r5 = r0 >> 2
        r5 = Int64(heapClassInst.heap32[(r5)])
        r5 = r5 >> 2
        r5 = Int64(heapClassInst.heap32[(r5 + 2)])
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = Int32(r1)
        heapClassInst.heap32[(g0 + 2)] = Int32(r4)
        __FUNCTION_TABLE__[(r5) >> 2](i7);
        r0 = commonVariable.r_g0
        __label__ = 4
    }
    if (__label__ == 4) {
        r0 = r0 & 255
        if (!(r0 == 0)) {
            r0 = r1 >> 2
            r5 = r4 >> 2
            r0 = Int64(heapClassInst.heap32[(r0 + 3)])
            r5 = Int64(heapClassInst.heap32[(r5 + 3)])

            if (r0 > r5) {
                r6 = r1
            } else {
                r6 = r4
            }

            if (r0 > r5) {
                r0 = r4
            } else {
                r0 = r1
            }
            r1 = r6 >> 2
            r4 = Int64(heapClassInst.heap32[(r1 + 3)])
            r5 = r0 >> 2
            r7 = Int64(heapClassInst.heap32[(r5 + 3)])
            r8 = r4 << 16
            r8 = r8 | r7
            r9 = r8 << 15
            r9 = r9 ^ (-1)
            r8 = (r8 + r9) | 0
            r9 = r8 >> 10
            r8 = r9 ^ r8
            r8 = (r8 * 9) | 0
            r9 = r8 >> 6
            r8 = r9 ^ r8
            r9 = r8 << 11
            r9 = r9 ^ (-1)
            r8 = (r8 + r9) | 0
            r9 = Int64(heapClassInst.heap32[(r3 + 3)])
            r10 = r8 >> 16
            r8 = r10 ^ r8
            r10 = (r9 + (-1)) | 0
            r10 = r8 & r10
            r11 = Int64(heapClassInst.heap32[(r3 + 11)])
            r12 = r10 << 2
            r11 = (r11 + r12) | 0
            while (true) {
                r11 = r11 >> 2
                r11 = Int64(heapClassInst.heap32[(r11)])
                if (r11 == (-1)) {
                    __label__ = 13
                    break
                } else {
                    r12 = Int64(heapClassInst.heap32[(r3 + 4)])
                    r13 = r11 << 4
                    r12 = (r12 + r13) | 0
                    r13 = r12 >> 2
                    r14 = Int64(heapClassInst.heap32[(r13)])
                    r14 = r14 >> 2
                    r14 = Int64(heapClassInst.heap32[(r14 + 3)])
                    if (!(r14 != r7)) {
                        r13 = Int64(heapClassInst.heap32[(r13 + 1)])
                        r13 = r13 >> 2
                        r13 = Int64(heapClassInst.heap32[(r13 + 3)])
                        if (!(r13 != r4)) {
                            __label__ = 10
                            break
                        }
                    }
                    r12 = Int64(heapClassInst.heap32[(r3 + 16)])
                    r11 = r11 << 2
                    r11 = (r12 + r11) | 0
                }
            }
            do {
                match (__label__) {
                    case 13 =>
                        r4 = Int64(heapClassInst.heap32[(r3 + 2)])
                        __label__ = 14

                    case 10 =>
                        r4 = Int64(heapClassInst.heap32[(r3 + 2)])
                        if (r4 > r11) {
                            if (r12 != 0) {
                                __label__ = 22
                            } else {
                                __label__ = 14
                            }
                        } else {
                            r0 = _E2_str222
                            r1 = _E2_str323
                            heapClassInst.heap32[(g0)] = Int32(r0)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
                            heapClassInst.heap32[(g0 + 2)] = 250
                            _assert(i7);
                        }
                    case _ => println("break5740")
                }
            } while (false);
            if (__label__ == 14) {
                r12 = (r2 + 4) | 0
                heapClassInst.heap32[(g0)] = Int32(r12)
                _ZN20btAlignedObjectArrayI16btBroadphasePairE21expandNonInitializingEv(i7);
                r12 = commonVariable.r_g0
                r7 = Int64(heapClassInst.heap32[(r3 + 18)])
                if (!(r7 == 0)) {
                    r11 = r7 >> 2
                    r11 = Int64(heapClassInst.heap32[(r11)])
                    r11 = r11 >> 2
                    r11 = Int64(heapClassInst.heap32[(r11 + 2)])
                    heapClassInst.heap32[(g0)] = Int32(r7)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                    heapClassInst.heap32[(g0 + 2)] = Int32(r6)
                    __FUNCTION_TABLE__[(r11) >> 2](i7);
                }
                r7 = Int64(heapClassInst.heap32[(r3 + 3)])
                if (r9 < r7) {
                    heapClassInst.heap32[(g0)] = Int32(r2)
                    _ZN28btHashedOverlappingPairCache10growTablesEv(i7);
                    r10 = Int64(heapClassInst.heap32[(r3 + 3)])
                    r10 = (r10 + (-1)) | 0
                    r10 = r10 & r8
                }
                r2 = Int64(heapClassInst.heap32[(r5 + 3)])
                r1 = Int64(heapClassInst.heap32[(r1 + 3)])
                if (r2 >= r1) {
                    r1 = r12 >> 2
                    heapClassInst.heap32[(r1)] = Int32(r6)
                    heapClassInst.heap32[(r1 + 1)] = Int32(r0)
                } else {
                    r1 = r12 >> 2
                    heapClassInst.heap32[(r1)] = Int32(r0)
                    heapClassInst.heap32[(r1 + 1)] = Int32(r6)
                }
                r0 = r12 >> 2
                heapClassInst.heap32[(r0 + 2)] = 0
                heapClassInst.heap32[(r0 + 3)] = 0
                r0 = r10 << 2
                r1 = Int64(heapClassInst.heap32[(r3 + 11)])
                r1 = (r1 + r0) | 0
                r1 = r1 >> 2
                r2 = r4 << 2
                r5 = Int64(heapClassInst.heap32[(r3 + 16)])
                r2 = (r5 + r2) | 0
                r1 = Int64(heapClassInst.heap32[(r1)])
                r2 = r2 >> 2
                heapClassInst.heap32[(r2)] = Int32(r1)
                r1 = Int64(heapClassInst.heap32[(r3 + 11)])
                r0 = (r1 + r0) | 0
                r0 = r0 >> 2
                heapClassInst.heap32[(r0)] = Int32(r4)
            }
            commonVariable.r_g0 = r12
            return;
        }
    }
    r0 = 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache21removeOverlappingPairEP17btBroadphaseProxyS1_P12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = gRemovePairs
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = Int64(heapClassInst.heap32[(fp + 2)])
    r3 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = (r1 + 1) | 0
    r4 = r3 >> 2
    heapClassInst.heap32[(r0)] = Int32(r1)
    r0 = r2 >> 2
    r1 = Int64(heapClassInst.heap32[(r4 + 3)])
    r0 = Int64(heapClassInst.heap32[(r0 + 3)])

    if (r1 > r0) {
        r4 = r3
    } else {
        r4 = r2
    }

    if (r1 > r0) {
        r0 = r2
    } else {
        r0 = r3
    }
    r1 = r4 >> 2
    r1 = Int64(heapClassInst.heap32[(r1 + 3)])
    r2 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 3)])
    r3 = r1 << 16
    r3 = r3 | r2
    r5 = r3 << 15
    r5 = r5 ^ (-1)
    r3 = (r3 + r5) | 0
    r5 = r3 >> 10
    r3 = r5 ^ r3
    r3 = (r3 * 9) | 0
    r5 = r3 >> 6
    r3 = r5 ^ r3
    r5 = r3 << 11
    r6 = Int64(heapClassInst.heap32[(fp)])
    r5 = r5 ^ (-1)
    r7 = r6 >> 2
    r3 = (r3 + r5) | 0
    r5 = r3 >> 16
    r8 = Int64(heapClassInst.heap32[(r7 + 3)])
    r3 = r5 ^ r3
    r5 = (r8 + (-1)) | 0
    r3 = r3 & r5
    r5 = Int64(heapClassInst.heap32[(r7 + 11)])
    r3 = r3 << 2
    r8 = Int64(heapClassInst.heap32[(fp + 3)])
    r5 = (r5 + r3) | 0
    while (true) {
        r5 = r5 >> 2
        r5 = Int64(heapClassInst.heap32[(r5)])
        if (r5 == (-1)) {
            __label__ = 33
            break
        } else {
            r9 = Int64(heapClassInst.heap32[(r7 + 4)])
            r10 = r5 << 4
            r9 = (r9 + r10) | 0
            r10 = r9 >> 2
            r11 = Int64(heapClassInst.heap32[(r10)])
            r11 = r11 >> 2
            r11 = Int64(heapClassInst.heap32[(r11 + 3)])
            if (!(r11 != r2)) {
                r11 = Int64(heapClassInst.heap32[(r10 + 1)])
                r11 = r11 >> 2
                r11 = Int64(heapClassInst.heap32[(r11 + 3)])
                if (!(r11 != r1)) {
                    __label__ = 5
                    break
                }
            }
            r9 = Int64(heapClassInst.heap32[(r7 + 16)])
            r5 = r5 << 2
            r5 = (r9 + r5) | 0
            continue
        }
    }
    if (__label__ == 5) {
        r11 = Int64(heapClassInst.heap32[(r7 + 2)])
        if (r11 > r5) {
            if (!(r9 == 0)) {
                r5 = Int64(heapClassInst.heap32[(r7)])
                r5 = r5 >> 2
                r5 = Int64(heapClassInst.heap32[(r5 + 8)])
                heapClassInst.heap32[(g0)] = Int32(r6)
                heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                __FUNCTION_TABLE__[(r5) >> 2](i7);
                r5 = Int64(heapClassInst.heap32[(r10)])
                r5 = r5 >> 2
                r5 = Int64(heapClassInst.heap32[(r5 + 3)])
                if (r5 == r2) {
                    r2 = Int64(heapClassInst.heap32[(r10 + 1)])
                    r2 = r2 >> 2
                    r2 = Int64(heapClassInst.heap32[(r2 + 3)])
                    if (r2 == r1) {
                        r1 = Int64(heapClassInst.heap32[(r7 + 4)])
                        r1 = (r9 - r1) | 0
                        r1 = r1 >> 4
                        r2 = Int64(heapClassInst.heap32[(r7 + 2)])
                        if (r2 > r1) {
                            r2 = Int64(heapClassInst.heap32[(r7 + 11)])
                            r2 = (r2 + r3) | 0
                            r2 = r2 >> 2
                            r3 = Int64(heapClassInst.heap32[(r2)])
                            if (r3 == (-1)) {
                                r0 = _E2_str727
                                r1 = _E2_str121
                                heapClassInst.heap32[(g0)] = Int32(r0)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r1)
                                heapClassInst.heap32[(g0 + 2)] = 304
                                _assert(i7);
                            } else {
                                r5 = Int64(heapClassInst.heap32[(r10 + 3)])
                                r6 = Int64(heapClassInst.heap32[(r7 + 16)])
                                if (r3 == r1) {
                                    __label__ = 20
                                } else {
                                    while (true) {
                                        r9 = r3
                                        r3 = r9 << 2
                                        r3 = (r6 + r3) | 0
                                        r10 = r3 >> 2
                                        r3 = Int64(heapClassInst.heap32[(r10)])
                                        if (!(r3 != r1)) {
                                            break
                                        }
                                    }
                                    if (r9 == (-1)) {
                                        __label__ = 20
                                    } else {
                                        r2 = r1 << 2
                                        r2 = (r6 + r2) | 0
                                        r2 = r2 >> 2
                                        r2 = Int64(heapClassInst.heap32[(r2)])
                                        heapClassInst.heap32[(r10)] = Int32(r2)
                                        __label__ = 21
                                    }
                                }
                                if (__label__ == 20) {
                                    r3 = r1 << 2
                                    r3 = (r6 + r3) | 0
                                    r3 = r3 >> 2
                                    r3 = Int64(heapClassInst.heap32[(r3)])
                                    heapClassInst.heap32[(r2)] = Int32(r3)
                                }
                                r2 = Int64(heapClassInst.heap32[(r7 + 2)])
                                r3 = Int64(heapClassInst.heap32[(r7 + 18)])
                                if (!(r3 == 0)) {
                                    r6 = r3 >> 2
                                    r6 = Int64(heapClassInst.heap32[(r6)])
                                    r6 = r6 >> 2
                                    r6 = Int64(heapClassInst.heap32[(r6 + 3)])
                                    heapClassInst.heap32[(g0)] = Int32(r3)
                                    heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                                    heapClassInst.heap32[(g0 + 2)] = Int32(r4)
                                    heapClassInst.heap32[(g0 + 3)] = Int32(r8)
                                    __FUNCTION_TABLE__[(r6) >> 2](i7);
                                }
                                r0 = (r2 + (-1)) | 0
                                if (r0 != r1) {
                                    r3 = Int64(heapClassInst.heap32[(r7 + 4)])
                                    r4 = r2 << 4
                                    r3 = (r3 + r4) | 0
                                    r3 = r3 >> 2
                                    r6 = Int64(heapClassInst.heap32[(r3 + (-3))])
                                    r3 = Int64(heapClassInst.heap32[(r3 + (-4))])
                                    r6 = r6 >> 2
                                    r3 = r3 >> 2
                                    r6 = Int64(heapClassInst.heap32[(r6 + 3)])
                                    r3 = Int64(heapClassInst.heap32[(r3 + 3)])
                                    r6 = r6 << 16
                                    r3 = r3 | r6
                                    r6 = r3 << 15
                                    r6 = r6 ^ (-1)
                                    r3 = (r3 + r6) | 0
                                    r6 = r3 >> 10
                                    r3 = r6 ^ r3
                                    r3 = (r3 * 9) | 0
                                    r6 = r3 >> 6
                                    r3 = r6 ^ r3
                                    r6 = r3 << 11
                                    r6 = r6 ^ (-1)
                                    r3 = (r3 + r6) | 0
                                    r6 = r3 >> 16
                                    r8 = Int64(heapClassInst.heap32[(r7 + 3)])
                                    r3 = r6 ^ r3
                                    r6 = (r8 + (-1)) | 0
                                    r3 = r3 & r6
                                    r6 = Int64(heapClassInst.heap32[(r7 + 11)])
                                    r3 = r3 << 2
                                    r6 = (r6 + r3) | 0
                                    r6 = r6 >> 2
                                    r8 = Int64(heapClassInst.heap32[(r6)])
                                    if (r8 == (-1))
                                    {
                                        r0 = _E2_str727
                                        r1 = _E2_str121
                                        heapClassInst.heap32[(g0)] = Int32(r0)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r1)
                                        heapClassInst.heap32[(g0 + 2)] = 345
                                        _assert(i7);
                                    } else {
                                        r9 = Int64(heapClassInst.heap32[(r7 + 16)])
                                        if (r8 == r0) {
                                            __label__ = 31
                                        } else {
                                            while (true) {
                                                r10 = r8
                                                r8 = r10 << 2
                                                r8 = (r9 + r8) | 0
                                                r11 = r8 >> 2
                                                r8 = Int64(heapClassInst.heap32[(r11)])
                                                if (!(r8 != r0)) {
                                                    break
                                                }
                                            }
                                            if (r10 == (-1)) {
                                                __label__ = 31
                                            } else {
                                                r2 = r2 << 2
                                                r2 = (r9 + r2) | 0
                                                r2 = r2 >> 2
                                                r2 = Int64(heapClassInst.heap32[(r2 + (-1))])
                                                heapClassInst.heap32[(r11)] = Int32(r2)
                                                __label__ = 32
                                            }
                                        }
                                        if (__label__ == 31) {
                                            r0 = r2 << 2
                                            r0 = (r9 + r0) | 0
                                            r0 = r0 >> 2
                                            r0 = Int64(heapClassInst.heap32[(r0 + (-1))])
                                            heapClassInst.heap32[(r6)] = Int32(r0)
                                        }
                                        r0 = Int64(heapClassInst.heap32[(r7 + 4)])
                                        r2 = (r0 + r4) | 0
                                        r4 = r1 << 4
                                        r2 = r2 >> 2
                                        r0 = (r0 + r4) | 0
                                        r4 = Int64(heapClassInst.heap32[(r2 + (-4))])
                                        r0 = r0 >> 2
                                        heapClassInst.heap32[(r0)] = Int32(r4)
                                        r4 = Int64(heapClassInst.heap32[(r2 + (-3))])
                                        heapClassInst.heap32[(r0 + 1)] = Int32(r4)
                                        r4 = Int64(heapClassInst.heap32[(r2 + (-2))])
                                        heapClassInst.heap32[(r0 + 2)] = Int32(r4)
                                        r2 = Int64(heapClassInst.heap32[(r2 + (-1))])
                                        heapClassInst.heap32[(r0 + 3)] = Int32(r2)
                                        r0 = Int64(heapClassInst.heap32[(r7 + 11)])
                                        r0 = (r0 + r3) | 0
                                        r0 = r0 >> 2
                                        r2 = r1 << 2
                                        r4 = Int64(heapClassInst.heap32[(r7 + 16)])
                                        r2 = (r4 + r2) | 0
                                        r0 = Int64(heapClassInst.heap32[(r0)])
                                        r2 = r2 >> 2
                                        heapClassInst.heap32[(r2)] = Int32(r0)
                                        r0 = Int64(heapClassInst.heap32[(r7 + 11)])
                                        r0 = (r0 + r3) | 0
                                        r0 = r0 >> 2
                                        heapClassInst.heap32[(r0)] = Int32(r1)
                                    }
                                }
                                r0 = Int64(heapClassInst.heap32[(r7 + 2)])
                                r0 = (r0 + (-1)) | 0
                                heapClassInst.heap32[(r7 + 2)] = Int32(r0)
                                commonVariable.r_g0 = r5
                                return;
                            }
                        } else {
                            r0 = _E2_str626
                            r1 = _E2_str121
                            heapClassInst.heap32[(g0)] = Int32(r0)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
                            heapClassInst.heap32[(g0 + 2)] = 300
                            _assert(i7);
                        }
                    } else {
                        r0 = _E2_str525
                        r3 = _E2_str121
                        heapClassInst.heap32[(g0)] = Int32(r0)
                        heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                        heapClassInst.heap32[(g0 + 2)] = 297
                        _assert(i7);
                    }
                } else {
                    r0 = _E2_str424
                    r1 = _E2_str121
                    heapClassInst.heap32[(g0)] = Int32(r0)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r1)
                    heapClassInst.heap32[(g0 + 2)] = 296
                    _assert(i7);
                }
            }
        } else {
            r0 = _E2_str222
            r1 = _E2_str323
            heapClassInst.heap32[(g0)] = Int32(r0)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heap32[(g0 + 2)] = 250
            _assert(i7);
        }
    }
    r0 = 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache8findPairEP17btBroadphaseProxyS1_(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = gFindPairs
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    r3 = Int64(heapClassInst.heap32[(fp + 2)])
    r1 = (r1 + 1) | 0
    r4 = r2 >> 2
    heapClassInst.heap32[(r0)] = Int32(r1)
    r0 = r3 >> 2
    r1 = Int64(heapClassInst.heap32[(r4 + 3)])
    r0 = Int64(heapClassInst.heap32[(r0 + 3)])

    if (r1 > r0) {
        r4 = r2
    } else {
        r4 = r3
    }

    if (r1 > r0) {
        r0 = r3
    } else {
        r0 = r2
    }
    r1 = r4 >> 2
    r1 = Int64(heapClassInst.heap32[(r1 + 3)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 3)])
    r2 = r1 << 16
    r2 = r2 | r0
    r3 = r2 << 15
    r3 = r3 ^ (-1)
    r2 = (r2 + r3) | 0
    r3 = r2 >> 10
    r2 = r3 ^ r2
    r2 = (r2 * 9) | 0
    r3 = r2 >> 6
    r2 = r3 ^ r2
    r3 = r2 << 11
    r4 = Int64(heapClassInst.heap32[(fp)])
    r3 = r3 ^ (-1)
    r4 = r4 >> 2
    r2 = (r2 + r3) | 0
    r3 = r2 >> 16
    r5 = Int64(heapClassInst.heap32[(r4 + 3)])
    r2 = r3 ^ r2
    r3 = (r5 + (-1)) | 0
    r2 = r2 & r3
    r3 = Int64(heapClassInst.heap32[(r4 + 9)])
    do {
        if (!(r3 <= r2)) {
            r3 = Int64(heapClassInst.heap32[(r4 + 11)])
            r2 = r2 << 2
            r2 = (r3 + r2) | 0
            while (true) {
                r2 = r2 >> 2
                r2 = Int64(heapClassInst.heap32[(r2)])
                if (r2 == (-1)) {
                    break
                } else {
                    r3 = Int64(heapClassInst.heap32[(r4 + 4)])
                    r5 = r2 << 4
                    r3 = (r3 + r5) | 0
                    r5 = r3 >> 2
                    r6 = Int64(heapClassInst.heap32[(r5)])
                    r6 = r6 >> 2
                    r6 = Int64(heapClassInst.heap32[(r6 + 3)])
                    if (!(r6 != r0)) {
                        r5 = Int64(heapClassInst.heap32[(r5 + 1)])
                        r5 = r5 >> 2
                        r5 = Int64(heapClassInst.heap32[(r5 + 3)])
                        if (!(r5 != r1)) {
                            break
                        }
                    }
                    r3 = Int64(heapClassInst.heap32[(r4 + 16)])
                    r2 = r2 << 2
                    r2 = (r3 + r2) | 0
                }
            }
            r0 = Int64(heapClassInst.heap32[(r4 + 2)])
            if (r0 > r2) {
                commonVariable.r_g0 = r3
                return;
            } else {
                r3 = _E2_str222
                r0 = _E2_str121
                heapClassInst.heap32[(g0)] = Int32(r3)
                heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                heapClassInst.heap32[(g0 + 2)] = 165
                _assert(i7);
            }
        }
    } while (false);
    r0 = 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache20sortOverlappingPairsEP12btDispatcher(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var r13: Int64 = 0
    var r14: Int64 = 0
    var r15: Int64 = 0
    var r16: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-40)
    var g0 = i7 >> 2;
    r0 = sp + (-24)
    r1 = 1
    r2 = r0 >> 2
    heapClassInst.heap8[sp + (-8)] = Int8(r1)
    heapClassInst.heap32[(r2 + 3)] = 0
    r3 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(r2 + 1)] = 0
    r4 = r3 >> 2
    heapClassInst.heap32[(r2 + 2)] = 0
    r5 = Int64(heapClassInst.heap32[(r4 + 2)])
    do {
        if (r5 > 0) {
            r6 = Int64(heapClassInst.heap32[(fp + 1)])
            r7 = 0
            r5 = r7
            while (true) {
                r8 = Int64(heapClassInst.heap32[(r4 + 4)])
                if (r7 == r5) {
                    r9 = 1
                    r10 = r5 << 1

                    if (r5 == 0) {
                        r10 = r9
                    }
                    if (!(r7 >= r10)) {
                        if (r10 != 0) {
                            r7 = gNumAlignedAllocs
                            r7 = r7 >> 2
                            r11 = Int64(heapClassInst.heap32[(r7)])
                            r12 = r10 << 4
                            r11 = (r11 + 1) | 0
                            r12 = r12 | 3
                            heapClassInst.heap32[(r7)] = Int32(r11)
                            r7 = (r12 + 16) | 0
                            heapClassInst.heap32[(g0)] = Int32(r7)
                            mallocNew(i7);
                            r7 = commonVariable.r_g0
                            if (r7 != 0) {
                                r11 = 0
                                r12 = (r7 + 4) | 0
                                r11 = (r11 - r12) | 0
                                r11 = r11 & 15
                                r11 = (r7 + r11) | 0
                                r12 = (r11 + 4) | 0
                                r11 = r11 >> 2
                                heapClassInst.heap32[(r11)] = Int32(r7)
                                r7 = r12
                            }
                        } else {
                            r7 = 0
                        }
                        if (r5 < 1) {
                            r13 = Int64(heapClassInst.heap32[(r2 + 3)])
                        } else {
                            r11 = 0
                            r12 = (r11 - r5) | 0
                            while (true) {
                                r13 = Int64(heapClassInst.heap32[(r2 + 3)])
                                r14 = r11 << 4
                                r15 = (r13 - r14) | 0
                                r15 = r15 >> 2
                                r14 = (r7 - r14) | 0
                                r16 = Int64(heapClassInst.heap32[(r15)])
                                r14 = r14 >> 2
                                heapClassInst.heap32[(r14)] = Int32(r16)
                                r16 = Int64(heapClassInst.heap32[(r15 + 1)])
                                heapClassInst.heap32[(r14 + 1)] = Int32(r16)
                                r16 = Int64(heapClassInst.heap32[(r15 + 2)])
                                heapClassInst.heap32[(r14 + 2)] = Int32(r16)
                                r15 = Int64(heapClassInst.heap32[(r15 + 3)])
                                r11 = (r11 + (-1)) | 0
                                heapClassInst.heap32[(r14 + 3)] = Int32(r15)
                                if (!(r12 != r11)) {
                                    break
                                }
                            }
                        }
                        if (r13 != 0) {
                            r11 = Int64(heapClassInst.heapU8[sp + (-8)])
                            if (r11 != 0) {
                                r5 = gNumAlignedFree
                                r5 = r5 >> 2
                                r11 = Int64(heapClassInst.heap32[(r5)])
                                r11 = (r11 + 1) | 0
                                r12 = r13 >> 2
                                heapClassInst.heap32[(r5)] = Int32(r11)
                                r5 = Int64(heapClassInst.heap32[(r12 + (-1))])
                                heapClassInst.heap32[(g0)] = Int32(r5)
                                free(i7);
                                r5 = Int64(heapClassInst.heap32[(r2 + 1)])
                            }
                            heapClassInst.heap32[(r2 + 3)] = 0
                        }
                        heapClassInst.heap8[sp + (-8)] = Int8(r9)
                        heapClassInst.heap32[(r2 + 3)] = Int32(r7)
                        heapClassInst.heap32[(r2 + 2)] = Int32(r10)
                    }
                }
                r7 = r1 << 4
                r7 = (r8 + r7) | 0
                r7 = r7 >> 2
                r5 = r5 << 4
                r8 = Int64(heapClassInst.heap32[(r2 + 3)])
                r5 = (r8 + r5) | 0
                r8 = Int64(heapClassInst.heap32[(r7 + (-4))])
                r5 = r5 >> 2
                heapClassInst.heap32[(r5)] = Int32(r8)
                r8 = Int64(heapClassInst.heap32[(r7 + (-3))])
                heapClassInst.heap32[(r5 + 1)] = Int32(r8)
                r8 = Int64(heapClassInst.heap32[(r7 + (-2))])
                heapClassInst.heap32[(r5 + 2)] = Int32(r8)
                r7 = Int64(heapClassInst.heap32[(r7 + (-1))])
                heapClassInst.heap32[(r5 + 3)] = Int32(r7)
                r5 = Int64(heapClassInst.heap32[(r2 + 1)])
                r5 = (r5 + 1) | 0
                heapClassInst.heap32[(r2 + 1)] = Int32(r5)
                r7 = Int64(heapClassInst.heap32[(r4 + 2)])
                if (r7 <= r1) {
                    break
                } else {
                    r7 = Int64(heapClassInst.heap32[(r2 + 2)])
                    r1 = (r1 + 1) | 0
                }
            }
            if (r5 > 0) {
                r1 = 0
                while (true) {
                    r5 = Int64(heapClassInst.heap32[(r2 + 3)])
                    r7 = r1 << 4
                    r8 = Int64(heapClassInst.heap32[(r4)])
                    r5 = (r5 + r7) | 0
                    r5 = r5 >> 2
                    r7 = r8 >> 2
                    r7 = Int64(heapClassInst.heap32[(r7 + 3)])
                    r8 = Int64(heapClassInst.heap32[(r5 + 1)])
                    r5 = Int64(heapClassInst.heap32[(r5)])
                    heapClassInst.heap32[(g0)] = Int32(r3)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r5)
                    heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                    heapClassInst.heap32[(g0 + 3)] = Int32(r6)
                    __FUNCTION_TABLE__[(r7) >> 2](i7);
                    r5 = Int64(heapClassInst.heap32[(r2 + 1)])
                    r1 = (r1 + 1) | 0
                    if (r5 > r1) {
                        continue
                    } else {
                        break
                    }
                }
            }
        } else {
            r5 = 0
        }
    } while (false);
    r1 = Int64(heapClassInst.heap32[(r4 + 14)])
    if (r1 > 0) {
        r5 = 0
        while (true) {
            r1 = r5 << 2
            r6 = Int64(heapClassInst.heap32[(r4 + 16)])
            r1 = (r6 + r1) | 0
            r5 = (r5 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r1)] = (-1)
            r1 = Int64(heapClassInst.heap32[(r4 + 14)])
            if (!(r1 > r5)) {
                break
            }
        }
        r5 = Int64(heapClassInst.heap32[(r2 + 1)])
    }
    if (r5 > 1) {
        r5 = (r5 + (-1)) | 0
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = 0
        heapClassInst.heap32[(g0 + 2)] = Int32(r5)
        _ZN20btAlignedObjectArrayI16btBroadphasePairE17quickSortInternalI29btBroadphasePairSortPredicateEEvT_ii(i7);
        r5 = Int64(heapClassInst.heap32[(r2 + 1)])
    }
    do {
        if (!(r5 < 1)) {
            r0 = 0
            while (true) {
                r1 = Int64(heapClassInst.heap32[(r2 + 3)])
                r5 = r0 << 4
                r6 = Int64(heapClassInst.heap32[(r4)])
                r1 = (r1 + r5) | 0
                r1 = r1 >> 2
                r5 = r6 >> 2
                r5 = Int64(heapClassInst.heap32[(r5 + 2)])
                r6 = Int64(heapClassInst.heap32[(r1 + 1)])
                r1 = Int64(heapClassInst.heap32[(r1)])
                heapClassInst.heap32[(g0)] = Int32(r3)
                heapClassInst.heap32[(g0 + 1)] = Int32(r1)
                heapClassInst.heap32[(g0 + 2)] = Int32(r6)
                r0 = (r0 + 1) | 0
                __FUNCTION_TABLE__[(r5) >> 2](i7);
                r1 = Int64(heapClassInst.heap32[(r2 + 1)])
                if (r1 > r0) {
                    continue
                } else {
                    break
                }
            }
        }
    } while (false);
    r0 = Int64(heapClassInst.heap32[(r2 + 3)])
    if (!(r0 == 0)) {
        r1 = Int64(heapClassInst.heapU8[sp + (-8)])
        if (!(r1 == 0)) {
            r1 = gNumAlignedFree
            r1 = r1 >> 2
            r2 = Int64(heapClassInst.heap32[(r1)])
            r2 = (r2 + 1) | 0
            r0 = r0 >> 2
            heapClassInst.heap32[(r1)] = Int32(r2)
            r0 = Int64(heapClassInst.heap32[(r0 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r0)
            free(i7);
        }
    }
    return;
}

@OverflowWrapping
func _ZN20btAlignedObjectArrayI16btBroadphasePairE21expandNonInitializingEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var r12: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 2)])
    r3 = Int64(heapClassInst.heap32[(r1 + 1)])
    if (r2 == r3) {
        r4 = 1
        r5 = r3 << 1

        if (r3 == 0) {
            r5 = r4
        }
        if (r2 >= r5) {
            __label__ = 1
        } else {
            if (r5 != 0) {
                r2 = gNumAlignedAllocs
                r2 = r2 >> 2
                r6 = Int64(heapClassInst.heap32[(r2)])
                r7 = r5 << 4
                r6 = (r6 + 1) | 0
                r7 = r7 | 3
                heapClassInst.heap32[(r2)] = Int32(r6)
                r2 = (r7 + 16) | 0
                heapClassInst.heap32[(g0)] = Int32(r2)
                mallocNew(i7);
                r6 = commonVariable.r_g0
                if (r6 != 0) {
                    r2 = 0
                    r7 = (r6 + 4) | 0
                    r2 = (r2 - r7) | 0
                    r2 = r2 & 15
                    r2 = (r6 + r2) | 0
                    r7 = (r2 + 4) | 0
                    r2 = r2 >> 2
                    heapClassInst.heap32[(r2)] = Int32(r6)
                    r6 = r7
                }
            } else {
                r6 = 0
            }
            r7 = (r0 + 12) | 0
            if (r3 < 1) {
                r2 = r7 >> 2
                r9 = Int64(heapClassInst.heap32[(r2)])
            } else {
                r2 = 0
                r8 = (r2 - r3) | 0
                while (true) {
                    r9 = r7 >> 2
                    r9 = Int64(heapClassInst.heap32[(r9)])
                    r10 = r2 << 4
                    r11 = (r9 - r10) | 0
                    r11 = r11 >> 2
                    r10 = (r6 - r10) | 0
                    r12 = Int64(heapClassInst.heap32[(r11)])
                    r10 = r10 >> 2
                    heapClassInst.heap32[(r10)] = Int32(r12)
                    r12 = Int64(heapClassInst.heap32[(r11 + 1)])
                    heapClassInst.heap32[(r10 + 1)] = Int32(r12)
                    r12 = Int64(heapClassInst.heap32[(r11 + 2)])
                    heapClassInst.heap32[(r10 + 2)] = Int32(r12)
                    r11 = Int64(heapClassInst.heap32[(r11 + 3)])
                    r2 = (r2 + (-1)) | 0
                    heapClassInst.heap32[(r10 + 3)] = Int32(r11)
                    if (!(r8 != r2)) {
                        break
                    }
                }
                r7 = (r0 + 12) | 0
            }
            if (r9 != 0) {
                r2 = Int64(heapClassInst.heapU8[r0 + 16])
                if (r2 != 0) {
                    r2 = gNumAlignedFree
                    r2 = r2 >> 2
                    r8 = Int64(heapClassInst.heap32[(r2)])
                    r8 = (r8 + 1) | 0
                    r9 = r9 >> 2
                    heapClassInst.heap32[(r2)] = Int32(r8)
                    r2 = Int64(heapClassInst.heap32[(r9 + (-1))])
                    heapClassInst.heap32[(g0)] = Int32(r2)
                    free(i7);
                    r2 = Int64(heapClassInst.heap32[(r1 + 1)])
                } else {
                    r2 = r3
                }
                r8 = r7 >> 2
                heapClassInst.heap32[(r8)] = 0
            } else {
                r2 = r3
            }
            r7 = r7 >> 2
            heapClassInst.heap8[r0 + 16] = Int8(r4)
            heapClassInst.heap32[(r7)] = Int32(r6)
            heapClassInst.heap32[(r1 + 2)] = Int32(r5)
            __label__ = 19
        }
    } else {
        __label__ = 1
    }
    if (__label__ == 1) {
        r2 = r3
    }
    r0 = (r2 + 1) | 0
    heapClassInst.heap32[(r1 + 1)] = Int32(r0)
    r0 = Int64(heapClassInst.heap32[(r1 + 3)])
    r1 = r3 << 4
    r0 = (r0 + r1) | 0
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCache10growTablesEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 9)])
    r3 = Int64(heapClassInst.heap32[(r1 + 3)])
    do {
        if (!(r2 >= r3)) {
            do {
                if (!(r2 > r3)) {
                    r4 = Int64(heapClassInst.heap32[(r1 + 10)])
                    if (!(r4 >= r3)) {
                        if (r3 != 0) {
                            r4 = gNumAlignedAllocs
                            r4 = r4 >> 2
                            r5 = Int64(heapClassInst.heap32[(r4)])
                            r6 = r3 << 2
                            r5 = (r5 + 1) | 0
                            r6 = r6 | 3
                            heapClassInst.heap32[(r4)] = Int32(r5)
                            r4 = (r6 + 16) | 0
                            heapClassInst.heap32[(g0)] = Int32(r4)
                            mallocNew(i7);
                            r4 = commonVariable.r_g0
                            if (r4 != 0) {
                                r5 = 0
                                r6 = (r4 + 4) | 0
                                r5 = (r5 - r6) | 0
                                r5 = r5 & 15
                                r5 = (r4 + r5) | 0
                                r6 = (r5 + 4) | 0
                                r5 = r5 >> 2
                                heapClassInst.heap32[(r5)] = Int32(r4)
                                r4 = r6
                            }
                        } else {
                            r4 = 0
                        }
                        r5 = (r0 + 44) | 0
                        if (r2 < 1) {
                            r6 = r5 >> 2
                            r7 = Int64(heapClassInst.heap32[(r6)])
                        } else {
                            r6 = 0
                            while (true) {
                                r7 = r5 >> 2
                                r7 = Int64(heapClassInst.heap32[(r7)])
                                r8 = r6 << 2
                                r9 = (r7 + r8) | 0
                                r9 = r9 >> 2
                                r8 = (r4 + r8) | 0
                                r9 = Int64(heapClassInst.heap32[(r9)])
                                r6 = (r6 + 1) | 0
                                r8 = r8 >> 2
                                heapClassInst.heap32[(r8)] = Int32(r9)
                                if (!(r2 != r6)) {
                                    break
                                }
                            }
                            r5 = (r0 + 44) | 0
                        }
                        if (!(r7 == 0)) {
                            r6 = Int64(heapClassInst.heapU8[r0 + 48])
                            if (!(r6 == 0)) {
                                r6 = gNumAlignedFree
                                r6 = r6 >> 2
                                r8 = Int64(heapClassInst.heap32[(r6)])
                                r8 = (r8 + 1) | 0
                                r7 = r7 >> 2
                                heapClassInst.heap32[(r6)] = Int32(r8)
                                r6 = Int64(heapClassInst.heap32[(r7 + (-1))])
                                heapClassInst.heap32[(g0)] = Int32(r6)
                                free(i7);
                            }
                            r6 = r5 >> 2
                            heapClassInst.heap32[(r6)] = 0
                        }
                        r6 = 1
                        r5 = r5 >> 2
                        heapClassInst.heap8[r0 + 48] = Int8(r6)
                        heapClassInst.heap32[(r5)] = Int32(r4)
                        heapClassInst.heap32[(r1 + 10)] = Int32(r3)
                    }
                    r4 = r2
                    while (true) {
                        r5 = r4 << 2
                        r6 = Int64(heapClassInst.heap32[(r1 + 11)])
                        r5 = (r6 + r5) | 0
                        r4 = (r4 + 1) | 0
                        r5 = r5 >> 2
                        heapClassInst.heap32[(r5)] = 0
                        if (!(r3 != r4)) {
                            break
                        }
                    }
                }
            } while (false);
            heapClassInst.heap32[(r1 + 9)] = Int32(r3)
            r4 = Int64(heapClassInst.heap32[(r1 + 14)])
            do {
                if (!(r4 > r3)) {
                    if (!(r4 >= r3)) {
                        r5 = Int64(heapClassInst.heap32[(r1 + 15)])
                        if (!(r5 >= r3)) {
                            if (r3 != 0) {
                                r5 = gNumAlignedAllocs
                                r5 = r5 >> 2
                                r6 = Int64(heapClassInst.heap32[(r5)])
                                r7 = r3 << 2
                                r6 = (r6 + 1) | 0
                                r7 = r7 | 3
                                heapClassInst.heap32[(r5)] = Int32(r6)
                                r5 = (r7 + 16) | 0
                                heapClassInst.heap32[(g0)] = Int32(r5)
                                mallocNew(i7);
                                r5 = commonVariable.r_g0
                                if (r5 != 0) {
                                    r6 = 0
                                    r7 = (r5 + 4) | 0
                                    r6 = (r6 - r7) | 0
                                    r6 = r6 & 15
                                    r6 = (r5 + r6) | 0
                                    r7 = (r6 + 4) | 0
                                    r6 = r6 >> 2
                                    heapClassInst.heap32[(r6)] = Int32(r5)
                                    r5 = r7
                                }
                            } else {
                                r5 = 0
                            }
                            r6 = (r0 + 64) | 0
                            if (r4 < 1) {
                                r7 = r6 >> 2
                                r8 = Int64(heapClassInst.heap32[(r7)])
                            } else {
                                r7 = 0
                                while (true) {
                                    r8 = r6 >> 2
                                    r8 = Int64(heapClassInst.heap32[(r8)])
                                    r9 = r7 << 2
                                    r10 = (r8 + r9) | 0
                                    r10 = r10 >> 2
                                    r9 = (r5 + r9) | 0
                                    r10 = Int64(heapClassInst.heap32[(r10)])
                                    r7 = (r7 + 1) | 0
                                    r9 = r9 >> 2
                                    heapClassInst.heap32[(r9)] = Int32(r10)
                                    if (!(r4 != r7)) {
                                        break
                                    }
                                }
                                r6 = (r0 + 64) | 0
                            }
                            if (!(r8 == 0)) {
                                r7 = Int64(heapClassInst.heapU8[r0 + 68])
                                if (!(r7 == 0)) {
                                    r7 = gNumAlignedFree
                                    r7 = r7 >> 2
                                    r9 = Int64(heapClassInst.heap32[(r7)])
                                    r9 = (r9 + 1) | 0
                                    r8 = r8 >> 2
                                    heapClassInst.heap32[(r7)] = Int32(r9)
                                    r7 = Int64(heapClassInst.heap32[(r8 + (-1))])
                                    heapClassInst.heap32[(g0)] = Int32(r7)
                                    free(i7);
                                }
                                r7 = r6 >> 2
                                heapClassInst.heap32[(r7)] = 0
                            }
                            r7 = 1
                            r6 = r6 >> 2
                            heapClassInst.heap8[r0 + 68] = Int8(r7)
                            heapClassInst.heap32[(r6)] = Int32(r5)
                            heapClassInst.heap32[(r1 + 15)] = Int32(r3)
                            if (r4 >= r3) {
                                break
                            }
                        }
                        while (true) {
                            r0 = r4 << 2
                            r5 = Int64(heapClassInst.heap32[(r1 + 16)])
                            r0 = (r5 + r0) | 0
                            r4 = (r4 + 1) | 0
                            r0 = r0 >> 2
                            heapClassInst.heap32[(r0)] = 0
                            if (!(r3 != r4)) {
                                break
                            }
                        }
                    }
                }
            } while (false);
            heapClassInst.heap32[(r1 + 14)] = Int32(r3)
            do {
                if (!(r3 < 1)) {
                    r0 = 0
                    while (true) {
                        r4 = r0 << 2
                        r5 = Int64(heapClassInst.heap32[(r1 + 11)])
                        r4 = (r5 + r4) | 0
                        r0 = (r0 + 1) | 0
                        r4 = r4 >> 2
                        heapClassInst.heap32[(r4)] = (-1)
                        if (!(r3 != r0)) {
                            break
                        }
                    }
                    if (!(r3 < 1)) {
                        r0 = 0
                        while (true) {
                            r4 = r0 << 2
                            r5 = Int64(heapClassInst.heap32[(r1 + 16)])
                            r4 = (r5 + r4) | 0
                            r0 = (r0 + 1) | 0
                            r4 = r4 >> 2
                            heapClassInst.heap32[(r4)] = (-1)
                            if (!(r3 != r0)) {
                                break
                            }
                        }
                    }
                }
            } while (false);
            if (!(r2 < 1)) {
                r0 = 0
                while (true) {
                    r3 = Int64(heapClassInst.heap32[(r1 + 4)])
                    r4 = r0 << 4
                    r3 = (r3 + r4) | 0
                    r3 = r3 >> 2
                    r4 = Int64(heapClassInst.heap32[(r3 + 1)])
                    r3 = Int64(heapClassInst.heap32[(r3)])
                    r4 = r4 >> 2
                    r3 = r3 >> 2
                    r4 = Int64(heapClassInst.heap32[(r4 + 3)])
                    r4 = r4 << 16
                    r3 = Int64(heapClassInst.heap32[(r3 + 3)])
                    r3 = r4 | r3
                    r4 = r3 << 15
                    r4 = r4 ^ (-1)
                    r3 = (r3 + r4) | 0
                    r4 = r3 >> 10
                    r3 = r4 ^ r3
                    r3 = (r3 * 9) | 0
                    r4 = r3 >> 6
                    r3 = r4 ^ r3
                    r4 = r3 << 11
                    r4 = r4 ^ (-1)
                    r3 = (r3 + r4) | 0
                    r4 = r3 >> 16
                    r5 = Int64(heapClassInst.heap32[(r1 + 3)])
                    r3 = r4 ^ r3
                    r4 = (r5 + (-1)) | 0
                    r3 = r3 & r4
                    r3 = r3 << 2
                    r4 = Int64(heapClassInst.heap32[(r1 + 11)])
                    r4 = (r4 + r3) | 0
                    r4 = r4 >> 2
                    r5 = r0 << 2
                    r6 = Int64(heapClassInst.heap32[(r1 + 16)])
                    r5 = (r6 + r5) | 0
                    r4 = Int64(heapClassInst.heap32[(r4)])
                    r5 = r5 >> 2
                    heapClassInst.heap32[(r5)] = Int32(r4)
                    r4 = Int64(heapClassInst.heap32[(r1 + 11)])
                    r3 = (r4 + r3) | 0
                    r4 = (r0 + 1) | 0
                    r3 = r3 >> 2
                    heapClassInst.heap32[(r3)] = Int32(r0)
                    r0 = r4
                    if (r2 != r4) {
                        continue
                    } else {
                        break
                    }
                }
            }
        }
    } while (false);
    return;
}

@OverflowWrapping
func _ZN28btHashedOverlappingPairCacheC1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV28btHashedOverlappingPairCache
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    r3 = 1
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap8[r0 + 20] = Int8(r3)
    heapClassInst.heap32[(r2 + 4)] = 0
    heapClassInst.heap32[(r2 + 2)] = 0
    heapClassInst.heap32[(r2 + 3)] = 0
    r1 = 0
    heapClassInst.heap32[(r2 + 6)] = 0
    heapClassInst.heap8[r0 + 28] = Int8(r1)
    heapClassInst.heap8[r0 + 48] = Int8(r3)
    heapClassInst.heap32[(r2 + 11)] = 0
    heapClassInst.heap32[(r2 + 9)] = 0
    heapClassInst.heap32[(r2 + 10)] = 0
    heapClassInst.heap8[r0 + 68] = Int8(r3)
    heapClassInst.heap32[(r2 + 16)] = 0
    heapClassInst.heap32[(r2 + 14)] = 0
    r4 = gNumAlignedAllocs
    heapClassInst.heap32[(r2 + 15)] = 0
    r4 = r4 >> 2
    heapClassInst.heap32[(r2 + 18)] = 0
    r5 = Int64(heapClassInst.heap32[(r4)])
    r5 = (r5 + 1) | 0
    heapClassInst.heap32[(r4)] = Int32(r5)
    heapClassInst.heap32[(g0)] = 51
    mallocNew(i7);
    r4 = commonVariable.r_g0
    if (r4 != 0) {
        r5 = (r4 + 4) | 0
        r1 = (r1 - r5) | 0
        r1 = r1 & 15
        r1 = (r4 + r1) | 0
        r5 = (r1 + 4) | 0
        r1 = r1 >> 2
        heapClassInst.heap32[(r1)] = Int32(r4)
        r4 = r5
    }
    heapClassInst.heap8[r0 + 20] = Int8(r3)
    heapClassInst.heap32[(r2 + 4)] = Int32(r4)
    heapClassInst.heap32[(r2 + 3)] = 2
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN28btHashedOverlappingPairCache10growTablesEv(i7);
    return;
}

@OverflowWrapping
func _ZNK14btQuantizedBvh31calculateSerializeBufferSizeNewEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 84
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZNK14btQuantizedBvh9serializeEPvP12btSerializer(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var r7: Int64 = 0
    var r8: Int64 = 0
    var r9: Int64 = 0
    var r10: Int64 = 0
    var r11: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-24)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r2 = r1 >> 2
    heapClassInst.heap32[(r0 + 4)] = heapClassInst.heap32[(r2 + 5)]
    heapClassInst.heap32[(r0 + 5)] = heapClassInst.heap32[(r2 + 6)]
    heapClassInst.heap32[(r0 + 6)] = heapClassInst.heap32[(r2 + 7)]
    heapClassInst.heap32[(r0 + 7)] = heapClassInst.heap32[(r2 + 8)]
    heapClassInst.heap32[(r0)] = heapClassInst.heap32[(r2 + 1)]
    heapClassInst.heap32[(r0 + 1)] = heapClassInst.heap32[(r2 + 2)]
    heapClassInst.heap32[(r0 + 2)] = heapClassInst.heap32[(r2 + 3)]
    heapClassInst.heap32[(r0 + 3)] = heapClassInst.heap32[(r2 + 4)]
    heapClassInst.heap32[(r0 + 8)] = heapClassInst.heap32[(r2 + 9)]
    heapClassInst.heap32[(r0 + 9)] = heapClassInst.heap32[(r2 + 10)]
    heapClassInst.heap32[(r0 + 10)] = heapClassInst.heap32[(r2 + 11)]
    heapClassInst.heap32[(r0 + 11)] = heapClassInst.heap32[(r2 + 12)]
    r3 = Int64(heapClassInst.heap32[(r2 + 14)])
    heapClassInst.heap32[(r0 + 12)] = Int32(r3)
    r1 = Int64(heapClassInst.heapU8[r1 + 60])
    heapClassInst.heap32[(r0 + 13)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 22)])
    r3 = Int64(heapClassInst.heap32[(fp + 2)])
    heapClassInst.heap32[(r0 + 14)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 22)])
    if (r1 != 0) {
        r1 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r1)])
        r4 = r4 >> 2
        r4 = Int64(heapClassInst.heap32[(r4 + 7)])
        r5 = Int64(heapClassInst.heap32[(r2 + 24)])
        heapClassInst.heap32[(g0)] = Int32(r3)
        heapClassInst.heap32[(g0 + 1)] = Int32(r5)
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r4 = commonVariable.r_g0
        heapClassInst.heap32[(r0 + 16)] = Int32(r4)
        if (!(r4 == 0)) {
            r4 = Int64(heapClassInst.heap32[(r1)])
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r2 + 22)])
            r4 = Int64(heapClassInst.heap32[(r4 + 4)])
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = 48
            heapClassInst.heap32[(g0 + 2)] = Int32(r5)
            __FUNCTION_TABLE__[(r4) >> 2](i7);
            r4 = commonVariable.r_g0
            if (!(r5 < 1)) {
                r6 = r4 >> 2
                r7 = 0
                r6 = Int64(heapClassInst.heap32[(r6 + 2)])
                r5 = (r7 - r5) | 0
                while (true) {
                    r8 = (r7 * (-12)) | 0
                    r8 = r8 << 2
                    r9 = r7 << 6
                    r10 = Int64(heapClassInst.heap32[(r2 + 24)])
                    r8 = (r6 + r8) | 0
                    r10 = (r10 - r9) | 0
                    r8 = r8 >> 2
                    r10 = r10 >> 2
                    heapClassInst.heap32[(r8 + 4)] = heapClassInst.heap32[(r10 + 4)]
                    heapClassInst.heap32[(r8 + 5)] = heapClassInst.heap32[(r10 + 5)]
                    heapClassInst.heap32[(r8 + 6)] = heapClassInst.heap32[(r10 + 6)]
                    heapClassInst.heap32[(r8 + 7)] = heapClassInst.heap32[(r10 + 7)]
                    r10 = Int64(heapClassInst.heap32[(r2 + 24)])
                    r10 = (r10 - r9) | 0
                    r10 = r10 >> 2
                    heapClassInst.heap32[(r8)] = heapClassInst.heap32[(r10)]
                    heapClassInst.heap32[(r8 + 1)] = heapClassInst.heap32[(r10 + 1)]
                    heapClassInst.heap32[(r8 + 2)] = heapClassInst.heap32[(r10 + 2)]
                    heapClassInst.heap32[(r8 + 3)] = heapClassInst.heap32[(r10 + 3)]
                    r10 = Int64(heapClassInst.heap32[(r2 + 24)])
                    r10 = (r10 - r9) | 0
                    r10 = r10 >> 2
                    r10 = Int64(heapClassInst.heap32[(r10 + 8)])
                    heapClassInst.heap32[(r8 + 8)] = Int32(r10)
                    r10 = Int64(heapClassInst.heap32[(r2 + 24)])
                    r10 = (r10 - r9) | 0
                    r10 = r10 >> 2
                    r10 = Int64(heapClassInst.heap32[(r10 + 9)])
                    heapClassInst.heap32[(r8 + 9)] = Int32(r10)
                    r10 = Int64(heapClassInst.heap32[(r2 + 24)])
                    r9 = (r10 - r9) | 0
                    r9 = r9 >> 2
                    r9 = Int64(heapClassInst.heap32[(r9 + 10)])
                    r7 = (r7 + (-1)) | 0
                    heapClassInst.heap32[(r8 + 10)] = Int32(r9)
                    if (!(r5 != r7)) {
                        break
                    }
                }
            }
            r1 = Int64(heapClassInst.heap32[(r1)])
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            r5 = Int64(heapClassInst.heap32[(r2 + 24)])
            r6 = _E2_str32
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = Int32(r4)
            heapClassInst.heap32[(g0 + 2)] = Int32(r6)
            heapClassInst.heap32[(g0 + 3)] = 1497453121
            heapClassInst.heap32[(g0 + 4)] = Int32(r5)
            __FUNCTION_TABLE__[(r1) >> 2](i7);
        }
    } else {
        heapClassInst.heap32[(r0 + 16)] = 0
    }
    r1 = Int64(heapClassInst.heap32[(r2 + 32)])
    heapClassInst.heap32[(r0 + 15)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 32)])
    if (r1 != 0) {
        r1 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r1)])
        r4 = r4 >> 2
        r4 = Int64(heapClassInst.heap32[(r4 + 7)])
        r5 = Int64(heapClassInst.heap32[(r2 + 34)])
        heapClassInst.heap32[(g0)] = Int32(r3)
        heapClassInst.heap32[(g0 + 1)] = Int32(r5)
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r4 = commonVariable.r_g0
        heapClassInst.heap32[(r0 + 17)] = Int32(r4)
        if (!(r4 == 0)) {
            r4 = Int64(heapClassInst.heap32[(r1)])
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r2 + 32)])
            r4 = Int64(heapClassInst.heap32[(r4 + 4)])
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = 16
            heapClassInst.heap32[(g0 + 2)] = Int32(r5)
            __FUNCTION_TABLE__[(r4) >> 2](i7);
            r4 = commonVariable.r_g0
            do {
                if (!(r5 < 1)) {
                    r6 = r4 >> 2
                    r7 = 0
                    r6 = Int64(heapClassInst.heap32[(r6 + 2)])
                    r5 = (r7 - r5) | 0
                    while (true) {
                        r8 = r7 << 4
                        r9 = Int64(heapClassInst.heap32[(r2 + 34)])
                        r9 = (r9 - r8) | 0
                        r9 = r9 >> 2
                        r10 = (r6 - r8) | 0
                        r9 = Int64(heapClassInst.heap32[(r9 + 3)])
                        r11 = r10 >> 2
                        heapClassInst.heap32[(r11 + 3)] = Int32(r9)
                        r9 = Int64(heapClassInst.heap32[(r2 + 34)])
                        r9 = (r9 - r8) | 0
                        r9 = Int64(heapClassInst.heapU16[(r9 + 6) >> 1])
                        heapClassInst.heap16[(r10 + 6) >> 1] = Int16(r9)
                        r9 = Int64(heapClassInst.heap32[(r2 + 34)])
                        r9 = (r9 - r8) | 0
                        r9 = Int64(heapClassInst.heapU16[(r9 + 8) >> 1])
                        heapClassInst.heap16[(r10 + 8) >> 1] = Int16(r9)
                        r9 = Int64(heapClassInst.heap32[(r2 + 34)])
                        r9 = (r9 - r8) | 0
                        r9 = Int64(heapClassInst.heapU16[(r9 + 10) >> 1])
                        heapClassInst.heap16[(r10 + 10) >> 1] = Int16(r9)
                        r9 = Int64(heapClassInst.heap32[(r2 + 34)])
                        r9 = (r9 - r8) | 0
                        r9 = Int64(heapClassInst.heapU16[(r9) >> 1])
                        heapClassInst.heap16[(r10) >> 1] = Int16(r9)
                        r9 = Int64(heapClassInst.heap32[(r2 + 34)])
                        r9 = (r9 - r8) | 0
                        r9 = Int64(heapClassInst.heapU16[(r9 + 2) >> 1])
                        heapClassInst.heap16[(r10 + 2) >> 1] = Int16(r9)
                        r9 = Int64(heapClassInst.heap32[(r2 + 34)])
                        r8 = (r9 - r8) | 0
                        r8 = Int64(heapClassInst.heapU16[(r8 + 4) >> 1])
                        r7 = (r7 + (-1)) | 0
                        heapClassInst.heap16[(r10 + 4) >> 1] = Int16(r8)
                        if (!(r5 != r7)) {
                            break
                        }
                    }
                }
            } while (false);
            r1 = Int64(heapClassInst.heap32[(r1)])
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            r5 = Int64(heapClassInst.heap32[(r2 + 34)])
            r6 = _E2_str133
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = Int32(r4)
            heapClassInst.heap32[(g0 + 2)] = Int32(r6)
            heapClassInst.heap32[(g0 + 3)] = 1497453121
            heapClassInst.heap32[(g0 + 4)] = Int32(r5)
            __FUNCTION_TABLE__[(r1) >> 2](i7);
        }
    } else {
        heapClassInst.heap32[(r0 + 17)] = 0
    }
    r1 = Int64(heapClassInst.heap32[(r2 + 36)])
    heapClassInst.heap32[(r0 + 19)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 38)])
    heapClassInst.heap32[(r0 + 20)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 38)])
    if (r1 != 0) {
        r1 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r1)])
        r4 = r4 >> 2
        r4 = Int64(heapClassInst.heap32[(r4 + 7)])
        r5 = Int64(heapClassInst.heap32[(r2 + 40)])
        heapClassInst.heap32[(g0)] = Int32(r3)
        heapClassInst.heap32[(g0 + 1)] = Int32(r5)
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r4 = commonVariable.r_g0
        heapClassInst.heap32[(r0 + 18)] = Int32(r4)
        if (!(r4 == 0)) {
            r0 = Int64(heapClassInst.heap32[(r1)])
            r0 = r0 >> 2
            r4 = Int64(heapClassInst.heap32[(r2 + 38)])
            r0 = Int64(heapClassInst.heap32[(r0 + 4)])
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = 20
            heapClassInst.heap32[(g0 + 2)] = Int32(r4)
            __FUNCTION_TABLE__[(r0) >> 2](i7);
            r0 = commonVariable.r_g0
            do {
                if (!(r4 < 1)) {
                    r5 = r0 >> 2
                    r6 = 0
                    r5 = Int64(heapClassInst.heap32[(r5 + 2)])
                    r4 = (r6 - r4) | 0
                    while (true) {
                        r7 = r6 << 5
                        r8 = Int64(heapClassInst.heap32[(r2 + 40)])
                        r9 = (r6 * (-10)) | 0
                        r8 = (r8 - r7) | 0
                        r8 = Int64(heapClassInst.heapU16[(r8 + 6) >> 1])
                        r9 = r9 << 1
                        r9 = (r5 + r9) | 0
                        heapClassInst.heap16[(r9 + 14) >> 1] = Int16(r8)
                        r8 = Int64(heapClassInst.heap32[(r2 + 40)])
                        r8 = (r8 - r7) | 0
                        r8 = Int64(heapClassInst.heapU16[(r8 + 8) >> 1])
                        heapClassInst.heap16[(r9 + 16) >> 1] = Int16(r8)
                        r8 = Int64(heapClassInst.heap32[(r2 + 40)])
                        r8 = (r8 - r7) | 0
                        r8 = Int64(heapClassInst.heapU16[(r8 + 10) >> 1])
                        heapClassInst.heap16[(r9 + 18) >> 1] = Int16(r8)
                        r8 = Int64(heapClassInst.heap32[(r2 + 40)])
                        r8 = (r8 - r7) | 0
                        r8 = Int64(heapClassInst.heapU16[(r8) >> 1])
                        heapClassInst.heap16[(r9 + 8) >> 1] = Int16(r8)
                        r8 = Int64(heapClassInst.heap32[(r2 + 40)])
                        r8 = (r8 - r7) | 0
                        r8 = Int64(heapClassInst.heapU16[(r8 + 2) >> 1])
                        heapClassInst.heap16[(r9 + 10) >> 1] = Int16(r8)
                        r8 = Int64(heapClassInst.heap32[(r2 + 40)])
                        r8 = (r8 - r7) | 0
                        r8 = Int64(heapClassInst.heapU16[(r8 + 4) >> 1])
                        heapClassInst.heap16[(r9 + 12) >> 1] = Int16(r8)
                        r8 = Int64(heapClassInst.heap32[(r2 + 40)])
                        r9 = (r6 * (-5)) | 0
                        r8 = (r8 - r7) | 0
                        r9 = r9 << 2
                        r8 = r8 >> 2
                        r9 = (r5 + r9) | 0
                        r8 = Int64(heapClassInst.heap32[(r8 + 3)])
                        r9 = r9 >> 2
                        heapClassInst.heap32[(r9)] = Int32(r8)
                        r8 = Int64(heapClassInst.heap32[(r2 + 40)])
                        r7 = (r8 - r7) | 0
                        r7 = r7 >> 2
                        r7 = Int64(heapClassInst.heap32[(r7 + 4)])
                        r6 = (r6 + (-1)) | 0
                        heapClassInst.heap32[(r9 + 1)] = Int32(r7)
                        if (!(r4 != r6)) {
                            break
                        }
                    }
                }
            } while (false);
            r1 = Int64(heapClassInst.heap32[(r1)])
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            r2 = Int64(heapClassInst.heap32[(r2 + 40)])
            r4 = _E2_str234
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = Int32(r0)
            heapClassInst.heap32[(g0 + 2)] = Int32(r4)
            heapClassInst.heap32[(g0 + 3)] = 1497453121
            heapClassInst.heap32[(g0 + 4)] = Int32(r2)
            __FUNCTION_TABLE__[(r1) >> 2](i7);
        }
    } else {
        heapClassInst.heap32[(r0 + 18)] = 0
    }
    r0 = _E2_str335
    commonVariable.r_g0 = r0
    return;
}

@OverflowWrapping
func _ZN14btQuantizedBvhD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN14btQuantizedBvhD2Ev(i7);
    return;
}

@OverflowWrapping
func _ZN14btQuantizedBvhD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV14btQuantizedBvh
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 40)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 164])
        if (!(r3 == 0)) {
            r3 = gNumAlignedFree
            r3 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r3)])
            r4 = (r4 + 1) | 0
            r1 = r1 >> 2
            heapClassInst.heap32[(r3)] = Int32(r4)
            r1 = Int64(heapClassInst.heap32[(r1 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r1)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 40)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 164] = Int8(r1)
    heapClassInst.heap32[(r2 + 40)] = 0
    heapClassInst.heap32[(r2 + 38)] = 0
    heapClassInst.heap32[(r2 + 39)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 34)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 140])
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 34)] = 0
    }
    heapClassInst.heap8[r0 + 140] = Int8(r1)
    heapClassInst.heap32[(r2 + 34)] = 0
    heapClassInst.heap32[(r2 + 32)] = 0
    heapClassInst.heap32[(r2 + 33)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 29)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 120])
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 29)] = 0
    }
    heapClassInst.heap8[r0 + 120] = Int8(r1)
    heapClassInst.heap32[(r2 + 29)] = 0
    heapClassInst.heap32[(r2 + 27)] = 0
    heapClassInst.heap32[(r2 + 28)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 24)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 100])
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 24)] = 0
    }
    heapClassInst.heap8[r0 + 100] = Int8(r1)
    heapClassInst.heap32[(r2 + 24)] = 0
    heapClassInst.heap32[(r2 + 22)] = 0
    heapClassInst.heap32[(r2 + 23)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 19)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 80])
        if (!(r4 == 0)) {
            r4 = gNumAlignedFree
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4)])
            r5 = (r5 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r4)] = Int32(r5)
            r3 = Int64(heapClassInst.heap32[(r3 + (-1))])
            heapClassInst.heap32[(g0)] = Int32(r3)
            free(i7);
        }
        heapClassInst.heap32[(r2 + 19)] = 0
    }
    heapClassInst.heap8[r0 + 80] = Int8(r1)
    heapClassInst.heap32[(r2 + 19)] = 0
    heapClassInst.heap32[(r2 + 17)] = 0
    heapClassInst.heap32[(r2 + 18)] = 0
    if (!(r0 == 0)) {
        r0 = gNumAlignedFree
        r0 = r0 >> 2
        r1 = Int64(heapClassInst.heap32[(r0)])
        r1 = (r1 + 1) | 0
        heapClassInst.heap32[(r0)] = Int32(r1)
        r0 = Int64(heapClassInst.heap32[(r2 + (-1))])
        heapClassInst.heap32[(g0)] = Int32(r0)
        free(i7);
    }
    return;
}
