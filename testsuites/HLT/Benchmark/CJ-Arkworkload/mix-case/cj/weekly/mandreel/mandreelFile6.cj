/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*
import std.math.*

func _ZN35btSequentialImpulseConstraintSolver36resolveSingleConstraintRowLowerLimitER11btRigidBodyS1_RK18btSolverConstraint(
    sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
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
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 2)])
    r1 = r1 >> 2
    r0 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = r2 >> 2
    f0 = Float64(heapClassInst.heapFloat[(r1 + 4)])
    f1 = Float64(heapClassInst.heapFloat[(r0 + 126)])
    f2 = Float64(heapClassInst.heapFloat[(r1 + 5)])
    f3 = Float64(heapClassInst.heapFloat[(r0 + 127)])
    f4 = Float64(heapClassInst.heapFloat[(r1)])
    f5 = Float64(heapClassInst.heapFloat[(r0 + 130)])
    f6 = Float64(heapClassInst.heapFloat[(r1 + 1)])
    f7 = Float64(heapClassInst.heapFloat[(r0 + 131)])
    f8 = Float64(heapClassInst.heapFloat[(r2 + 126)])
    f9 = Float64(heapClassInst.heapFloat[(r2 + 127)])
    f10 = Float64(heapClassInst.heapFloat[(r1 + 6)])
    f11 = Float64(heapClassInst.heapFloat[(r0 + 128)])
    f1 = f0 * f1
    f3 = f2 * f3
    f4 = f4 * f5
    f5 = f6 * f7
    f6 = Float64(heapClassInst.heapFloat[(r1 + 2)])
    f7 = Float64(heapClassInst.heapFloat[(r0 + 132)])
    f12 = Float64(heapClassInst.heapFloat[(r1 + 8)])
    f13 = Float64(heapClassInst.heapFloat[(r2 + 130)])
    f14 = Float64(heapClassInst.heapFloat[(r1 + 9)])
    f15 = Float64(heapClassInst.heapFloat[(r2 + 131)])
    f16 = Float64(heapClassInst.heapFloat[(r2 + 128)])
    f1 = f1 + f3
    f3 = f10 * f11
    f4 = f4 + f5
    f5 = f6 * f7
    f6 = f12 * f13
    f7 = f14 * f15
    f11 = Float64(heapClassInst.heapFloat[(r1 + 10)])
    f12 = Float64(heapClassInst.heapFloat[(r2 + 132)])
    f8 = f0 * f8
    f9 = f2 * f9
    f13 = Float64(heapClassInst.heapFloat[(r1 + 21)])
    f14 = Float64(heapClassInst.heapFloat[(r1 + 30)])
    f1 = f1 + f3
    f3 = f4 + f5
    f4 = f6 + f7
    f5 = f11 * f12
    f6 = f8 + f9
    f7 = f10 * f16
    f8 = Float64(heapClassInst.heapFloat[(r1 + 29)])
    f9 = f13 * f14
    f1 = f1 + f3
    f3 = Float64(heapClassInst.heapFloat[(r1 + 23)])
    f4 = f4 + f5
    f5 = f6 + f7
    f4 = f4 - f5
    f5 = f8 - f9
    f1 = f3 * f1
    f1 = f5 - f1
    f3 = f3 * f4
    f1 = f1 - f3
    f3 = Float64(heapClassInst.heapFloat[(r1 + 31)])
    f4 = f13 + f1
    if (f3 > f4) {
        f1 = f3 - f13
        f4 = f3
    }
    heapClassInst.heapFloat[(r1 + 21)] = Float32(f4)
    f3 = Float64(heapClassInst.heapFloat[(r0 + 84)])
    f4 = 0.0
    if (!(f3 == f4)) {
        f3 = Float64(heapClassInst.heapFloat[(r0 + 138)])
        f0 = f0 * f3
        f0 = f0 * f1
        f3 = Float64(heapClassInst.heapFloat[(r0 + 126)])
        f5 = Float64(heapClassInst.heapFloat[(r0 + 139)])
        f6 = Float64(heapClassInst.heapFloat[(r0 + 140)])
        f0 = f3 + f0
        f2 = f2 * f5
        heapClassInst.heapFloat[(r0 + 126)] = Float32(f0)
        f0 = f2 * f1
        f2 = Float64(heapClassInst.heapFloat[(r0 + 127)])
        f0 = f2 + f0
        f2 = f10 * f6
        heapClassInst.heapFloat[(r0 + 127)] = Float32(f0)
        f0 = f2 * f1
        f2 = Float64(heapClassInst.heapFloat[(r0 + 128)])
        f0 = f2 + f0
        heapClassInst.heapFloat[(r0 + 128)] = Float32(f0)
        f0 = Float64(heapClassInst.heapFloat[(r0 + 134)])
        f0 = f0 * f1
        f2 = Float64(heapClassInst.heapFloat[(r1 + 12)])
        f3 = Float64(heapClassInst.heapFloat[(r0 + 136)])
        f5 = Float64(heapClassInst.heapFloat[(r0 + 135)])
        f0 = f2 * f0
        f2 = Float64(heapClassInst.heapFloat[(r0 + 130)])
        f6 = Float64(heapClassInst.heapFloat[(r1 + 14)])
        f7 = Float64(heapClassInst.heapFloat[(r1 + 13)])
        f0 = f2 + f0
        f2 = f5 * f1
        heapClassInst.heapFloat[(r0 + 130)] = Float32(f0)
        f0 = f7 * f2
        f2 = Float64(heapClassInst.heapFloat[(r0 + 131)])
        f0 = f2 + f0
        f2 = f3 * f1
        heapClassInst.heapFloat[(r0 + 131)] = Float32(f0)
        f0 = f6 * f2
        f2 = Float64(heapClassInst.heapFloat[(r0 + 132)])
        f0 = f2 + f0
        heapClassInst.heapFloat[(r0 + 132)] = Float32(f0)
    }
    f0 = Float64(heapClassInst.heapFloat[(r2 + 84)])
    if (!(f0 == f4)) {
        f0 = Float64(heapClassInst.heapFloat[(r1 + 4)])
        f2 = Float64(heapClassInst.heapFloat[(r2 + 138)])
        f0 = f2 * f0
        f0 = f0 * f1
        f2 = Float64(heapClassInst.heapFloat[(r2 + 126)])
        f3 = Float64(heapClassInst.heapFloat[(r1 + 5)])
        f4 = Float64(heapClassInst.heapFloat[(r2 + 139)])
        f5 = Float64(heapClassInst.heapFloat[(r1 + 6)])
        f6 = Float64(heapClassInst.heapFloat[(r2 + 140)])
        f0 = f2 - f0
        f2 = f4 * f3
        heapClassInst.heapFloat[(r2 + 126)] = Float32(f0)
        f0 = f2 * f1
        f2 = Float64(heapClassInst.heapFloat[(r2 + 127)])
        f0 = f2 - f0
        f2 = f6 * f5
        heapClassInst.heapFloat[(r2 + 127)] = Float32(f0)
        f0 = f2 * f1
        f2 = Float64(heapClassInst.heapFloat[(r2 + 128)])
        f0 = f2 - f0
        heapClassInst.heapFloat[(r2 + 128)] = Float32(f0)
        f0 = Float64(heapClassInst.heapFloat[(r2 + 134)])
        f0 = f0 * f1
        f2 = Float64(heapClassInst.heapFloat[(r1 + 16)])
        f3 = Float64(heapClassInst.heapFloat[(r2 + 136)])
        f4 = Float64(heapClassInst.heapFloat[(r2 + 135)])
        f0 = f2 * f0
        f2 = Float64(heapClassInst.heapFloat[(r2 + 130)])
        f5 = Float64(heapClassInst.heapFloat[(r1 + 18)])
        f6 = Float64(heapClassInst.heapFloat[(r1 + 17)])
        f0 = f2 + f0
        f2 = f4 * f1
        heapClassInst.heapFloat[(r2 + 130)] = Float32(f0)
        f0 = f6 * f2
        f2 = Float64(heapClassInst.heapFloat[(r2 + 131)])
        f0 = f2 + f0
        f1 = f3 * f1
        heapClassInst.heapFloat[(r2 + 131)] = Float32(f0)
        f0 = f5 * f1
        f1 = Float64(heapClassInst.heapFloat[(r2 + 132)])
        f0 = f1 + f0
        heapClassInst.heapFloat[(r2 + 132)] = Float32(f0)
    }
    return;
}

func _ZN35btSequentialImpulseConstraintSolver43resolveSplitPenetrationImpulseCacheFriendlyER11btRigidBodyS1_RK18btSolverConstraint(
    sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
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
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 2)])
    r0 = r0 >> 2
    f0 = Float64(heapClassInst.heapFloat[(r0 + 33)])
    f1 = 0.0
    if (!(f0 == f1)) {
        r1 = Int64(heapClassInst.heap32[(fp)])
        r2 = Int64(heapClassInst.heap32[(fp + 1)])
        r3 = gNumSplitImpulseRecoveries
        r3 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r3)])
        r4 = (r4 + 1) | 0
        r1 = r1 >> 2
        heapClassInst.heap32[(r3)] = Int32(r4)
        r2 = r2 >> 2
        f2 = Float64(heapClassInst.heapFloat[(r0 + 4)])
        f3 = Float64(heapClassInst.heapFloat[(r1 + 142)])
        f4 = Float64(heapClassInst.heapFloat[(r0 + 5)])
        f5 = Float64(heapClassInst.heapFloat[(r1 + 143)])
        f6 = Float64(heapClassInst.heapFloat[(r0)])
        f7 = Float64(heapClassInst.heapFloat[(r1 + 146)])
        f8 = Float64(heapClassInst.heapFloat[(r0 + 1)])
        f9 = Float64(heapClassInst.heapFloat[(r1 + 147)])
        f10 = Float64(heapClassInst.heapFloat[(r2 + 142)])
        f11 = Float64(heapClassInst.heapFloat[(r2 + 143)])
        f12 = Float64(heapClassInst.heapFloat[(r0 + 6)])
        f13 = Float64(heapClassInst.heapFloat[(r1 + 144)])
        f3 = f2 * f3
        f5 = f4 * f5
        f6 = f6 * f7
        f7 = f8 * f9
        f8 = Float64(heapClassInst.heapFloat[(r0 + 2)])
        f9 = Float64(heapClassInst.heapFloat[(r1 + 148)])
        f14 = Float64(heapClassInst.heapFloat[(r0 + 8)])
        f15 = Float64(heapClassInst.heapFloat[(r2 + 146)])
        f16 = Float64(heapClassInst.heapFloat[(r0 + 9)])
        f17 = Float64(heapClassInst.heapFloat[(r2 + 147)])
        f18 = Float64(heapClassInst.heapFloat[(r2 + 144)])
        f3 = f3 + f5
        f5 = f12 * f13
        f6 = f6 + f7
        f7 = f8 * f9
        f8 = f14 * f15
        f9 = f16 * f17
        f13 = Float64(heapClassInst.heapFloat[(r0 + 10)])
        f14 = Float64(heapClassInst.heapFloat[(r2 + 148)])
        f10 = f2 * f10
        f11 = f4 * f11
        f15 = Float64(heapClassInst.heapFloat[(r0 + 20)])
        f16 = Float64(heapClassInst.heapFloat[(r0 + 30)])
        f3 = f3 + f5
        f5 = f6 + f7
        f6 = f8 + f9
        f7 = f13 * f14
        f8 = f10 + f11
        f9 = f12 * f18
        f10 = f15 * f16
        f3 = f3 + f5
        f5 = Float64(heapClassInst.heapFloat[(r0 + 23)])
        f6 = f6 + f7
        f7 = f8 + f9
        f6 = f6 - f7
        f0 = f0 - f10
        f3 = f5 * f3
        f0 = f0 - f3
        f3 = f5 * f6
        f0 = f0 - f3
        f3 = Float64(heapClassInst.heapFloat[(r0 + 31)])
        f5 = f15 + f0
        if (f3 > f5) {
            f0 = f3 - f15
            f5 = f3
        }
        heapClassInst.heapFloat[(r0 + 20)] = Float32(f5)
        f3 = Float64(heapClassInst.heapFloat[(r1 + 84)])
        if (!(f3 == f1)) {
            f3 = Float64(heapClassInst.heapFloat[(r1 + 138)])
            f2 = f2 * f3
            f2 = f2 * f0
            f3 = Float64(heapClassInst.heapFloat[(r1 + 142)])
            f5 = Float64(heapClassInst.heapFloat[(r1 + 139)])
            f6 = Float64(heapClassInst.heapFloat[(r1 + 140)])
            f2 = f3 + f2
            f3 = f4 * f5
            heapClassInst.heapFloat[(r1 + 142)] = Float32(f2)
            f2 = f3 * f0
            f3 = Float64(heapClassInst.heapFloat[(r1 + 143)])
            f2 = f3 + f2
            f3 = f12 * f6
            heapClassInst.heapFloat[(r1 + 143)] = Float32(f2)
            f2 = f3 * f0
            f3 = Float64(heapClassInst.heapFloat[(r1 + 144)])
            f2 = f3 + f2
            heapClassInst.heapFloat[(r1 + 144)] = Float32(f2)
            f2 = Float64(heapClassInst.heapFloat[(r1 + 134)])
            f2 = f2 * f0
            f3 = Float64(heapClassInst.heapFloat[(r0 + 12)])
            f4 = Float64(heapClassInst.heapFloat[(r1 + 136)])
            f5 = Float64(heapClassInst.heapFloat[(r1 + 135)])
            f2 = f3 * f2
            f3 = Float64(heapClassInst.heapFloat[(r1 + 146)])
            f6 = Float64(heapClassInst.heapFloat[(r0 + 14)])
            f7 = Float64(heapClassInst.heapFloat[(r0 + 13)])
            f2 = f3 + f2
            f3 = f5 * f0
            heapClassInst.heapFloat[(r1 + 146)] = Float32(f2)
            f2 = f7 * f3
            f3 = Float64(heapClassInst.heapFloat[(r1 + 147)])
            f2 = f3 + f2
            f3 = f4 * f0
            heapClassInst.heapFloat[(r1 + 147)] = Float32(f2)
            f2 = f6 * f3
            f3 = Float64(heapClassInst.heapFloat[(r1 + 148)])
            f2 = f3 + f2
            heapClassInst.heapFloat[(r1 + 148)] = Float32(f2)
        }
        f2 = Float64(heapClassInst.heapFloat[(r2 + 84)])
        if (!(f2 == f1)) {
            f1 = Float64(heapClassInst.heapFloat[(r0 + 4)])
            f2 = Float64(heapClassInst.heapFloat[(r2 + 138)])
            f1 = f2 * f1
            f1 = f1 * f0
            f2 = Float64(heapClassInst.heapFloat[(r2 + 142)])
            f3 = Float64(heapClassInst.heapFloat[(r0 + 5)])
            f4 = Float64(heapClassInst.heapFloat[(r2 + 139)])
            f5 = Float64(heapClassInst.heapFloat[(r0 + 6)])
            f6 = Float64(heapClassInst.heapFloat[(r2 + 140)])
            f1 = f2 - f1
            f2 = f4 * f3
            heapClassInst.heapFloat[(r2 + 142)] = Float32(f1)
            f1 = f2 * f0
            f2 = Float64(heapClassInst.heapFloat[(r2 + 143)])
            f1 = f2 - f1
            f2 = f6 * f5
            heapClassInst.heapFloat[(r2 + 143)] = Float32(f1)
            f1 = f2 * f0
            f2 = Float64(heapClassInst.heapFloat[(r2 + 144)])
            f1 = f2 - f1
            heapClassInst.heapFloat[(r2 + 144)] = Float32(f1)
            f1 = Float64(heapClassInst.heapFloat[(r2 + 134)])
            f1 = f1 * f0
            f2 = Float64(heapClassInst.heapFloat[(r0 + 16)])
            f3 = Float64(heapClassInst.heapFloat[(r2 + 136)])
            f4 = Float64(heapClassInst.heapFloat[(r2 + 135)])
            f1 = f2 * f1
            f2 = Float64(heapClassInst.heapFloat[(r2 + 146)])
            f5 = Float64(heapClassInst.heapFloat[(r0 + 18)])
            f6 = Float64(heapClassInst.heapFloat[(r0 + 17)])
            f1 = f2 + f1
            f2 = f4 * f0
            heapClassInst.heapFloat[(r2 + 146)] = Float32(f1)
            f1 = f6 * f2
            f2 = Float64(heapClassInst.heapFloat[(r2 + 147)])
            f1 = f2 + f1
            f0 = f3 * f0
            heapClassInst.heapFloat[(r2 + 147)] = Float32(f1)
            f0 = f5 * f0
            f1 = Float64(heapClassInst.heapFloat[(r2 + 148)])
            f0 = f1 + f0
            heapClassInst.heapFloat[(r2 + 148)] = Float32(f0)
        }
    }
    return;
}

func _Z24applyAnisotropicFrictionP17btCollisionObjectR9btVector3(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
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
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    if (!(r0 == 0)) {
        r0 = r0 >> 2
        r1 = Int64(heapClassInst.heap32[(r0 + 45)])
        if (r1 != 0) {
            r1 = Int64(heapClassInst.heap32[(fp + 1)])
            r1 = r1 >> 2
            f0 = Float64(heapClassInst.heapFloat[(r1)])
            f1 = Float64(heapClassInst.heapFloat[(r0 + 2)])
            f2 = Float64(heapClassInst.heapFloat[(r0 + 1)])
            f3 = Float64(heapClassInst.heapFloat[(r1 + 1)])
            f4 = Float64(heapClassInst.heapFloat[(r0 + 6)])
            f5 = Float64(heapClassInst.heapFloat[(r0 + 5)])
            f6 = Float64(heapClassInst.heapFloat[(r0 + 3)])
            f7 = Float64(heapClassInst.heapFloat[(r0 + 7)])
            f8 = f2 * f0
            f9 = f5 * f3
            f10 = f1 * f0
            f11 = f4 * f3
            f12 = Float64(heapClassInst.heapFloat[(r1 + 2)])
            f13 = Float64(heapClassInst.heapFloat[(r0 + 10)])
            f14 = Float64(heapClassInst.heapFloat[(r0 + 9)])
            f15 = Float64(heapClassInst.heapFloat[(r0 + 11)])
            f8 = f8 + f9
            f9 = f14 * f12
            f10 = f10 + f11
            f11 = f13 * f12
            f0 = f6 * f0
            f3 = f7 * f3
            f8 = f8 + f9
            f9 = Float64(heapClassInst.heapFloat[(r0 + 41)])
            f10 = f10 + f11
            f11 = Float64(heapClassInst.heapFloat[(r0 + 42)])
            f0 = f0 + f3
            f3 = f15 * f12
            f8 = f8 * f9
            f9 = f10 * f11
            f10 = Float64(heapClassInst.heapFloat[(r0 + 43)])
            f0 = f0 + f3
            f0 = f0 * f10
            f2 = f2 * f8
            f1 = f1 * f9
            f3 = f5 * f8
            f4 = f4 * f9
            f1 = f2 + f1
            f2 = f6 * f0
            f5 = f14 * f8
            f6 = f13 * f9
            f3 = f3 + f4
            f4 = f7 * f0
            f1 = f1 + f2
            f2 = f5 + f6
            f0 = f15 * f0
            f3 = f3 + f4
            heapClassInst.heapFloat[(r1)] = Float32(f1)
            f0 = f2 + f0
            heapClassInst.heapFloat[(r1 + 1)] = Float32(f3)
            heapClassInst.heapFloat[(r1 + 2)] = Float32(f0)
            heapClassInst.heap32[(r1 + 3)] = 0
            return;
        }
    }
    return;
}

func _ZN35btSequentialImpulseConstraintSolver5resetEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    heapClassInst.heap32[(r0 + 31)] = 0
    return;
}

func _ZN35btSequentialImpulseConstraintSolver45solveGroupCacheFriendlySplitImpulseIterationsEPP17btCollisionObjectiPP20btPersistentManifoldiPP17btTypedConstraintiRK19btContactSolverInfoP12btIDebugDrawP12btStackAlloc(
    sp: Int64): Unit {
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
    r0 = Int64(heapClassInst.heap32[(fp + 7)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 11)])
    do {
        if (!(r2 == 0)) {
            r2 = Int64(heapClassInst.heap32[(fp)])
            r0 = Int64(heapClassInst.heapU8[r0 + 61])
            r3 = Int64(heapClassInst.heap32[(r1 + 5)])
            r0 = r0 & 1
            if (r0 != 0) {
                if (!(r3 < 1)) {
                    r0 = 0
                    while (true) {
                        r3 = r2 >> 2
                        r4 = Int64(heapClassInst.heap32[(r3 + 2)])
                        if (!(r4 < 1)) {
                            r5 = 0
                            while (true) {
                                r6 = Int64(heapClassInst.heap32[(r3 + 19)])
                                r7 = r5 << 2
                                r6 = (r6 + r7) | 0
                                r6 = r6 >> 2
                                r6 = Int64(heapClassInst.heap32[(r6)])
                                r6 = (r6 * 136) | 0
                                r7 = Int64(heapClassInst.heap32[(r3 + 4)])
                                r6 = (r7 + r6) | 0
                                r7 = r6 >> 2
                                r8 = Int64(heapClassInst.heap32[(r7 + 27)])
                                r7 = Int64(heapClassInst.heap32[(r7 + 26)])
                                heapClassInst.heap32[(g0)] = Int32(r7)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r6)
                                r5 = (r5 + 1) | 0
                                _ZN35btSequentialImpulseConstraintSolver43resolveSplitPenetrationImpulseCacheFriendlyER11btRigidBodyS1_RK18btSolverConstraint(
                                    i7);
                                if (!(r4 != r5)) {
                                    break
                                }
                            }
                        }
                        r0 = (r0 + 1) | 0
                        r3 = Int64(heapClassInst.heap32[(r1 + 5)])
                        if (r3 > r0) {
                            continue
                        } else {
                            break
                        }
                    }
                }
            } else {
                if (r3 > 0) {
                    r0 = 0
                    while (true) {
                        r3 = r2 >> 2
                        r4 = Int64(heapClassInst.heap32[(r3 + 2)])
                        if (!(r4 < 1)) {
                            r5 = 0
                            while (true) {
                                r6 = Int64(heapClassInst.heap32[(r3 + 19)])
                                r7 = r5 << 2
                                r6 = (r6 + r7) | 0
                                r6 = r6 >> 2
                                r6 = Int64(heapClassInst.heap32[(r6)])
                                r6 = (r6 * 136) | 0
                                r7 = Int64(heapClassInst.heap32[(r3 + 4)])
                                r6 = (r7 + r6) | 0
                                r7 = r6 >> 2
                                r8 = Int64(heapClassInst.heap32[(r7 + 27)])
                                r7 = Int64(heapClassInst.heap32[(r7 + 26)])
                                heapClassInst.heap32[(g0)] = Int32(r7)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r6)
                                r5 = (r5 + 1) | 0
                                _ZN35btSequentialImpulseConstraintSolver43resolveSplitPenetrationImpulseCacheFriendlyER11btRigidBodyS1_RK18btSolverConstraint(
                                    i7);
                                if (!(r4 != r5)) {
                                    break
                                }
                            }
                        }
                        r0 = (r0 + 1) | 0
                        r3 = Int64(heapClassInst.heap32[(r1 + 5)])
                        if (r3 > r0) {
                            continue
                        } else {
                            break
                        }
                    }
                }
            }
        }
    } while (false);
    return;
}

func _ZN35btSequentialImpulseConstraintSolverD1Ev(sp: Int64): Unit {
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
    r1 = _ZTV35btSequentialImpulseConstraintSolver
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 29)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 120])
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
        heapClassInst.heap32[(r2 + 29)] = 0
    }
    r1 = 1
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
    r3 = Int64(heapClassInst.heap32[(r2 + 14)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 60])
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
        heapClassInst.heap32[(r2 + 14)] = 0
    }
    heapClassInst.heap8[r0 + 60] = Int8(r1)
    heapClassInst.heap32[(r2 + 14)] = 0
    heapClassInst.heap32[(r2 + 12)] = 0
    heapClassInst.heap32[(r2 + 13)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 9)])
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
        heapClassInst.heap32[(r2 + 9)] = 0
    }
    heapClassInst.heap8[r0 + 40] = Int8(r1)
    heapClassInst.heap32[(r2 + 9)] = 0
    heapClassInst.heap32[(r2 + 7)] = 0
    heapClassInst.heap32[(r2 + 8)] = 0
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

func _ZN35btSequentialImpulseConstraintSolverD0Ev(sp: Int64): Unit {
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
    r1 = _ZTV35btSequentialImpulseConstraintSolver
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 29)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 120])
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
        heapClassInst.heap32[(r2 + 29)] = 0
    }
    r1 = 1
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
    r3 = Int64(heapClassInst.heap32[(r2 + 14)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 60])
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
        heapClassInst.heap32[(r2 + 14)] = 0
    }
    heapClassInst.heap8[r0 + 60] = Int8(r1)
    heapClassInst.heap32[(r2 + 14)] = 0
    heapClassInst.heap32[(r2 + 12)] = 0
    heapClassInst.heap32[(r2 + 13)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 9)])
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
        heapClassInst.heap32[(r2 + 9)] = 0
    }
    heapClassInst.heap8[r0 + 40] = Int8(r1)
    heapClassInst.heap32[(r2 + 9)] = 0
    heapClassInst.heap32[(r2 + 7)] = 0
    heapClassInst.heap32[(r2 + 8)] = 0
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

func _ZN35btSequentialImpulseConstraintSolver10solveGroupEPP17btCollisionObjectiPP20btPersistentManifoldiPP17btTypedConstraintiRK19btContactSolverInfoP12btIDebugDrawP12btStackAllocP12btDispatcher(
    sp: Int64): Unit {
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
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-48)
    var g0 = i7 >> 2;
    r0 = _E2_str450
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    if (r1 != 0) {
        r0 = Int64(heapClassInst.heap32[(fp + 2)])
        if (r0 != 0) {
            r2 = Int64(heapClassInst.heap32[(fp)])
            r3 = Int64(heapClassInst.heap32[(fp + 3)])
            r4 = Int64(heapClassInst.heap32[(fp + 4)])
            r5 = Int64(heapClassInst.heap32[(fp + 5)])
            r6 = Int64(heapClassInst.heap32[(fp + 6)])
            r7 = Int64(heapClassInst.heap32[(fp + 7)])
            r8 = Int64(heapClassInst.heap32[(fp + 8)])
            r9 = Int64(heapClassInst.heap32[(fp + 9)])
            r10 = r2 >> 2
            r11 = Int64(heapClassInst.heap32[(r10)])
            r11 = r11 >> 2
            r11 = Int64(heapClassInst.heap32[(r11 + 8)])
            heapClassInst.heap32[(g0)] = Int32(r2)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heap32[(g0 + 2)] = Int32(r0)
            heapClassInst.heap32[(g0 + 3)] = Int32(r3)
            heapClassInst.heap32[(g0 + 4)] = Int32(r4)
            heapClassInst.heap32[(g0 + 5)] = Int32(r5)
            heapClassInst.heap32[(g0 + 6)] = Int32(r6)
            heapClassInst.heap32[(g0 + 7)] = Int32(r7)
            heapClassInst.heap32[(g0 + 8)] = Int32(r8)
            heapClassInst.heap32[(g0 + 9)] = Int32(r9)
            __FUNCTION_TABLE__[(r11) >> 2](i7);
            r11 = Int64(heapClassInst.heap32[(r10)])
            r11 = r11 >> 2
            r11 = Int64(heapClassInst.heap32[(r11 + 9)])
            heapClassInst.heap32[(g0)] = Int32(r2)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heap32[(g0 + 2)] = Int32(r0)
            heapClassInst.heap32[(g0 + 3)] = Int32(r3)
            heapClassInst.heap32[(g0 + 4)] = Int32(r4)
            heapClassInst.heap32[(g0 + 5)] = Int32(r5)
            heapClassInst.heap32[(g0 + 6)] = Int32(r6)
            heapClassInst.heap32[(g0 + 7)] = Int32(r7)
            heapClassInst.heap32[(g0 + 8)] = Int32(r8)
            heapClassInst.heap32[(g0 + 9)] = Int32(r9)
            __FUNCTION_TABLE__[(r11) >> 2](i7);
            r10 = Int64(heapClassInst.heap32[(r10)])
            r10 = r10 >> 2
            r10 = Int64(heapClassInst.heap32[(r10 + 7)])
            heapClassInst.heap32[(g0)] = Int32(r2)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heap32[(g0 + 2)] = Int32(r0)
            heapClassInst.heap32[(g0 + 3)] = Int32(r3)
            heapClassInst.heap32[(g0 + 4)] = Int32(r4)
            heapClassInst.heap32[(g0 + 5)] = Int32(r5)
            heapClassInst.heap32[(g0 + 6)] = Int32(r6)
            heapClassInst.heap32[(g0 + 7)] = Int32(r7)
            heapClassInst.heap32[(g0 + 8)] = Int32(r8)
            heapClassInst.heap32[(g0 + 9)] = Int32(r9)
            r0 = _ZN15CProfileManager11CurrentNodeE
            r0 = r0 >> 2
            __FUNCTION_TABLE__[(r10) >> 2](i7);
            r1 = Int64(heapClassInst.heap32[(r0)])
            r2 = r1 >> 2
            r3 = Int64(heapClassInst.heap32[(r2 + 4)])
            r3 = (r3 + (-1)) | 0
            heapClassInst.heap32[(r2 + 4)] = Int32(r3)
            do {
                if (!(r3 != 0)) {
                    r3 = Int64(heapClassInst.heap32[(r2 + 1)])
                    if (r3 != 0) {
                        r1 = sp + (-8)
                        heapClassInst.heap32[(g0)] = Int32(r1)
                        heapClassInst.heap32[(g0 + 1)] = 0
                        r3 = _ZL13gProfileClock_2E_0
                        gettimeofday(i7);
                        r3 = r3 >> 2
                        r3 = Int64(heapClassInst.heap32[(r3)])
                        r3 = r3 >> 2
                        r1 = r1 >> 2
                        r4 = Int64(heapClassInst.heap32[(fp + (-2))])
                        r5 = Int64(heapClassInst.heap32[(r3)])
                        r4 = (r4 - r5) | 0
                        r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                        r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                        r1 = (r1 - r3) | 0
                        r3 = (r4 * 1000000) | 0
                        r1 = (r1 + r3) | 0
                        r3 = Int64(heapClassInst.heap32[(r2 + 3)])
                        r1 = (r1 - r3) | 0
                        f0 = Float64(`UIntNative`(r1))
                        f1 = 1000.0
                        f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                        f0 = f0 / f1
                        f0 = f2 + f0
                        heapClassInst.heapFloat[(r2 + 2)] = Float32(f0)
                        r1 = Int64(heapClassInst.heap32[(r2 + 4)])
                        if (r1 != 0) {
                            break
                        } else {
                            r1 = Int64(heapClassInst.heap32[(r0)])
                        }
                    }
                    r1 = r1 >> 2
                    r1 = Int64(heapClassInst.heap32[(r1 + 5)])
                    heapClassInst.heap32[(r0)] = Int32(r1)
                }
            } while (false);
            f0 = 0.0
            commonVariable.f_g0 = f0
            return;
        } else {
            r0 = _E2_str753
            r1 = _E2_str652
            heapClassInst.heap32[(g0)] = Int32(r0)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heap32[(g0 + 2)] = 1186
            _assert(i7);
        }
    } else {
        r1 = _E2_str551
        r0 = _E2_str652
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = Int32(r0)
        heapClassInst.heap32[(g0 + 2)] = 1185
        _assert(i7);
    }
}

func _ZN35btSequentialImpulseConstraintSolver29solveGroupCacheFriendlyFinishEPP17btCollisionObjectiPP20btPersistentManifoldiPP17btTypedConstraintiRK19btContactSolverInfoP12btIDebugDrawP12btStackAlloc(
    sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-504)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    r3 = Int64(heapClassInst.heap32[(fp + 2)])
    r4 = Int64(heapClassInst.heap32[(fp + 7)])
    r5 = Int64(heapClassInst.heap32[(r1 + 2)])
    r6 = 0
    while (true) {
        if (r6 < r5) {
            r7 = (r6 * 34) | 0
            r8 = Int64(heapClassInst.heap32[(r1 + 4)])
            r7 = r7 << 2
            r7 = (r8 + r7) | 0
            r7 = r7 >> 2
            r8 = Int64(heapClassInst.heap32[(r7 + 28)])
            if (r8 != 0) {
                r8 = r8 >> 2
                heapClassInst.heap32[(r8 + 28)] = heapClassInst.heap32[(r7 + 21)]
                r9 = Int64(heapClassInst.heapU8[r4 + 60])
                r9 = r9 & 8
                if (!(r9 == 0)) {
                    r9 = Int64(heapClassInst.heap32[(r7 + 25)])
                    r10 = Int64(heapClassInst.heap32[(r1 + 14)])
                    r9 = (r9 * 136) | 0
                    r9 = (r10 + r9) | 0
                    r9 = r9 >> 2
                    heapClassInst.heap32[(r8 + 30)] = heapClassInst.heap32[(r9 + 21)]
                    r7 = Int64(heapClassInst.heap32[(r7 + 25)])
                    r9 = Int64(heapClassInst.heap32[(r1 + 14)])
                    r7 = (r7 * 136) | 0
                    r7 = (r7 + r9) | 0
                    r7 = r7 >> 2
                    heapClassInst.heap32[(r8 + 31)] = heapClassInst.heap32[(r7 + 55)]
                }
                r6 = (r6 + 1) | 0
                continue
            } else {
                __label__ = 2
                break
            }
        } else {
            __label__ = 7
            break
        }
    }
    match (__label__) {
        case 7 =>
            r5 = Int64(heapClassInst.heap32[(r1 + 7)])
            do {
                if (!(r5 < 1)) {
                    r6 = 0
                    while (true) {
                        r7 = (r6 * 34) | 0
                        r8 = Int64(heapClassInst.heap32[(r1 + 9)])
                        r7 = r7 << 2
                        r7 = (r8 + r7) | 0
                        r7 = r7 >> 2
                        r8 = Int64(heapClassInst.heap32[(r7 + 28)])
                        r8 = r8 >> 2
                        f0 = Float64(heapClassInst.heapFloat[(r8 + 7)])
                        f1 = Float64(heapClassInst.heapFloat[(r7 + 21)])
                        r6 = (r6 + 1) | 0
                        f0 = f1 + f0
                        heapClassInst.heapFloat[(r8 + 7)] = Float32(f0)
                        if (r5 != r6) {
                            continue
                        } else {
                            break
                        }
                    }
                }
            } while (false);
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4 + 11)])
            do {
                if (r5 != 0) {
                    if (!(r3 < 1)) {
                        __label__ = 13
                        while (true) {
                            r5 = r2 >> 2
                            r5 = Int64(heapClassInst.heap32[(r5)])
                            r6 = Int64(heapClassInst.heapU8[r5 + 232])
                            r6 = r6 & 2
                            if (!(r6 == 0)) {
                                if (!(r5 == 0)) {
                                    r6 = r5 >> 2
                                    f0 = Float64(heapClassInst.heapFloat[(r6 + 84)])
                                    f1 = 0.0
                                    if (!(f0 == f1)) {
                                        f0 = Float64(heapClassInst.heapFloat[(r4 + 3)])
                                        f1 = Float64(heapClassInst.heapFloat[(r6 + 78)])
                                        f2 = Float64(heapClassInst.heapFloat[(r6 + 128)])
                                        f3 = Float64(heapClassInst.heapFloat[(r6 + 77)])
                                        f4 = Float64(heapClassInst.heapFloat[(r6 + 127)])
                                        f5 = Float64(heapClassInst.heapFloat[(r6 + 76)])
                                        f6 = Float64(heapClassInst.heapFloat[(r6 + 126)])
                                        f5 = f5 + f6
                                        f3 = f3 + f4
                                        heapClassInst.heapFloat[(r6 + 76)] = Float32(f5)
                                        f1 = f1 + f2
                                        heapClassInst.heapFloat[(r6 + 77)] = Float32(f3)
                                        heapClassInst.heapFloat[(r6 + 78)] = Float32(f1)
                                        heapClassInst.heap32[(r6 + 79)] = 0
                                        f1 = Float64(heapClassInst.heapFloat[(r6 + 82)])
                                        f2 = Float64(heapClassInst.heapFloat[(r6 + 132)])
                                        f3 = Float64(heapClassInst.heapFloat[(r6 + 81)])
                                        f4 = Float64(heapClassInst.heapFloat[(r6 + 131)])
                                        f5 = Float64(heapClassInst.heapFloat[(r6 + 80)])
                                        f6 = Float64(heapClassInst.heapFloat[(r6 + 130)])
                                        f5 = f5 + f6
                                        f3 = f3 + f4
                                        heapClassInst.heapFloat[(r6 + 80)] = Float32(f5)
                                        f1 = f1 + f2
                                        heapClassInst.heapFloat[(r6 + 81)] = Float32(f3)
                                        heapClassInst.heapFloat[(r6 + 82)] = Float32(f1)
                                        heapClassInst.heap32[(r6 + 83)] = 0
                                        f1 = Float64(heapClassInst.heapFloat[(r6 + 142)])
                                        f2 = Float64(heapClassInst.heapFloat[(r6 + 143)])
                                        f3 = Float64(heapClassInst.heapFloat[(r6 + 144)])
                                        r7 = sp + (-64)
                                        r8 = (r5 + 4) | 0
                                        r5 = (r5 + 584) | 0
                                        heapClassInst.heap32[(g0)] = Int32(r8)
                                        heapClassInst.heapFloat[(g0 + 1)] = Float32(f1)
                                        heapClassInst.heapFloat[(g0 + 2)] = Float32(f2)
                                        heapClassInst.heapFloat[(g0 + 3)] = Float32(f3)
                                        heapClassInst.heap32[(g0 + 4)] = Int32(r5)
                                        heapClassInst.heapFloat[(g0 + 5)] = Float32(f0)
                                        heapClassInst.heap32[(g0 + 6)] = Int32(r7)
                                        _ZN15btTransformUtil18integrateTransformERK11btTransformRK9btVector3S5_fRS0_(i7);
                                        r5 = r7 >> 2
                                        heapClassInst.heap32[(r6 + 1)] = heapClassInst.heap32[(fp + (-16))]
                                        heapClassInst.heap32[(r6 + 2)] = heapClassInst.heap32[(r5 + 1)]
                                        heapClassInst.heap32[(r6 + 3)] = heapClassInst.heap32[(r5 + 2)]
                                        heapClassInst.heap32[(r6 + 4)] = heapClassInst.heap32[(r5 + 3)]
                                        heapClassInst.heap32[(r6 + 5)] = heapClassInst.heap32[(r5 + 4)]
                                        heapClassInst.heap32[(r6 + 6)] = heapClassInst.heap32[(r5 + 5)]
                                        heapClassInst.heap32[(r6 + 7)] = heapClassInst.heap32[(r5 + 6)]
                                        heapClassInst.heap32[(r6 + 8)] = heapClassInst.heap32[(r5 + 7)]
                                        heapClassInst.heap32[(r6 + 9)] = heapClassInst.heap32[(r5 + 8)]
                                        heapClassInst.heap32[(r6 + 10)] = heapClassInst.heap32[(r5 + 9)]
                                        heapClassInst.heap32[(r6 + 11)] = heapClassInst.heap32[(r5 + 10)]
                                        heapClassInst.heap32[(r6 + 12)] = heapClassInst.heap32[(r5 + 11)]
                                        heapClassInst.heap32[(r6 + 13)] = heapClassInst.heap32[(r5 + 12)]
                                        heapClassInst.heap32[(r6 + 14)] = heapClassInst.heap32[(r5 + 13)]
                                        heapClassInst.heap32[(r6 + 15)] = heapClassInst.heap32[(r5 + 14)]
                                        heapClassInst.heap32[(r6 + 16)] = heapClassInst.heap32[(r5 + 15)]
                                    }
                                }
                            }
                            r3 = (r3 + (-1)) | 0
                            r2 = (r2 + 4) | 0
                            if (r3 == 0) {
                                break
                            } else {
                                continue
                            }
                        }
                    }
                } else {
                    if (!(r3 < 1)) {
                        __label__ = 18
                        while (true) {
                            r4 = r2 >> 2
                            r4 = Int64(heapClassInst.heap32[(r4)])
                            r5 = Int64(heapClassInst.heapU8[r4 + 232])
                            r5 = r5 & 2
                            if (!(r5 == 0)) {
                                if (!(r4 == 0)) {
                                    r4 = r4 >> 2
                                    f0 = Float64(heapClassInst.heapFloat[(r4 + 84)])
                                    f1 = 0.0
                                    if (!(f0 == f1)) {
                                        f0 = Float64(heapClassInst.heapFloat[(r4 + 78)])
                                        f1 = Float64(heapClassInst.heapFloat[(r4 + 128)])
                                        f2 = Float64(heapClassInst.heapFloat[(r4 + 77)])
                                        f3 = Float64(heapClassInst.heapFloat[(r4 + 127)])
                                        f4 = Float64(heapClassInst.heapFloat[(r4 + 76)])
                                        f5 = Float64(heapClassInst.heapFloat[(r4 + 126)])
                                        f4 = f4 + f5
                                        f2 = f2 + f3
                                        heapClassInst.heapFloat[(r4 + 76)] = Float32(f4)
                                        f0 = f0 + f1
                                        heapClassInst.heapFloat[(r4 + 77)] = Float32(f2)
                                        heapClassInst.heapFloat[(r4 + 78)] = Float32(f0)
                                        heapClassInst.heap32[(r4 + 79)] = 0
                                        f0 = Float64(heapClassInst.heapFloat[(r4 + 82)])
                                        f1 = Float64(heapClassInst.heapFloat[(r4 + 132)])
                                        f2 = Float64(heapClassInst.heapFloat[(r4 + 81)])
                                        f3 = Float64(heapClassInst.heapFloat[(r4 + 131)])
                                        f4 = Float64(heapClassInst.heapFloat[(r4 + 80)])
                                        f5 = Float64(heapClassInst.heapFloat[(r4 + 130)])
                                        f4 = f4 + f5
                                        f2 = f2 + f3
                                        heapClassInst.heapFloat[(r4 + 80)] = Float32(f4)
                                        f0 = f0 + f1
                                        heapClassInst.heapFloat[(r4 + 81)] = Float32(f2)
                                        heapClassInst.heapFloat[(r4 + 82)] = Float32(f0)
                                        heapClassInst.heap32[(r4 + 83)] = 0
                                    }
                                }
                            }
                            r3 = (r3 + (-1)) | 0
                            r2 = (r2 + 4) | 0
                            if (r3 != 0) {
                                continue
                            } else {
                                break
                            }
                        }
                    }
                }
            } while (false);
            r2 = Int64(heapClassInst.heap32[(r1 + 2)])
            do {
                if (!(r2 > (-1))) {
                    r3 = Int64(heapClassInst.heap32[(r1 + 3)])
                    if (!(r3 > (-1))) {
                        r3 = Int64(heapClassInst.heap32[(r1 + 4)])
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
                            heapClassInst.heap32[(r1 + 4)] = 0
                        }
                        r3 = 1
                        heapClassInst.heap8[r0 + 20] = Int8(r3)
                        heapClassInst.heap32[(r1 + 4)] = 0
                        heapClassInst.heap32[(r1 + 3)] = 0
                    }
                    r3 = (r2 * 136) | 0
                    while (true) {
                        r4 = Int64(heapClassInst.heap32[(r1 + 4)])
                        r4 = (r4 + r3) | 0
                        r5 = sp + (-472)
                        heapClassInst.heap32[(g0)] = Int32(r4)
                        heapClassInst.heap32[(g0 + 1)] = Int32(r5)
                        heapClassInst.heap32[(g0 + 2)] = 136
                        r2 = (r2 + 1) | 0
                        r3 = (r3 + 136) | 0
                        memcpy(i7);
                        if (r2 != 0) {
                            continue
                        } else {
                            break
                        }
                    }
                }
            } while (false);
            heapClassInst.heap32[(r1 + 2)] = 0
            r2 = Int64(heapClassInst.heap32[(r1 + 7)])
            do {
                if (!(r2 > (-1))) {
                    r3 = Int64(heapClassInst.heap32[(r1 + 8)])
                    if (!(r3 > (-1))) {
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
                        heapClassInst.heap32[(r1 + 8)] = 0
                    }
                    r3 = (r2 * 136) | 0
                    while (true) {
                        r4 = Int64(heapClassInst.heap32[(r1 + 9)])
                        r4 = (r4 + r3) | 0
                        r5 = sp + (-336)
                        heapClassInst.heap32[(g0)] = Int32(r4)
                        heapClassInst.heap32[(g0 + 1)] = Int32(r5)
                        heapClassInst.heap32[(g0 + 2)] = 136
                        r2 = (r2 + 1) | 0
                        r3 = (r3 + 136) | 0
                        memcpy(i7);
                        if (r2 != 0) {
                            continue
                        } else {
                            break
                        }
                    }
                }
            } while (false);
            heapClassInst.heap32[(r1 + 7)] = 0
            r2 = Int64(heapClassInst.heap32[(r1 + 12)])
            do {
                if (!(r2 > (-1))) {
                    r3 = Int64(heapClassInst.heap32[(r1 + 13)])
                    if (!(r3 > (-1))) {
                        r3 = Int64(heapClassInst.heap32[(r1 + 14)])
                        if (!(r3 == 0)) {
                            r4 = Int64(heapClassInst.heapU8[r0 + 60])
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
                            heapClassInst.heap32[(r1 + 14)] = 0
                        }
                        r3 = 1
                        heapClassInst.heap8[r0 + 60] = Int8(r3)
                        heapClassInst.heap32[(r1 + 14)] = 0
                        heapClassInst.heap32[(r1 + 13)] = 0
                    }
                    r0 = (r2 * 136) | 0
                    while (true) {
                        r3 = Int64(heapClassInst.heap32[(r1 + 14)])
                        r3 = (r3 + r0) | 0
                        r4 = sp + (-200)
                        heapClassInst.heap32[(g0)] = Int32(r3)
                        heapClassInst.heap32[(g0 + 1)] = Int32(r4)
                        heapClassInst.heap32[(g0 + 2)] = 136
                        r2 = (r2 + 1) | 0
                        r0 = (r0 + 136) | 0
                        memcpy(i7);
                        if (r2 != 0) {
                            continue
                        } else {
                            break
                        }
                    }
                }
            } while (false);
            heapClassInst.heap32[(r1 + 12)] = 0
            f0 = 0.0
            commonVariable.f_g0 = f0
            return;
        case 2 =>
            r0 = _E2_str955
            r1 = _E2_str652
            heapClassInst.heap32[(g0)] = Int32(r0)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heap32[(g0 + 2)] = 1129
            _assert(i7);
        case _ => println("break")
    }
}

func _ZN35btSequentialImpulseConstraintSolver28solveGroupCacheFriendlySetupEPP17btCollisionObjectiPP20btPersistentManifoldiPP17btTypedConstraintiRK19btContactSolverInfoP12btIDebugDrawP12btStackAlloc(
    sp: Int64): Unit {
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
    var r24: Int64 = 0
    var r25: Int64 = 0
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
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var f24: Float64 = 0.0
    var f25: Float64 = 0.0
    var f26: Float64 = 0.0
    var f27: Float64 = 0.0
    var f28: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-584)
    var g0 = i7 >> 2;
    r0 = _E2_str1056
    r1 = Int64(heapClassInst.heap32[(fp + 6)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = Int64(heapClassInst.heap32[(fp + 4)])
    heapClassInst.heap32[(fp + (-133))] = Int32(r0)
    r2 = 0
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r0 = (r2 - r0) | 0
    do {
        if (!(r1 == r0)) {
            r0 = Int64(heapClassInst.heap32[(fp)])
            r3 = Int64(heapClassInst.heap32[(fp + 1)])
            r4 = Int64(heapClassInst.heap32[(fp + 2)])
            r5 = Int64(heapClassInst.heap32[(fp + 3)])
            heapClassInst.heap32[(fp + (-132))] = Int32(r5)
            r5 = Int64(heapClassInst.heap32[(fp + 5)])
            heapClassInst.heap32[(fp + (-127))] = Int32(r5)
            r5 = Int64(heapClassInst.heap32[(fp + 7)])
            r6 = r5 >> 2
            r7 = Int64(heapClassInst.heap32[(r6 + 11)])
            do {
                if (r7 != 0) {
                    if (!(r4 < 1)) {
                        __label__ = 4
                        while (true) {
                            r7 = r3 >> 2
                            r7 = Int64(heapClassInst.heap32[(r7)])
                            r8 = Int64(heapClassInst.heapU8[r7 + 232])
                            r8 = r8 & 2
                            if (!(r8 == 0)) {
                                if (!(r7 == 0)) {
                                    r7 = r7 >> 2
                                    heapClassInst.heap32[(r7 + 126)] = 0
                                    heapClassInst.heap32[(r7 + 127)] = 0
                                    heapClassInst.heap32[(r7 + 128)] = 0
                                    heapClassInst.heap32[(r7 + 129)] = 0
                                    heapClassInst.heap32[(r7 + 130)] = 0
                                    heapClassInst.heap32[(r7 + 131)] = 0
                                    heapClassInst.heap32[(r7 + 132)] = 0
                                    heapClassInst.heap32[(r7 + 133)] = 0
                                    heapClassInst.heap32[(r7 + 142)] = 0
                                    heapClassInst.heap32[(r7 + 143)] = 0
                                    heapClassInst.heap32[(r7 + 144)] = 0
                                    heapClassInst.heap32[(r7 + 145)] = 0
                                    heapClassInst.heap32[(r7 + 146)] = 0
                                    heapClassInst.heap32[(r7 + 147)] = 0
                                    heapClassInst.heap32[(r7 + 148)] = 0
                                    heapClassInst.heap32[(r7 + 149)] = 0
                                }
                            }
                            r4 = (r4 + (-1)) | 0
                            r3 = (r3 + 4) | 0
                            if (r4 == 0) {
                                break
                            } else {
                                continue
                            }
                        }
                    }
                } else {
                    if (!(r4 < 1)) {
                        __label__ = 8
                        while (true) {
                            r7 = r3 >> 2
                            r7 = Int64(heapClassInst.heap32[(r7)])
                            r8 = Int64(heapClassInst.heapU8[r7 + 232])
                            r8 = r8 & 2
                            if (!(r8 == 0)) {
                                if (!(r7 == 0)) {
                                    r7 = r7 >> 2
                                    heapClassInst.heap32[(r7 + 126)] = 0
                                    heapClassInst.heap32[(r7 + 127)] = 0
                                    heapClassInst.heap32[(r7 + 128)] = 0
                                    heapClassInst.heap32[(r7 + 129)] = 0
                                    heapClassInst.heap32[(r7 + 130)] = 0
                                    heapClassInst.heap32[(r7 + 131)] = 0
                                    heapClassInst.heap32[(r7 + 132)] = 0
                                    heapClassInst.heap32[(r7 + 133)] = 0
                                }
                            }
                            r4 = (r4 + (-1)) | 0
                            r3 = (r3 + 4) | 0
                            if (r4 == 0) {
                                break
                            }
                        }
                    }
                }
            } while (false);
            do {
                if (r1 < 1) {
                    r4 = r0 >> 2
                    r3 = Int64(heapClassInst.heap32[(r4 + 27)])
                    do {
                        if (!(r3 > r1)) {
                            if (!(r3 >= r1)) {
                                r7 = Int64(heapClassInst.heap32[(r4 + 28)])
                                if (!(r7 >= r1)) {
                                    if (r1 != 0) {
                                        r7 = gNumAlignedAllocs
                                        r7 = r7 >> 2
                                        r8 = Int64(heapClassInst.heap32[(r7)])
                                        r9 = r1 << 3
                                        r8 = (r8 + 1) | 0
                                        r9 = r9 | 3
                                        heapClassInst.heap32[(r7)] = Int32(r8)
                                        r7 = (r9 + 16) | 0
                                        heapClassInst.heap32[(g0)] = Int32(r7)
                                        mallocNew(i7);
                                        r7 = commonVariable.r_g0
                                        if (r7 != 0) {
                                            r8 = (r7 + 4) | 0
                                            r8 = (r2 - r8) | 0
                                            r8 = r8 & 15
                                            r8 = (r7 + r8) | 0
                                            r9 = (r8 + 4) | 0
                                            r8 = r8 >> 2
                                            heapClassInst.heap32[(r8)] = Int32(r7)
                                            r7 = r9
                                        }
                                    } else {
                                        r7 = 0
                                    }
                                    r8 = (r0 + 116) | 0
                                    if (r3 < 1) {
                                        r2 = r8 >> 2
                                        r9 = Int64(heapClassInst.heap32[(r2)])
                                    } else {
                                        while (true) {
                                            r9 = r8 >> 2
                                            r9 = Int64(heapClassInst.heap32[(r9)])
                                            r10 = r2 << 3
                                            r11 = (r9 + r10) | 0
                                            r11 = r11 >> 2
                                            r10 = (r7 + r10) | 0
                                            r12 = Int64(heapClassInst.heap32[(r11 + 1)])
                                            r11 = Int64(heapClassInst.heap32[(r11)])
                                            r10 = r10 >> 2
                                            r2 = (r2 + 1) | 0
                                            heapClassInst.heap32[(r10)] = Int32(r11)
                                            heapClassInst.heap32[(r10 + 1)] = Int32(r12)
                                            if (!(r3 != r2)) {
                                                break
                                            }
                                        }
                                        r8 = (r0 + 116) | 0
                                    }
                                    if (!(r9 == 0)) {
                                        r2 = Int64(heapClassInst.heapU8[r0 + 120])
                                        if (!(r2 == 0)) {
                                            r2 = gNumAlignedFree
                                            r2 = r2 >> 2
                                            r10 = Int64(heapClassInst.heap32[(r2)])
                                            r10 = (r10 + 1) | 0
                                            r9 = r9 >> 2
                                            heapClassInst.heap32[(r2)] = Int32(r10)
                                            r2 = Int64(heapClassInst.heap32[(r9 + (-1))])
                                            heapClassInst.heap32[(g0)] = Int32(r2)
                                            free(i7);
                                        }
                                        r2 = r8 >> 2
                                        heapClassInst.heap32[(r2)] = 0
                                    }
                                    r2 = 1
                                    r8 = r8 >> 2
                                    heapClassInst.heap8[r0 + 120] = Int8(r2)
                                    heapClassInst.heap32[(r8)] = Int32(r7)
                                    heapClassInst.heap32[(r4 + 28)] = Int32(r1)
                                    if (r3 >= r1) {
                                        break
                                    }
                                }
                                while (true) {
                                    r2 = r3 << 3
                                    r7 = Int64(heapClassInst.heap32[(r4 + 29)])
                                    r2 = (r7 + r2) | 0
                                    r2 = r2 >> 2
                                    r3 = (r3 + 1) | 0
                                    heapClassInst.heap32[(r2)] = 0
                                    heapClassInst.heap32[(r2 + 1)] = 0
                                    if (!(r1 != r3)) {
                                        break
                                    }
                                }
                            }
                        }
                    } while (false);
                    r3 = 0
                    heapClassInst.heap32[(r4 + 27)] = Int32(r1)
                } else {
                    r2 = 0
                    while (true) {
                        r3 = r2 << 2
                        r4 = Int64(heapClassInst.heap32[(fp + (-127))])
                        r3 = (r4 + r3) | 0
                        r3 = r3 >> 2
                        r3 = Int64(heapClassInst.heap32[(r3)])
                        r4 = r3 >> 2
                        r4 = Int64(heapClassInst.heap32[(r4)])
                        r4 = r4 >> 2
                        r4 = Int64(heapClassInst.heap32[(r4 + 2)])
                        r2 = (r2 + 1) | 0
                        heapClassInst.heap32[(g0)] = Int32(r3)
                        __FUNCTION_TABLE__[(r4) >> 2](i7);
                        if (r1 == r2) {
                            break
                        }
                    }
                    r2 = r0 >> 2
                    r3 = Int64(heapClassInst.heap32[(r2 + 27)])
                    do {
                        if (!(r3 > r1)) {
                            if (!(r3 >= r1)) {
                                r4 = Int64(heapClassInst.heap32[(r2 + 28)])
                                if (!(r4 >= r1)) {
                                    if (r1 != 0) {
                                        r4 = gNumAlignedAllocs
                                        r4 = r4 >> 2
                                        r7 = Int64(heapClassInst.heap32[(r4)])
                                        r8 = r1 << 3
                                        r7 = (r7 + 1) | 0
                                        r8 = r8 | 3
                                        heapClassInst.heap32[(r4)] = Int32(r7)
                                        r4 = (r8 + 16) | 0
                                        heapClassInst.heap32[(g0)] = Int32(r4)
                                        mallocNew(i7);
                                        r4 = commonVariable.r_g0
                                        if (r4 != 0) {
                                            r7 = 0
                                            r8 = (r4 + 4) | 0
                                            r7 = (r7 - r8) | 0
                                            r7 = r7 & 15
                                            r7 = (r4 + r7) | 0
                                            r8 = (r7 + 4) | 0
                                            r7 = r7 >> 2
                                            heapClassInst.heap32[(r7)] = Int32(r4)
                                            r4 = r8
                                        }
                                    } else {
                                        r4 = 0
                                    }
                                    r7 = (r0 + 116) | 0
                                    if (r3 < 1) {
                                        r8 = r7 >> 2
                                        r9 = Int64(heapClassInst.heap32[(r8)])
                                    } else {
                                        r8 = 0
                                        while (true) {
                                            r9 = r7 >> 2
                                            r9 = Int64(heapClassInst.heap32[(r9)])
                                            r10 = r8 << 3
                                            r11 = (r9 + r10) | 0
                                            r11 = r11 >> 2
                                            r10 = (r4 + r10) | 0
                                            r12 = Int64(heapClassInst.heap32[(r11 + 1)])
                                            r11 = Int64(heapClassInst.heap32[(r11)])
                                            r10 = r10 >> 2
                                            r8 = (r8 + 1) | 0
                                            heapClassInst.heap32[(r10)] = Int32(r11)
                                            heapClassInst.heap32[(r10 + 1)] = Int32(r12)
                                            if (!(r3 != r8)) {
                                                break
                                            }
                                        }
                                        r7 = (r0 + 116) | 0
                                    }
                                    if (!(r9 == 0)) {
                                        r8 = Int64(heapClassInst.heapU8[r0 + 120])
                                        if (!(r8 == 0)) {
                                            r8 = gNumAlignedFree
                                            r8 = r8 >> 2
                                            r10 = Int64(heapClassInst.heap32[(r8)])
                                            r10 = (r10 + 1) | 0
                                            r9 = r9 >> 2
                                            heapClassInst.heap32[(r8)] = Int32(r10)
                                            r8 = Int64(heapClassInst.heap32[(r9 + (-1))])
                                            heapClassInst.heap32[(g0)] = Int32(r8)
                                            free(i7);
                                        }
                                        r8 = r7 >> 2
                                        heapClassInst.heap32[(r8)] = 0
                                    }
                                    r8 = 1
                                    r7 = r7 >> 2
                                    heapClassInst.heap8[r0 + 120] = Int8(r8)
                                    heapClassInst.heap32[(r7)] = Int32(r4)
                                    heapClassInst.heap32[(r2 + 28)] = Int32(r1)
                                    if (r3 >= r1) {
                                        break
                                    }
                                }
                                while (true) {
                                    r4 = r3 << 3
                                    r7 = Int64(heapClassInst.heap32[(r2 + 29)])
                                    r4 = (r7 + r4) | 0
                                    r4 = r4 >> 2
                                    r3 = (r3 + 1) | 0
                                    heapClassInst.heap32[(r4)] = 0
                                    heapClassInst.heap32[(r4 + 1)] = 0
                                    if (!(r1 != r3)) {
                                        break
                                    }
                                }
                            }
                        }
                    } while (false);
                    heapClassInst.heap32[(r2 + 27)] = Int32(r1)
                    if (r1 > 0) {
                        r4 = 0
                        r7 = Int64(heapClassInst.heap32[(fp + (-127))])
                        r8 = r1
                        r3 = r4
                        while (true) {
                            r9 = r7 >> 2
                            r9 = Int64(heapClassInst.heap32[(r9)])
                            r10 = r9 >> 2
                            r10 = Int64(heapClassInst.heap32[(r10)])
                            r10 = r10 >> 2
                            r10 = Int64(heapClassInst.heap32[(r10 + 4)])
                            r11 = Int64(heapClassInst.heap32[(r2 + 29)])
                            r11 = (r11 + r4) | 0
                            heapClassInst.heap32[(g0)] = Int32(r9)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                            __FUNCTION_TABLE__[(r10) >> 2](i7);
                            r9 = r11 >> 2
                            r9 = Int64(heapClassInst.heap32[(r9)])
                            r8 = (r8 + (-1)) | 0
                            r3 = (r9 + r3) | 0
                            r4 = (r4 + 8) | 0
                            r7 = (r7 + 4) | 0
                            if (!(r8 != 0)) {
                                break
                            }
                        }
                    } else {
                        r3 = 0
                    }
                }
            } while (false);
            r2 = r0 >> 2
            r4 = Int64(heapClassInst.heap32[(r2 + 7)])
            do {
                if (!(r4 > r3)) {
                    if (!(r4 >= r3)) {
                        r7 = Int64(heapClassInst.heap32[(r2 + 8)])
                        if (!(r7 >= r3)) {
                            if (r3 != 0) {
                                r7 = gNumAlignedAllocs
                                r7 = r7 >> 2
                                r8 = Int64(heapClassInst.heap32[(r7)])
                                r9 = (r3 * 136) | 0
                                r8 = (r8 + 1) | 0
                                r9 = r9 | 3
                                heapClassInst.heap32[(r7)] = Int32(r8)
                                r7 = (r9 + 16) | 0
                                heapClassInst.heap32[(g0)] = Int32(r7)
                                mallocNew(i7);
                                r7 = commonVariable.r_g0
                                if (r7 != 0) {
                                    r8 = 0
                                    r9 = (r7 + 4) | 0
                                    r8 = (r8 - r9) | 0
                                    r8 = r8 & 15
                                    r8 = (r7 + r8) | 0
                                    r9 = (r8 + 4) | 0
                                    r8 = r8 >> 2
                                    heapClassInst.heap32[(r8)] = Int32(r7)
                                    r7 = r9
                                }
                            } else {
                                r7 = 0
                            }
                            r8 = (r0 + 36) | 0
                            if (r4 < 1) {
                                r9 = r8 >> 2
                                r11 = Int64(heapClassInst.heap32[(r9)])
                            } else {
                                r9 = 0
                                r10 = r4
                                while (true) {
                                    r11 = r8 >> 2
                                    r11 = Int64(heapClassInst.heap32[(r11)])
                                    r12 = (r7 + r9) | 0
                                    r13 = (r11 + r9) | 0
                                    heapClassInst.heap32[(g0)] = Int32(r12)
                                    heapClassInst.heap32[(g0 + 1)] = Int32(r13)
                                    heapClassInst.heap32[(g0 + 2)] = 136
                                    r10 = (r10 + (-1)) | 0
                                    r9 = (r9 + 136) | 0
                                    memcpy(i7);
                                    if (!(r10 != 0)) {
                                        break
                                    }
                                }
                                r8 = (r0 + 36) | 0
                            }
                            if (!(r11 == 0)) {
                                r9 = Int64(heapClassInst.heapU8[r0 + 40])
                                if (!(r9 == 0)) {
                                    r9 = gNumAlignedFree
                                    r9 = r9 >> 2
                                    r10 = Int64(heapClassInst.heap32[(r9)])
                                    r10 = (r10 + 1) | 0
                                    r11 = r11 >> 2
                                    heapClassInst.heap32[(r9)] = Int32(r10)
                                    r9 = Int64(heapClassInst.heap32[(r11 + (-1))])
                                    heapClassInst.heap32[(g0)] = Int32(r9)
                                    free(i7);
                                }
                                r9 = r8 >> 2
                                heapClassInst.heap32[(r9)] = 0
                            }
                            r9 = 1
                            r8 = r8 >> 2
                            heapClassInst.heap8[r0 + 40] = Int8(r9)
                            heapClassInst.heap32[(r8)] = Int32(r7)
                            heapClassInst.heap32[(r2 + 8)] = Int32(r3)
                            if (r4 >= r3) {
                                break
                            }
                        }
                        r7 = (r3 - r4) | 0
                        r4 = (r4 * 136) | 0
                        while (true) {
                            r8 = Int64(heapClassInst.heap32[(r2 + 9)])
                            r8 = (r8 + r4) | 0
                            r9 = sp + (-448)
                            heapClassInst.heap32[(g0)] = Int32(r8)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r9)
                            heapClassInst.heap32[(g0 + 2)] = 136
                            r7 = (r7 + (-1)) | 0
                            r4 = (r4 + 136) | 0
                            memcpy(i7);
                            if (!(r7 != 0)) {
                                break
                            }
                        }
                    }
                }
            } while (false);
            r4 = 0
            heapClassInst.heap32[(r2 + 7)] = Int32(r3)
            r7 = r4
            while (true) {
                if (r4 < r1) {
                    r8 = Int64(heapClassInst.heap32[(r2 + 29)])
                    r9 = r4 << 3
                    r10 = (r8 + r9) | 0
                    r10 = r10 >> 2
                    r10 = Int64(heapClassInst.heap32[(r10)])
                    if (r10 != 0) {
                        if (r7 < r3) {
                            r11 = r4 << 1
                            r12 = r4 << 2
                            r13 = Int64(heapClassInst.heap32[(fp + (-127))])
                            r12 = (r13 + r12) | 0
                            r12 = r12 >> 2
                            r13 = Int64(heapClassInst.heap32[(r12)])
                            r14 = r13 >> 2
                            r15 = Int64(heapClassInst.heap32[(r2 + 9)])
                            r16 = Int64(heapClassInst.heap32[(r14 + 5)])
                            r17 = Int64(heapClassInst.heap32[(r14 + 6)])
                            if (!(r10 < 1)) {
                                r10 = (r7 * 136) | 0
                                r10 = (r15 + r10) | 0
                                r18 = 0
                                r19 = r18
                                while (true) {
                                    r20 = (r19 * 34) | 0
                                    r21 = 136
                                    r22 = r18
                                    while (true) {
                                        r21 = (r21 + (-1)) | 0
                                        r23 = (r22 + 1) | 0
                                        r22 = (r10 + r22) | 0
                                        r24 = (r19 * 136) | 0
                                        heapClassInst.heap8[r22 + r24] = Int8(r18)
                                        r22 = r23
                                        if (!(r21 != 0)) {
                                            break
                                        }
                                    }
                                    r21 = r20 << 2
                                    r22 = r20 << 2
                                    r21 = (r10 + r21) | 0
                                    r23 = r20 << 2
                                    r22 = (r10 + r22) | 0
                                    r21 = r21 >> 2
                                    r24 = r20 << 2
                                    r23 = (r10 + r23) | 0
                                    r22 = r22 >> 2
                                    heapClassInst.heap32[(r21 + 31)] = (-8388609)
                                    r21 = r20 << 2
                                    r24 = (r10 + r24) | 0
                                    r23 = r23 >> 2
                                    heapClassInst.heap32[(r22 + 32)] = 2139095039
                                    r20 = r20 << 2
                                    r21 = (r10 + r21) | 0
                                    r22 = r24 >> 2
                                    heapClassInst.heap32[(r23 + 21)] = 0
                                    r20 = (r10 + r20) | 0
                                    r23 = r11 << 2
                                    r21 = r21 >> 2
                                    heapClassInst.heap32[(r22 + 20)] = 0
                                    r22 = (r8 + r23) | 0
                                    r19 = (r19 + 1) | 0
                                    r20 = r20 >> 2
                                    heapClassInst.heap32[(r21 + 26)] = Int32(r16)
                                    r21 = r22 >> 2
                                    heapClassInst.heap32[(r20 + 27)] = Int32(r17)
                                    r20 = Int64(heapClassInst.heap32[(r21)])
                                    if (!(r20 > r19)) {
                                        break
                                    }
                                }
                            }
                            r10 = r16 >> 2
                            heapClassInst.heap32[(r10 + 126)] = 0
                            heapClassInst.heap32[(r10 + 127)] = 0
                            heapClassInst.heap32[(r10 + 128)] = 0
                            heapClassInst.heap32[(r10 + 129)] = 0
                            heapClassInst.heap32[(r10 + 130)] = 0
                            heapClassInst.heap32[(r10 + 131)] = 0
                            heapClassInst.heap32[(r10 + 132)] = 0
                            heapClassInst.heap32[(r10 + 133)] = 0
                            r16 = r17 >> 2
                            heapClassInst.heap32[(r16 + 126)] = 0
                            heapClassInst.heap32[(r16 + 127)] = 0
                            heapClassInst.heap32[(r16 + 128)] = 0
                            heapClassInst.heap32[(r16 + 129)] = 0
                            heapClassInst.heap32[(r16 + 130)] = 0
                            heapClassInst.heap32[(r16 + 131)] = 0
                            heapClassInst.heap32[(r16 + 132)] = 0
                            heapClassInst.heap32[(r16 + 133)] = 0
                            f0 = 1.0
                            f1 = Float64(heapClassInst.heapFloat[(r6 + 3)])
                            r17 = sp + (-504)
                            f1 = f0 / f1
                            r18 = (r7 * 136) | 0
                            r15 = (r15 + r18) | 0
                            r18 = r17 >> 2
                            heapClassInst.heapFloat[(fp + (-126))] = Float32(f1)
                            r19 = (r15 + 16) | 0
                            heapClassInst.heap32[(r18 + 1)] = heapClassInst.heap32[(r6 + 8)]
                            heapClassInst.heap32[(r18 + 2)] = Int32(r19)
                            heapClassInst.heap32[(r18 + 3)] = Int32(r15)
                            r19 = (r15 + 32) | 0
                            heapClassInst.heap32[(r18 + 4)] = 0
                            heapClassInst.heap32[(r18 + 5)] = Int32(r19)
                            r19 = (r15 + 116) | 0
                            heapClassInst.heap32[(r18 + 6)] = 34
                            r20 = r15 >> 2
                            heapClassInst.heap32[(r18 + 7)] = Int32(r19)
                            heapClassInst.heap32[(r20 + 30)] = heapClassInst.heap32[(r6 + 10)]
                            r19 = (r15 + 120) | 0
                            heapClassInst.heap32[(r18 + 13)] = heapClassInst.heap32[(r6 + 1)]
                            r20 = (r15 + 124) | 0
                            heapClassInst.heap32[(r18 + 8)] = Int32(r19)
                            r19 = (r15 + 128) | 0
                            heapClassInst.heap32[(r18 + 9)] = Int32(r20)
                            heapClassInst.heap32[(r18 + 10)] = Int32(r19)
                            r19 = Int64(heapClassInst.heap32[(r6 + 5)])
                            heapClassInst.heap32[(r18 + 12)] = Int32(r19)
                            r12 = Int64(heapClassInst.heap32[(r12)])
                            r19 = r12 >> 2
                            r19 = Int64(heapClassInst.heap32[(r19)])
                            r19 = r19 >> 2
                            r19 = Int64(heapClassInst.heap32[(r19 + 5)])
                            r11 = r11 << 2
                            heapClassInst.heap32[(g0)] = Int32(r12)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r17)
                            r8 = (r8 + r11) | 0
                            r8 = r8 >> 2
                            __FUNCTION_TABLE__[(r19) >> 2](i7);
                            r11 = Int64(heapClassInst.heap32[(r8)])
                            do {
                                if (!(r11 < 1)) {
                                    r11 = 0
                                    while (true) {
                                        r12 = (r11 * 34) | 0
                                        r12 = r12 << 2
                                        r12 = (r15 + r12) | 0
                                        r12 = r12 >> 2
                                        heapClassInst.heap32[(r12 + 28)] = Int32(r13)
                                        r17 = Int64(heapClassInst.heap32[(r14 + 5)])
                                        r17 = r17 >> 2
                                        f1 = Float64(heapClassInst.heapFloat[(r12)])
                                        f2 = Float64(heapClassInst.heapFloat[(r17 + 64)])
                                        f3 = Float64(heapClassInst.heapFloat[(r12 + 1)])
                                        f4 = Float64(heapClassInst.heapFloat[(r17 + 65)])
                                        f5 = Float64(heapClassInst.heapFloat[(r17 + 68)])
                                        f6 = Float64(heapClassInst.heapFloat[(r17 + 69)])
                                        f2 = f2 * f1
                                        f4 = f4 * f3
                                        f7 = Float64(heapClassInst.heapFloat[(r12 + 2)])
                                        f8 = Float64(heapClassInst.heapFloat[(r17 + 66)])
                                        f9 = Float64(heapClassInst.heapFloat[(r17 + 72)])
                                        f10 = Float64(heapClassInst.heapFloat[(r17 + 73)])
                                        f11 = Float64(heapClassInst.heapFloat[(r17 + 70)])
                                        f5 = f5 * f1
                                        f6 = f6 * f3
                                        f2 = f2 + f4
                                        f4 = f8 * f7
                                        f8 = Float64(heapClassInst.heapFloat[(r17 + 74)])
                                        f9 = f9 * f1
                                        f10 = f10 * f3
                                        f5 = f5 + f6
                                        f6 = f11 * f7
                                        f2 = f2 + f4
                                        f4 = Float64(heapClassInst.heapFloat[(r17 + 134)])
                                        f11 = Float64(heapClassInst.heapFloat[(r17 + 136)])
                                        f12 = Float64(heapClassInst.heapFloat[(r17 + 135)])
                                        f5 = f5 + f6
                                        f6 = f9 + f10
                                        f8 = f8 * f7
                                        f2 = f2 * f4
                                        f4 = f6 + f8
                                        f5 = f5 * f12
                                        heapClassInst.heapFloat[(r12 + 12)] = Float32(f2)
                                        f2 = f4 * f11
                                        heapClassInst.heapFloat[(r12 + 13)] = Float32(f5)
                                        heapClassInst.heapFloat[(r12 + 14)] = Float32(f2)
                                        heapClassInst.heap32[(r12 + 15)] = 0
                                        r17 = Int64(heapClassInst.heap32[(r14 + 6)])
                                        r17 = r17 >> 2
                                        f2 = Float64(heapClassInst.heapFloat[(r12 + 8)])
                                        f4 = Float64(heapClassInst.heapFloat[(r17 + 64)])
                                        f5 = Float64(heapClassInst.heapFloat[(r12 + 9)])
                                        f6 = Float64(heapClassInst.heapFloat[(r17 + 65)])
                                        f8 = Float64(heapClassInst.heapFloat[(r17 + 68)])
                                        f9 = Float64(heapClassInst.heapFloat[(r17 + 69)])
                                        f4 = f4 * f2
                                        f6 = f6 * f5
                                        f10 = Float64(heapClassInst.heapFloat[(r12 + 10)])
                                        f11 = Float64(heapClassInst.heapFloat[(r17 + 66)])
                                        f12 = Float64(heapClassInst.heapFloat[(r17 + 72)])
                                        f13 = Float64(heapClassInst.heapFloat[(r17 + 73)])
                                        f14 = Float64(heapClassInst.heapFloat[(r17 + 70)])
                                        f8 = f8 * f2
                                        f9 = f9 * f5
                                        f4 = f4 + f6
                                        f6 = f11 * f10
                                        f11 = Float64(heapClassInst.heapFloat[(r17 + 74)])
                                        f12 = f12 * f2
                                        f13 = f13 * f5
                                        f8 = f8 + f9
                                        f9 = f14 * f10
                                        f4 = f4 + f6
                                        f6 = Float64(heapClassInst.heapFloat[(r17 + 134)])
                                        f14 = Float64(heapClassInst.heapFloat[(r17 + 136)])
                                        f15 = Float64(heapClassInst.heapFloat[(r17 + 135)])
                                        f8 = f8 + f9
                                        f9 = f12 + f13
                                        f11 = f11 * f10
                                        f4 = f4 * f6
                                        f6 = f9 + f11
                                        f8 = f8 * f15
                                        heapClassInst.heapFloat[(r12 + 16)] = Float32(f4)
                                        f4 = f6 * f14
                                        heapClassInst.heapFloat[(r12 + 17)] = Float32(f8)
                                        heapClassInst.heapFloat[(r12 + 18)] = Float32(f4)
                                        heapClassInst.heap32[(r12 + 19)] = 0
                                        f4 = Float64(heapClassInst.heapFloat[(r10 + 68)])
                                        f6 = Float64(heapClassInst.heapFloat[(r10 + 69)])
                                        f8 = Float64(heapClassInst.heapFloat[(r10 + 64)])
                                        f9 = Float64(heapClassInst.heapFloat[(r10 + 65)])
                                        f11 = Float64(heapClassInst.heapFloat[(r10 + 72)])
                                        f12 = Float64(heapClassInst.heapFloat[(r10 + 73)])
                                        f13 = Float64(heapClassInst.heapFloat[(r10 + 70)])
                                        f14 = Float64(heapClassInst.heapFloat[(r10 + 66)])
                                        f8 = f8 * f1
                                        f9 = f9 * f3
                                        f4 = f4 * f1
                                        f6 = f6 * f3
                                        f15 = Float64(heapClassInst.heapFloat[(r10 + 74)])
                                        f16 = Float64(heapClassInst.heapFloat[(r16 + 68)])
                                        f17 = Float64(heapClassInst.heapFloat[(r16 + 69)])
                                        f18 = Float64(heapClassInst.heapFloat[(r16 + 64)])
                                        f19 = Float64(heapClassInst.heapFloat[(r16 + 65)])
                                        f8 = f8 + f9
                                        f9 = f14 * f7
                                        f4 = f4 + f6
                                        f6 = f13 * f7
                                        f11 = f11 * f1
                                        f12 = f12 * f3
                                        f13 = Float64(heapClassInst.heapFloat[(r10 + 84)])
                                        f14 = Float64(heapClassInst.heapFloat[(r12 + 5)])
                                        f20 = Float64(heapClassInst.heapFloat[(r12 + 4)])
                                        f21 = Float64(heapClassInst.heapFloat[(r16 + 84)])
                                        f22 = Float64(heapClassInst.heapFloat[(r12 + 6)])
                                        f8 = f8 + f9
                                        f4 = f4 + f6
                                        f6 = f20 * f13
                                        f9 = f14 * f13
                                        f23 = Float64(heapClassInst.heapFloat[(r16 + 72)])
                                        f24 = Float64(heapClassInst.heapFloat[(r16 + 73)])
                                        f25 = Float64(heapClassInst.heapFloat[(r16 + 70)])
                                        f26 = Float64(heapClassInst.heapFloat[(r16 + 66)])
                                        f18 = f18 * f2
                                        f19 = f19 * f5
                                        f16 = f16 * f2
                                        f17 = f17 * f5
                                        f11 = f11 + f12
                                        f12 = f15 * f7
                                        f15 = Float64(heapClassInst.heapFloat[(r16 + 74)])
                                        f27 = f20 * f21
                                        f28 = f14 * f21
                                        f11 = f11 + f12
                                        f12 = f22 * f13
                                        f13 = f18 + f19
                                        f18 = f26 * f10
                                        f16 = f16 + f17
                                        f17 = f25 * f10
                                        f19 = f23 * f2
                                        f23 = f24 * f5
                                        f8 = f8 * f1
                                        f4 = f4 * f3
                                        f6 = f6 * f20
                                        f9 = f9 * f14
                                        f13 = f13 + f18
                                        f16 = f16 + f17
                                        f17 = f22 * f21
                                        f18 = f19 + f23
                                        f15 = f15 * f10
                                        f19 = f27 * f20
                                        f21 = f28 * f14
                                        f4 = f8 + f4
                                        f8 = f11 * f7
                                        f6 = f6 + f9
                                        f9 = f12 * f22
                                        f11 = f18 + f15
                                        f12 = f13 * f2
                                        f13 = f16 * f5
                                        f15 = f19 + f21
                                        f16 = f17 * f22
                                        f4 = f4 + f8
                                        f6 = f6 + f9
                                        f8 = f12 + f13
                                        f9 = f11 * f10
                                        f11 = f15 + f16
                                        f4 = f4 + f6
                                        f6 = f8 + f9
                                        f4 = f11 + f4
                                        f4 = f6 + f4
                                        f4 = f0 / f4
                                        heapClassInst.heapFloat[(r12 + 23)] = Float32(f4)
                                        f6 = Float64(heapClassInst.heapFloat[(r10 + 76)])
                                        f8 = Float64(heapClassInst.heapFloat[(r10 + 77)])
                                        f9 = Float64(heapClassInst.heapFloat[(r10 + 80)])
                                        f11 = Float64(heapClassInst.heapFloat[(r10 + 81)])
                                        f12 = Float64(heapClassInst.heapFloat[(r16 + 80)])
                                        f13 = Float64(heapClassInst.heapFloat[(r16 + 81)])
                                        f15 = Float64(heapClassInst.heapFloat[(r16 + 76)])
                                        f16 = Float64(heapClassInst.heapFloat[(r16 + 77)])
                                        f17 = Float64(heapClassInst.heapFloat[(r10 + 78)])
                                        f18 = Float64(heapClassInst.heapFloat[(r10 + 82)])
                                        f19 = Float64(heapClassInst.heapFloat[(r16 + 82)])
                                        f21 = Float64(heapClassInst.heapFloat[(r16 + 78)])
                                        f6 = f20 * f6
                                        f8 = f14 * f8
                                        f1 = f1 * f9
                                        f3 = f3 * f11
                                        f2 = f2 * f12
                                        f5 = f5 * f13
                                        f9 = f20 * f15
                                        f11 = f14 * f16
                                        f6 = f6 + f8
                                        f8 = f22 * f17
                                        f1 = f1 + f3
                                        f3 = f7 * f18
                                        f2 = f2 + f5
                                        f5 = f10 * f19
                                        f7 = f9 + f11
                                        f9 = f22 * f21
                                        f6 = f6 + f8
                                        f1 = f1 + f3
                                        f2 = f2 + f5
                                        f3 = f7 + f9
                                        f1 = f6 + f1
                                        f2 = f2 - f3
                                        f1 = f1 + f2
                                        f2 = Float64(heapClassInst.heapFloat[(r18 + 13)])
                                        f3 = 0.0
                                        f1 = f2 * f1
                                        f2 = Float64(heapClassInst.heapFloat[(r12 + 29)])
                                        f1 = f3 - f1
                                        f2 = f4 * f2
                                        f1 = f4 * f1
                                        f1 = f2 + f1
                                        r11 = (r11 + 1) | 0
                                        heapClassInst.heapFloat[(r12 + 29)] = Float32(f1)
                                        heapClassInst.heap32[(r12 + 21)] = 0
                                        r12 = Int64(heapClassInst.heap32[(r8)])
                                        if (!(r12 > r11)) {
                                            break
                                        }
                                    }
                                }
                            } while (false);
                            r8 = Int64(heapClassInst.heap32[(r2 + 29)])
                            r8 = (r8 + r9) | 0
                            r8 = r8 >> 2
                            r8 = Int64(heapClassInst.heap32[(r8)])
                        } else {
                            __label__ = 78
                            break
                        }
                    } else {
                        r8 = 0
                    }
                    r7 = (r8 + r7) | 0
                    r4 = (r4 + 1) | 0
                } else {
                    __label__ = 90
                    break
                }
            }
            match (__label__) {
                case 90 =>
                    r1 = Int64(heapClassInst.heap32[(fp + (-133))])
                    do {
                        if (!(r1 < 1)) {
                            while (true) {
                                r1 = Int64(heapClassInst.heap32[(fp + (-132))])
                                r1 = r1 >> 2
                                r1 = Int64(heapClassInst.heap32[(r1)])
                                heapClassInst.heap32[(fp + (-128))] = Int32(r1)
                                r1 = r1 >> 2
                                heapClassInst.heap32[(fp + (-127))] = Int32(r1)
                                r3 = Int64(heapClassInst.heap32[(r1 + 277)])
                                r1 = Int64(heapClassInst.heap32[(r1 + 278)])
                                r4 = Int64(heapClassInst.heapU8[r3 + 232])
                                r4 = r4 & 2
                                if (r4 != 0) {
                                    r4 = r3
                                } else {
                                    r4 = 0
                                }
                                r7 = Int64(heapClassInst.heapU8[r1 + 232])
                                r7 = r7 & 2
                                if (r7 != 0) {
                                    r7 = r1
                                } else {
                                    r7 = 0
                                }
                                if (r4 == 0) {
                                    __label__ = 99
                                } else {
                                    r4 = r4 >> 2
                                    f0 = Float64(heapClassInst.heapFloat[(r4 + 84)])
                                    f1 = 0.0
                                    if (f0 != f1) {
                                        __label__ = 101
                                    } else {
                                        __label__ = 99
                                    }
                                }
                                if (__label__ == 99) {
                                    if (r7 == 0) {
                                        __label__ = 216
                                    } else {
                                        r4 = r7 >> 2
                                        f0 = Float64(heapClassInst.heapFloat[(r4 + 84)])
                                        f1 = 0.0
                                        if (f0 == f1) {
                                            __label__ = 216
                                        } else {
                                            __label__ = 101
                                        }
                                    }
                                }
                                if (__label__ == 101) {
                                    r4 = Int64(heapClassInst.heap32[(fp + (-128))])
                                    r7 = (r4 + 4) | 0
                                    heapClassInst.heap32[(fp + (-129))] = Int32(r7)
                                    r7 = (r4 + 152) | 0
                                    heapClassInst.heap32[(fp + (-130))] = Int32(r7)
                                    r4 = (r4 + 168) | 0
                                    heapClassInst.heap32[(fp + (-131))] = Int32(r4)
                                    r4 = 0
                                    r7 = r4
                                    while (true) {
                                        r8 = Int64(heapClassInst.heap32[(fp + (-127))])
                                        r8 = Int64(heapClassInst.heap32[(r8 + 279)])
                                        if (r8 > r7) {
                                            r8 = Int64(heapClassInst.heap32[(fp + (-128))])
                                            r8 = (r8 + r4) | 0
                                            r9 = r8 >> 2
                                            f0 = Float64(heapClassInst.heapFloat[(r9 + 21)])
                                            r10 = Int64(heapClassInst.heap32[(fp + (-127))])
                                            f1 = Float64(heapClassInst.heapFloat[(r10 + 281)])
                                            do {
                                                if (!(f0 > f1)) {
                                                    r10 = Int64(heapClassInst.heap32[(fp + (-129))])
                                                    r10 = (r10 + r4) | 0
                                                    r11 = Int64(heapClassInst.heap32[(fp + (-131))])
                                                    r11 = (r11 + r4) | 0
                                                    r12 = Int64(heapClassInst.heap32[(fp + (-130))])
                                                    r12 = (r12 + r4) | 0
                                                    r13 = Int64(heapClassInst.heap32[(r2 + 3)])
                                                    r14 = Int64(heapClassInst.heap32[(r2 + 2)])
                                                    if (r13 == r14) {
                                                        r15 = 1
                                                        r16 = r14 << 1
                                                        r16 = if (r14 == 0) {
                                                            r15
                                                        } else {
                                                            r16
                                                        };
                                                        if (r13 >= r16) {
                                                            __label__ = 104
                                                        } else {
                                                            if (r16 != 0) {
                                                                r13 = gNumAlignedAllocs
                                                                r13 = r13 >> 2
                                                                r17 = Int64(heapClassInst.heap32[(r13)])
                                                                r18 = (r16 * 136) | 0
                                                                r17 = (r17 + 1) | 0
                                                                r18 = r18 | 3
                                                                heapClassInst.heap32[(r13)] = Int32(r17)
                                                                r13 = (r18 + 16) | 0
                                                                heapClassInst.heap32[(g0)] = Int32(r13)
                                                                mallocNew(i7);
                                                                r17 = commonVariable.r_g0
                                                                if (r17 != 0) {
                                                                    r13 = 0
                                                                    r18 = (r17 + 4) | 0
                                                                    r13 = (r13 - r18) | 0
                                                                    r13 = r13 & 15
                                                                    r13 = (r17 + r13) | 0
                                                                    r18 = (r13 + 4) | 0
                                                                    r13 = r13 >> 2
                                                                    heapClassInst.heap32[(r13)] = Int32(r17)
                                                                    r17 = r18
                                                                }
                                                            } else {
                                                                r17 = 0
                                                            }
                                                            if (r14 < 1) {
                                                                r19 = Int64(heapClassInst.heap32[(r2 + 4)])
                                                            } else {
                                                                r13 = 0
                                                                r18 = r14
                                                                while (true) {
                                                                    r19 = Int64(heapClassInst.heap32[(r2 + 4)])
                                                                    r20 = (r17 + r13) | 0
                                                                    r21 = (r19 + r13) | 0
                                                                    heapClassInst.heap32[(g0)] = Int32(r20)
                                                                    heapClassInst.heap32[(g0 + 1)] = Int32(r21)
                                                                    heapClassInst.heap32[(g0 + 2)] = 136
                                                                    r18 = (r18 + (-1)) | 0
                                                                    r13 = (r13 + 136) | 0
                                                                    memcpy(i7);
                                                                    if (!(r18 != 0)) {
                                                                        break
                                                                    }
                                                                }
                                                            }
                                                            if (r19 != 0) {
                                                                r13 = Int64(heapClassInst.heapU8[r0 + 20])
                                                                if (r13 != 0) {
                                                                    r13 = gNumAlignedFree
                                                                    r13 = r13 >> 2
                                                                    r18 = Int64(heapClassInst.heap32[(r13)])
                                                                    r18 = (r18 + 1) | 0
                                                                    r19 = r19 >> 2
                                                                    heapClassInst.heap32[(r13)] = Int32(r18)
                                                                    r13 = Int64(heapClassInst.heap32[(r19 + (-1))])
                                                                    heapClassInst.heap32[(g0)] = Int32(r13)
                                                                    free(i7);
                                                                    r13 = Int64(heapClassInst.heap32[(r2 + 2)])
                                                                } else {
                                                                    r13 = r14
                                                                }
                                                                heapClassInst.heap32[(r2 + 4)] = 0
                                                            } else {
                                                                r13 = r14
                                                            }
                                                            heapClassInst.heap8[r0 + 20] = Int8(r15)
                                                            heapClassInst.heap32[(r2 + 4)] = Int32(r17)
                                                            heapClassInst.heap32[(r2 + 3)] = Int32(r16)
                                                            __label__ = 121
                                                        }
                                                    } else {
                                                        __label__ = 104
                                                    }
                                                    if (__label__ == 104) {
                                                        r13 = r14
                                                    }
                                                    r13 = (r13 + 1) | 0
                                                    heapClassInst.heap32[(r2 + 2)] = Int32(r13)
                                                    r13 = Int64(heapClassInst.heapU8[r3 + 232])
                                                    r15 = Int64(heapClassInst.heapU8[r1 + 232])
                                                    r13 = r13 & 2
                                                    r16 = 0
                                                    r15 = r15 & 2
                                                    r13 = if (r13 == 0) {
                                                        r16
                                                    } else {
                                                        r3
                                                    };
                                                    r17 = Int64(heapClassInst.heap32[(r2 + 4)])
                                                    r15 = if (r15 == 0) {
                                                        r16
                                                    } else {
                                                        r1
                                                    };
                                                    if (r13 == 0) {
                                                        r18 = _ZGVZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
                                                        r19 = Int64(heapClassInst.heapU8[r18])
                                                        if (!(r19 != 0)) {
                                                            r19 = _ZZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
                                                            r20 = r19 >> 2
                                                            heapClassInst.heap32[(r20 + 41)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 42)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 43)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 44)] = 0
                                                            heapClassInst.heap32[(r20 + 45)] = 0
                                                            heapClassInst.heap32[(r20 + 46)] = 1566444395
                                                            heapClassInst.heap32[(r20 + 47)] = 0
                                                            heapClassInst.heap32[(r20 + 48)] = 0
                                                            heapClassInst.heap32[(r20 + 49)] = 0
                                                            heapClassInst.heap32[(r20 + 50)] = 0
                                                            heapClassInst.heap32[(r20 + 51)] = 1
                                                            heapClassInst.heap32[(r20 + 52)] = (-1)
                                                            heapClassInst.heap32[(r20 + 53)] = (-1)
                                                            heapClassInst.heap32[(r20 + 54)] = 1
                                                            heapClassInst.heap32[(r20 + 55)] = 0
                                                            heapClassInst.heap32[(r20 + 56)] = 1056964608
                                                            heapClassInst.heap32[(r20 + 57)] = 0
                                                            heapClassInst.heap32[(r20 + 58)] = 1
                                                            heapClassInst.heap32[(r20 + 59)] = 0
                                                            heapClassInst.heap32[(r20 + 60)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 61)] = 0
                                                            heapClassInst.heap32[(r20 + 62)] = 0
                                                            heapClassInst.heap32[(r20 + 63)] = 0
                                                            heapClassInst.heap32[(r20 + 1)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 2)] = 0
                                                            heapClassInst.heap32[(r20 + 3)] = 0
                                                            heapClassInst.heap32[(r20 + 4)] = 0
                                                            heapClassInst.heap32[(r20 + 5)] = 0
                                                            heapClassInst.heap32[(r20 + 6)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 7)] = 0
                                                            heapClassInst.heap32[(r20 + 8)] = 0
                                                            heapClassInst.heap32[(r20 + 9)] = 0
                                                            heapClassInst.heap32[(r20 + 10)] = 0
                                                            heapClassInst.heap32[(r20 + 11)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 12)] = 0
                                                            heapClassInst.heap32[(r20 + 13)] = 0
                                                            heapClassInst.heap32[(r20 + 14)] = 0
                                                            r21 = _ZTV11btRigidBody
                                                            heapClassInst.heap32[(r20 + 15)] = 0
                                                            r21 = (r21 + 8) | 0
                                                            heapClassInst.heap32[(r20 + 16)] = 0
                                                            r22 = 1
                                                            heapClassInst.heap32[(r20)] = Int32(r21)
                                                            heapClassInst.heap8[r19 + 492] = Int8(r22)
                                                            heapClassInst.heap32[(r20 + 122)] = 0
                                                            heapClassInst.heap32[(r20 + 120)] = 0
                                                            r21 = sp + (-280)
                                                            heapClassInst.heap32[(r20 + 121)] = 0
                                                            r20 = r21 >> 2
                                                            heapClassInst.heap32[(fp + (-70))] = 0
                                                            heapClassInst.heap32[(r20 + 1)] = 0
                                                            heapClassInst.heap32[(r20 + 18)] = 0
                                                            heapClassInst.heap32[(r20 + 19)] = 0
                                                            heapClassInst.heap32[(r20 + 20)] = 0
                                                            heapClassInst.heap32[(r20 + 21)] = 0
                                                            heapClassInst.heap32[(r20 + 22)] = 0
                                                            heapClassInst.heap32[(r20 + 23)] = 0
                                                            heapClassInst.heap32[(r20 + 24)] = 0
                                                            heapClassInst.heap32[(r20 + 25)] = 1056964608
                                                            heapClassInst.heap32[(r20 + 26)] = 0
                                                            heapClassInst.heap32[(r20 + 27)] = 1061997773
                                                            heapClassInst.heap32[(r20 + 28)] = 1065353216
                                                            heapClassInst.heap8[sp + (-164)] = Int8(r16)
                                                            heapClassInst.heap32[(r20 + 30)] = 1000593162
                                                            heapClassInst.heap32[(r20 + 31)] = 1008981770
                                                            heapClassInst.heap32[(r20 + 32)] = 1008981770
                                                            heapClassInst.heap32[(r20 + 33)] = 1008981770
                                                            heapClassInst.heap32[(r20 + 2)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 3)] = 0
                                                            heapClassInst.heap32[(r20 + 4)] = 0
                                                            heapClassInst.heap32[(r20 + 5)] = 0
                                                            heapClassInst.heap32[(r20 + 6)] = 0
                                                            heapClassInst.heap32[(r20 + 7)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 8)] = 0
                                                            heapClassInst.heap32[(r20 + 9)] = 0
                                                            heapClassInst.heap32[(r20 + 10)] = 0
                                                            heapClassInst.heap32[(r20 + 11)] = 0
                                                            heapClassInst.heap32[(r20 + 12)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 13)] = 0
                                                            heapClassInst.heap32[(r20 + 14)] = 0
                                                            heapClassInst.heap32[(r20 + 15)] = 0
                                                            heapClassInst.heap32[(r20 + 16)] = 0
                                                            heapClassInst.heap32[(r20 + 17)] = 0
                                                            heapClassInst.heap32[(g0)] = Int32(r19)
                                                            heapClassInst.heap32[(g0 + 1)] = Int32(r21)
                                                            _ZN11btRigidBody14setupRigidBodyERKNS_27btRigidBodyConstructionInfoE(
                                                                i7);
                                                            heapClassInst.heap8[r18] = Int8(r22)
                                                        }
                                                        r18 = _ZZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
                                                        r19 = r18 >> 2
                                                        r20 = Int64(heapClassInst.heap32[(r19 + 51)])
                                                        r20 = r20 | 1
                                                        heapClassInst.heap32[(r19 + 51)] = Int32(r20)
                                                        heapClassInst.heap32[(r19 + 84)] = 0
                                                        f0 = 0.0
                                                        f1 = Float64(heapClassInst.heapFloat[(r19 + 95)])
                                                        f2 = Float64(heapClassInst.heapFloat[(r19 + 94)])
                                                        f3 = Float64(heapClassInst.heapFloat[(r19 + 93)])
                                                        f3 = f3 * f0
                                                        f2 = f2 * f0
                                                        heapClassInst.heapFloat[(r19 + 89)] = Float32(f3)
                                                        f1 = f1 * f0
                                                        heapClassInst.heapFloat[(r19 + 90)] = Float32(f2)
                                                        heapClassInst.heapFloat[(r19 + 91)] = Float32(f1)
                                                        heapClassInst.heap32[(r19 + 92)] = 0
                                                        heapClassInst.heap32[(r19 + 97)] = 0
                                                        heapClassInst.heap32[(r19 + 98)] = 0
                                                        heapClassInst.heap32[(r19 + 99)] = 0
                                                        heapClassInst.heap32[(r19 + 100)] = 0
                                                        f1 = Float64(heapClassInst.heapFloat[(r19 + 87)])
                                                        f2 = Float64(heapClassInst.heapFloat[(r19 + 86)])
                                                        f3 = Float64(heapClassInst.heapFloat[(r19 + 85)])
                                                        f3 = f3 * f0
                                                        f2 = f2 * f0
                                                        heapClassInst.heapFloat[(r19 + 138)] = Float32(f3)
                                                        f0 = f1 * f0
                                                        heapClassInst.heapFloat[(r19 + 139)] = Float32(f2)
                                                        heapClassInst.heapFloat[(r19 + 140)] = Float32(f0)
                                                        heapClassInst.heap32[(r19 + 141)] = 0
                                                    } else {
                                                        r18 = r13
                                                    }
                                                    r19 = (r14 * 136) | 0
                                                    r17 = (r17 + r19) | 0
                                                    r17 = r17 >> 2
                                                    heapClassInst.heap32[(r17 + 26)] = Int32(r18)
                                                    if (r15 == 0) {
                                                        r18 = _ZGVZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
                                                        r19 = Int64(heapClassInst.heapU8[r18])
                                                        if (!(r19 != 0)) {
                                                            r19 = _ZZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
                                                            r20 = r19 >> 2
                                                            heapClassInst.heap32[(r20 + 41)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 42)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 43)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 44)] = 0
                                                            heapClassInst.heap32[(r20 + 45)] = 0
                                                            heapClassInst.heap32[(r20 + 46)] = 1566444395
                                                            heapClassInst.heap32[(r20 + 47)] = 0
                                                            heapClassInst.heap32[(r20 + 48)] = 0
                                                            heapClassInst.heap32[(r20 + 49)] = 0
                                                            heapClassInst.heap32[(r20 + 50)] = 0
                                                            heapClassInst.heap32[(r20 + 51)] = 1
                                                            heapClassInst.heap32[(r20 + 52)] = (-1)
                                                            heapClassInst.heap32[(r20 + 53)] = (-1)
                                                            heapClassInst.heap32[(r20 + 54)] = 1
                                                            heapClassInst.heap32[(r20 + 55)] = 0
                                                            heapClassInst.heap32[(r20 + 56)] = 1056964608
                                                            heapClassInst.heap32[(r20 + 57)] = 0
                                                            heapClassInst.heap32[(r20 + 58)] = 1
                                                            heapClassInst.heap32[(r20 + 59)] = 0
                                                            heapClassInst.heap32[(r20 + 60)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 61)] = 0
                                                            heapClassInst.heap32[(r20 + 62)] = 0
                                                            heapClassInst.heap32[(r20 + 63)] = 0
                                                            heapClassInst.heap32[(r20 + 1)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 2)] = 0
                                                            heapClassInst.heap32[(r20 + 3)] = 0
                                                            heapClassInst.heap32[(r20 + 4)] = 0
                                                            heapClassInst.heap32[(r20 + 5)] = 0
                                                            heapClassInst.heap32[(r20 + 6)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 7)] = 0
                                                            heapClassInst.heap32[(r20 + 8)] = 0
                                                            heapClassInst.heap32[(r20 + 9)] = 0
                                                            heapClassInst.heap32[(r20 + 10)] = 0
                                                            heapClassInst.heap32[(r20 + 11)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 12)] = 0
                                                            heapClassInst.heap32[(r20 + 13)] = 0
                                                            heapClassInst.heap32[(r20 + 14)] = 0
                                                            r21 = _ZTV11btRigidBody
                                                            heapClassInst.heap32[(r20 + 15)] = 0
                                                            r21 = (r21 + 8) | 0
                                                            heapClassInst.heap32[(r20 + 16)] = 0
                                                            r22 = 1
                                                            heapClassInst.heap32[(r20)] = Int32(r21)
                                                            heapClassInst.heap8[r19 + 492] = Int8(r22)
                                                            heapClassInst.heap32[(r20 + 122)] = 0
                                                            heapClassInst.heap32[(r20 + 120)] = 0
                                                            r21 = sp + (-144)
                                                            heapClassInst.heap32[(r20 + 121)] = 0
                                                            r20 = r21 >> 2
                                                            heapClassInst.heap32[(fp + (-36))] = 0
                                                            heapClassInst.heap32[(r20 + 1)] = 0
                                                            heapClassInst.heap32[(r20 + 18)] = 0
                                                            heapClassInst.heap32[(r20 + 19)] = 0
                                                            heapClassInst.heap32[(r20 + 20)] = 0
                                                            heapClassInst.heap32[(r20 + 21)] = 0
                                                            heapClassInst.heap32[(r20 + 22)] = 0
                                                            heapClassInst.heap32[(r20 + 23)] = 0
                                                            heapClassInst.heap32[(r20 + 24)] = 0
                                                            heapClassInst.heap32[(r20 + 25)] = 1056964608
                                                            heapClassInst.heap32[(r20 + 26)] = 0
                                                            heapClassInst.heap32[(r20 + 27)] = 1061997773
                                                            heapClassInst.heap32[(r20 + 28)] = 1065353216
                                                            heapClassInst.heap8[sp + (-28)] = Int8(r16)
                                                            heapClassInst.heap32[(r20 + 30)] = 1000593162
                                                            heapClassInst.heap32[(r20 + 31)] = 1008981770
                                                            heapClassInst.heap32[(r20 + 32)] = 1008981770
                                                            heapClassInst.heap32[(r20 + 33)] = 1008981770
                                                            heapClassInst.heap32[(r20 + 2)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 3)] = 0
                                                            heapClassInst.heap32[(r20 + 4)] = 0
                                                            heapClassInst.heap32[(r20 + 5)] = 0
                                                            heapClassInst.heap32[(r20 + 6)] = 0
                                                            heapClassInst.heap32[(r20 + 7)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 8)] = 0
                                                            heapClassInst.heap32[(r20 + 9)] = 0
                                                            heapClassInst.heap32[(r20 + 10)] = 0
                                                            heapClassInst.heap32[(r20 + 11)] = 0
                                                            heapClassInst.heap32[(r20 + 12)] = 1065353216
                                                            heapClassInst.heap32[(r20 + 13)] = 0
                                                            heapClassInst.heap32[(r20 + 14)] = 0
                                                            heapClassInst.heap32[(r20 + 15)] = 0
                                                            heapClassInst.heap32[(r20 + 16)] = 0
                                                            heapClassInst.heap32[(r20 + 17)] = 0
                                                            heapClassInst.heap32[(g0)] = Int32(r19)
                                                            heapClassInst.heap32[(g0 + 1)] = Int32(r21)
                                                            _ZN11btRigidBody14setupRigidBodyERKNS_27btRigidBodyConstructionInfoE(
                                                                i7);
                                                            heapClassInst.heap8[r18] = Int8(r22)
                                                        }
                                                        r18 = _ZZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
                                                        r19 = r18 >> 2
                                                        r20 = Int64(heapClassInst.heap32[(r19 + 51)])
                                                        r20 = r20 | 1
                                                        heapClassInst.heap32[(r19 + 51)] = Int32(r20)
                                                        heapClassInst.heap32[(r19 + 84)] = 0
                                                        f0 = 0.0
                                                        f1 = Float64(heapClassInst.heapFloat[(r19 + 95)])
                                                        f2 = Float64(heapClassInst.heapFloat[(r19 + 94)])
                                                        f3 = Float64(heapClassInst.heapFloat[(r19 + 93)])
                                                        f3 = f3 * f0
                                                        f2 = f2 * f0
                                                        heapClassInst.heapFloat[(r19 + 89)] = Float32(f3)
                                                        f1 = f1 * f0
                                                        heapClassInst.heapFloat[(r19 + 90)] = Float32(f2)
                                                        heapClassInst.heapFloat[(r19 + 91)] = Float32(f1)
                                                        heapClassInst.heap32[(r19 + 92)] = 0
                                                        heapClassInst.heap32[(r19 + 97)] = 0
                                                        heapClassInst.heap32[(r19 + 98)] = 0
                                                        heapClassInst.heap32[(r19 + 99)] = 0
                                                        heapClassInst.heap32[(r19 + 100)] = 0
                                                        f1 = Float64(heapClassInst.heapFloat[(r19 + 87)])
                                                        f2 = Float64(heapClassInst.heapFloat[(r19 + 86)])
                                                        f3 = Float64(heapClassInst.heapFloat[(r19 + 85)])
                                                        f3 = f3 * f0
                                                        f2 = f2 * f0
                                                        heapClassInst.heapFloat[(r19 + 138)] = Float32(f3)
                                                        f0 = f1 * f0
                                                        heapClassInst.heapFloat[(r19 + 139)] = Float32(f2)
                                                        heapClassInst.heapFloat[(r19 + 140)] = Float32(f0)
                                                        heapClassInst.heap32[(r19 + 141)] = 0
                                                    } else {
                                                        r18 = r15
                                                    }
                                                    heapClassInst.heap32[(r17 + 27)] = Int32(r18)
                                                    r18 = r1 >> 2
                                                    heapClassInst.heap32[(r17 + 28)] = Int32(r10)
                                                    r19 = r3 >> 2
                                                    r20 = Int64(heapClassInst.heap32[(r19 + 58)])
                                                    r21 = Int64(heapClassInst.heap32[(r18 + 58)])
                                                    f0 = Float64(heapClassInst.heapFloat[(r9 + 15)])
                                                    f1 = Float64(heapClassInst.heapFloat[(r19 + 15)])
                                                    f2 = Float64(heapClassInst.heapFloat[(r9 + 14)])
                                                    f3 = Float64(heapClassInst.heapFloat[(r19 + 14)])
                                                    f4 = Float64(heapClassInst.heapFloat[(r9 + 13)])
                                                    f5 = Float64(heapClassInst.heapFloat[(r19 + 13)])
                                                    r19 = sp + (-296)
                                                    f4 = f4 - f5
                                                    f2 = f2 - f3
                                                    r22 = r19 >> 2
                                                    heapClassInst.heapFloat[(fp + (-74))] = Float32(f4)
                                                    f0 = f0 - f1
                                                    heapClassInst.heapFloat[(r22 + 1)] = Float32(f2)
                                                    heapClassInst.heapFloat[(r22 + 2)] = Float32(f0)
                                                    heapClassInst.heap32[(r22 + 3)] = 0
                                                    f1 = Float64(heapClassInst.heapFloat[(r9 + 11)])
                                                    f3 = Float64(heapClassInst.heapFloat[(r18 + 15)])
                                                    f5 = Float64(heapClassInst.heapFloat[(r9 + 10)])
                                                    f6 = Float64(heapClassInst.heapFloat[(r18 + 14)])
                                                    f7 = Float64(heapClassInst.heapFloat[(r9 + 9)])
                                                    f8 = Float64(heapClassInst.heapFloat[(r18 + 13)])
                                                    r18 = sp + (-312)
                                                    f7 = f7 - f8
                                                    f5 = f5 - f6
                                                    r22 = r18 >> 2
                                                    heapClassInst.heapFloat[(fp + (-78))] = Float32(f7)
                                                    f1 = f1 - f3
                                                    heapClassInst.heapFloat[(r22 + 1)] = Float32(f5)
                                                    heapClassInst.heapFloat[(r22 + 2)] = Float32(f1)
                                                    r23 = r8 >> 2
                                                    heapClassInst.heap32[(r22 + 3)] = 0
                                                    r22 = r8 >> 2
                                                    r24 = r8 >> 2
                                                    r20 = r20 & 2
                                                    r21 = r21 & 2
                                                    r20 = if (r20 == 0) {
                                                        r16
                                                    } else {
                                                        r3
                                                    };
                                                    r16 = if (r21 == 0) {
                                                        r16
                                                    } else {
                                                        r1
                                                    };
                                                    if (r20 == 0) {
                                                        heapClassInst.heap32[(r17 + 12)] = 0
                                                        heapClassInst.heap32[(r17 + 13)] = 0
                                                        f3 = 0.0
                                                        heapClassInst.heap32[(r17 + 14)] = 0
                                                        heapClassInst.heap32[(r17 + 15)] = 0
                                                        f6 = f3
                                                        f8 = f3
                                                    } else {
                                                        f3 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                        f6 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                        f8 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                        f9 = f4 * f8
                                                        f10 = f2 * f3
                                                        f3 = f0 * f3
                                                        f11 = f4 * f6
                                                        f6 = f2 * f6
                                                        f8 = f0 * f8
                                                        f9 = f9 - f10
                                                        f3 = f3 - f11
                                                        f6 = f6 - f8
                                                        r21 = r20 >> 2
                                                        f8 = Float64(heapClassInst.heapFloat[(r21 + 64)])
                                                        f10 = Float64(heapClassInst.heapFloat[(r21 + 65)])
                                                        f11 = Float64(heapClassInst.heapFloat[(r21 + 68)])
                                                        f12 = Float64(heapClassInst.heapFloat[(r21 + 69)])
                                                        f8 = f8 * f6
                                                        f10 = f10 * f3
                                                        f13 = Float64(heapClassInst.heapFloat[(r21 + 66)])
                                                        f14 = Float64(heapClassInst.heapFloat[(r21 + 72)])
                                                        f15 = Float64(heapClassInst.heapFloat[(r21 + 73)])
                                                        f16 = Float64(heapClassInst.heapFloat[(r21 + 70)])
                                                        f11 = f11 * f6
                                                        f12 = f12 * f3
                                                        f8 = f8 + f10
                                                        f10 = f13 * f9
                                                        f13 = Float64(heapClassInst.heapFloat[(r21 + 74)])
                                                        f6 = f14 * f6
                                                        f3 = f15 * f3
                                                        f11 = f11 + f12
                                                        f12 = f16 * f9
                                                        f8 = f8 + f10
                                                        f10 = Float64(heapClassInst.heapFloat[(r21 + 134)])
                                                        f14 = Float64(heapClassInst.heapFloat[(r21 + 136)])
                                                        f15 = Float64(heapClassInst.heapFloat[(r21 + 135)])
                                                        f11 = f11 + f12
                                                        f8 = f8 * f10
                                                        f3 = f6 + f3
                                                        f6 = f13 * f9
                                                        f3 = f3 + f6
                                                        f6 = f11 * f15
                                                        heapClassInst.heapFloat[(r17 + 12)] = Float32(f8)
                                                        f3 = f3 * f14
                                                        heapClassInst.heapFloat[(r17 + 13)] = Float32(f6)
                                                        heapClassInst.heapFloat[(r17 + 14)] = Float32(f3)
                                                        heapClassInst.heap32[(r17 + 15)] = 0
                                                    }
                                                    if (r16 == 0) {
                                                        heapClassInst.heap32[(r17 + 16)] = 0
                                                        heapClassInst.heap32[(r17 + 17)] = 0
                                                        f10 = 0.0
                                                        heapClassInst.heap32[(r17 + 18)] = 0
                                                        heapClassInst.heap32[(r17 + 19)] = 0
                                                        f11 = f10
                                                        f9 = f10
                                                    } else {
                                                        f9 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                        f10 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                        f11 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                        f12 = f5 * f11
                                                        f13 = f1 * f9
                                                        r21 = r16 >> 2
                                                        f12 = f12 - f13
                                                        f13 = f1 * f10
                                                        f11 = f7 * f11
                                                        f12 = -f12
                                                        f14 = Float64(heapClassInst.heapFloat[(r21 + 64)])
                                                        f11 = f13 - f11
                                                        f13 = Float64(heapClassInst.heapFloat[(r21 + 65)])
                                                        f9 = f7 * f9
                                                        f10 = f5 * f10
                                                        f15 = Float64(heapClassInst.heapFloat[(r21 + 68)])
                                                        f16 = Float64(heapClassInst.heapFloat[(r21 + 69)])
                                                        f14 = f14 * f12
                                                        f13 = f13 * f11
                                                        f9 = f9 - f10
                                                        f10 = Float64(heapClassInst.heapFloat[(r21 + 66)])
                                                        f17 = Float64(heapClassInst.heapFloat[(r21 + 72)])
                                                        f18 = Float64(heapClassInst.heapFloat[(r21 + 73)])
                                                        f19 = Float64(heapClassInst.heapFloat[(r21 + 70)])
                                                        f15 = f15 * f12
                                                        f16 = f16 * f11
                                                        f13 = f14 - f13
                                                        f10 = f10 * f9
                                                        f14 = Float64(heapClassInst.heapFloat[(r21 + 74)])
                                                        f12 = f17 * f12
                                                        f11 = f18 * f11
                                                        f15 = f15 - f16
                                                        f16 = f19 * f9
                                                        f10 = f13 - f10
                                                        f13 = Float64(heapClassInst.heapFloat[(r21 + 134)])
                                                        f17 = Float64(heapClassInst.heapFloat[(r21 + 136)])
                                                        f18 = Float64(heapClassInst.heapFloat[(r21 + 135)])
                                                        f15 = f15 - f16
                                                        f10 = f10 * f13
                                                        f11 = f12 - f11
                                                        f9 = f14 * f9
                                                        f9 = f11 - f9
                                                        f11 = f15 * f18
                                                        heapClassInst.heapFloat[(r17 + 16)] = Float32(f10)
                                                        f9 = f9 * f17
                                                        heapClassInst.heapFloat[(r17 + 17)] = Float32(f11)
                                                        heapClassInst.heapFloat[(r17 + 18)] = Float32(f9)
                                                        heapClassInst.heap32[(r17 + 19)] = 0
                                                    }
                                                    if (r20 != 0) {
                                                        f12 = f6 * f0
                                                        f13 = f3 * f2
                                                        f3 = f3 * f4
                                                        f14 = f8 * f0
                                                        f15 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                        f12 = f12 - f13
                                                        f13 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                        f3 = f3 - f14
                                                        f8 = f8 * f2
                                                        f6 = f6 * f4
                                                        f12 = f15 * f12
                                                        f3 = f13 * f3
                                                        f13 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                        f6 = f8 - f6
                                                        r21 = r20 >> 2
                                                        f3 = f12 + f3
                                                        f6 = f13 * f6
                                                        f8 = Float64(heapClassInst.heapFloat[(r21 + 84)])
                                                        f3 = f3 + f6
                                                        f3 = f8 + f3
                                                    } else {
                                                        f3 = 0.0
                                                    }
                                                    if (r16 != 0) {
                                                        f6 = f5 * f9
                                                        f8 = f1 * f11
                                                        f12 = f1 * f10
                                                        f9 = f7 * f9
                                                        f13 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                        f6 = f6 - f8
                                                        f8 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                        f9 = f12 - f9
                                                        f11 = f7 * f11
                                                        f10 = f5 * f10
                                                        f6 = f13 * f6
                                                        f9 = f8 * f9
                                                        f8 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                        f10 = f11 - f10
                                                        r21 = r16 >> 2
                                                        f9 = f6 + f9
                                                        f6 = f8 * f10
                                                        f8 = Float64(heapClassInst.heapFloat[(r21 + 84)])
                                                        f9 = f9 + f6
                                                        f9 = f8 + f9
                                                    } else {
                                                        f9 = 0.0
                                                    }
                                                    f6 = 1.0
                                                    f3 = f3 + f9
                                                    f3 = f6 / f3
                                                    heapClassInst.heapFloat[(r17 + 23)] = Float32(f3)
                                                    f3 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                    heapClassInst.heapFloat[(r17 + 4)] = Float32(f3)
                                                    f8 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                    heapClassInst.heapFloat[(r17 + 5)] = Float32(f8)
                                                    f9 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                    heapClassInst.heapFloat[(r17 + 6)] = Float32(f9)
                                                    heapClassInst.heap32[(r17 + 7)] = heapClassInst.heap32[(r9 + 20)]
                                                    f10 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                    f11 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                    f12 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                    f13 = f2 * f10
                                                    f14 = f0 * f11
                                                    f15 = f0 * f12
                                                    f10 = f4 * f10
                                                    f13 = f13 - f14
                                                    f11 = f4 * f11
                                                    f12 = f2 * f12
                                                    f10 = f15 - f10
                                                    heapClassInst.heapFloat[(r17)] = Float32(f13)
                                                    f11 = f11 - f12
                                                    heapClassInst.heapFloat[(r17 + 1)] = Float32(f10)
                                                    heapClassInst.heapFloat[(r17 + 2)] = Float32(f11)
                                                    heapClassInst.heap32[(r17 + 3)] = 0
                                                    f10 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                    f11 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                    f12 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                    f13 = f1 * f10
                                                    f14 = f5 * f11
                                                    f11 = f7 * f11
                                                    f15 = f1 * f12
                                                    f13 = f13 - f14
                                                    f12 = f5 * f12
                                                    f10 = f7 * f10
                                                    f11 = f11 - f15
                                                    heapClassInst.heapFloat[(r17 + 8)] = Float32(f13)
                                                    f10 = f12 - f10
                                                    heapClassInst.heapFloat[(r17 + 9)] = Float32(f11)
                                                    heapClassInst.heapFloat[(r17 + 10)] = Float32(f10)
                                                    heapClassInst.heap32[(r17 + 11)] = 0
                                                    if (r20 != 0) {
                                                        r21 = r20 >> 2
                                                        f10 = Float64(heapClassInst.heapFloat[(r21 + 81)])
                                                        f11 = Float64(heapClassInst.heapFloat[(r21 + 80)])
                                                        f12 = Float64(heapClassInst.heapFloat[(r21 + 82)])
                                                        f13 = f11 * f2
                                                        f14 = f10 * f4
                                                        f4 = f12 * f4
                                                        f11 = f11 * f0
                                                        f0 = f10 * f0
                                                        f2 = f12 * f2
                                                        f10 = Float64(heapClassInst.heapFloat[(r21 + 78)])
                                                        f12 = f13 - f14
                                                        f13 = Float64(heapClassInst.heapFloat[(r21 + 77)])
                                                        f11 = f4 - f11
                                                        f14 = Float64(heapClassInst.heapFloat[(r21 + 76)])
                                                        f0 = f0 - f2
                                                        f4 = f10 + f12
                                                        f2 = f13 + f11
                                                        f0 = f14 + f0
                                                    } else {
                                                        f0 = 0.0
                                                        f2 = f0
                                                        f4 = f0
                                                    }
                                                    if (r16 != 0) {
                                                        r21 = r16 >> 2
                                                        f10 = Float64(heapClassInst.heapFloat[(r21 + 81)])
                                                        f11 = Float64(heapClassInst.heapFloat[(r21 + 80)])
                                                        f12 = Float64(heapClassInst.heapFloat[(r21 + 82)])
                                                        f13 = f11 * f5
                                                        f14 = f10 * f7
                                                        f7 = f12 * f7
                                                        f11 = f11 * f1
                                                        f1 = f10 * f1
                                                        f5 = f12 * f5
                                                        f10 = Float64(heapClassInst.heapFloat[(r21 + 78)])
                                                        f12 = f13 - f14
                                                        f13 = Float64(heapClassInst.heapFloat[(r21 + 77)])
                                                        f11 = f7 - f11
                                                        f14 = Float64(heapClassInst.heapFloat[(r21 + 76)])
                                                        f1 = f1 - f5
                                                        f7 = f10 + f12
                                                        f5 = f13 + f11
                                                        f1 = f14 + f1
                                                    } else {
                                                        f1 = 0.0
                                                        f5 = f1
                                                        f7 = f1
                                                    }
                                                    f0 = f0 - f1
                                                    f1 = f2 - f5
                                                    f2 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                    f5 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                    f4 = f4 - f7
                                                    f7 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                    f2 = f2 * f0
                                                    f5 = f5 * f1
                                                    f2 = f2 + f5
                                                    f5 = f7 * f4
                                                    f7 = Float64(heapClassInst.heapFloat[(r9 + 21)])
                                                    f10 = Float64(heapClassInst.heapFloat[(r6 + 13)])
                                                    f2 = f2 + f5
                                                    f5 = f7 + f10
                                                    heapClassInst.heap32[(r17 + 22)] = heapClassInst.heap32[(r9 + 22)]
                                                    r21 = Int64(heapClassInst.heap32[(r9 + 37)])
                                                    r25 = Int64(heapClassInst.heap32[(r6 + 16)])
                                                    if (r21 > r25) {
                                                        __label__ = 151
                                                    } else {
                                                        f7 = Float64(heapClassInst.heapFloat[(r9 + 23)])
                                                        f10 = -f2
                                                        f7 = f7 * f10
                                                        f10 = 0.0
                                                        if (f7 <= f10) {
                                                            __label__ = 151
                                                        } else {
                                                            __label__ = 152
                                                        }
                                                    }
                                                    if (__label__ == 151) {
                                                        f7 = 0.0
                                                    }
                                                    r21 = Int64(heapClassInst.heapU8[r5 + 60])
                                                    r21 = r21 & 4
                                                    if (r21 == 0) {
                                                        heapClassInst.heap32[(r17 + 21)] = 0
                                                    } else {
                                                        f10 = Float64(heapClassInst.heapFloat[(r9 + 29)])
                                                        f11 = Float64(heapClassInst.heapFloat[(r6 + 14)])
                                                        f10 = f10 * f11
                                                        heapClassInst.heapFloat[(r17 + 21)] = Float32(f10)
                                                        if (!(r20 == 0)) {
                                                            r21 = r20 >> 2
                                                            f11 = Float64(heapClassInst.heapFloat[(r21 + 84)])
                                                            f12 = 0.0
                                                            if (!(f11 == f12)) {
                                                                f3 = f3 * f11
                                                                f12 = Float64(heapClassInst.heapFloat[(r21 + 85)])
                                                                f3 = f3 * f12
                                                                f3 = f3 * f10
                                                                f12 = Float64(heapClassInst.heapFloat[(r21 + 126)])
                                                                f13 = Float64(heapClassInst.heapFloat[(r21 + 86)])
                                                                f14 = Float64(heapClassInst.heapFloat[(r21 + 87)])
                                                                f8 = f8 * f11
                                                                f3 = f12 + f3
                                                                f8 = f8 * f13
                                                                heapClassInst.heapFloat[(r21 + 126)] = Float32(f3)
                                                                f3 = f8 * f10
                                                                f8 = Float64(heapClassInst.heapFloat[(r21 + 127)])
                                                                f9 = f9 * f11
                                                                f3 = f8 + f3
                                                                f8 = f9 * f14
                                                                heapClassInst.heapFloat[(r21 + 127)] = Float32(f3)
                                                                f3 = f8 * f10
                                                                f8 = Float64(heapClassInst.heapFloat[(r21 + 128)])
                                                                f3 = f8 + f3
                                                                heapClassInst.heapFloat[(r21 + 128)] = Float32(f3)
                                                                f3 = Float64(heapClassInst.heapFloat[(r21 + 134)])
                                                                f3 = f3 * f10
                                                                f8 = Float64(heapClassInst.heapFloat[(r17 + 12)])
                                                                f9 = Float64(heapClassInst.heapFloat[(r21 + 136)])
                                                                f11 = Float64(heapClassInst.heapFloat[(r21 + 135)])
                                                                f3 = f8 * f3
                                                                f8 = Float64(heapClassInst.heapFloat[(r21 + 130)])
                                                                f12 = Float64(heapClassInst.heapFloat[(r17 + 14)])
                                                                f13 = Float64(heapClassInst.heapFloat[(r17 + 13)])
                                                                f3 = f8 + f3
                                                                f8 = f11 * f10
                                                                heapClassInst.heapFloat[(r21 + 130)] = Float32(f3)
                                                                f3 = f13 * f8
                                                                f8 = Float64(heapClassInst.heapFloat[(r21 + 131)])
                                                                f3 = f8 + f3
                                                                f8 = f9 * f10
                                                                heapClassInst.heapFloat[(r21 + 131)] = Float32(f3)
                                                                f3 = f12 * f8
                                                                f8 = Float64(heapClassInst.heapFloat[(r21 + 132)])
                                                                f3 = f8 + f3
                                                                heapClassInst.heapFloat[(r21 + 132)] = Float32(f3)
                                                            }
                                                        }
                                                        if (!(r16 == 0)) {
                                                            r21 = r16 >> 2
                                                            f3 = Float64(heapClassInst.heapFloat[(r21 + 84)])
                                                            f8 = 0.0
                                                            if (!(f3 == f8)) {
                                                                f8 = Float64(heapClassInst.heapFloat[(r17 + 21)])
                                                                f8 = -f8
                                                                f9 = Float64(heapClassInst.heapFloat[(r17 + 4)])
                                                                f9 = f9 * f3
                                                                f10 = Float64(heapClassInst.heapFloat[(r21 + 85)])
                                                                f9 = f9 * f10
                                                                f10 = Float64(heapClassInst.heapFloat[(r17 + 5)])
                                                                f11 = Float64(heapClassInst.heapFloat[(r17 + 6)])
                                                                f9 = f9 * f8
                                                                f12 = Float64(heapClassInst.heapFloat[(r21 + 126)])
                                                                f13 = Float64(heapClassInst.heapFloat[(r21 + 86)])
                                                                f14 = Float64(heapClassInst.heapFloat[(r21 + 87)])
                                                                f15 = Float64(heapClassInst.heapFloat[(r17 + 16)])
                                                                f16 = Float64(heapClassInst.heapFloat[(r17 + 17)])
                                                                f17 = Float64(heapClassInst.heapFloat[(r17 + 18)])
                                                                f10 = f10 * f3
                                                                f9 = f12 + f9
                                                                f10 = f10 * f13
                                                                heapClassInst.heapFloat[(r21 + 126)] = Float32(f9)
                                                                f9 = f10 * f8
                                                                f10 = Float64(heapClassInst.heapFloat[(r21 + 127)])
                                                                f3 = f11 * f3
                                                                f9 = f10 + f9
                                                                f3 = f3 * f14
                                                                heapClassInst.heapFloat[(r21 + 127)] = Float32(f9)
                                                                f3 = f3 * f8
                                                                f9 = Float64(heapClassInst.heapFloat[(r21 + 128)])
                                                                f3 = f9 + f3
                                                                heapClassInst.heapFloat[(r21 + 128)] = Float32(f3)
                                                                f3 = Float64(heapClassInst.heapFloat[(r21 + 134)])
                                                                f3 = f3 * f8
                                                                f9 = Float64(heapClassInst.heapFloat[(r21 + 136)])
                                                                f10 = Float64(heapClassInst.heapFloat[(r21 + 135)])
                                                                f11 = Float64(heapClassInst.heapFloat[(r21 + 130)])
                                                                f3 = f3 * f15
                                                                f3 = f11 - f3
                                                                f10 = f10 * f8
                                                                heapClassInst.heapFloat[(r21 + 130)] = Float32(f3)
                                                                f3 = f10 * f16
                                                                f10 = Float64(heapClassInst.heapFloat[(r21 + 131)])
                                                                f3 = f10 - f3
                                                                f8 = f9 * f8
                                                                heapClassInst.heapFloat[(r21 + 131)] = Float32(f3)
                                                                f3 = f8 * f17
                                                                f8 = Float64(heapClassInst.heapFloat[(r21 + 132)])
                                                                f3 = f8 - f3
                                                                heapClassInst.heapFloat[(r21 + 132)] = Float32(f3)
                                                            }
                                                        }
                                                    }
                                                    heapClassInst.heap32[(r17 + 20)] = 0
                                                    if (r20 != 0) {
                                                        r21 = r20 >> 2
                                                        f9 = Float64(heapClassInst.heapFloat[(r21 + 76)])
                                                        f8 = Float64(heapClassInst.heapFloat[(r21 + 77)])
                                                        f3 = Float64(heapClassInst.heapFloat[(r21 + 78)])
                                                    } else {
                                                        f3 = 0.0
                                                        f8 = f3
                                                        f9 = f3
                                                    }
                                                    f10 = Float64(heapClassInst.heapFloat[(r17 + 4)])
                                                    f11 = Float64(heapClassInst.heapFloat[(r17 + 5)])
                                                    f12 = Float64(heapClassInst.heapFloat[(r17 + 6)])
                                                    f9 = f10 * f9
                                                    f8 = f11 * f8
                                                    f8 = f9 + f8
                                                    f3 = f12 * f3
                                                    f3 = f8 + f3
                                                    if (r20 != 0) {
                                                        r20 = r20 >> 2
                                                        f13 = Float64(heapClassInst.heapFloat[(r20 + 80)])
                                                        f9 = Float64(heapClassInst.heapFloat[(r20 + 81)])
                                                        f8 = Float64(heapClassInst.heapFloat[(r20 + 82)])
                                                    } else {
                                                        f8 = 0.0
                                                        f9 = f8
                                                        f13 = f8
                                                    }
                                                    f14 = Float64(heapClassInst.heapFloat[(r17)])
                                                    f15 = Float64(heapClassInst.heapFloat[(r17 + 1)])
                                                    f13 = f14 * f13
                                                    f9 = f15 * f9
                                                    f14 = Float64(heapClassInst.heapFloat[(r17 + 2)])
                                                    f9 = f13 + f9
                                                    f8 = f14 * f8
                                                    f8 = f9 + f8
                                                    f3 = f3 + f8
                                                    if (r16 != 0) {
                                                        r20 = r16 >> 2
                                                        f13 = Float64(heapClassInst.heapFloat[(r20 + 80)])
                                                        f9 = Float64(heapClassInst.heapFloat[(r20 + 81)])
                                                        f8 = Float64(heapClassInst.heapFloat[(r20 + 82)])
                                                    } else {
                                                        f8 = 0.0
                                                        f9 = f8
                                                        f13 = f8
                                                    }
                                                    f14 = Float64(heapClassInst.heapFloat[(r17 + 8)])
                                                    f15 = Float64(heapClassInst.heapFloat[(r17 + 9)])
                                                    f13 = f14 * f13
                                                    f9 = f15 * f9
                                                    f14 = Float64(heapClassInst.heapFloat[(r17 + 10)])
                                                    f9 = f13 + f9
                                                    f8 = f14 * f8
                                                    f8 = f9 + f8
                                                    if (r16 != 0) {
                                                        r16 = r16 >> 2
                                                        f14 = Float64(heapClassInst.heapFloat[(r16 + 76)])
                                                        f13 = Float64(heapClassInst.heapFloat[(r16 + 77)])
                                                        f9 = Float64(heapClassInst.heapFloat[(r16 + 78)])
                                                    } else {
                                                        f9 = 0.0
                                                        f13 = f9
                                                        f14 = f9
                                                    }
                                                    f10 = f10 * f14
                                                    f11 = f11 * f13
                                                    f10 = f10 + f11
                                                    f9 = f12 * f9
                                                    f9 = f10 + f9
                                                    f10 = Float64(heapClassInst.heapFloat[(r6 + 8)])
                                                    f11 = -f5
                                                    f8 = f8 - f9
                                                    f9 = f10 * f11
                                                    f10 = Float64(heapClassInst.heapFloat[(r6 + 3)])
                                                    f3 = f3 + f8
                                                    f8 = f9 / f10
                                                    f9 = Float64(heapClassInst.heapFloat[(r17 + 23)])
                                                    f3 = f7 - f3
                                                    f7 = f9 * f8
                                                    f3 = f9 * f3
                                                    r16 = Int64(heapClassInst.heap32[(r6 + 11)])
                                                    if (r16 == 0) {
                                                        __label__ = 174
                                                    } else {
                                                        f8 = Float64(heapClassInst.heapFloat[(r6 + 12)])
                                                        if (f8 >= f5) {
                                                            heapClassInst.heapFloat[(r17 + 29)] = Float32(f3)
                                                            heapClassInst.heapFloat[(r17 + 33)] = Float32(f7)
                                                            __label__ = 176
                                                        } else {
                                                            __label__ = 174
                                                        }
                                                    }
                                                    if (__label__ == 174) {
                                                        f3 = f7 + f3
                                                        heapClassInst.heapFloat[(r17 + 29)] = Float32(f3)
                                                        heapClassInst.heap32[(r17 + 33)] = 0
                                                    }
                                                    heapClassInst.heap32[(r17 + 30)] = 0
                                                    heapClassInst.heap32[(r17 + 31)] = 0
                                                    heapClassInst.heap32[(r17 + 32)] = 1343554297
                                                    r16 = Int64(heapClassInst.heap32[(r2 + 12)])
                                                    heapClassInst.heap32[(r17 + 25)] = Int32(r16)
                                                    r16 = Int64(heapClassInst.heapU8[r5 + 60])
                                                    r16 = r16 & 32
                                                    if (r16 == 0) {
                                                        __label__ = 178
                                                    } else {
                                                        r16 = Int64(heapClassInst.heapU8[r8 + 120])
                                                        if (r16 != 0) {
                                                            r16 = r8 >> 2
                                                            f0 = Float64(heapClassInst.heapFloat[(r9 + 35)])
                                                            f1 = Float64(heapClassInst.heapFloat[(r16 + 33)])
                                                            heapClassInst.heap32[(g0)] = Int32(r0)
                                                            heapClassInst.heap32[(g0 + 1)] = Int32(r12)
                                                            heapClassInst.heap32[(g0 + 2)] = Int32(r14)
                                                            heapClassInst.heap32[(g0 + 3)] = Int32(r10)
                                                            heapClassInst.heap32[(g0 + 4)] = Int32(r19)
                                                            heapClassInst.heap32[(g0 + 5)] = Int32(r18)
                                                            heapClassInst.heap32[(g0 + 6)] = Int32(r3)
                                                            heapClassInst.heap32[(g0 + 7)] = Int32(r1)
                                                            heapClassInst.heap32[(g0 + 8)] = 1065353216
                                                            heapClassInst.heapFloat[(g0 + 9)] = Float32(f1)
                                                            heapClassInst.heapFloat[(g0 + 10)] = Float32(f0)
                                                            _ZN35btSequentialImpulseConstraintSolver21addFrictionConstraintERK9btVector3P11btRigidBodyS4_iR15btManifoldPointS2_S2_P17btCollisionObjectS8_fff(
                                                                i7);
                                                            r12 = Int64(heapClassInst.heapU8[r5 + 60])
                                                            r12 = r12 & 16
                                                            if (r12 == 0) {
                                                                __label__ = 194
                                                            } else {
                                                                r12 = r8 >> 2
                                                                r8 = r8 >> 2
                                                                f0 = Float64(heapClassInst.heapFloat[(r12 + 36)])
                                                                f1 = Float64(heapClassInst.heapFloat[(r8 + 34)])
                                                                heapClassInst.heap32[(g0)] = Int32(r0)
                                                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                                                heapClassInst.heap32[(g0 + 2)] = Int32(r14)
                                                                heapClassInst.heap32[(g0 + 3)] = Int32(r10)
                                                                heapClassInst.heap32[(g0 + 4)] = Int32(r19)
                                                                heapClassInst.heap32[(g0 + 5)] = Int32(r18)
                                                                heapClassInst.heap32[(g0 + 6)] = Int32(r3)
                                                                heapClassInst.heap32[(g0 + 7)] = Int32(r1)
                                                                heapClassInst.heap32[(g0 + 8)] = 1065353216
                                                                heapClassInst.heapFloat[(g0 + 9)] = Float32(f1)
                                                                heapClassInst.heapFloat[(g0 + 10)] = Float32(f0)
                                                                _ZN35btSequentialImpulseConstraintSolver21addFrictionConstraintERK9btVector3P11btRigidBodyS4_iR15btManifoldPointS2_S2_P17btCollisionObjectS8_fff(
                                                                    i7);
                                                                __label__ = 194
                                                            }
                                                        } else {
                                                            __label__ = 178
                                                        }
                                                    }
                                                    do {
                                                        if (__label__ == 178) {
                                                            f3 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                            f5 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                            f7 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                            f8 = f3 * f2
                                                            f0 = f0 - f8
                                                            f8 = f7 * f2
                                                            r16 = r8 >> 2
                                                            f1 = f1 - f8
                                                            f2 = f5 * f2
                                                            r20 = r8 >> 2
                                                            heapClassInst.heapFloat[(r16 + 38)] = Float32(f0)
                                                            f2 = f4 - f2
                                                            r21 = r8 >> 2
                                                            heapClassInst.heapFloat[(r20 + 39)] = Float32(f1)
                                                            r25 = r8 >> 2
                                                            heapClassInst.heapFloat[(r21 + 40)] = Float32(f2)
                                                            heapClassInst.heap32[(r25 + 41)] = 0
                                                            r25 = Int64(heapClassInst.heapU8[r5 + 60])
                                                            r25 = r25 & 64
                                                            if (!(r25 != 0)) {
                                                                f0 = f0 * f0
                                                                f1 = f1 * f1
                                                                f0 = f0 + f1
                                                                f1 = f2 * f2
                                                                f0 = f0 + f1
                                                                f1 = 1.1920928955078125e-007
                                                                if (!(f0 <= f1)) {
                                                                    heapClassInst.heapFloat[(g0)] = Float32(f0)
                                                                    sqrtf(i7);
                                                                    f3 = f6 / commonVariable.f_g0
                                                                    f5 = Float64(heapClassInst.heapFloat[(r16 + 38)])
                                                                    f5 = f5 * f3
                                                                    heapClassInst.heapFloat[(r16 + 38)] = Float32(f5)
                                                                    f7 = Float64(heapClassInst.heapFloat[(r20 + 39)])
                                                                    f7 = f7 * f3
                                                                    heapClassInst.heapFloat[(r20 + 39)] = Float32(f7)
                                                                    f0 = Float64(heapClassInst.heapFloat[(r21 + 40)])
                                                                    f3 = f0 * f3
                                                                    heapClassInst.heapFloat[(r21 + 40)] = Float32(f3)
                                                                    r16 = Int64(heapClassInst.heapU8[r5 + 60])
                                                                    r16 = r16 & 16
                                                                    if (!(r16 == 0)) {
                                                                        f0 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                                        f1 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                                        f2 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                                        f4 = f7 * f0
                                                                        f8 = f3 * f1
                                                                        f4 = f4 - f8
                                                                        f3 = f3 * f2
                                                                        f0 = f5 * f0
                                                                        r16 = r8 >> 2
                                                                        f3 = f3 - f0
                                                                        f5 = f5 * f1
                                                                        f7 = f7 * f2
                                                                        r20 = r8 >> 2
                                                                        heapClassInst.heapFloat[(r16 + 42)] = Float32(f4)
                                                                        f5 = f5 - f7
                                                                        r21 = r8 >> 2
                                                                        heapClassInst.heapFloat[(r20 + 43)] = Float32(f3)
                                                                        f7 = f4 * f4
                                                                        f3 = f3 * f3
                                                                        r22 = r8 >> 2
                                                                        heapClassInst.heapFloat[(r21 + 44)] = Float32(f5)
                                                                        heapClassInst.heap32[(r22 + 45)] = 0
                                                                        f3 = f7 + f3
                                                                        f5 = f5 * f5
                                                                        f3 = f3 + f5
                                                                        heapClassInst.heapFloat[(g0)] = Float32(f3)
                                                                        sqrtf(i7);
                                                                        f3 = f6 / commonVariable.f_g0
                                                                        f5 = Float64(heapClassInst.heapFloat[(r16 + 42)])
                                                                        f5 = f5 * f3
                                                                        heapClassInst.heapFloat[(r16 + 42)] = Float32(f5)
                                                                        f5 = Float64(heapClassInst.heapFloat[(r20 + 43)])
                                                                        f5 = f5 * f3
                                                                        heapClassInst.heapFloat[(r20 + 43)] = Float32(f5)
                                                                        f5 = Float64(heapClassInst.heapFloat[(r21 + 44)])
                                                                        f3 = f5 * f3
                                                                        heapClassInst.heapFloat[(r21 + 44)] = Float32(f3)
                                                                        heapClassInst.heap32[(g0)] = Int32(r3)
                                                                        heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                                                        _Z24applyAnisotropicFrictionP17btCollisionObjectR9btVector3(
                                                                            i7);
                                                                        heapClassInst.heap32[(g0)] = Int32(r1)
                                                                        heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                                                        _Z24applyAnisotropicFrictionP17btCollisionObjectR9btVector3(
                                                                            i7);
                                                                        heapClassInst.heap32[(g0)] = Int32(r0)
                                                                        heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                                                        heapClassInst.heap32[(g0 + 2)] = Int32(r14)
                                                                        heapClassInst.heap32[(g0 + 3)] = Int32(r10)
                                                                        heapClassInst.heap32[(g0 + 4)] = Int32(r19)
                                                                        heapClassInst.heap32[(g0 + 5)] = Int32(r18)
                                                                        heapClassInst.heap32[(g0 + 6)] = Int32(r3)
                                                                        heapClassInst.heap32[(g0 + 7)] = Int32(r1)
                                                                        heapClassInst.heap32[(g0 + 8)] = 1065353216
                                                                        heapClassInst.heap32[(g0 + 9)] = 0
                                                                        heapClassInst.heap32[(g0 + 10)] = 0
                                                                        _ZN35btSequentialImpulseConstraintSolver21addFrictionConstraintERK9btVector3P11btRigidBodyS4_iR15btManifoldPointS2_S2_P17btCollisionObjectS8_fff(
                                                                            i7);
                                                                    }
                                                                    heapClassInst.heap32[(g0)] = Int32(r3)
                                                                    heapClassInst.heap32[(g0 + 1)] = Int32(r12)
                                                                    _Z24applyAnisotropicFrictionP17btCollisionObjectR9btVector3(
                                                                        i7);
                                                                    heapClassInst.heap32[(g0)] = Int32(r1)
                                                                    heapClassInst.heap32[(g0 + 1)] = Int32(r12)
                                                                    _Z24applyAnisotropicFrictionP17btCollisionObjectR9btVector3(
                                                                        i7);
                                                                    heapClassInst.heap32[(g0)] = Int32(r0)
                                                                    heapClassInst.heap32[(g0 + 1)] = Int32(r12)
                                                                    heapClassInst.heap32[(g0 + 2)] = Int32(r14)
                                                                    heapClassInst.heap32[(g0 + 3)] = Int32(r10)
                                                                    heapClassInst.heap32[(g0 + 4)] = Int32(r19)
                                                                    heapClassInst.heap32[(g0 + 5)] = Int32(r18)
                                                                    heapClassInst.heap32[(g0 + 6)] = Int32(r3)
                                                                    heapClassInst.heap32[(g0 + 7)] = Int32(r1)
                                                                    heapClassInst.heap32[(g0 + 8)] = 1065353216
                                                                    heapClassInst.heap32[(g0 + 9)] = 0
                                                                    heapClassInst.heap32[(g0 + 10)] = 0
                                                                    r10 = 1
                                                                    _ZN35btSequentialImpulseConstraintSolver21addFrictionConstraintERK9btVector3P11btRigidBodyS4_iR15btManifoldPointS2_S2_P17btCollisionObjectS8_fff(
                                                                        i7);
                                                                    heapClassInst.heap8[r8 + 120] = Int8(r10)
                                                                    break
                                                                }
                                                            }
                                                            f0 = 0.0
                                                            if (f5 < f0) {
                                                                f0 = -f5
                                                            } else {
                                                                f0 = f5
                                                            }
                                                            f1 = 0.70710676908493042
                                                            if (f0 <= f1) {
                                                                f3 = f3 * f3
                                                                f0 = f7 * f7
                                                                f3 = f3 + f0
                                                                heapClassInst.heapFloat[(g0)] = Float32(f3)
                                                                sqrtf(i7);
                                                                f1 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                                f0 = f6 / commonVariable.f_g0
                                                                f1 = -f1
                                                                f1 = f0 * f1
                                                                heapClassInst.heapFloat[(r16 + 38)] = Float32(f1)
                                                                f2 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                                f2 = f2 * f0
                                                                heapClassInst.heapFloat[(r20 + 39)] = Float32(f2)
                                                                heapClassInst.heap32[(r21 + 40)] = 0
                                                                f4 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                                f5 = -f4
                                                                r16 = r8 >> 2
                                                                f2 = f2 * f5
                                                                f3 = f3 * f0
                                                                r20 = r8 >> 2
                                                                f0 = f4 * f1
                                                                heapClassInst.heapFloat[(r16 + 42)] = Float32(f2)
                                                                heapClassInst.heapFloat[(r20 + 43)] = Float32(f0)
                                                            } else {
                                                                f3 = f7 * f7
                                                                f7 = f5 * f5
                                                                f3 = f3 + f7
                                                                heapClassInst.heapFloat[(g0)] = Float32(f3)
                                                                sqrtf(i7);
                                                                heapClassInst.heap32[(r16 + 38)] = 0
                                                                f0 = Float64(heapClassInst.heapFloat[(r22 + 19)])
                                                                f6 = f6 / commonVariable.f_g0
                                                                f7 = -f0
                                                                f7 = f6 * f7
                                                                heapClassInst.heapFloat[(r20 + 39)] = Float32(f7)
                                                                f0 = Float64(heapClassInst.heapFloat[(r24 + 18)])
                                                                f0 = f0 * f6
                                                                r16 = r8 >> 2
                                                                f3 = f3 * f6
                                                                heapClassInst.heapFloat[(r21 + 40)] = Float32(f0)
                                                                heapClassInst.heapFloat[(r16 + 42)] = Float32(f3)
                                                                f3 = Float64(heapClassInst.heapFloat[(r23 + 17)])
                                                                f6 = -f3
                                                                f3 = f3 * f7
                                                                r16 = r8 >> 2
                                                                f6 = f0 * f6
                                                                heapClassInst.heapFloat[(r16 + 43)] = Float32(f6)
                                                            }
                                                            r16 = r8 >> 2
                                                            heapClassInst.heapFloat[(r16 + 44)] = Float32(f3)
                                                            r16 = Int64(heapClassInst.heapU8[r5 + 60])
                                                            r16 = r16 & 16
                                                            if (!(r16 == 0)) {
                                                                heapClassInst.heap32[(g0)] = Int32(r3)
                                                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                                                _Z24applyAnisotropicFrictionP17btCollisionObjectR9btVector3(
                                                                    i7);
                                                                heapClassInst.heap32[(g0)] = Int32(r1)
                                                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                                                _Z24applyAnisotropicFrictionP17btCollisionObjectR9btVector3(
                                                                    i7);
                                                                heapClassInst.heap32[(g0)] = Int32(r0)
                                                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                                                heapClassInst.heap32[(g0 + 2)] = Int32(r14)
                                                                heapClassInst.heap32[(g0 + 3)] = Int32(r10)
                                                                heapClassInst.heap32[(g0 + 4)] = Int32(r19)
                                                                heapClassInst.heap32[(g0 + 5)] = Int32(r18)
                                                                heapClassInst.heap32[(g0 + 6)] = Int32(r3)
                                                                heapClassInst.heap32[(g0 + 7)] = Int32(r1)
                                                                heapClassInst.heap32[(g0 + 8)] = 1065353216
                                                                heapClassInst.heap32[(g0 + 9)] = 0
                                                                heapClassInst.heap32[(g0 + 10)] = 0
                                                                _ZN35btSequentialImpulseConstraintSolver21addFrictionConstraintERK9btVector3P11btRigidBodyS4_iR15btManifoldPointS2_S2_P17btCollisionObjectS8_fff(
                                                                    i7);
                                                            }
                                                            heapClassInst.heap32[(g0)] = Int32(r3)
                                                            heapClassInst.heap32[(g0 + 1)] = Int32(r12)
                                                            _Z24applyAnisotropicFrictionP17btCollisionObjectR9btVector3(
                                                                i7);
                                                            heapClassInst.heap32[(g0)] = Int32(r1)
                                                            heapClassInst.heap32[(g0 + 1)] = Int32(r12)
                                                            _Z24applyAnisotropicFrictionP17btCollisionObjectR9btVector3(
                                                                i7);
                                                            heapClassInst.heap32[(g0)] = Int32(r0)
                                                            heapClassInst.heap32[(g0 + 1)] = Int32(r12)
                                                            heapClassInst.heap32[(g0 + 2)] = Int32(r14)
                                                            heapClassInst.heap32[(g0 + 3)] = Int32(r10)
                                                            heapClassInst.heap32[(g0 + 4)] = Int32(r19)
                                                            heapClassInst.heap32[(g0 + 5)] = Int32(r18)
                                                            heapClassInst.heap32[(g0 + 6)] = Int32(r3)
                                                            heapClassInst.heap32[(g0 + 7)] = Int32(r1)
                                                            heapClassInst.heap32[(g0 + 8)] = 1065353216
                                                            heapClassInst.heap32[(g0 + 9)] = 0
                                                            heapClassInst.heap32[(g0 + 10)] = 0
                                                            r10 = 1
                                                            _ZN35btSequentialImpulseConstraintSolver21addFrictionConstraintERK9btVector3P11btRigidBodyS4_iR15btManifoldPointS2_S2_P17btCollisionObjectS8_fff(
                                                                i7);
                                                            heapClassInst.heap8[r8 + 120] = Int8(r10)
                                                        }
                                                    } while (false);
                                                    r8 = Int64(heapClassInst.heap32[(r6 + 15)])
                                                    r10 = Int64(heapClassInst.heap32[(r17 + 25)])
                                                    r11 = Int64(heapClassInst.heap32[(r2 + 14)])
                                                    r12 = r8 & 8
                                                    if (r12 == 0) {
                                                        r8 = (r10 * 136) | 0
                                                        r8 = (r11 + r8) | 0
                                                        r8 = r8 >> 2
                                                        heapClassInst.heap32[(r8 + 21)] = 0
                                                        r8 = Int64(heapClassInst.heapU8[r5 + 60])
                                                        r8 = r8 & 16
                                                        if (r8 == 0) {
                                                            break
                                                        } else {
                                                            r8 = Int64(heapClassInst.heap32[(r17 + 25)])
                                                            r9 = Int64(heapClassInst.heap32[(r2 + 14)])
                                                            r8 = (r8 * 136) | 0
                                                            r8 = (r8 + r9) | 0
                                                            r8 = r8 >> 2
                                                            heapClassInst.heap32[(r8 + 55)] = 0
                                                        }
                                                    } else {
                                                        r8 = r8 & 4
                                                        if (r8 == 0) {
                                                            r10 = (r10 * 136) | 0
                                                            r10 = (r11 + r10) | 0
                                                            r10 = r10 >> 2
                                                            heapClassInst.heap32[(r10 + 21)] = 0
                                                        } else {
                                                            r10 = (r10 * 136) | 0
                                                            r10 = (r11 + r10) | 0
                                                            f0 = Float64(heapClassInst.heapFloat[(r9 + 31)])
                                                            f1 = Float64(heapClassInst.heapFloat[(r6 + 14)])
                                                            f0 = f0 * f1
                                                            r10 = r10 >> 2
                                                            heapClassInst.heapFloat[(r10 + 21)] = Float32(f0)
                                                            if (!(r13 == 0)) {
                                                                r11 = r13 >> 2
                                                                f1 = Float64(heapClassInst.heapFloat[(r11 + 84)])
                                                                f2 = 0.0
                                                                if (!(f1 == f2)) {
                                                                    f2 = Float64(heapClassInst.heapFloat[(r10 + 4)])
                                                                    f2 = f2 * f1
                                                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 85)])
                                                                    f2 = f2 * f3
                                                                    f3 = Float64(heapClassInst.heapFloat[(r10 + 5)])
                                                                    f4 = Float64(heapClassInst.heapFloat[(r10 + 6)])
                                                                    f2 = f2 * f0
                                                                    f5 = Float64(heapClassInst.heapFloat[(r11 + 126)])
                                                                    f6 = Float64(heapClassInst.heapFloat[(r11 + 86)])
                                                                    f7 = Float64(heapClassInst.heapFloat[(r11 + 87)])
                                                                    f3 = f3 * f1
                                                                    f2 = f5 + f2
                                                                    f3 = f3 * f6
                                                                    heapClassInst.heapFloat[(r11 + 126)] = Float32(f2)
                                                                    f2 = f3 * f0
                                                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 127)])
                                                                    f1 = f4 * f1
                                                                    f2 = f3 + f2
                                                                    f1 = f1 * f7
                                                                    heapClassInst.heapFloat[(r11 + 127)] = Float32(f2)
                                                                    f1 = f1 * f0
                                                                    f2 = Float64(heapClassInst.heapFloat[(r11 + 128)])
                                                                    f1 = f2 + f1
                                                                    heapClassInst.heapFloat[(r11 + 128)] = Float32(f1)
                                                                    f1 = Float64(heapClassInst.heapFloat[(r11 + 134)])
                                                                    f1 = f1 * f0
                                                                    f2 = Float64(heapClassInst.heapFloat[(r10 + 12)])
                                                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 136)])
                                                                    f4 = Float64(heapClassInst.heapFloat[(r11 + 135)])
                                                                    f1 = f2 * f1
                                                                    f2 = Float64(heapClassInst.heapFloat[(r11 + 130)])
                                                                    f5 = Float64(heapClassInst.heapFloat[(r10 + 14)])
                                                                    f6 = Float64(heapClassInst.heapFloat[(r10 + 13)])
                                                                    f1 = f2 + f1
                                                                    f2 = f4 * f0
                                                                    heapClassInst.heapFloat[(r11 + 130)] = Float32(f1)
                                                                    f1 = f6 * f2
                                                                    f2 = Float64(heapClassInst.heapFloat[(r11 + 131)])
                                                                    f1 = f2 + f1
                                                                    f0 = f3 * f0
                                                                    heapClassInst.heapFloat[(r11 + 131)] = Float32(f1)
                                                                    f0 = f5 * f0
                                                                    f1 = Float64(heapClassInst.heapFloat[(r11 + 132)])
                                                                    f0 = f1 + f0
                                                                    heapClassInst.heapFloat[(r11 + 132)] = Float32(f0)
                                                                }
                                                            }
                                                            if (!(r15 == 0)) {
                                                                r11 = r15 >> 2
                                                                f0 = Float64(heapClassInst.heapFloat[(r11 + 84)])
                                                                f1 = 0.0
                                                                if (!(f0 == f1)) {
                                                                    f1 = Float64(heapClassInst.heapFloat[(r10 + 21)])
                                                                    f1 = -f1
                                                                    f2 = Float64(heapClassInst.heapFloat[(r10 + 4)])
                                                                    f2 = f2 * f0
                                                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 85)])
                                                                    f2 = f2 * f3
                                                                    f3 = Float64(heapClassInst.heapFloat[(r10 + 5)])
                                                                    f4 = Float64(heapClassInst.heapFloat[(r10 + 6)])
                                                                    f2 = f2 * f1
                                                                    f5 = Float64(heapClassInst.heapFloat[(r11 + 126)])
                                                                    f6 = Float64(heapClassInst.heapFloat[(r11 + 86)])
                                                                    f7 = Float64(heapClassInst.heapFloat[(r11 + 87)])
                                                                    f8 = Float64(heapClassInst.heapFloat[(r10 + 16)])
                                                                    f9 = Float64(heapClassInst.heapFloat[(r10 + 17)])
                                                                    f10 = Float64(heapClassInst.heapFloat[(r10 + 18)])
                                                                    f3 = f3 * f0
                                                                    f2 = f5 + f2
                                                                    f3 = f3 * f6
                                                                    heapClassInst.heapFloat[(r11 + 126)] = Float32(f2)
                                                                    f2 = f3 * f1
                                                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 127)])
                                                                    f0 = f4 * f0
                                                                    f2 = f3 + f2
                                                                    f0 = f0 * f7
                                                                    heapClassInst.heapFloat[(r11 + 127)] = Float32(f2)
                                                                    f0 = f0 * f1
                                                                    f2 = Float64(heapClassInst.heapFloat[(r11 + 128)])
                                                                    f0 = f2 + f0
                                                                    heapClassInst.heapFloat[(r11 + 128)] = Float32(f0)
                                                                    f0 = Float64(heapClassInst.heapFloat[(r11 + 134)])
                                                                    f0 = f0 * f1
                                                                    f2 = Float64(heapClassInst.heapFloat[(r11 + 136)])
                                                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 135)])
                                                                    f4 = Float64(heapClassInst.heapFloat[(r11 + 130)])
                                                                    f0 = f0 * f8
                                                                    f0 = f4 - f0
                                                                    f3 = f3 * f1
                                                                    heapClassInst.heapFloat[(r11 + 130)] = Float32(f0)
                                                                    f0 = f3 * f9
                                                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 131)])
                                                                    f0 = f3 - f0
                                                                    f1 = f2 * f1
                                                                    heapClassInst.heapFloat[(r11 + 131)] = Float32(f0)
                                                                    f0 = f1 * f10
                                                                    f1 = Float64(heapClassInst.heapFloat[(r11 + 132)])
                                                                    f0 = f1 - f0
                                                                    heapClassInst.heapFloat[(r11 + 132)] = Float32(f0)
                                                                }
                                                            }
                                                        }
                                                        r10 = Int64(heapClassInst.heap32[(r6 + 15)])
                                                        r11 = r10 & 16
                                                        if (!(r11 == 0)) {
                                                            r11 = Int64(heapClassInst.heap32[(r17 + 25)])
                                                            r17 = Int64(heapClassInst.heap32[(r2 + 14)])
                                                            r10 = r10 & 4
                                                            if (r10 == 0) {
                                                                r10 = (r11 * 136) | 0
                                                                r10 = (r17 + r10) | 0
                                                                r10 = r10 >> 2
                                                                heapClassInst.heap32[(r10 + 55)] = 0
                                                            } else {
                                                                r11 = (r11 * 136) | 0
                                                                r11 = (r17 + r11) | 0
                                                                f0 = Float64(heapClassInst.heapFloat[(r9 + 32)])
                                                                f1 = Float64(heapClassInst.heapFloat[(r6 + 14)])
                                                                f0 = f0 * f1
                                                                r11 = r11 >> 2
                                                                heapClassInst.heapFloat[(r11 + 55)] = Float32(f0)
                                                                if (!(r13 == 0)) {
                                                                    r17 = r13 >> 2
                                                                    f1 = Float64(heapClassInst.heapFloat[(r17 + 84)])
                                                                    f2 = 0.0
                                                                    if (!(f1 == f2)) {
                                                                        f2 = Float64(heapClassInst.heapFloat[(r11 + 38)])
                                                                        f2 = f2 * f1
                                                                        f3 = Float64(heapClassInst.heapFloat[(r11 + 39)])
                                                                        f4 = Float64(heapClassInst.heapFloat[(r11 + 40)])
                                                                        f5 = Float64(heapClassInst.heapFloat[(r17 + 126)])
                                                                        f2 = f2 * f0
                                                                        f2 = f5 + f2
                                                                        f3 = f3 * f1
                                                                        heapClassInst.heapFloat[(r17 + 126)] = Float32(f2)
                                                                        f2 = f3 * f0
                                                                        f3 = Float64(heapClassInst.heapFloat[(r17 + 127)])
                                                                        f2 = f3 + f2
                                                                        f1 = f4 * f1
                                                                        heapClassInst.heapFloat[(r17 + 127)] = Float32(f2)
                                                                        f1 = f1 * f0
                                                                        f2 = Float64(heapClassInst.heapFloat[(r17 + 128)])
                                                                        f1 = f2 + f1
                                                                        heapClassInst.heapFloat[(r17 + 128)] = Float32(f1)
                                                                        f1 = Float64(heapClassInst.heapFloat[(r17 + 134)])
                                                                        f1 = f1 * f0
                                                                        f2 = Float64(heapClassInst.heapFloat[(r11 + 46)])
                                                                        f3 = Float64(heapClassInst.heapFloat[(r17 + 136)])
                                                                        f4 = Float64(heapClassInst.heapFloat[(r17 + 135)])
                                                                        f1 = f2 * f1
                                                                        f2 = Float64(heapClassInst.heapFloat[(r17 + 130)])
                                                                        f5 = Float64(heapClassInst.heapFloat[(r11 + 48)])
                                                                        f6 = Float64(heapClassInst.heapFloat[(r11 + 47)])
                                                                        f1 = f2 + f1
                                                                        f2 = f4 * f0
                                                                        heapClassInst.heapFloat[(r17 + 130)] = Float32(f1)
                                                                        f1 = f6 * f2
                                                                        f2 = Float64(heapClassInst.heapFloat[(r17 + 131)])
                                                                        f1 = f2 + f1
                                                                        f0 = f3 * f0
                                                                        heapClassInst.heapFloat[(r17 + 131)] = Float32(f1)
                                                                        f0 = f5 * f0
                                                                        f1 = Float64(heapClassInst.heapFloat[(r17 + 132)])
                                                                        f0 = f1 + f0
                                                                        heapClassInst.heapFloat[(r17 + 132)] = Float32(f0)
                                                                    }
                                                                }
                                                                if (!(r15 == 0)) {
                                                                    r17 = r15 >> 2
                                                                    f0 = Float64(heapClassInst.heapFloat[(r17 + 84)])
                                                                    f1 = 0.0
                                                                    if (!(f0 == f1)) {
                                                                        f1 = Float64(heapClassInst.heapFloat[(r11 + 55)])
                                                                        f1 = -f1
                                                                        f2 = Float64(heapClassInst.heapFloat[(r11 + 38)])
                                                                        f2 = f2 * f0
                                                                        f3 = Float64(heapClassInst.heapFloat[(r11 + 39)])
                                                                        f4 = Float64(heapClassInst.heapFloat[(r11 + 40)])
                                                                        f2 = f2 * f1
                                                                        f5 = Float64(heapClassInst.heapFloat[(r17 + 126)])
                                                                        f6 = Float64(heapClassInst.heapFloat[(r11 + 50)])
                                                                        f7 = Float64(heapClassInst.heapFloat[(r11 + 51)])
                                                                        f8 = Float64(heapClassInst.heapFloat[(r11 + 52)])
                                                                        f2 = f5 + f2
                                                                        f3 = f3 * f0
                                                                        heapClassInst.heapFloat[(r17 + 126)] = Float32(f2)
                                                                        f2 = f3 * f1
                                                                        f3 = Float64(heapClassInst.heapFloat[(r17 + 127)])
                                                                        f2 = f3 + f2
                                                                        f0 = f4 * f0
                                                                        heapClassInst.heapFloat[(r17 + 127)] = Float32(f2)
                                                                        f0 = f0 * f1
                                                                        f2 = Float64(heapClassInst.heapFloat[(r17 + 128)])
                                                                        f0 = f2 + f0
                                                                        heapClassInst.heapFloat[(r17 + 128)] = Float32(f0)
                                                                        f0 = Float64(heapClassInst.heapFloat[(r17 + 134)])
                                                                        f0 = f0 * f1
                                                                        f2 = Float64(heapClassInst.heapFloat[(r17 + 136)])
                                                                        f3 = Float64(heapClassInst.heapFloat[(r17 + 135)])
                                                                        f4 = Float64(heapClassInst.heapFloat[(r17 + 130)])
                                                                        f0 = f0 * f6
                                                                        f0 = f4 - f0
                                                                        f3 = f3 * f1
                                                                        heapClassInst.heapFloat[(r17 + 130)] = Float32(f0)
                                                                        f0 = f3 * f7
                                                                        f3 = Float64(heapClassInst.heapFloat[(r17 + 131)])
                                                                        f0 = f3 - f0
                                                                        f1 = f2 * f1
                                                                        heapClassInst.heapFloat[(r17 + 131)] = Float32(f0)
                                                                        f0 = f1 * f8
                                                                        f1 = Float64(heapClassInst.heapFloat[(r17 + 132)])
                                                                        f0 = f1 - f0
                                                                        heapClassInst.heapFloat[(r17 + 132)] = Float32(f0)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            } while (false);
                                            r7 = (r7 + 1) | 0
                                            r4 = (r4 + 276) | 0
                                        } else {
                                            break
                                        }
                                    }
                                }
                                r1 = Int64(heapClassInst.heap32[(fp + (-133))])
                                r1 = (r1 + (-1)) | 0
                                heapClassInst.heap32[(fp + (-133))] = Int32(r1)
                                r3 = Int64(heapClassInst.heap32[(fp + (-132))])
                                r3 = (r3 + 4) | 0
                                heapClassInst.heap32[(fp + (-132))] = Int32(r3)
                                if (!(r1 != 0)) {
                                    break
                                }
                            }
                        }
                    } while (false);
                    r1 = Int64(heapClassInst.heap32[(r2 + 17)])
                    r3 = Int64(heapClassInst.heap32[(r2 + 2)])
                    r4 = Int64(heapClassInst.heap32[(r2 + 12)])
                    do {
                        if (!(r1 > r3)) {
                            if (!(r1 >= r3)) {
                                r5 = Int64(heapClassInst.heap32[(r2 + 18)])
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
                                    r6 = (r0 + 76) | 0
                                    if (r1 < 1) {
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
                                            if (!(r1 != r7)) {
                                                break
                                            }
                                        }
                                        r6 = (r0 + 76) | 0
                                    }
                                    if (!(r8 == 0)) {
                                        r7 = Int64(heapClassInst.heapU8[r0 + 80])
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
                                    heapClassInst.heap8[r0 + 80] = Int8(r7)
                                    heapClassInst.heap32[(r6)] = Int32(r5)
                                    heapClassInst.heap32[(r2 + 18)] = Int32(r3)
                                    if (r1 >= r3) {
                                        break
                                    }
                                }
                                while (true) {
                                    r5 = r1 << 2
                                    r6 = Int64(heapClassInst.heap32[(r2 + 19)])
                                    r5 = (r6 + r5) | 0
                                    r1 = (r1 + 1) | 0
                                    r5 = r5 >> 2
                                    heapClassInst.heap32[(r5)] = 0
                                    if (!(r3 != r1)) {
                                        break
                                    }
                                }
                            }
                        }
                    } while (false);
                    heapClassInst.heap32[(r2 + 17)] = Int32(r3)
                    r1 = Int64(heapClassInst.heap32[(r2 + 22)])
                    do {
                        if (!(r1 > r4)) {
                            if (!(r1 >= r4)) {
                                r5 = Int64(heapClassInst.heap32[(r2 + 23)])
                                if (!(r5 >= r4)) {
                                    if (r4 != 0) {
                                        r5 = gNumAlignedAllocs
                                        r5 = r5 >> 2
                                        r6 = Int64(heapClassInst.heap32[(r5)])
                                        r7 = r4 << 2
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
                                    r6 = (r0 + 96) | 0
                                    if (r1 < 1) {
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
                                            if (!(r1 != r7)) {
                                                break
                                            }
                                        }
                                        r6 = (r0 + 96) | 0
                                    }
                                    if (!(r8 == 0)) {
                                        r7 = Int64(heapClassInst.heapU8[r0 + 100])
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
                                    heapClassInst.heap8[r0 + 100] = Int8(r7)
                                    heapClassInst.heap32[(r6)] = Int32(r5)
                                    heapClassInst.heap32[(r2 + 23)] = Int32(r4)
                                    if (r1 >= r4) {
                                        break
                                    }
                                }
                                while (true) {
                                    r0 = r1 << 2
                                    r5 = Int64(heapClassInst.heap32[(r2 + 24)])
                                    r0 = (r5 + r0) | 0
                                    r1 = (r1 + 1) | 0
                                    r0 = r0 >> 2
                                    heapClassInst.heap32[(r0)] = 0
                                    if (!(r4 != r1)) {
                                        break
                                    }
                                }
                            }
                        }
                    } while (false);
                    heapClassInst.heap32[(r2 + 22)] = Int32(r4)
                    do {
                        if (!(r3 < 1)) {
                            r0 = 0
                            while (true) {
                                r1 = r0 << 2
                                r5 = Int64(heapClassInst.heap32[(r2 + 19)])
                                r1 = (r5 + r1) | 0
                                r5 = (r0 + 1) | 0
                                r1 = r1 >> 2
                                heapClassInst.heap32[(r1)] = Int32(r0)
                                r0 = r5
                                if (!(r3 != r5)) {
                                    break
                                }
                            }
                        }
                    } while (false);
                    if (r4 < 1) {
                        break
                    } else {
                        r0 = 0
                        while (true) {
                            r1 = r0 << 2
                            r3 = Int64(heapClassInst.heap32[(r2 + 24)])
                            r1 = (r3 + r1) | 0
                            r3 = (r0 + 1) | 0
                            r1 = r1 >> 2
                            heapClassInst.heap32[(r1)] = Int32(r0)
                            r0 = r3
                            if (!(r4 != r3)) {
                                break
                            }
                        }
                    }
                case 78 =>
                    r8 = _E2_str1157
                    r0 = _E2_str652
                    heapClassInst.heap32[(g0)] = Int32(r8)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                    heapClassInst.heap32[(g0 + 2)] = 813
                    _assert(i7);
                case _ => println("break");
            }
        }
    } while (false);
    r0 = _ZN15CProfileManager11CurrentNodeE
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    r3 = (r3 + (-1)) | 0
    heapClassInst.heap32[(r2 + 4)] = Int32(r3)
    do {
        if (!(r3 != 0)) {
            r3 = Int64(heapClassInst.heap32[(r2 + 1)])
            if (r3 != 0) {
                r1 = sp + (-8)
                heapClassInst.heap32[(g0)] = Int32(r1)
                heapClassInst.heap32[(g0 + 1)] = 0
                r3 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r3 = r3 >> 2
                r3 = Int64(heapClassInst.heap32[(r3)])
                r3 = r3 >> 2
                r1 = r1 >> 2
                r4 = Int64(heapClassInst.heap32[(fp + (-2))])
                r5 = Int64(heapClassInst.heap32[(r3)])
                r4 = (r4 - r5) | 0
                r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r1 = (r1 - r3) | 0
                r3 = (r4 * 1000000) | 0
                r1 = (r1 + r3) | 0
                r3 = Int64(heapClassInst.heap32[(r2 + 3)])
                r1 = (r1 - r3) | 0
                f0 = Float64(`UIntNative`(r1))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r2 + 2)] = Float32(f0)
                r1 = Int64(heapClassInst.heap32[(r2 + 4)])
                if (r1 != 0) {
                    break
                } else {
                    r1 = Int64(heapClassInst.heap32[(r0)])
                }
            }
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            heapClassInst.heap32[(r0)] = Int32(r1)
        }
    } while (false);
    f0 = 0.0
    commonVariable.f_g0 = f0
    return;
}

func _ZN35btSequentialImpulseConstraintSolver33solveGroupCacheFriendlyIterationsEPP17btCollisionObjectiPP20btPersistentManifoldiPP17btTypedConstraintiRK19btContactSolverInfoP12btIDebugDrawP12btStackAlloc(
    sp: Int64): Unit {
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
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-48)
    var g0 = i7 >> 2;
    r0 = _E2_str854
    r1 = Int64(heapClassInst.heap32[(fp + 7)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = Int64(heapClassInst.heap32[(fp)])
    r2 = Int64(heapClassInst.heap32[(fp + 5)])
    r3 = Int64(heapClassInst.heap32[(fp + 6)])
    r4 = r1 >> 2
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r5 = Int64(heapClassInst.heap32[(r4 + 5)])
    if (!(r5 < 1)) {
        r5 = 0
        while (true) {
            r6 = r0 >> 2
            r7 = Int64(heapClassInst.heap32[(r4 + 15)])
            r8 = r7 & 1
            if (r8 != 0) {
                r8 = r5 & 7
                if (!(r8 != 0)) {
                    r7 = Int64(heapClassInst.heap32[(r6 + 2)])
                    r8 = Int64(heapClassInst.heap32[(r6 + 12)])
                    if (!(r7 < 1)) {
                        r9 = 0
                        r7 = (r9 - r7) | 0
                        r9 = 1
                        while (true) {
                            r10 = Int64(heapClassInst.heap32[(r6 + 19)])
                            r11 = r9 << 2
                            r11 = (r10 + r11) | 0
                            r11 = r11 >> 2
                            r12 = Int64(heapClassInst.heap32[(r6 + 31)])
                            r13 = Int64(heapClassInst.heap32[(r11 + (-1))])
                            r12 = (r12 * 1664525) | 0
                            r12 = (r12 + 1013904223) | 0
                            heapClassInst.heap32[(r6 + 31)] = Int32(r12)
                            if (`UIntNative`(r9) < `UIntNative`(65537)) {
                                r14 = r12 >> 16
                                r12 = r14 ^ r12
                                if (`UIntNative`(r9) < `UIntNative`(257)) {
                                    r14 = r12 >> 8
                                    r12 = r14 ^ r12
                                    if (`UIntNative`(r9) < `UIntNative`(17)) {
                                        r14 = r12 >> 4
                                        r12 = r14 ^ r12
                                        if (`UIntNative`(r9) < `UIntNative`(5)) {
                                            r14 = r12 >> 2
                                            r12 = r14 ^ r12
                                            if (`UIntNative`(r9) < `UIntNative`(3)) {
                                                r14 = r12 >> 1
                                                r12 = r14 ^ r12
                                            }
                                        }
                                    }
                                }
                            }
                            r12 = Int64(floor(Float64(`UIntNative`(r12) % `UIntNative`(r9))))
                            r12 = r12 << 2
                            r10 = (r10 + r12) | 0
                            r10 = r10 >> 2
                            r10 = Int64(heapClassInst.heap32[(r10)])
                            heapClassInst.heap32[(r11 + (-1))] = Int32(r10)
                            r10 = Int64(heapClassInst.heap32[(r6 + 19)])
                            r10 = (r10 + r12) | 0
                            r9 = (r9 + 1) | 0
                            r10 = r10 >> 2
                            heapClassInst.heap32[(r10)] = Int32(r13)
                            r10 = (r7 + r9) | 0
                            if (!(r10 != 1)) {
                                break
                            }
                        }
                    }
                    do {
                        if (!(r8 < 1)) {
                            r7 = 0
                            r7 = (r7 - r8) | 0
                            r8 = 1
                            while (true) {
                                r9 = Int64(heapClassInst.heap32[(r6 + 24)])
                                r10 = r8 << 2
                                r10 = (r9 + r10) | 0
                                r10 = r10 >> 2
                                r11 = Int64(heapClassInst.heap32[(r6 + 31)])
                                r12 = Int64(heapClassInst.heap32[(r10 + (-1))])
                                r11 = (r11 * 1664525) | 0
                                r11 = (r11 + 1013904223) | 0
                                heapClassInst.heap32[(r6 + 31)] = Int32(r11)
                                if (`UIntNative`(r8) < `UIntNative`(65537)) {
                                    r13 = r11 >> 16
                                    r11 = r13 ^ r11
                                    if (`UIntNative`(r8) < `UIntNative`(257)) {
                                        r13 = r11 >> 8
                                        r11 = r13 ^ r11
                                        if (`UIntNative`(r8) < `UIntNative`(17)) {
                                            r13 = r11 >> 4
                                            r11 = r13 ^ r11
                                            if (`UIntNative`(r8) < `UIntNative`(5)) {
                                                r13 = r11 >> 2
                                                r11 = r13 ^ r11
                                                if (`UIntNative`(r8) < `UIntNative`(3)) {
                                                    r13 = r11 >> 1
                                                    r11 = r13 ^ r11
                                                }
                                            }
                                        }
                                    }
                                }
                                r11 = Int64(floor(Float64(`UIntNative`(r11) % `UIntNative`(r8))))
                                r11 = r11 << 2
                                r9 = (r9 + r11) | 0
                                r9 = r9 >> 2
                                r9 = Int64(heapClassInst.heap32[(r9)])
                                heapClassInst.heap32[(r10 + (-1))] = Int32(r9)
                                r9 = Int64(heapClassInst.heap32[(r6 + 24)])
                                r9 = (r9 + r11) | 0
                                r8 = (r8 + 1) | 0
                                r9 = r9 >> 2
                                heapClassInst.heap32[(r9)] = Int32(r12)
                                r9 = (r7 + r8) | 0
                                if (!(r9 != 1)) {
                                    break
                                }
                            }
                        }
                    } while (false);
                    r7 = Int64(heapClassInst.heap32[(r4 + 15)])
                }
            }
            r8 = Int64(heapClassInst.heap32[(r6 + 7)])
            r7 = r7 & 256
            do {
                if (r7 != 0) {
                    do {
                        if (!(r8 < 1)) {
                            r7 = 0
                            r8 = r7
                            while (true) {
                                r9 = (r8 * 34) | 0
                                r10 = Int64(heapClassInst.heap32[(r6 + 9)])
                                r9 = r9 << 2
                                r9 = (r10 + r9) | 0
                                r9 = r9 >> 2
                                r11 = Int64(heapClassInst.heap32[(r9 + 27)])
                                r9 = Int64(heapClassInst.heap32[(r9 + 26)])
                                r10 = (r10 + r7) | 0
                                heapClassInst.heap32[(g0)] = Int32(r9)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r10)
                                r8 = (r8 + 1) | 0
                                r7 = (r7 + 136) | 0
                                _ZN35btSequentialImpulseConstraintSolver33resolveSingleConstraintRowGenericER11btRigidBodyS1_RK18btSolverConstraint(
                                    i7);
                                r9 = Int64(heapClassInst.heap32[(r6 + 7)])
                                if (!(r9 > r8)) {
                                    break
                                }
                            }
                        }
                    } while (false);
                    do {
                        if (!(r3 < 1)) {
                            r7 = r2
                            r8 = r3
                            while (true) {
                                r9 = r7 >> 2
                                r9 = Int64(heapClassInst.heap32[(r9)])
                                r10 = r9 >> 2
                                r11 = Int64(heapClassInst.heap32[(r10)])
                                r11 = r11 >> 2
                                r11 = Int64(heapClassInst.heap32[(r11 + 6)])
                                f0 = Float64(heapClassInst.heapFloat[(r4 + 3)])
                                r12 = Int64(heapClassInst.heap32[(r10 + 6)])
                                r10 = Int64(heapClassInst.heap32[(r10 + 5)])
                                heapClassInst.heap32[(g0)] = Int32(r9)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r10)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r12)
                                heapClassInst.heapFloat[(g0 + 3)] = Float32(f0)
                                r8 = (r8 + (-1)) | 0
                                r7 = (r7 + 4) | 0
                                __FUNCTION_TABLE__[(r11) >> 2](i7);
                                if (!(r8 != 0)) {
                                    break
                                }
                            }
                        }
                    } while (false);
                    r7 = Int64(heapClassInst.heap32[(r6 + 2)])
                    do {
                        if (!(r7 < 1)) {
                            r8 = 0
                            while (true) {
                                r9 = Int64(heapClassInst.heap32[(r6 + 19)])
                                r10 = r8 << 2
                                r9 = (r9 + r10) | 0
                                r9 = r9 >> 2
                                r9 = Int64(heapClassInst.heap32[(r9)])
                                r9 = (r9 * 136) | 0
                                r10 = Int64(heapClassInst.heap32[(r6 + 4)])
                                r9 = (r10 + r9) | 0
                                r10 = r9 >> 2
                                r11 = Int64(heapClassInst.heap32[(r10 + 27)])
                                r10 = Int64(heapClassInst.heap32[(r10 + 26)])
                                heapClassInst.heap32[(g0)] = Int32(r10)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r9)
                                r8 = (r8 + 1) | 0
                                _ZN35btSequentialImpulseConstraintSolver36resolveSingleConstraintRowLowerLimitER11btRigidBodyS1_RK18btSolverConstraint(
                                    i7);
                                if (!(r7 != r8)) {
                                    break
                                }
                            }
                        }
                    } while (false);
                    r7 = Int64(heapClassInst.heap32[(r6 + 12)])
                    if (r7 < 1) {
                        break
                    } else {
                        r8 = 0
                        while (true) {
                            r9 = Int64(heapClassInst.heap32[(r6 + 24)])
                            r10 = r8 << 2
                            r9 = (r9 + r10) | 0
                            r9 = r9 >> 2
                            r9 = Int64(heapClassInst.heap32[(r9)])
                            r10 = Int64(heapClassInst.heap32[(r6 + 14)])
                            r9 = (r9 * 136) | 0
                            r9 = (r10 + r9) | 0
                            r10 = r9 >> 2
                            r11 = Int64(heapClassInst.heap32[(r10 + 25)])
                            r12 = Int64(heapClassInst.heap32[(r6 + 4)])
                            r11 = (r11 * 136) | 0
                            r11 = (r12 + r11) | 0
                            r11 = r11 >> 2
                            f0 = Float64(heapClassInst.heapFloat[(r11 + 21)])
                            f1 = 0.0
                            if (!(f0 <= f1)) {
                                f1 = Float64(heapClassInst.heapFloat[(r10 + 22)])
                                f0 = f1 * f0
                                f1 = -f0
                                heapClassInst.heapFloat[(r10 + 31)] = Float32(f1)
                                heapClassInst.heapFloat[(r10 + 32)] = Float32(f0)
                                r11 = Int64(heapClassInst.heap32[(r10 + 27)])
                                r10 = Int64(heapClassInst.heap32[(r10 + 26)])
                                heapClassInst.heap32[(g0)] = Int32(r10)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r9)
                                _ZN35btSequentialImpulseConstraintSolver33resolveSingleConstraintRowGenericER11btRigidBodyS1_RK18btSolverConstraint(
                                    i7);
                            }
                            r8 = (r8 + 1) | 0
                            if (r7 == r8) {
                                break
                            } else {
                                continue
                            }
                        }
                    }
                } else {
                    do {
                        if (!(r8 < 1)) {
                            r8 = 0
                            r7 = r8
                            while (true) {
                                r9 = (r7 * 34) | 0
                                r10 = Int64(heapClassInst.heap32[(r6 + 9)])
                                r9 = r9 << 2
                                r9 = (r10 + r9) | 0
                                r9 = r9 >> 2
                                r11 = Int64(heapClassInst.heap32[(r9 + 27)])
                                r9 = Int64(heapClassInst.heap32[(r9 + 26)])
                                r10 = (r10 + r8) | 0
                                heapClassInst.heap32[(g0)] = Int32(r9)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r10)
                                r7 = (r7 + 1) | 0
                                r8 = (r8 + 136) | 0
                                _ZN35btSequentialImpulseConstraintSolver33resolveSingleConstraintRowGenericER11btRigidBodyS1_RK18btSolverConstraint(
                                    i7);
                                r9 = Int64(heapClassInst.heap32[(r6 + 7)])
                                if (!(r9 > r7)) {
                                    break
                                }
                            }
                        }
                    } while (false);
                    do {
                        if (!(r3 < 1)) {
                            r7 = r2
                            r8 = r3
                            while (true) {
                                r9 = r7 >> 2
                                r9 = Int64(heapClassInst.heap32[(r9)])
                                r10 = r9 >> 2
                                r11 = Int64(heapClassInst.heap32[(r10)])
                                r11 = r11 >> 2
                                r11 = Int64(heapClassInst.heap32[(r11 + 6)])
                                f0 = Float64(heapClassInst.heapFloat[(r4 + 3)])
                                r12 = Int64(heapClassInst.heap32[(r10 + 6)])
                                r10 = Int64(heapClassInst.heap32[(r10 + 5)])
                                heapClassInst.heap32[(g0)] = Int32(r9)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r10)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r12)
                                heapClassInst.heapFloat[(g0 + 3)] = Float32(f0)
                                r8 = (r8 + (-1)) | 0
                                r7 = (r7 + 4) | 0
                                __FUNCTION_TABLE__[(r11) >> 2](i7);
                                if (!(r8 != 0)) {
                                    break
                                }
                            }
                        }
                    } while (false);
                    r7 = Int64(heapClassInst.heap32[(r6 + 2)])
                    do {
                        if (!(r7 < 1)) {
                            r8 = 0
                            while (true) {
                                r9 = Int64(heapClassInst.heap32[(r6 + 19)])
                                r10 = r8 << 2
                                r9 = (r9 + r10) | 0
                                r9 = r9 >> 2
                                r9 = Int64(heapClassInst.heap32[(r9)])
                                r9 = (r9 * 136) | 0
                                r10 = Int64(heapClassInst.heap32[(r6 + 4)])
                                r9 = (r10 + r9) | 0
                                r10 = r9 >> 2
                                r11 = Int64(heapClassInst.heap32[(r10 + 27)])
                                r10 = Int64(heapClassInst.heap32[(r10 + 26)])
                                heapClassInst.heap32[(g0)] = Int32(r10)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r9)
                                r8 = (r8 + 1) | 0
                                _ZN35btSequentialImpulseConstraintSolver36resolveSingleConstraintRowLowerLimitER11btRigidBodyS1_RK18btSolverConstraint(
                                    i7);
                                if (!(r7 != r8)) {
                                    break
                                }
                            }
                        }
                    } while (false);
                    r7 = Int64(heapClassInst.heap32[(r6 + 12)])
                    if (!(r7 < 1)) {
                        r8 = 0
                        while (true) {
                            r9 = Int64(heapClassInst.heap32[(r6 + 24)])
                            r10 = r8 << 2
                            r9 = (r9 + r10) | 0
                            r9 = r9 >> 2
                            r9 = Int64(heapClassInst.heap32[(r9)])
                            r10 = Int64(heapClassInst.heap32[(r6 + 14)])
                            r9 = (r9 * 136) | 0
                            r9 = (r10 + r9) | 0
                            r10 = r9 >> 2
                            r11 = Int64(heapClassInst.heap32[(r10 + 25)])
                            r12 = Int64(heapClassInst.heap32[(r6 + 4)])
                            r11 = (r11 * 136) | 0
                            r11 = (r12 + r11) | 0
                            r11 = r11 >> 2
                            f0 = Float64(heapClassInst.heapFloat[(r11 + 21)])
                            f1 = 0.0
                            if (!(f0 <= f1)) {
                                f1 = Float64(heapClassInst.heapFloat[(r10 + 22)])
                                f0 = f1 * f0
                                f1 = -f0
                                heapClassInst.heapFloat[(r10 + 31)] = Float32(f1)
                                heapClassInst.heapFloat[(r10 + 32)] = Float32(f0)
                                r11 = Int64(heapClassInst.heap32[(r10 + 27)])
                                r10 = Int64(heapClassInst.heap32[(r10 + 26)])
                                heapClassInst.heap32[(g0)] = Int32(r10)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r9)
                                _ZN35btSequentialImpulseConstraintSolver33resolveSingleConstraintRowGenericER11btRigidBodyS1_RK18btSolverConstraint(
                                    i7);
                            }
                            r8 = (r8 + 1) | 0
                            if (!(r7 != r8)) {
                                break
                            }
                        }
                    }
                }
            } while (false);
            r5 = (r5 + 1) | 0
            r6 = Int64(heapClassInst.heap32[(r4 + 5)])
            if (r6 > r5) {
                continue
            } else {
                break
            }
        }
    }
    r4 = Int64(heapClassInst.heap32[(fp + 1)])
    r5 = Int64(heapClassInst.heap32[(fp + 2)])
    r6 = Int64(heapClassInst.heap32[(fp + 3)])
    r7 = Int64(heapClassInst.heap32[(fp + 4)])
    r8 = Int64(heapClassInst.heap32[(fp + 8)])
    r9 = Int64(heapClassInst.heap32[(fp + 9)])
    r10 = r0 >> 2
    r10 = Int64(heapClassInst.heap32[(r10)])
    r10 = r10 >> 2
    r10 = Int64(heapClassInst.heap32[(r10 + 6)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r4)
    heapClassInst.heap32[(g0 + 2)] = Int32(r5)
    heapClassInst.heap32[(g0 + 3)] = Int32(r6)
    heapClassInst.heap32[(g0 + 4)] = Int32(r7)
    heapClassInst.heap32[(g0 + 5)] = Int32(r2)
    heapClassInst.heap32[(g0 + 6)] = Int32(r3)
    heapClassInst.heap32[(g0 + 7)] = Int32(r1)
    heapClassInst.heap32[(g0 + 8)] = Int32(r8)
    heapClassInst.heap32[(g0 + 9)] = Int32(r9)
    r0 = _ZN15CProfileManager11CurrentNodeE
    __FUNCTION_TABLE__[(r10) >> 2](i7);
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    r3 = (r3 + (-1)) | 0
    heapClassInst.heap32[(r2 + 4)] = Int32(r3)
    do {
        if (!(r3 != 0)) {
            r3 = Int64(heapClassInst.heap32[(r2 + 1)])
            if (r3 != 0) {
                r1 = sp + (-8)
                heapClassInst.heap32[(g0)] = Int32(r1)
                heapClassInst.heap32[(g0 + 1)] = 0
                r3 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r3 = r3 >> 2
                r3 = Int64(heapClassInst.heap32[(r3)])
                r3 = r3 >> 2
                r1 = r1 >> 2
                r4 = Int64(heapClassInst.heap32[(fp + (-2))])
                r5 = Int64(heapClassInst.heap32[(r3)])
                r4 = (r4 - r5) | 0
                r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r1 = (r1 - r3) | 0
                r3 = (r4 * 1000000) | 0
                r1 = (r1 + r3) | 0
                r3 = Int64(heapClassInst.heap32[(r2 + 3)])
                r1 = (r1 - r3) | 0
                f0 = Float64(`UIntNative`(r1))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r2 + 2)] = Float32(f0)
                r1 = Int64(heapClassInst.heap32[(r2 + 4)])
                if (r1 != 0) {
                    break
                } else {
                    r1 = Int64(heapClassInst.heap32[(r0)])
                }
            }
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            heapClassInst.heap32[(r0)] = Int32(r1)
        }
    } while (false);
    f0 = 0.0
    commonVariable.f_g0 = f0
    return;
}

func _ZN35btSequentialImpulseConstraintSolver21addFrictionConstraintERK9btVector3P11btRigidBodyS4_iR15btManifoldPointS2_S2_P17btCollisionObjectS8_fff(
    sp: Int64): Unit {
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
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-288)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 13)])
    r3 = Int64(heapClassInst.heap32[(r1 + 12)])
    r4 = Int64(heapClassInst.heap32[(fp + 1)])
    r5 = Int64(heapClassInst.heap32[(fp + 2)])
    r6 = Int64(heapClassInst.heap32[(fp + 3)])
    r7 = Int64(heapClassInst.heap32[(fp + 4)])
    r8 = Int64(heapClassInst.heap32[(fp + 5)])
    r9 = Int64(heapClassInst.heap32[(fp + 6)])
    r10 = Int64(heapClassInst.heap32[(fp + 7)])
    f0 = Float64(heapClassInst.heapFloat[(fp + 8)])
    f1 = Float64(heapClassInst.heapFloat[(fp + 9)])
    f2 = Float64(heapClassInst.heapFloat[(fp + 10)])
    if (r2 == r3) {
        r11 = 1
        r12 = r3 << 1
        r12 = if (r3 == 0) {
            r11
        } else {
            r12
        };
        if (r2 >= r12) {
            __label__ = 1
        } else {
            if (r12 != 0) {
                r2 = gNumAlignedAllocs
                r2 = r2 >> 2
                r13 = Int64(heapClassInst.heap32[(r2)])
                r14 = (r12 * 136) | 0
                r13 = (r13 + 1) | 0
                r14 = r14 | 3
                heapClassInst.heap32[(r2)] = Int32(r13)
                r2 = (r14 + 16) | 0
                heapClassInst.heap32[(g0)] = Int32(r2)
                mallocNew(i7);
                r13 = commonVariable.r_g0
                if (r13 != 0) {
                    r2 = 0
                    r14 = (r13 + 4) | 0
                    r2 = (r2 - r14) | 0
                    r2 = r2 & 15
                    r2 = (r13 + r2) | 0
                    r14 = (r2 + 4) | 0
                    r2 = r2 >> 2
                    heapClassInst.heap32[(r2)] = Int32(r13)
                    r13 = r14
                }
            } else {
                r13 = 0
            }
            r14 = (r0 + 56) | 0
            if (r3 < 1) {
                r2 = r14 >> 2
                r16 = Int64(heapClassInst.heap32[(r2)])
            } else {
                r2 = 0
                r15 = r3
                while (true) {
                    r16 = r14 >> 2
                    r16 = Int64(heapClassInst.heap32[(r16)])
                    r17 = (r13 + r2) | 0
                    r18 = (r16 + r2) | 0
                    heapClassInst.heap32[(g0)] = Int32(r17)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r18)
                    heapClassInst.heap32[(g0 + 2)] = 136
                    r15 = (r15 + (-1)) | 0
                    r2 = (r2 + 136) | 0
                    memcpy(i7);
                    if (!(r15 != 0)) {
                        break
                    }
                }
                r14 = (r0 + 56) | 0
            }
            if (r16 != 0) {
                r2 = Int64(heapClassInst.heapU8[r0 + 60])
                if (r2 != 0) {
                    r2 = gNumAlignedFree
                    r2 = r2 >> 2
                    r15 = Int64(heapClassInst.heap32[(r2)])
                    r15 = (r15 + 1) | 0
                    r16 = r16 >> 2
                    heapClassInst.heap32[(r2)] = Int32(r15)
                    r2 = Int64(heapClassInst.heap32[(r16 + (-1))])
                    heapClassInst.heap32[(g0)] = Int32(r2)
                    free(i7);
                    r2 = Int64(heapClassInst.heap32[(r1 + 12)])
                } else {
                    r2 = r3
                }
                r15 = r14 >> 2
                heapClassInst.heap32[(r15)] = 0
            } else {
                r2 = r3
            }
            r14 = r14 >> 2
            heapClassInst.heap8[r0 + 60] = Int8(r11)
            heapClassInst.heap32[(r14)] = Int32(r13)
            heapClassInst.heap32[(r1 + 13)] = Int32(r12)
            __label__ = 19
        }
    } else {
        __label__ = 1
    }
    if (__label__ == 1) {
        r2 = r3
    }
    r0 = (r2 + 1) | 0
    heapClassInst.heap32[(r1 + 12)] = Int32(r0)
    r0 = Int64(heapClassInst.heap32[(r1 + 14)])
    r1 = (r3 * 136) | 0
    r0 = (r0 + r1) | 0
    r0 = r0 >> 2
    heapClassInst.heap32[(r0 + 25)] = Int32(r5)
    r1 = Int64(heapClassInst.heapU8[r9 + 232])
    r1 = r1 & 2
    if (!(r1 != 0)) {
        r9 = 0
    }
    r1 = Int64(heapClassInst.heapU8[r10 + 232])
    r1 = r1 & 2
    if (!(r1 != 0)) {
        r10 = 0
    }
    r1 = r4 >> 2
    heapClassInst.heap32[(r0 + 4)] = heapClassInst.heap32[(r1)]
    heapClassInst.heap32[(r0 + 5)] = heapClassInst.heap32[(r1 + 1)]
    heapClassInst.heap32[(r0 + 6)] = heapClassInst.heap32[(r1 + 2)]
    heapClassInst.heap32[(r0 + 7)] = heapClassInst.heap32[(r1 + 3)]
    if (r9 == 0) {
        r2 = _ZGVZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
        r3 = Int64(heapClassInst.heapU8[r2])
        if (!(r3 != 0)) {
            r3 = _ZZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
            r4 = r3 >> 2
            heapClassInst.heap32[(r4 + 41)] = 1065353216
            heapClassInst.heap32[(r4 + 42)] = 1065353216
            heapClassInst.heap32[(r4 + 43)] = 1065353216
            heapClassInst.heap32[(r4 + 44)] = 0
            heapClassInst.heap32[(r4 + 45)] = 0
            heapClassInst.heap32[(r4 + 46)] = 1566444395
            heapClassInst.heap32[(r4 + 47)] = 0
            heapClassInst.heap32[(r4 + 48)] = 0
            heapClassInst.heap32[(r4 + 49)] = 0
            heapClassInst.heap32[(r4 + 50)] = 0
            heapClassInst.heap32[(r4 + 51)] = 1
            heapClassInst.heap32[(r4 + 52)] = (-1)
            heapClassInst.heap32[(r4 + 53)] = (-1)
            heapClassInst.heap32[(r4 + 54)] = 1
            heapClassInst.heap32[(r4 + 55)] = 0
            heapClassInst.heap32[(r4 + 56)] = 1056964608
            heapClassInst.heap32[(r4 + 57)] = 0
            heapClassInst.heap32[(r4 + 58)] = 1
            heapClassInst.heap32[(r4 + 59)] = 0
            heapClassInst.heap32[(r4 + 60)] = 1065353216
            heapClassInst.heap32[(r4 + 61)] = 0
            heapClassInst.heap32[(r4 + 62)] = 0
            heapClassInst.heap32[(r4 + 63)] = 0
            heapClassInst.heap32[(r4 + 1)] = 1065353216
            heapClassInst.heap32[(r4 + 2)] = 0
            heapClassInst.heap32[(r4 + 3)] = 0
            heapClassInst.heap32[(r4 + 4)] = 0
            heapClassInst.heap32[(r4 + 5)] = 0
            heapClassInst.heap32[(r4 + 6)] = 1065353216
            heapClassInst.heap32[(r4 + 7)] = 0
            heapClassInst.heap32[(r4 + 8)] = 0
            heapClassInst.heap32[(r4 + 9)] = 0
            heapClassInst.heap32[(r4 + 10)] = 0
            heapClassInst.heap32[(r4 + 11)] = 1065353216
            heapClassInst.heap32[(r4 + 12)] = 0
            heapClassInst.heap32[(r4 + 13)] = 0
            heapClassInst.heap32[(r4 + 14)] = 0
            r5 = _ZTV11btRigidBody
            heapClassInst.heap32[(r4 + 15)] = 0
            r5 = (r5 + 8) | 0
            heapClassInst.heap32[(r4 + 16)] = 0
            r11 = 1
            heapClassInst.heap32[(r4)] = Int32(r5)
            heapClassInst.heap8[r3 + 492] = Int8(r11)
            heapClassInst.heap32[(r4 + 122)] = 0
            heapClassInst.heap32[(r4 + 120)] = 0
            r5 = sp + (-272)
            heapClassInst.heap32[(r4 + 121)] = 0
            r4 = r5 >> 2
            heapClassInst.heap32[(fp + (-68))] = 0
            heapClassInst.heap32[(r4 + 1)] = 0
            heapClassInst.heap32[(r4 + 18)] = 0
            heapClassInst.heap32[(r4 + 19)] = 0
            heapClassInst.heap32[(r4 + 20)] = 0
            heapClassInst.heap32[(r4 + 21)] = 0
            heapClassInst.heap32[(r4 + 22)] = 0
            heapClassInst.heap32[(r4 + 23)] = 0
            heapClassInst.heap32[(r4 + 24)] = 0
            heapClassInst.heap32[(r4 + 25)] = 1056964608
            heapClassInst.heap32[(r4 + 26)] = 0
            heapClassInst.heap32[(r4 + 27)] = 1061997773
            r12 = 0
            heapClassInst.heap32[(r4 + 28)] = 1065353216
            heapClassInst.heap8[sp + (-156)] = Int8(r12)
            heapClassInst.heap32[(r4 + 30)] = 1000593162
            heapClassInst.heap32[(r4 + 31)] = 1008981770
            heapClassInst.heap32[(r4 + 32)] = 1008981770
            heapClassInst.heap32[(r4 + 33)] = 1008981770
            heapClassInst.heap32[(r4 + 2)] = 1065353216
            heapClassInst.heap32[(r4 + 3)] = 0
            heapClassInst.heap32[(r4 + 4)] = 0
            heapClassInst.heap32[(r4 + 5)] = 0
            heapClassInst.heap32[(r4 + 6)] = 0
            heapClassInst.heap32[(r4 + 7)] = 1065353216
            heapClassInst.heap32[(r4 + 8)] = 0
            heapClassInst.heap32[(r4 + 9)] = 0
            heapClassInst.heap32[(r4 + 10)] = 0
            heapClassInst.heap32[(r4 + 11)] = 0
            heapClassInst.heap32[(r4 + 12)] = 1065353216
            heapClassInst.heap32[(r4 + 13)] = 0
            heapClassInst.heap32[(r4 + 14)] = 0
            heapClassInst.heap32[(r4 + 15)] = 0
            heapClassInst.heap32[(r4 + 16)] = 0
            heapClassInst.heap32[(r4 + 17)] = 0
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = Int32(r5)
            _ZN11btRigidBody14setupRigidBodyERKNS_27btRigidBodyConstructionInfoE(i7);
            heapClassInst.heap8[r2] = Int8(r11)
        }
        r2 = _ZZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
        r3 = r2 >> 2
        r4 = Int64(heapClassInst.heap32[(r3 + 51)])
        r4 = r4 | 1
        heapClassInst.heap32[(r3 + 51)] = Int32(r4)
        heapClassInst.heap32[(r3 + 84)] = 0
        f3 = 0.0
        f4 = Float64(heapClassInst.heapFloat[(r3 + 95)])
        f5 = Float64(heapClassInst.heapFloat[(r3 + 94)])
        f6 = Float64(heapClassInst.heapFloat[(r3 + 93)])
        f6 = f6 * f3
        f5 = f5 * f3
        heapClassInst.heapFloat[(r3 + 89)] = Float32(f6)
        f4 = f4 * f3
        heapClassInst.heapFloat[(r3 + 90)] = Float32(f5)
        heapClassInst.heapFloat[(r3 + 91)] = Float32(f4)
        heapClassInst.heap32[(r3 + 92)] = 0
        heapClassInst.heap32[(r3 + 97)] = 0
        heapClassInst.heap32[(r3 + 98)] = 0
        heapClassInst.heap32[(r3 + 99)] = 0
        heapClassInst.heap32[(r3 + 100)] = 0
        f4 = Float64(heapClassInst.heapFloat[(r3 + 87)])
        f5 = Float64(heapClassInst.heapFloat[(r3 + 86)])
        f6 = Float64(heapClassInst.heapFloat[(r3 + 85)])
        f6 = f6 * f3
        f5 = f5 * f3
        heapClassInst.heapFloat[(r3 + 138)] = Float32(f6)
        f3 = f4 * f3
        heapClassInst.heapFloat[(r3 + 139)] = Float32(f5)
        heapClassInst.heapFloat[(r3 + 140)] = Float32(f3)
        heapClassInst.heap32[(r3 + 141)] = 0
    } else {
        r2 = r9
    }
    heapClassInst.heap32[(r0 + 26)] = Int32(r2)
    if (r10 == 0) {
        r2 = _ZGVZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
        r3 = Int64(heapClassInst.heapU8[r2])
        if (!(r3 != 0)) {
            r3 = _ZZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
            r4 = r3 >> 2
            heapClassInst.heap32[(r4 + 41)] = 1065353216
            heapClassInst.heap32[(r4 + 42)] = 1065353216
            heapClassInst.heap32[(r4 + 43)] = 1065353216
            heapClassInst.heap32[(r4 + 44)] = 0
            heapClassInst.heap32[(r4 + 45)] = 0
            heapClassInst.heap32[(r4 + 46)] = 1566444395
            heapClassInst.heap32[(r4 + 47)] = 0
            heapClassInst.heap32[(r4 + 48)] = 0
            heapClassInst.heap32[(r4 + 49)] = 0
            heapClassInst.heap32[(r4 + 50)] = 0
            heapClassInst.heap32[(r4 + 51)] = 1
            heapClassInst.heap32[(r4 + 52)] = (-1)
            heapClassInst.heap32[(r4 + 53)] = (-1)
            heapClassInst.heap32[(r4 + 54)] = 1
            heapClassInst.heap32[(r4 + 55)] = 0
            heapClassInst.heap32[(r4 + 56)] = 1056964608
            heapClassInst.heap32[(r4 + 57)] = 0
            heapClassInst.heap32[(r4 + 58)] = 1
            heapClassInst.heap32[(r4 + 59)] = 0
            heapClassInst.heap32[(r4 + 60)] = 1065353216
            heapClassInst.heap32[(r4 + 61)] = 0
            heapClassInst.heap32[(r4 + 62)] = 0
            heapClassInst.heap32[(r4 + 63)] = 0
            heapClassInst.heap32[(r4 + 1)] = 1065353216
            heapClassInst.heap32[(r4 + 2)] = 0
            heapClassInst.heap32[(r4 + 3)] = 0
            heapClassInst.heap32[(r4 + 4)] = 0
            heapClassInst.heap32[(r4 + 5)] = 0
            heapClassInst.heap32[(r4 + 6)] = 1065353216
            heapClassInst.heap32[(r4 + 7)] = 0
            heapClassInst.heap32[(r4 + 8)] = 0
            heapClassInst.heap32[(r4 + 9)] = 0
            heapClassInst.heap32[(r4 + 10)] = 0
            heapClassInst.heap32[(r4 + 11)] = 1065353216
            heapClassInst.heap32[(r4 + 12)] = 0
            heapClassInst.heap32[(r4 + 13)] = 0
            heapClassInst.heap32[(r4 + 14)] = 0
            r5 = _ZTV11btRigidBody
            heapClassInst.heap32[(r4 + 15)] = 0
            r5 = (r5 + 8) | 0
            heapClassInst.heap32[(r4 + 16)] = 0
            r11 = 1
            heapClassInst.heap32[(r4)] = Int32(r5)
            heapClassInst.heap8[r3 + 492] = Int8(r11)
            heapClassInst.heap32[(r4 + 122)] = 0
            heapClassInst.heap32[(r4 + 120)] = 0
            r5 = sp + (-136)
            heapClassInst.heap32[(r4 + 121)] = 0
            r4 = r5 >> 2
            heapClassInst.heap32[(fp + (-34))] = 0
            heapClassInst.heap32[(r4 + 1)] = 0
            heapClassInst.heap32[(r4 + 18)] = 0
            heapClassInst.heap32[(r4 + 19)] = 0
            heapClassInst.heap32[(r4 + 20)] = 0
            heapClassInst.heap32[(r4 + 21)] = 0
            heapClassInst.heap32[(r4 + 22)] = 0
            heapClassInst.heap32[(r4 + 23)] = 0
            heapClassInst.heap32[(r4 + 24)] = 0
            heapClassInst.heap32[(r4 + 25)] = 1056964608
            heapClassInst.heap32[(r4 + 26)] = 0
            heapClassInst.heap32[(r4 + 27)] = 1061997773
            r12 = 0
            heapClassInst.heap32[(r4 + 28)] = 1065353216
            heapClassInst.heap8[sp + (-20)] = Int8(r12)
            heapClassInst.heap32[(r4 + 30)] = 1000593162
            heapClassInst.heap32[(r4 + 31)] = 1008981770
            heapClassInst.heap32[(r4 + 32)] = 1008981770
            heapClassInst.heap32[(r4 + 33)] = 1008981770
            heapClassInst.heap32[(r4 + 2)] = 1065353216
            heapClassInst.heap32[(r4 + 3)] = 0
            heapClassInst.heap32[(r4 + 4)] = 0
            heapClassInst.heap32[(r4 + 5)] = 0
            heapClassInst.heap32[(r4 + 6)] = 0
            heapClassInst.heap32[(r4 + 7)] = 1065353216
            heapClassInst.heap32[(r4 + 8)] = 0
            heapClassInst.heap32[(r4 + 9)] = 0
            heapClassInst.heap32[(r4 + 10)] = 0
            heapClassInst.heap32[(r4 + 11)] = 0
            heapClassInst.heap32[(r4 + 12)] = 1065353216
            heapClassInst.heap32[(r4 + 13)] = 0
            heapClassInst.heap32[(r4 + 14)] = 0
            heapClassInst.heap32[(r4 + 15)] = 0
            heapClassInst.heap32[(r4 + 16)] = 0
            heapClassInst.heap32[(r4 + 17)] = 0
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = Int32(r5)
            _ZN11btRigidBody14setupRigidBodyERKNS_27btRigidBodyConstructionInfoE(i7);
            heapClassInst.heap8[r2] = Int8(r11)
        }
        r2 = _ZZN35btSequentialImpulseConstraintSolver12getFixedBodyEvE7s_fixed
        r3 = r2 >> 2
        r4 = Int64(heapClassInst.heap32[(r3 + 51)])
        r4 = r4 | 1
        heapClassInst.heap32[(r3 + 51)] = Int32(r4)
        heapClassInst.heap32[(r3 + 84)] = 0
        f3 = 0.0
        f4 = Float64(heapClassInst.heapFloat[(r3 + 95)])
        f5 = Float64(heapClassInst.heapFloat[(r3 + 94)])
        f6 = Float64(heapClassInst.heapFloat[(r3 + 93)])
        f6 = f6 * f3
        f5 = f5 * f3
        heapClassInst.heapFloat[(r3 + 89)] = Float32(f6)
        f4 = f4 * f3
        heapClassInst.heapFloat[(r3 + 90)] = Float32(f5)
        heapClassInst.heapFloat[(r3 + 91)] = Float32(f4)
        heapClassInst.heap32[(r3 + 92)] = 0
        heapClassInst.heap32[(r3 + 97)] = 0
        heapClassInst.heap32[(r3 + 98)] = 0
        heapClassInst.heap32[(r3 + 99)] = 0
        heapClassInst.heap32[(r3 + 100)] = 0
        f4 = Float64(heapClassInst.heapFloat[(r3 + 87)])
        f5 = Float64(heapClassInst.heapFloat[(r3 + 86)])
        f6 = Float64(heapClassInst.heapFloat[(r3 + 85)])
        f6 = f6 * f3
        f5 = f5 * f3
        heapClassInst.heapFloat[(r3 + 138)] = Float32(f6)
        f3 = f4 * f3
        heapClassInst.heapFloat[(r3 + 139)] = Float32(f5)
        heapClassInst.heapFloat[(r3 + 140)] = Float32(f3)
        heapClassInst.heap32[(r3 + 141)] = 0
    } else {
        r2 = r10
    }
    r3 = r6 >> 2
    heapClassInst.heap32[(r0 + 27)] = Int32(r2)
    heapClassInst.heap32[(r0 + 22)] = heapClassInst.heap32[(r3 + 21)]
    heapClassInst.heap32[(r0 + 28)] = 0
    heapClassInst.heap32[(r0 + 21)] = 0
    heapClassInst.heap32[(r0 + 20)] = 0
    r2 = r7 >> 2
    f3 = Float64(heapClassInst.heapFloat[(r0 + 5)])
    f4 = Float64(heapClassInst.heapFloat[(r2 + 2)])
    f5 = Float64(heapClassInst.heapFloat[(r0 + 6)])
    f6 = Float64(heapClassInst.heapFloat[(r2 + 1)])
    f7 = Float64(heapClassInst.heapFloat[(r0 + 4)])
    f8 = Float64(heapClassInst.heapFloat[(r2)])
    f9 = f6 * f5
    f10 = f4 * f3
    f9 = f9 - f10
    f4 = f4 * f7
    f10 = f8 * f5
    f4 = f4 - f10
    heapClassInst.heapFloat[(r0)] = Float32(f9)
    f8 = f8 * f3
    f6 = f6 * f7
    f6 = f8 - f6
    heapClassInst.heapFloat[(r0 + 1)] = Float32(f4)
    heapClassInst.heapFloat[(r0 + 2)] = Float32(f6)
    heapClassInst.heap32[(r0 + 3)] = 0
    if (r9 == 0) {
        heapClassInst.heap32[(r0 + 12)] = 0
        heapClassInst.heap32[(r0 + 13)] = 0
        f10 = 0.0
        heapClassInst.heap32[(r0 + 14)] = 0
        heapClassInst.heap32[(r0 + 15)] = 0
        f11 = f10
        f8 = f10
    } else {
        r3 = r9 >> 2
        f8 = Float64(heapClassInst.heapFloat[(r3 + 64)])
        f10 = Float64(heapClassInst.heapFloat[(r3 + 65)])
        f11 = Float64(heapClassInst.heapFloat[(r3 + 68)])
        f12 = Float64(heapClassInst.heapFloat[(r3 + 69)])
        f8 = f8 * f9
        f10 = f10 * f4
        f13 = Float64(heapClassInst.heapFloat[(r3 + 66)])
        f14 = Float64(heapClassInst.heapFloat[(r3 + 72)])
        f15 = Float64(heapClassInst.heapFloat[(r3 + 73)])
        f16 = Float64(heapClassInst.heapFloat[(r3 + 70)])
        f11 = f11 * f9
        f12 = f12 * f4
        f8 = f8 + f10
        f10 = f13 * f6
        f13 = Float64(heapClassInst.heapFloat[(r3 + 74)])
        f14 = f14 * f9
        f15 = f15 * f4
        f11 = f11 + f12
        f12 = f16 * f6
        f8 = f8 + f10
        f10 = Float64(heapClassInst.heapFloat[(r3 + 134)])
        f16 = Float64(heapClassInst.heapFloat[(r3 + 136)])
        f17 = Float64(heapClassInst.heapFloat[(r3 + 135)])
        f11 = f11 + f12
        f8 = f8 * f10
        f10 = f14 + f15
        f12 = f13 * f6
        f10 = f10 + f12
        f11 = f11 * f17
        heapClassInst.heapFloat[(r0 + 12)] = Float32(f8)
        f10 = f10 * f16
        heapClassInst.heapFloat[(r0 + 13)] = Float32(f11)
        heapClassInst.heapFloat[(r0 + 14)] = Float32(f10)
        heapClassInst.heap32[(r0 + 15)] = 0
    }
    r3 = r8 >> 2
    f12 = Float64(heapClassInst.heapFloat[(r3 + 2)])
    f13 = Float64(heapClassInst.heapFloat[(r3 + 1)])
    f14 = Float64(heapClassInst.heapFloat[(r3)])
    f15 = f12 * f3
    f16 = f13 * f5
    f15 = f15 - f16
    f16 = f14 * f5
    f12 = f12 * f7
    f12 = f16 - f12
    heapClassInst.heapFloat[(r0 + 8)] = Float32(f15)
    f13 = f13 * f7
    f14 = f14 * f3
    f13 = f13 - f14
    heapClassInst.heapFloat[(r0 + 9)] = Float32(f12)
    heapClassInst.heapFloat[(r0 + 10)] = Float32(f13)
    heapClassInst.heap32[(r0 + 11)] = 0
    if (r10 == 0) {
        heapClassInst.heap32[(r0 + 16)] = 0
        heapClassInst.heap32[(r0 + 17)] = 0
        f14 = 0.0
        heapClassInst.heap32[(r0 + 18)] = 0
        heapClassInst.heap32[(r0 + 19)] = 0
        f17 = f14
        f16 = f14
    } else {
        r4 = r10 >> 2
        f14 = Float64(heapClassInst.heapFloat[(r4 + 64)])
        f16 = Float64(heapClassInst.heapFloat[(r4 + 65)])
        f17 = Float64(heapClassInst.heapFloat[(r4 + 68)])
        f18 = Float64(heapClassInst.heapFloat[(r4 + 69)])
        f14 = f14 * f15
        f16 = f16 * f12
        f19 = Float64(heapClassInst.heapFloat[(r4 + 66)])
        f20 = Float64(heapClassInst.heapFloat[(r4 + 72)])
        f21 = Float64(heapClassInst.heapFloat[(r4 + 73)])
        f22 = Float64(heapClassInst.heapFloat[(r4 + 70)])
        f17 = f17 * f15
        f18 = f18 * f12
        f14 = f14 + f16
        f16 = f19 * f13
        f19 = Float64(heapClassInst.heapFloat[(r4 + 74)])
        f20 = f20 * f15
        f21 = f21 * f12
        f17 = f17 + f18
        f18 = f22 * f13
        f14 = f14 + f16
        f16 = Float64(heapClassInst.heapFloat[(r4 + 134)])
        f22 = Float64(heapClassInst.heapFloat[(r4 + 136)])
        f23 = Float64(heapClassInst.heapFloat[(r4 + 135)])
        f17 = f17 + f18
        f14 = f14 * f16
        f16 = f20 + f21
        f18 = f19 * f13
        f16 = f16 + f18
        f17 = f17 * f23
        heapClassInst.heapFloat[(r0 + 16)] = Float32(f14)
        f16 = f16 * f22
        heapClassInst.heapFloat[(r0 + 17)] = Float32(f17)
        heapClassInst.heapFloat[(r0 + 18)] = Float32(f16)
        heapClassInst.heap32[(r0 + 19)] = 0
    }
    if (r9 != 0) {
        f18 = Float64(heapClassInst.heapFloat[(r2 + 1)])
        f19 = Float64(heapClassInst.heapFloat[(r2 + 2)])
        f20 = Float64(heapClassInst.heapFloat[(r2)])
        f21 = f11 * f19
        f22 = f10 * f18
        f10 = f10 * f20
        f19 = f8 * f19
        f23 = Float64(heapClassInst.heapFloat[(r1)])
        f21 = f21 - f22
        f22 = Float64(heapClassInst.heapFloat[(r1 + 1)])
        f10 = f10 - f19
        f8 = f8 * f18
        f11 = f11 * f20
        f18 = f23 * f21
        f10 = f22 * f10
        f19 = Float64(heapClassInst.heapFloat[(r1 + 2)])
        f8 = f8 - f11
        r2 = r9 >> 2
        f10 = f18 + f10
        f8 = f19 * f8
        f11 = Float64(heapClassInst.heapFloat[(r2 + 84)])
        f8 = f10 + f8
        f8 = f11 + f8
    } else {
        f8 = 0.0
    }
    if (r10 != 0) {
        f10 = Float64(heapClassInst.heapFloat[(r3 + 2)])
        f11 = Float64(heapClassInst.heapFloat[(r3)])
        f18 = Float64(heapClassInst.heapFloat[(r3 + 1)])
        f19 = f18 * f16
        f20 = f10 * f17
        f10 = f10 * f14
        f16 = f11 * f16
        f21 = Float64(heapClassInst.heapFloat[(r1)])
        f19 = f19 - f20
        f20 = Float64(heapClassInst.heapFloat[(r1 + 1)])
        f10 = f10 - f16
        f11 = f11 * f17
        f14 = f18 * f14
        f16 = f21 * f19
        f10 = f20 * f10
        f17 = Float64(heapClassInst.heapFloat[(r1 + 2)])
        f14 = f11 - f14
        r1 = r10 >> 2
        f10 = f16 + f10
        f14 = f17 * f14
        f11 = Float64(heapClassInst.heapFloat[(r1 + 84)])
        f14 = f10 + f14
        f14 = f11 + f14
    } else {
        f14 = 0.0
    }
    f8 = f8 + f14
    f0 = f0 / f8
    heapClassInst.heapFloat[(r0 + 23)] = Float32(f0)
    if (r9 != 0) {
        r1 = r9 >> 2
        f8 = Float64(heapClassInst.heapFloat[(r1 + 76)])
        f10 = Float64(heapClassInst.heapFloat[(r1 + 77)])
        f8 = f7 * f8
        f10 = f3 * f10
        f11 = Float64(heapClassInst.heapFloat[(r1 + 78)])
        f8 = f8 + f10
        f10 = f5 * f11
        f10 = f8 + f10
        f14 = Float64(heapClassInst.heapFloat[(r1 + 80)])
        f11 = Float64(heapClassInst.heapFloat[(r1 + 81)])
        f8 = Float64(heapClassInst.heapFloat[(r1 + 82)])
    } else {
        f8 = 0.0
        f10 = f7 * f8
        f11 = f3 * f8
        f10 = f10 + f11
        f11 = f5 * f8
        f10 = f10 + f11
        f11 = f8
        f14 = f8
    }
    f9 = f9 * f14
    f4 = f4 * f11
    f4 = f9 + f4
    f6 = f6 * f8
    f4 = f4 + f6
    f4 = f10 + f4
    if (r10 != 0) {
        r1 = r10 >> 2
        f6 = Float64(heapClassInst.heapFloat[(r1 + 80)])
        f8 = Float64(heapClassInst.heapFloat[(r1 + 81)])
        f6 = f15 * f6
        f12 = f12 * f8
        f15 = Float64(heapClassInst.heapFloat[(r1 + 82)])
        f6 = f6 + f12
        f12 = f13 * f15
        f12 = f6 + f12
        f15 = Float64(heapClassInst.heapFloat[(r1 + 76)])
        f13 = Float64(heapClassInst.heapFloat[(r1 + 77)])
        f6 = Float64(heapClassInst.heapFloat[(r1 + 78)])
    } else {
        f6 = 0.0
        f15 = f15 * f6
        f12 = f12 * f6
        f12 = f15 + f12
        f13 = f13 * f6
        f12 = f12 + f13
        f13 = f6
        f15 = f6
    }
    f7 = f7 * f15
    f3 = f3 * f13
    f3 = f7 + f3
    f5 = f5 * f6
    f3 = f3 + f5
    f3 = f12 - f3
    f3 = f4 + f3
    f1 = f1 - f3
    f0 = f0 * f1
    heapClassInst.heapFloat[(r0 + 29)] = Float32(f0)
    heapClassInst.heapFloat[(r0 + 30)] = Float32(f2)
    heapClassInst.heap32[(r0 + 31)] = 0
    heapClassInst.heap32[(r0 + 32)] = 1343554297
    return;
}

func _ZN23btDiscreteDynamicsWorld11setNumTasksEi(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

func _ZN23btDiscreteDynamicsWorld14updateVehiclesEf(sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-24)
    var g0 = i7 >> 2;
    r0 = _E2_str289
    r1 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = r1 >> 2
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r2 = Int64(heapClassInst.heap32[(r0 + 63)])
    if (!(r2 < 1)) {
        f0 = Float64(heapClassInst.heapFloat[(fp + 1)])
        r2 = 0
        while (true) {
            r3 = Int64(heapClassInst.heap32[(r0 + 65)])
            r4 = r2 << 2
            r3 = (r3 + r4) | 0
            r3 = r3 >> 2
            r3 = Int64(heapClassInst.heap32[(r3)])
            r4 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r4)])
            r4 = r4 >> 2
            r4 = Int64(heapClassInst.heap32[(r4 + 2)])
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
            r2 = (r2 + 1) | 0
            __FUNCTION_TABLE__[(r4) >> 2](i7);
            r3 = Int64(heapClassInst.heap32[(r0 + 63)])
            if (r3 > r2) {
                continue
            } else {
                break
            }
        }
    }
    r0 = _ZN15CProfileManager11CurrentNodeE
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    r3 = (r3 + (-1)) | 0
    heapClassInst.heap32[(r2 + 4)] = Int32(r3)
    do {
        if (!(r3 != 0)) {
            r3 = Int64(heapClassInst.heap32[(r2 + 1)])
            if (r3 != 0) {
                r1 = sp + (-8)
                heapClassInst.heap32[(g0)] = Int32(r1)
                heapClassInst.heap32[(g0 + 1)] = 0
                r3 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r3 = r3 >> 2
                r3 = Int64(heapClassInst.heap32[(r3)])
                r3 = r3 >> 2
                r1 = r1 >> 2
                r4 = Int64(heapClassInst.heap32[(fp + (-2))])
                r5 = Int64(heapClassInst.heap32[(r3)])
                r4 = (r4 - r5) | 0
                r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r1 = (r1 - r3) | 0
                r3 = (r4 * 1000000) | 0
                r1 = (r1 + r3) | 0
                r3 = Int64(heapClassInst.heap32[(r2 + 3)])
                r1 = (r1 - r3) | 0
                f0 = Float64(`UIntNative`(r1))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r2 + 2)] = Float32(f0)
                r1 = Int64(heapClassInst.heap32[(r2 + 4)])
                if (r1 != 0) {
                    break
                } else {
                    r1 = Int64(heapClassInst.heap32[(r0)])
                }
            }
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            heapClassInst.heap32[(r0)] = Int32(r1)
        }
    } while (false);
    return;
}

func _ZN15btDynamicsWorld13addConstraintEP17btTypedConstraintb(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

func _ZN15btDynamicsWorld16removeConstraintEP17btTypedConstraint(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

func _ZNK15btDynamicsWorld17getNumConstraintsEv(sp: Int64): Unit {
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

func _ZN15btDynamicsWorld13getConstraintEi(sp: Int64): Unit {
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

func _ZNK15btDynamicsWorld13getConstraintEi(sp: Int64): Unit {
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

func _ZN15btDynamicsWorld10addVehicleEP17btActionInterface(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

func _ZN15btDynamicsWorld13removeVehicleEP17btActionInterface(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

func _ZN15btDynamicsWorld12addCharacterEP17btActionInterface(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

func _ZN15btDynamicsWorld15removeCharacterEP17btActionInterface(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    return;
}

func _ZNK23btDiscreteDynamicsWorld12getWorldTypeEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 2
    commonVariable.r_g0 = r0
    return;
}

func _ZNK23btDiscreteDynamicsWorld10getGravityEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r0 = r0 >> 2
    r1 = r1 >> 2
    heapClassInst.heap32[(r0)] = heapClassInst.heap32[(r1 + 56)]
    heapClassInst.heap32[(r0 + 1)] = heapClassInst.heap32[(r1 + 57)]
    heapClassInst.heap32[(r0 + 2)] = heapClassInst.heap32[(r1 + 58)]
    heapClassInst.heap32[(r0 + 3)] = heapClassInst.heap32[(r1 + 59)]
    return;
}

func _ZN23btDiscreteDynamicsWorld10addVehicleEP17btActionInterface(sp: Int64): Unit {
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
    r1 = Int64(heapClassInst.heap32[(r1 + 15)])
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
}

func _ZN23btDiscreteDynamicsWorld13removeVehicleEP17btActionInterface(sp: Int64): Unit {
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
    r1 = Int64(heapClassInst.heap32[(r1 + 16)])
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
}

func _ZN23btDiscreteDynamicsWorld12addCharacterEP17btActionInterface(sp: Int64): Unit {
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
    r1 = Int64(heapClassInst.heap32[(r1 + 15)])
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
}

func _ZN23btDiscreteDynamicsWorld15removeCharacterEP17btActionInterface(sp: Int64): Unit {
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
    r1 = Int64(heapClassInst.heap32[(r1 + 16)])
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
}

func _ZN34btClosestNotMeConvexResultCallbackD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTVN16btCollisionWorld27ClosestConvexResultCallbackE
    r0 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    return;
}

func _ZN34btClosestNotMeConvexResultCallbackD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTVN16btCollisionWorld27ClosestConvexResultCallbackE
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

func _ZNK34btClosestNotMeConvexResultCallback14needsCollisionEP17btBroadphaseProxy(sp: Int64): Unit {
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
    i7 = sp + (-40)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = r1 >> 2
    r3 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r2)])
    r4 = Int64(heapClassInst.heap32[(r3 + 20)])
    if (r2 != r4) {
        r5 = Int64(heapClassInst.heapU16[(r0 + 10) >> 1])
        r6 = Int64(heapClassInst.heapU16[(r1 + 4) >> 1])
        r5 = r5 & r6
        r5 = r5 & 65535
        if (r5 == 0) {
            __label__ = 1
        } else {
            r5 = Int64(heapClassInst.heapU16[(r1 + 6) >> 1])
            r0 = Int64(heapClassInst.heapU16[(r0 + 8) >> 1])
            r0 = r5 & r0
            r0 = r0 & 65535
            if (r0 == 0) {
                __label__ = 1
            } else {
                r0 = Int64(heapClassInst.heap32[(r3 + 23)])
                r5 = r0 >> 2
                r5 = Int64(heapClassInst.heap32[(r5)])
                r5 = r5 >> 2
                r5 = Int64(heapClassInst.heap32[(r5 + 7)])
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = Int32(r4)
                heapClassInst.heap32[(g0 + 2)] = Int32(r2)
                __FUNCTION_TABLE__[(r5) >> 2](i7);
                r0 = commonVariable.r_g0
                if (r0 != 0) {
                    r0 = sp + (-24)
                    r2 = 1
                    r4 = r0 >> 2
                    heapClassInst.heap8[sp + (-8)] = Int8(r2)
                    heapClassInst.heap32[(r4 + 3)] = 0
                    heapClassInst.heap32[(r4 + 1)] = 0
                    heapClassInst.heap32[(r4 + 2)] = 0
                    r5 = Int64(heapClassInst.heap32[(r3 + 22)])
                    r6 = r5 >> 2
                    r6 = Int64(heapClassInst.heap32[(r6)])
                    r3 = Int64(heapClassInst.heap32[(r3 + 20)])
                    r6 = r6 >> 2
                    r3 = r3 >> 2
                    r6 = Int64(heapClassInst.heap32[(r6 + 13)])
                    r3 = Int64(heapClassInst.heap32[(r3 + 47)])
                    heapClassInst.heap32[(g0)] = Int32(r5)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                    heapClassInst.heap32[(g0 + 2)] = Int32(r1)
                    __FUNCTION_TABLE__[(r6) >> 2](i7);
                    r1 = commonVariable.r_g0
                    do {
                        if (!(r1 == 0)) {
                            r1 = r1 >> 2
                            r3 = Int64(heapClassInst.heap32[(r1 + 2)])
                            if (!(r3 == 0)) {
                                r3 = Int64(heapClassInst.heap32[(r4 + 1)])
                                if (!(r3 > (-1))) {
                                    r5 = Int64(heapClassInst.heap32[(r4 + 2)])
                                    if (r5 < 0) {
                                        r5 = Int64(heapClassInst.heap32[(r4 + 3)])
                                        if (!(r5 == 0)) {
                                            r6 = Int64(heapClassInst.heapU8[sp + (-8)])
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
                                            heapClassInst.heap32[(r4 + 3)] = 0
                                        }
                                        heapClassInst.heap8[sp + (-8)] = Int8(r2)
                                        heapClassInst.heap32[(r4 + 3)] = 0
                                        heapClassInst.heap32[(r4 + 2)] = 0
                                    }
                                    while (true) {
                                        r2 = r3 << 2
                                        r5 = Int64(heapClassInst.heap32[(r4 + 3)])
                                        r2 = (r5 + r2) | 0
                                        r3 = (r3 + 1) | 0
                                        r2 = r2 >> 2
                                        heapClassInst.heap32[(r2)] = 0
                                        if (!(r3 != 0)) {
                                            break
                                        }
                                    }
                                }
                                heapClassInst.heap32[(r4 + 1)] = 0
                                r1 = Int64(heapClassInst.heap32[(r1 + 2)])
                                r2 = r1 >> 2
                                r2 = Int64(heapClassInst.heap32[(r2)])
                                r2 = r2 >> 2
                                r2 = Int64(heapClassInst.heap32[(r2 + 4)])
                                heapClassInst.heap32[(g0)] = Int32(r1)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                                __FUNCTION_TABLE__[(r2) >> 2](i7);
                                r0 = Int64(heapClassInst.heap32[(r4 + 1)])
                                r1 = 0
                                while (true) {
                                    if (r0 > r1) {
                                        r2 = Int64(heapClassInst.heap32[(r4 + 3)])
                                        r3 = r1 << 2
                                        r3 = (r2 + r3) | 0
                                        r3 = r3 >> 2
                                        r3 = Int64(heapClassInst.heap32[(r3)])
                                        r3 = r3 >> 2
                                        r3 = Int64(heapClassInst.heap32[(r3 + 279)])
                                        if (r3 > 0) {
                                            break
                                        } else {
                                            r1 = (r1 + 1) | 0
                                        }
                                    } else {
                                        break
                                    }
                                }
                                if (!(r2 == 0)) {
                                    r0 = Int64(heapClassInst.heapU8[sp + (-8)])
                                    if (!(r0 == 0)) {
                                        r0 = gNumAlignedFree
                                        r0 = r0 >> 2
                                        r1 = Int64(heapClassInst.heap32[(r0)])
                                        r1 = (r1 + 1) | 0
                                        r2 = r2 >> 2
                                        heapClassInst.heap32[(r0)] = Int32(r1)
                                        r0 = Int64(heapClassInst.heap32[(r2 + (-1))])
                                        heapClassInst.heap32[(g0)] = Int32(r0)
                                        free(i7);
                                    }
                                }
                                r0 = 0
                                commonVariable.r_g0 = r0
                                return;
                            }
                        }
                    } while (false);
                    r0 = Int64(heapClassInst.heap32[(r4 + 3)])
                    if (!(r0 == 0)) {
                        r2 = Int64(heapClassInst.heapU8[sp + (-8)])
                        if (!(r2 == 0)) {
                            r2 = gNumAlignedFree
                            r2 = r2 >> 2
                            r1 = Int64(heapClassInst.heap32[(r2)])
                            r1 = (r1 + 1) | 0
                            r0 = r0 >> 2
                            heapClassInst.heap32[(r2)] = Int32(r1)
                            r0 = Int64(heapClassInst.heap32[(r0 + (-1))])
                            heapClassInst.heap32[(g0)] = Int32(r0)
                            free(i7);
                        }
                    }
                    r0 = 1
                    commonVariable.r_g0 = r0
                    return;
                } else {
                    r0 = 1
                    __label__ = 28
                }
            }
        }
    } else {
        __label__ = 1
    }
    if (__label__ == 1) {
        r0 = 0
    }
    r0 = r0 & 255
    commonVariable.r_g0 = r0
    return;
}

func _ZN34btClosestNotMeConvexResultCallback15addSingleResultERN16btCollisionWorld17LocalConvexResultEb(sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(fp)])
    r3 = Int64(heapClassInst.heap32[(r1)])
    r4 = r2 >> 2
    r5 = Int64(heapClassInst.heap32[(r4 + 20)])
    if (!(r3 == r5)) {
        r3 = Int64(heapClassInst.heapU8[r3 + 204])
        r3 = r3 & 4
        if (!(r3 != 0)) {
            f0 = Float64(heapClassInst.heapFloat[(r4 + 7)])
            f1 = Float64(heapClassInst.heapFloat[(r4 + 3)])
            f2 = Float64(heapClassInst.heapFloat[(r4 + 8)])
            f3 = Float64(heapClassInst.heapFloat[(r4 + 4)])
            f4 = Float64(heapClassInst.heapFloat[(r1 + 2)])
            f0 = f0 - f1
            f1 = Float64(heapClassInst.heapFloat[(r1 + 3)])
            f2 = f2 - f3
            f3 = Float64(heapClassInst.heapFloat[(r4 + 9)])
            f5 = Float64(heapClassInst.heapFloat[(r4 + 5)])
            f0 = f4 * f0
            f1 = f1 * f2
            f2 = Float64(heapClassInst.heapFloat[(r1 + 4)])
            f3 = f3 - f5
            f4 = Float64(heapClassInst.heapFloat[(r4 + 21)])
            f0 = f0 + f1
            f1 = f2 * f3
            f0 = f0 + f1
            f1 = -f4
            if (!(f0 >= f1)) {
                r1 = Int64(heapClassInst.heap32[(fp + 2)])
                heapClassInst.heap32[(g0)] = Int32(r2)
                heapClassInst.heap32[(g0 + 1)] = Int32(r0)
                heapClassInst.heap32[(g0 + 2)] = Int32(r1)
                _ZN16btCollisionWorld27ClosestConvexResultCallback15addSingleResultERNS_17LocalConvexResultEb(i7);
                return;
            }
        }
    }
    f0 = 1.0
    commonVariable.f_g0 = f0
    return;
}

func _ZN23btDiscreteDynamicsWorld19getConstraintSolverEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 44)])
    commonVariable.r_g0 = r0
    return;
}

func _ZNK23btDiscreteDynamicsWorld17getNumConstraintsEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0 + 47)])
    commonVariable.r_g0 = r0
    return;
}

func _ZN23btDiscreteDynamicsWorld13getConstraintEi(sp: Int64): Unit {
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
    r0 = Int64(heapClassInst.heap32[(r0 + 49)])
    r1 = r1 << 2
    r0 = (r0 + r1) | 0
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0)])
    commonVariable.r_g0 = r0
    return;
}

func _ZN23btDiscreteDynamicsWorld11clearForcesEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0 + 52)])
    if (!(r1 < 1)) {
        r1 = 0
        while (true) {
            r2 = Int64(heapClassInst.heap32[(r0 + 54)])
            r3 = r1 << 2
            r2 = (r2 + r3) | 0
            r2 = r2 >> 2
            r2 = Int64(heapClassInst.heap32[(r2)])
            r2 = r2 >> 2
            r1 = (r1 + 1) | 0
            heapClassInst.heap32[(r2 + 101)] = 0
            heapClassInst.heap32[(r2 + 102)] = 0
            heapClassInst.heap32[(r2 + 103)] = 0
            heapClassInst.heap32[(r2 + 104)] = 0
            heapClassInst.heap32[(r2 + 105)] = 0
            heapClassInst.heap32[(r2 + 106)] = 0
            heapClassInst.heap32[(r2 + 107)] = 0
            heapClassInst.heap32[(r2 + 108)] = 0
            r2 = Int64(heapClassInst.heap32[(r0 + 52)])
            if (r2 > r1) {
                continue
            } else {
                break
            }
        }
    }
    return;
}

func _ZNK23btDiscreteDynamicsWorld13getConstraintEi(sp: Int64): Unit {
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
    r0 = Int64(heapClassInst.heap32[(r0 + 49)])
    r1 = r1 << 2
    r0 = (r0 + r1) | 0
    r0 = r0 >> 2
    r0 = Int64(heapClassInst.heap32[(r0)])
    commonVariable.r_g0 = r0
    return;
}

func _ZN23btDiscreteDynamicsWorld12removeActionEP17btActionInterface(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = Int64(heapClassInst.heap32[(r0 + 63)])
    r3 = 0
    while (true) {
        if (r2 > r3) {
            r4 = Int64(heapClassInst.heap32[(r0 + 65)])
            r5 = r3 << 2
            r4 = (r4 + r5) | 0
            r4 = r4 >> 2
            r4 = Int64(heapClassInst.heap32[(r4)])
            if (r4 != r1) {
                r3 = (r3 + 1) | 0
                continue
            } else {
                __label__ = 5
                break
            }
        } else {
            __label__ = 4
            break
        }
    }
    if (__label__ == 4) {
        r3 = r2
    }
    if (!(r2 <= r3)) {
        r1 = (r2 + (-1)) | 0
        r2 = r3 << 2
        r3 = Int64(heapClassInst.heap32[(r0 + 65)])
        r1 = r1 << 2
        r2 = (r3 + r2) | 0
        r3 = (r3 + r1) | 0
        r2 = r2 >> 2
        r3 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r2)])
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(r2)] = Int32(r3)
        r2 = Int64(heapClassInst.heap32[(r0 + 65)])
        r1 = (r2 + r1) | 0
        r1 = r1 >> 2
        heapClassInst.heap32[(r1)] = Int32(r4)
        r1 = Int64(heapClassInst.heap32[(r0 + 63)])
        r1 = (r1 + (-1)) | 0
        heapClassInst.heap32[(r0 + 63)] = Int32(r1)
    }
    return;
}

func _ZZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoEN27InplaceSolverIslandCallbackD1Ev(
    sp: Int64): Unit {
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
    r1 = _ZTVZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoE27InplaceSolverIslandCallback
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 21)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 88])
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
        heapClassInst.heap32[(r2 + 21)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 88] = Int8(r1)
    heapClassInst.heap32[(r2 + 21)] = 0
    heapClassInst.heap32[(r2 + 19)] = 0
    heapClassInst.heap32[(r2 + 20)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 16)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 68])
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
        heapClassInst.heap32[(r2 + 16)] = 0
    }
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
    return;
}

func _ZZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoEN27InplaceSolverIslandCallbackD0Ev(
    sp: Int64): Unit {
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
    r1 = _ZTVZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoE27InplaceSolverIslandCallback
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 21)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 88])
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
        heapClassInst.heap32[(r2 + 21)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 88] = Int8(r1)
    heapClassInst.heap32[(r2 + 21)] = 0
    heapClassInst.heap32[(r2 + 19)] = 0
    heapClassInst.heap32[(r2 + 20)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 16)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 68])
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
        heapClassInst.heap32[(r2 + 16)] = 0
    }
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
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

func _ZZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoEN27InplaceSolverIslandCallback13ProcessIslandEPP17btCollisionObjectiPP20btPersistentManifoldii(
    sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-48)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(fp + 5)])
    r3 = Int64(heapClassInst.heap32[(fp + 1)])
    r4 = Int64(heapClassInst.heap32[(fp + 2)])
    r5 = Int64(heapClassInst.heap32[(fp + 3)])
    r6 = Int64(heapClassInst.heap32[(fp + 4)])
    r7 = Int64(heapClassInst.heap32[(r1 + 4)])
    do {
        if (r2 < 0) {
            r0 = 0
            r0 = (r0 - r6) | 0
            if (r7 == r0) {
                break
            } else {
                r0 = Int64(heapClassInst.heap32[(r1 + 2)])
                r2 = r0 >> 2
                r2 = Int64(heapClassInst.heap32[(r2)])
                r2 = r2 >> 2
                r2 = Int64(heapClassInst.heap32[(r2 + 3)])
                r8 = Int64(heapClassInst.heap32[(r1 + 7)])
                r9 = Int64(heapClassInst.heap32[(r1 + 6)])
                r10 = Int64(heapClassInst.heap32[(r1 + 5)])
                r11 = Int64(heapClassInst.heap32[(r1 + 1)])
                r1 = Int64(heapClassInst.heap32[(r1 + 3)])
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                heapClassInst.heap32[(g0 + 2)] = Int32(r4)
                heapClassInst.heap32[(g0 + 3)] = Int32(r5)
                heapClassInst.heap32[(g0 + 4)] = Int32(r6)
                heapClassInst.heap32[(g0 + 5)] = Int32(r1)
                heapClassInst.heap32[(g0 + 6)] = Int32(r7)
                heapClassInst.heap32[(g0 + 7)] = Int32(r11)
                heapClassInst.heap32[(g0 + 8)] = Int32(r10)
                heapClassInst.heap32[(g0 + 9)] = Int32(r9)
                heapClassInst.heap32[(g0 + 10)] = Int32(r8)
                __FUNCTION_TABLE__[(r2) >> 2](i7);
                return;
            }
        } else {
            r8 = 1
            r9 = 4
            r10 = 0
            while (true) {
                if (r7 > r10) {
                    r11 = Int64(heapClassInst.heap32[(r1 + 3)])
                    r12 = r10 << 2
                    r12 = (r11 + r12) | 0
                    r12 = r12 >> 2
                    r12 = Int64(heapClassInst.heap32[(r12)])
                    r12 = r12 >> 2
                    r13 = Int64(heapClassInst.heap32[(r12 + 5)])
                    r13 = r13 >> 2
                    r13 = Int64(heapClassInst.heap32[(r13 + 52)])
                    if (r13 < 0) {
                        r13 = Int64(heapClassInst.heap32[(r12 + 6)])
                        r13 = r13 >> 2
                        r13 = Int64(heapClassInst.heap32[(r13 + 52)])
                    }
                    r10 = (r10 + 1) | 0
                    r9 = (r9 + (-4)) | 0
                    r8 = (r8 + (-1)) | 0
                    if (r13 == r2) {
                        __label__ = 9
                        break
                    } else {
                        __label__ = 7
                    }
                } else {
                    __label__ = 8
                    break
                }
            }
            do {
                match (__label__) {
                    case 9 =>
                        r10 = if (r7 > r10) {
                            r7
                        } else {
                            r10
                        };
                        r7 = (r11 - r9) | 0
                        r9 = (r10 + r8) | 0
                        r8 = 0
                        r10 = r7
                        while (true) {
                            r11 = r10 >> 2
                            r11 = Int64(heapClassInst.heap32[(r11)])
                            r11 = r11 >> 2
                            r12 = Int64(heapClassInst.heap32[(r11 + 5)])
                            r12 = r12 >> 2
                            r12 = Int64(heapClassInst.heap32[(r12 + 52)])
                            if (r12 < 0) {
                                r12 = Int64(heapClassInst.heap32[(r11 + 6)])
                                r12 = r12 >> 2
                                r12 = Int64(heapClassInst.heap32[(r12 + 52)])
                            }
                            r11 = if (r12 == r2) {
                                1
                            } else {
                                0
                            };
                            r11 = r11 & 1
                            r9 = (r9 + (-1)) | 0
                            r8 = (r11 + r8) | 0
                            r10 = (r10 + 4) | 0
                            if (!(r9 != 0)) {
                                break
                            }
                        }
                    case 8 =>
                        r7 = 0
                        r8 = r7
                    case _ => println("break");
                }
            } while (false);
            r2 = Int64(heapClassInst.heap32[(r1 + 1)])
            r9 = r2 >> 2
            r9 = Int64(heapClassInst.heap32[(r9 + 17)])
            if (r9 < 2) {
                r0 = 0
                r0 = (r0 - r6) | 0
                if (r8 == r0) {
                    break
                } else {
                    r0 = Int64(heapClassInst.heap32[(r1 + 2)])
                    r9 = r0 >> 2
                    r9 = Int64(heapClassInst.heap32[(r9)])
                    r9 = r9 >> 2
                    r9 = Int64(heapClassInst.heap32[(r9 + 3)])
                    r10 = Int64(heapClassInst.heap32[(r1 + 7)])
                    r11 = Int64(heapClassInst.heap32[(r1 + 6)])
                    r1 = Int64(heapClassInst.heap32[(r1 + 5)])
                    heapClassInst.heap32[(g0)] = Int32(r0)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                    heapClassInst.heap32[(g0 + 2)] = Int32(r4)
                    heapClassInst.heap32[(g0 + 3)] = Int32(r5)
                    heapClassInst.heap32[(g0 + 4)] = Int32(r6)
                    heapClassInst.heap32[(g0 + 5)] = Int32(r7)
                    heapClassInst.heap32[(g0 + 6)] = Int32(r8)
                    heapClassInst.heap32[(g0 + 7)] = Int32(r2)
                    heapClassInst.heap32[(g0 + 8)] = Int32(r1)
                    heapClassInst.heap32[(g0 + 9)] = Int32(r11)
                    heapClassInst.heap32[(g0 + 10)] = Int32(r10)
                    __FUNCTION_TABLE__[(r9) >> 2](i7);
                    return;
                }
            } else {
                do {
                    if (r4 > 0) {
                        r2 = Int64(heapClassInst.heap32[(r1 + 9)])
                        while (true) {
                            r9 = Int64(heapClassInst.heap32[(r1 + 10)])
                            if (r9 == r2) {
                                r10 = 1
                                r11 = r2 << 1
                                r11 = if (r2 == 0) {
                                    r10
                                } else {
                                    r11
                                };
                                if (!(r9 >= r11)) {
                                    if (r11 != 0) {
                                        r9 = gNumAlignedAllocs
                                        r9 = r9 >> 2
                                        r12 = Int64(heapClassInst.heap32[(r9)])
                                        r13 = r11 << 2
                                        r12 = (r12 + 1) | 0
                                        r13 = r13 | 3
                                        heapClassInst.heap32[(r9)] = Int32(r12)
                                        r9 = (r13 + 16) | 0
                                        heapClassInst.heap32[(g0)] = Int32(r9)
                                        mallocNew(i7);
                                        r9 = commonVariable.r_g0
                                        if (r9 != 0) {
                                            r12 = 0
                                            r13 = (r9 + 4) | 0
                                            r12 = (r12 - r13) | 0
                                            r12 = r12 & 15
                                            r12 = (r9 + r12) | 0
                                            r13 = (r12 + 4) | 0
                                            r12 = r12 >> 2
                                            heapClassInst.heap32[(r12)] = Int32(r9)
                                            r9 = r13
                                        }
                                    } else {
                                        r9 = 0
                                    }
                                    if (r2 < 1) {
                                        r13 = Int64(heapClassInst.heap32[(r1 + 11)])
                                    } else {
                                        r12 = 0
                                        while (true) {
                                            r13 = Int64(heapClassInst.heap32[(r1 + 11)])
                                            r14 = r12 << 2
                                            r15 = (r13 + r14) | 0
                                            r15 = r15 >> 2
                                            r14 = (r9 + r14) | 0
                                            r15 = Int64(heapClassInst.heap32[(r15)])
                                            r12 = (r12 + 1) | 0
                                            r14 = r14 >> 2
                                            heapClassInst.heap32[(r14)] = Int32(r15)
                                            if (!(r2 != r12)) {
                                                break
                                            }
                                        }
                                    }
                                    if (r13 != 0) {
                                        r12 = Int64(heapClassInst.heapU8[r0 + 48])
                                        if (r12 != 0) {
                                            r2 = gNumAlignedFree
                                            r2 = r2 >> 2
                                            r12 = Int64(heapClassInst.heap32[(r2)])
                                            r12 = (r12 + 1) | 0
                                            r13 = r13 >> 2
                                            heapClassInst.heap32[(r2)] = Int32(r12)
                                            r2 = Int64(heapClassInst.heap32[(r13 + (-1))])
                                            heapClassInst.heap32[(g0)] = Int32(r2)
                                            free(i7);
                                            r2 = Int64(heapClassInst.heap32[(r1 + 9)])
                                        }
                                        heapClassInst.heap32[(r1 + 11)] = 0
                                    }
                                    heapClassInst.heap8[r0 + 48] = Int8(r10)
                                    heapClassInst.heap32[(r1 + 11)] = Int32(r9)
                                    heapClassInst.heap32[(r1 + 10)] = Int32(r11)
                                }
                            }
                            r9 = r3 >> 2
                            r2 = r2 << 2
                            r10 = Int64(heapClassInst.heap32[(r1 + 11)])
                            r2 = (r10 + r2) | 0
                            r9 = Int64(heapClassInst.heap32[(r9)])
                            r2 = r2 >> 2
                            heapClassInst.heap32[(r2)] = Int32(r9)
                            r2 = Int64(heapClassInst.heap32[(r1 + 9)])
                            r2 = (r2 + 1) | 0
                            r4 = (r4 + (-1)) | 0
                            r3 = (r3 + 4) | 0
                            heapClassInst.heap32[(r1 + 9)] = Int32(r2)
                            if (!(r4 != 0)) {
                                break
                            }
                        }
                    }
                } while (false);
                do {
                    if (!(r6 < 1)) {
                        r2 = Int64(heapClassInst.heap32[(r1 + 14)])
                        while (true) {
                            r3 = Int64(heapClassInst.heap32[(r1 + 15)])
                            if (r3 == r2) {
                                r4 = 1
                                r9 = r2 << 1
                                r9 = if (r2 == 0) {
                                    r4
                                } else {
                                    r9
                                };
                                if (!(r3 >= r9)) {
                                    if (r9 != 0) {
                                        r3 = gNumAlignedAllocs
                                        r3 = r3 >> 2
                                        r10 = Int64(heapClassInst.heap32[(r3)])
                                        r11 = r9 << 2
                                        r10 = (r10 + 1) | 0
                                        r11 = r11 | 3
                                        heapClassInst.heap32[(r3)] = Int32(r10)
                                        r3 = (r11 + 16) | 0
                                        heapClassInst.heap32[(g0)] = Int32(r3)
                                        mallocNew(i7);
                                        r3 = commonVariable.r_g0
                                        if (r3 != 0) {
                                            r10 = 0
                                            r11 = (r3 + 4) | 0
                                            r10 = (r10 - r11) | 0
                                            r10 = r10 & 15
                                            r10 = (r3 + r10) | 0
                                            r11 = (r10 + 4) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r3)
                                            r3 = r11
                                        }
                                    } else {
                                        r3 = 0
                                    }
                                    if (r2 < 1) {
                                        r11 = Int64(heapClassInst.heap32[(r1 + 16)])
                                    } else {
                                        r10 = 0
                                        while (true) {
                                            r11 = Int64(heapClassInst.heap32[(r1 + 16)])
                                            r12 = r10 << 2
                                            r13 = (r11 + r12) | 0
                                            r13 = r13 >> 2
                                            r12 = (r3 + r12) | 0
                                            r13 = Int64(heapClassInst.heap32[(r13)])
                                            r10 = (r10 + 1) | 0
                                            r12 = r12 >> 2
                                            heapClassInst.heap32[(r12)] = Int32(r13)
                                            if (!(r2 != r10)) {
                                                break
                                            }
                                        }
                                    }
                                    if (r11 != 0) {
                                        r10 = Int64(heapClassInst.heapU8[r0 + 68])
                                        if (r10 != 0) {
                                            r2 = gNumAlignedFree
                                            r2 = r2 >> 2
                                            r10 = Int64(heapClassInst.heap32[(r2)])
                                            r10 = (r10 + 1) | 0
                                            r11 = r11 >> 2
                                            heapClassInst.heap32[(r2)] = Int32(r10)
                                            r2 = Int64(heapClassInst.heap32[(r11 + (-1))])
                                            heapClassInst.heap32[(g0)] = Int32(r2)
                                            free(i7);
                                            r2 = Int64(heapClassInst.heap32[(r1 + 14)])
                                        }
                                        heapClassInst.heap32[(r1 + 16)] = 0
                                    }
                                    heapClassInst.heap8[r0 + 68] = Int8(r4)
                                    heapClassInst.heap32[(r1 + 16)] = Int32(r3)
                                    heapClassInst.heap32[(r1 + 15)] = Int32(r9)
                                }
                            }
                            r3 = r5 >> 2
                            r2 = r2 << 2
                            r4 = Int64(heapClassInst.heap32[(r1 + 16)])
                            r2 = (r4 + r2) | 0
                            r3 = Int64(heapClassInst.heap32[(r3)])
                            r2 = r2 >> 2
                            heapClassInst.heap32[(r2)] = Int32(r3)
                            r2 = Int64(heapClassInst.heap32[(r1 + 14)])
                            r2 = (r2 + 1) | 0
                            r6 = (r6 + (-1)) | 0
                            r5 = (r5 + 4) | 0
                            heapClassInst.heap32[(r1 + 14)] = Int32(r2)
                            if (!(r6 != 0)) {
                                break
                            }
                        }
                    }
                } while (false);
                do {
                    if (r8 > 0) {
                        r2 = Int64(heapClassInst.heap32[(r1 + 19)])
                        while (true) {
                            r3 = Int64(heapClassInst.heap32[(r1 + 20)])
                            if (r3 == r2) {
                                r4 = 1
                                r5 = r2 << 1
                                r5 = if (r2 == 0) {
                                    r4
                                } else {
                                    r5
                                };
                                if (!(r3 >= r5)) {
                                    if (r5 != 0) {
                                        r3 = gNumAlignedAllocs
                                        r3 = r3 >> 2
                                        r6 = Int64(heapClassInst.heap32[(r3)])
                                        r9 = r5 << 2
                                        r6 = (r6 + 1) | 0
                                        r9 = r9 | 3
                                        heapClassInst.heap32[(r3)] = Int32(r6)
                                        r3 = (r9 + 16) | 0
                                        heapClassInst.heap32[(g0)] = Int32(r3)
                                        mallocNew(i7);
                                        r3 = commonVariable.r_g0
                                        if (r3 != 0) {
                                            r6 = 0
                                            r9 = (r3 + 4) | 0
                                            r6 = (r6 - r9) | 0
                                            r6 = r6 & 15
                                            r6 = (r3 + r6) | 0
                                            r9 = (r6 + 4) | 0
                                            r6 = r6 >> 2
                                            heapClassInst.heap32[(r6)] = Int32(r3)
                                            r3 = r9
                                        }
                                    } else {
                                        r3 = 0
                                    }
                                    if (r2 < 1) {
                                        r9 = Int64(heapClassInst.heap32[(r1 + 21)])
                                    } else {
                                        r6 = 0
                                        while (true) {
                                            r9 = Int64(heapClassInst.heap32[(r1 + 21)])
                                            r10 = r6 << 2
                                            r11 = (r9 + r10) | 0
                                            r11 = r11 >> 2
                                            r10 = (r3 + r10) | 0
                                            r11 = Int64(heapClassInst.heap32[(r11)])
                                            r6 = (r6 + 1) | 0
                                            r10 = r10 >> 2
                                            heapClassInst.heap32[(r10)] = Int32(r11)
                                            if (!(r2 != r6)) {
                                                break
                                            }
                                        }
                                    }
                                    if (r9 != 0) {
                                        r6 = Int64(heapClassInst.heapU8[r0 + 88])
                                        if (r6 != 0) {
                                            r2 = gNumAlignedFree
                                            r2 = r2 >> 2
                                            r6 = Int64(heapClassInst.heap32[(r2)])
                                            r6 = (r6 + 1) | 0
                                            r9 = r9 >> 2
                                            heapClassInst.heap32[(r2)] = Int32(r6)
                                            r2 = Int64(heapClassInst.heap32[(r9 + (-1))])
                                            heapClassInst.heap32[(g0)] = Int32(r2)
                                            free(i7);
                                            r2 = Int64(heapClassInst.heap32[(r1 + 19)])
                                        }
                                        heapClassInst.heap32[(r1 + 21)] = 0
                                    }
                                    heapClassInst.heap8[r0 + 88] = Int8(r4)
                                    heapClassInst.heap32[(r1 + 21)] = Int32(r3)
                                    heapClassInst.heap32[(r1 + 20)] = Int32(r5)
                                }
                            }
                            r3 = r7 >> 2
                            r2 = r2 << 2
                            r4 = Int64(heapClassInst.heap32[(r1 + 21)])
                            r2 = (r4 + r2) | 0
                            r3 = Int64(heapClassInst.heap32[(r3)])
                            r2 = r2 >> 2
                            heapClassInst.heap32[(r2)] = Int32(r3)
                            r2 = Int64(heapClassInst.heap32[(r1 + 19)])
                            r2 = (r2 + 1) | 0
                            r8 = (r8 + (-1)) | 0
                            r7 = (r7 + 4) | 0
                            heapClassInst.heap32[(r1 + 19)] = Int32(r2)
                            if (!(r8 != 0)) {
                                break
                            }
                        }
                    } else {
                        r2 = Int64(heapClassInst.heap32[(r1 + 19)])
                    }
                } while (false);
                r3 = Int64(heapClassInst.heap32[(r1 + 1)])
                r3 = r3 >> 2
                r1 = Int64(heapClassInst.heap32[(r1 + 14)])
                r1 = (r1 + r2) | 0
                r2 = Int64(heapClassInst.heap32[(r3 + 17)])
                if (!(r1 <= r2)) {
                    heapClassInst.heap32[(g0)] = Int32(r0)
                    _ZZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoEN27InplaceSolverIslandCallback18processConstraintsEv(
                        i7);
                }
            }
        }
    } while (false);
    return;
}

func _ZN20btAlignedObjectArrayIP17btTypedConstraintE17quickSortInternalI33btSortConstraintOnIslandPredicateEEvT_ii(
    sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 2)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = (r0 + r1) | 0
    r3 = r2 >> 31
    r4 = Int64(heapClassInst.heap32[(fp)])
    r2 = (r2 + r3) | 0
    r3 = r4 >> 2
    r2 = r2 & 2147483646
    r5 = Int64(heapClassInst.heap32[(r3 + 3)])
    r2 = r2 << 1
    r2 = (r5 + r2) | 0
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2)])
    r5 = r1
    r6 = r0
    while (true) {
        r7 = r2 >> 2
        r8 = Int64(heapClassInst.heap32[(r7 + 5)])
        r8 = r8 >> 2
        r9 = Int64(heapClassInst.heap32[(r3 + 3)])
        r8 = Int64(heapClassInst.heap32[(r8 + 52)])
        while (true) {
            r10 = r5 << 2
            r10 = (r9 + r10) | 0
            r10 = r10 >> 2
            r11 = Int64(heapClassInst.heap32[(r10)])
            if (r8 < 0) {
                r12 = Int64(heapClassInst.heap32[(r7 + 6)])
                r12 = r12 >> 2
                r12 = Int64(heapClassInst.heap32[(r12 + 52)])
            } else {
                r12 = r8
            }
            r13 = r11 >> 2
            r14 = Int64(heapClassInst.heap32[(r13 + 5)])
            r14 = r14 >> 2
            r14 = Int64(heapClassInst.heap32[(r14 + 52)])
            if (r14 < 0) {
                r14 = Int64(heapClassInst.heap32[(r13 + 6)])
                r14 = r14 >> 2
                r14 = Int64(heapClassInst.heap32[(r14 + 52)])
            }
            if (r14 < r12) {
                r5 = (r5 + 1) | 0
                continue
            } else {
                break
            }
        }
        while (true) {
            r12 = r6 << 2
            r13 = (r9 + r12) | 0
            r13 = r13 >> 2
            r13 = Int64(heapClassInst.heap32[(r13)])
            r14 = r13 >> 2
            r15 = Int64(heapClassInst.heap32[(r14 + 5)])
            r15 = r15 >> 2
            r15 = Int64(heapClassInst.heap32[(r15 + 52)])
            if (r15 < 0) {
                r15 = Int64(heapClassInst.heap32[(r14 + 6)])
                r15 = r15 >> 2
                r15 = Int64(heapClassInst.heap32[(r15 + 52)])
            }
            if (r8 < 0) {
                r14 = Int64(heapClassInst.heap32[(r7 + 6)])
                r14 = r14 >> 2
                r14 = Int64(heapClassInst.heap32[(r14 + 52)])
            } else {
                r14 = r8
            }
            if (r14 < r15) {
                r6 = (r6 + (-1)) | 0
                continue
            } else {
                break
            }
        }
        if (r5 <= r6) {
            heapClassInst.heap32[(r10)] = Int32(r13)
            r7 = Int64(heapClassInst.heap32[(r3 + 3)])
            r7 = (r7 + r12) | 0
            r5 = (r5 + 1) | 0
            r6 = (r6 + (-1)) | 0
            r7 = r7 >> 2
            heapClassInst.heap32[(r7)] = Int32(r11)
        }
        if (r5 <= r6) {
            continue
        } else {
            break
        }
    }
    if (!(r6 <= r1)) {
        heapClassInst.heap32[(g0)] = Int32(r4)
        heapClassInst.heap32[(g0 + 1)] = Int32(r1)
        heapClassInst.heap32[(g0 + 2)] = Int32(r6)
        _ZN20btAlignedObjectArrayIP17btTypedConstraintE17quickSortInternalI33btSortConstraintOnIslandPredicateEEvT_ii(
            i7);
    }
    if (!(r5 >= r0)) {
        heapClassInst.heap32[(g0)] = Int32(r4)
        heapClassInst.heap32[(g0 + 1)] = Int32(r5)
        heapClassInst.heap32[(g0 + 2)] = Int32(r0)
        _ZN20btAlignedObjectArrayIP17btTypedConstraintE17quickSortInternalI33btSortConstraintOnIslandPredicateEEvT_ii(
            i7);
    }
    return;
}

func _ZN23btDiscreteDynamicsWorld9serializeEP12btSerializer(sp: Int64): Unit {
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
    i7 = sp + (-24)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 8)])
    r3 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    r4 = r3 >> 2
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    r2 = Int64(heapClassInst.heap32[(r4 + 2)])
    if (!(r2 < 1)) {
        r2 = 0
        while (true) {
            r5 = Int64(heapClassInst.heap32[(r4 + 4)])
            r6 = r2 << 2
            r5 = (r5 + r6) | 0
            r5 = r5 >> 2
            r5 = Int64(heapClassInst.heap32[(r5)])
            r6 = Int64(heapClassInst.heapU8[r5 + 232])
            r6 = r6 & 2
            if (!(r6 == 0)) {
                r6 = r5 >> 2
                r7 = Int64(heapClassInst.heap32[(r6)])
                r7 = r7 >> 2
                r7 = Int64(heapClassInst.heap32[(r7 + 4)])
                heapClassInst.heap32[(g0)] = Int32(r5)
                __FUNCTION_TABLE__[(r7) >> 2](i7);
                r8 = Int64(heapClassInst.heap32[(r1)])
                r8 = r8 >> 2
                r8 = Int64(heapClassInst.heap32[(r8 + 4)])
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0)
                heapClassInst.heap32[(g0 + 2)] = 1
                __FUNCTION_TABLE__[(r8) >> 2](i7);
                r7 = commonVariable.r_g0
                r6 = Int64(heapClassInst.heap32[(r6)])
                r6 = r6 >> 2
                r8 = r7 >> 2
                r6 = Int64(heapClassInst.heap32[(r6 + 5)])
                r8 = Int64(heapClassInst.heap32[(r8 + 2)])
                heapClassInst.heap32[(g0)] = Int32(r5)
                heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                heapClassInst.heap32[(g0 + 2)] = Int32(r0)
                __FUNCTION_TABLE__[(r6) >> 2](i7);
                r8 = Int64(heapClassInst.heap32[(r1)])
                r8 = r8 >> 2
                r8 = Int64(heapClassInst.heap32[(r8 + 5)])
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = Int32(r7)
                heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0)
                heapClassInst.heap32[(g0 + 3)] = 1497645650
                heapClassInst.heap32[(g0 + 4)] = Int32(r5)
                __FUNCTION_TABLE__[(r8) >> 2](i7);
            }
            r2 = (r2 + 1) | 0
            r5 = Int64(heapClassInst.heap32[(r4 + 2)])
            if (r5 > r2) {
                continue
            } else {
                break
            }
        }
    }
    r2 = Int64(heapClassInst.heap32[(r4 + 47)])
    do {
        if (!(r2 < 1)) {
            r2 = 0
            while (true) {
                r5 = r2 << 2
                r6 = Int64(heapClassInst.heap32[(r4 + 49)])
                r5 = (r6 + r5) | 0
                r5 = r5 >> 2
                r5 = Int64(heapClassInst.heap32[(r5)])
                r6 = r5 >> 2
                r7 = Int64(heapClassInst.heap32[(r6)])
                r7 = r7 >> 2
                r7 = Int64(heapClassInst.heap32[(r7 + 9)])
                heapClassInst.heap32[(g0)] = Int32(r5)
                __FUNCTION_TABLE__[(r7) >> 2](i7);
                r8 = Int64(heapClassInst.heap32[(r1)])
                r8 = r8 >> 2
                r8 = Int64(heapClassInst.heap32[(r8 + 4)])
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0)
                heapClassInst.heap32[(g0 + 2)] = 1
                __FUNCTION_TABLE__[(r8) >> 2](i7);
                r7 = commonVariable.r_g0
                r6 = Int64(heapClassInst.heap32[(r6)])
                r6 = r6 >> 2
                r8 = r7 >> 2
                r6 = Int64(heapClassInst.heap32[(r6 + 10)])
                r8 = Int64(heapClassInst.heap32[(r8 + 2)])
                heapClassInst.heap32[(g0)] = Int32(r5)
                heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                heapClassInst.heap32[(g0 + 2)] = Int32(r0)
                __FUNCTION_TABLE__[(r6) >> 2](i7);
                r8 = Int64(heapClassInst.heap32[(r1)])
                r8 = r8 >> 2
                r8 = Int64(heapClassInst.heap32[(r8 + 5)])
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = Int32(r7)
                heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0)
                heapClassInst.heap32[(g0 + 3)] = 1397641027
                heapClassInst.heap32[(g0 + 4)] = Int32(r5)
                r2 = (r2 + 1) | 0
                __FUNCTION_TABLE__[(r8) >> 2](i7);
                r5 = Int64(heapClassInst.heap32[(r4 + 47)])
                if (r5 > r2) {
                    continue
                } else {
                    break
                }
            }
        }
    } while (false);
    heapClassInst.heap32[(g0)] = Int32(r3)
    heapClassInst.heap32[(g0 + 1)] = Int32(r0)
    _ZN16btCollisionWorld25serializeCollisionObjectsEP12btSerializer(i7);
    r1 = Int64(heapClassInst.heap32[(r1)])
    r1 = r1 >> 2
    r1 = Int64(heapClassInst.heap32[(r1 + 9)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    return;
}

func _ZN23btDiscreteDynamicsWorld19setConstraintSolverEP18btConstraintSolver(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heapU8[r0 + 245])
    if (!(r1 == 0)) {
        r1 = r0 >> 2
        r1 = Int64(heapClassInst.heap32[(r1 + 44)])
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
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = 0
    r3 = r0 >> 2
    heapClassInst.heap8[r0 + 245] = Int8(r2)
    heapClassInst.heap32[(r3 + 44)] = Int32(r1)
    return;
}

func _ZN23btDiscreteDynamicsWorld25predictUnconstraintMotionEf(sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-40)
    var g0 = i7 >> 2;
    r0 = _E2_str87
    r1 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = r1 >> 2
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r1 = Int64(heapClassInst.heap32[(r0 + 52)])
    if (!(r1 < 1)) {
        f0 = Float64(heapClassInst.heapFloat[(fp + 1)])
        r1 = 0
        while (true) {
            r2 = Int64(heapClassInst.heap32[(r0 + 54)])
            r3 = r1 << 2
            r2 = (r2 + r3) | 0
            r2 = r2 >> 2
            r2 = Int64(heapClassInst.heap32[(r2)])
            r3 = Int64(heapClassInst.heapU8[r2 + 204])
            r3 = r3 & 3
            if (!(r3 != 0)) {
                heapClassInst.heap32[(g0)] = Int32(r2)
                heapClassInst.heapFloat[(g0 + 1)] = Float32(f0)
                _ZN11btRigidBody19integrateVelocitiesEf(i7);
                heapClassInst.heap32[(g0)] = Int32(r2)
                heapClassInst.heapFloat[(g0 + 1)] = Float32(f0)
                _ZN11btRigidBody12applyDampingEf(i7);
                r3 = r2 >> 2
                f1 = Float64(heapClassInst.heapFloat[(r3 + 76)])
                f2 = Float64(heapClassInst.heapFloat[(r3 + 77)])
                f3 = Float64(heapClassInst.heapFloat[(r3 + 78)])
                r3 = (r2 + 4) | 0
                r4 = (r2 + 320) | 0
                r2 = (r2 + 68) | 0
                heapClassInst.heap32[(g0)] = Int32(r3)
                heapClassInst.heapFloat[(g0 + 1)] = Float32(f1)
                heapClassInst.heapFloat[(g0 + 2)] = Float32(f2)
                heapClassInst.heapFloat[(g0 + 3)] = Float32(f3)
                heapClassInst.heap32[(g0 + 4)] = Int32(r4)
                heapClassInst.heapFloat[(g0 + 5)] = Float32(f0)
                heapClassInst.heap32[(g0 + 6)] = Int32(r2)
                _ZN15btTransformUtil18integrateTransformERK11btTransformRK9btVector3S5_fRS0_(i7);
            }
            r1 = (r1 + 1) | 0
            r2 = Int64(heapClassInst.heap32[(r0 + 52)])
            if (r2 > r1) {
                continue
            } else {
                break
            }
        }
    }
    r0 = _ZN15CProfileManager11CurrentNodeE
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    r3 = (r3 + (-1)) | 0
    heapClassInst.heap32[(r2 + 4)] = Int32(r3)
    do {
        if (!(r3 != 0)) {
            r3 = Int64(heapClassInst.heap32[(r2 + 1)])
            if (r3 != 0) {
                r1 = sp + (-8)
                heapClassInst.heap32[(g0)] = Int32(r1)
                heapClassInst.heap32[(g0 + 1)] = 0
                r3 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r3 = r3 >> 2
                r3 = Int64(heapClassInst.heap32[(r3)])
                r3 = r3 >> 2
                r1 = r1 >> 2
                r4 = Int64(heapClassInst.heap32[(fp + (-2))])
                r5 = Int64(heapClassInst.heap32[(r3)])
                r4 = (r4 - r5) | 0
                r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r1 = (r1 - r3) | 0
                r3 = (r4 * 1000000) | 0
                r1 = (r1 + r3) | 0
                r3 = Int64(heapClassInst.heap32[(r2 + 3)])
                r1 = (r1 - r3) | 0
                f0 = Float64(`UIntNative`(r1))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r2 + 2)] = Float32(f0)
                r1 = Int64(heapClassInst.heap32[(r2 + 4)])
                if (r1 != 0) {
                    break
                } else {
                    r1 = Int64(heapClassInst.heap32[(r0)])
                }
            }
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            heapClassInst.heap32[(r0)] = Int32(r1)
        }
    } while (false);
    return;
}

func _ZN23btDiscreteDynamicsWorld26calculateSimulationIslandsEv(sp: Int64): Unit {
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
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-24)
    var g0 = i7 >> 2;
    r0 = _E2_str188
    r1 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r0 = r1 >> 2
    r2 = Int64(heapClassInst.heap32[(r0 + 45)])
    r3 = r2 >> 2
    r3 = Int64(heapClassInst.heap32[(r3)])
    r3 = r3 >> 2
    r3 = Int64(heapClassInst.heap32[(r3 + 2)])
    r4 = Int64(heapClassInst.heap32[(r0 + 6)])
    heapClassInst.heap32[(g0)] = Int32(r2)
    heapClassInst.heap32[(g0 + 1)] = Int32(r1)
    heapClassInst.heap32[(g0 + 2)] = Int32(r4)
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r2 = Int64(heapClassInst.heap32[(r0 + 47)])
    if (!(r2 < 1)) {
        r3 = 0
        while (true) {
            r4 = Int64(heapClassInst.heap32[(r0 + 49)])
            r5 = r3 << 2
            r4 = (r4 + r5) | 0
            r4 = r4 >> 2
            r4 = Int64(heapClassInst.heap32[(r4)])
            r4 = r4 >> 2
            r5 = Int64(heapClassInst.heap32[(r4 + 5)])
            do {
                if (!(r5 == 0)) {
                    r6 = Int64(heapClassInst.heapU8[r5 + 204])
                    r6 = r6 & 3
                    if (!(r6 != 0)) {
                        r4 = Int64(heapClassInst.heap32[(r4 + 6)])
                        if (!(r4 == 0)) {
                            r6 = Int64(heapClassInst.heapU8[r4 + 204])
                            r6 = r6 & 3
                            if (!(r6 != 0)) {
                                r5 = r5 >> 2
                                r6 = Int64(heapClassInst.heap32[(r5 + 54)])
                                if (r6 == 2) {
                                    __label__ = 8
                                } else {
                                    if (r6 != 5) {
                                        __label__ = 10
                                    } else {
                                        __label__ = 8
                                    }
                                }
                                if (__label__ == 8) {
                                    r6 = r4 >> 2
                                    r6 = Int64(heapClassInst.heap32[(r6 + 54)])
                                    if (r6 == 2) {
                                        break
                                    } else {
                                        if (r6 == 5) {
                                            break
                                        }
                                    }
                                }
                                r6 = Int64(heapClassInst.heap32[(r0 + 45)])
                                r5 = Int64(heapClassInst.heap32[(r5 + 52)])
                                r6 = r6 >> 2
                                r7 = Int64(heapClassInst.heap32[(r6 + 4)])
                                r8 = r5 << 3
                                r8 = (r7 + r8) | 0
                                r8 = r8 >> 2
                                r4 = r4 >> 2
                                r8 = Int64(heapClassInst.heap32[(r8)])
                                r4 = Int64(heapClassInst.heap32[(r4 + 52)])
                                if (!(r8 == r5)) {
                                    while (true) {
                                        r8 = r8 << 3
                                        r5 = r5 << 3
                                        r8 = (r7 + r8) | 0
                                        r5 = (r7 + r5) | 0
                                        r7 = r8 >> 2
                                        r5 = r5 >> 2
                                        r8 = Int64(heapClassInst.heap32[(r7)])
                                        heapClassInst.heap32[(r5)] = Int32(r8)
                                        r5 = Int64(heapClassInst.heap32[(r7)])
                                        r7 = Int64(heapClassInst.heap32[(r6 + 4)])
                                        r8 = r5 << 3
                                        r8 = (r7 + r8) | 0
                                        r8 = r8 >> 2
                                        r8 = Int64(heapClassInst.heap32[(r8)])
                                        if (!(r8 != r5)) {
                                            break
                                        }
                                    }
                                }
                                r8 = r4 << 3
                                r8 = (r7 + r8) | 0
                                r8 = r8 >> 2
                                r8 = Int64(heapClassInst.heap32[(r8)])
                                do {
                                    if (!(r8 == r4)) {
                                        while (true) {
                                            r8 = r8 << 3
                                            r4 = r4 << 3
                                            r8 = (r7 + r8) | 0
                                            r4 = (r7 + r4) | 0
                                            r7 = r8 >> 2
                                            r4 = r4 >> 2
                                            r8 = Int64(heapClassInst.heap32[(r7)])
                                            heapClassInst.heap32[(r4)] = Int32(r8)
                                            r4 = Int64(heapClassInst.heap32[(r7)])
                                            r7 = Int64(heapClassInst.heap32[(r6 + 4)])
                                            r8 = r4 << 3
                                            r8 = (r7 + r8) | 0
                                            r8 = r8 >> 2
                                            r8 = Int64(heapClassInst.heap32[(r8)])
                                            if (!(r8 != r4)) {
                                                break
                                            }
                                        }
                                    }
                                } while (false);
                                if (!(r5 == r4)) {
                                    r5 = r5 << 3
                                    r7 = (r7 + r5) | 0
                                    r7 = r7 >> 2
                                    heapClassInst.heap32[(r7)] = Int32(r4)
                                    r6 = Int64(heapClassInst.heap32[(r6 + 4)])
                                    r4 = r4 << 3
                                    r4 = (r6 + r4) | 0
                                    r5 = (r6 + r5) | 0
                                    r4 = r4 >> 2
                                    r5 = r5 >> 2
                                    r6 = Int64(heapClassInst.heap32[(r4 + 1)])
                                    r5 = Int64(heapClassInst.heap32[(r5 + 1)])
                                    r5 = (r5 + r6) | 0
                                    heapClassInst.heap32[(r4 + 1)] = Int32(r5)
                                }
                            }
                        }
                    }
                }
            } while (false);
            r3 = (r3 + 1) | 0
            if (r2 != r3) {
                continue
            } else {
                break
            }
        }
    }
    r0 = Int64(heapClassInst.heap32[(r0 + 45)])
    r2 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r2)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 3)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r1)
    r0 = _ZN15CProfileManager11CurrentNodeE
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    r3 = (r3 + (-1)) | 0
    heapClassInst.heap32[(r2 + 4)] = Int32(r3)
    do {
        if (!(r3 != 0)) {
            r3 = Int64(heapClassInst.heap32[(r2 + 1)])
            if (r3 != 0) {
                r1 = sp + (-8)
                heapClassInst.heap32[(g0)] = Int32(r1)
                heapClassInst.heap32[(g0 + 1)] = 0
                r3 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r3 = r3 >> 2
                r3 = Int64(heapClassInst.heap32[(r3)])
                r3 = r3 >> 2
                r1 = r1 >> 2
                r4 = Int64(heapClassInst.heap32[(fp + (-2))])
                r5 = Int64(heapClassInst.heap32[(r3)])
                r4 = (r4 - r5) | 0
                r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r1 = (r1 - r3) | 0
                r3 = (r4 * 1000000) | 0
                r1 = (r1 + r3) | 0
                r3 = Int64(heapClassInst.heap32[(r2 + 3)])
                r1 = (r1 - r3) | 0
                f0 = Float64(`UIntNative`(r1))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r2 + 2)] = Float32(f0)
                r1 = Int64(heapClassInst.heap32[(r2 + 4)])
                if (r1 != 0) {
                    break
                } else {
                    r1 = Int64(heapClassInst.heap32[(r0)])
                }
            }
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            heapClassInst.heap32[(r0)] = Int32(r1)
        }
    } while (false);
    return;
}

func _ZZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoEN27InplaceSolverIslandCallback18processConstraintsEv(
    sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-48)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 14)])
    r3 = Int64(heapClassInst.heap32[(r1 + 19)])
    r4 = (r3 + r2) | 0
    if (!(r4 < 1)) {
        r4 = Int64(heapClassInst.heap32[(r1 + 2)])
        r5 = r4 >> 2
        r5 = Int64(heapClassInst.heap32[(r5)])
        r5 = r5 >> 2
        r5 = Int64(heapClassInst.heap32[(r5 + 3)])
        r6 = Int64(heapClassInst.heap32[(r1 + 7)])
        r7 = Int64(heapClassInst.heap32[(r1 + 6)])
        r8 = Int64(heapClassInst.heap32[(r1 + 5)])
        r9 = Int64(heapClassInst.heap32[(r1 + 1)])
        r10 = Int64(heapClassInst.heap32[(r1 + 21)])
        r11 = Int64(heapClassInst.heap32[(r1 + 16)])
        r12 = Int64(heapClassInst.heap32[(r1 + 9)])
        r13 = Int64(heapClassInst.heap32[(r1 + 11)])
        heapClassInst.heap32[(g0)] = Int32(r4)
        heapClassInst.heap32[(g0 + 1)] = Int32(r13)
        heapClassInst.heap32[(g0 + 2)] = Int32(r12)
        heapClassInst.heap32[(g0 + 3)] = Int32(r11)
        heapClassInst.heap32[(g0 + 4)] = Int32(r2)
        heapClassInst.heap32[(g0 + 5)] = Int32(r10)
        heapClassInst.heap32[(g0 + 6)] = Int32(r3)
        heapClassInst.heap32[(g0 + 7)] = Int32(r9)
        heapClassInst.heap32[(g0 + 8)] = Int32(r8)
        heapClassInst.heap32[(g0 + 9)] = Int32(r7)
        heapClassInst.heap32[(g0 + 10)] = Int32(r6)
        __FUNCTION_TABLE__[(r5) >> 2](i7);
    }
    r2 = Int64(heapClassInst.heap32[(r1 + 9)])
    if (!(r2 > (-1))) {
        r3 = Int64(heapClassInst.heap32[(r1 + 10)])
        if (!(r3 > (-1))) {
            r3 = Int64(heapClassInst.heap32[(r1 + 11)])
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
                heapClassInst.heap32[(r1 + 11)] = 0
            }
            r3 = 1
            heapClassInst.heap8[r0 + 48] = Int8(r3)
            heapClassInst.heap32[(r1 + 11)] = 0
            heapClassInst.heap32[(r1 + 10)] = 0
        }
        while (true) {
            r3 = r2 << 2
            r4 = Int64(heapClassInst.heap32[(r1 + 11)])
            r3 = (r4 + r3) | 0
            r2 = (r2 + 1) | 0
            r3 = r3 >> 2
            heapClassInst.heap32[(r3)] = 0
            if (r2 != 0) {
                continue
            } else {
                break
            }
        }
    }
    heapClassInst.heap32[(r1 + 9)] = 0
    r2 = Int64(heapClassInst.heap32[(r1 + 14)])
    do {
        if (!(r2 > (-1))) {
            r3 = Int64(heapClassInst.heap32[(r1 + 15)])
            if (!(r3 > (-1))) {
                r3 = Int64(heapClassInst.heap32[(r1 + 16)])
                if (!(r3 == 0)) {
                    r4 = Int64(heapClassInst.heapU8[r0 + 68])
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
                    heapClassInst.heap32[(r1 + 16)] = 0
                }
                r3 = 1
                heapClassInst.heap8[r0 + 68] = Int8(r3)
                heapClassInst.heap32[(r1 + 16)] = 0
                heapClassInst.heap32[(r1 + 15)] = 0
            }
            while (true) {
                r3 = r2 << 2
                r4 = Int64(heapClassInst.heap32[(r1 + 16)])
                r3 = (r4 + r3) | 0
                r2 = (r2 + 1) | 0
                r3 = r3 >> 2
                heapClassInst.heap32[(r3)] = 0
                if (r2 != 0) {
                    continue
                } else {
                    break
                }
            }
        }
    } while (false);
    heapClassInst.heap32[(r1 + 14)] = 0
    r2 = Int64(heapClassInst.heap32[(r1 + 19)])
    do {
        if (!(r2 > (-1))) {
            r3 = Int64(heapClassInst.heap32[(r1 + 20)])
            if (!(r3 > (-1))) {
                r3 = Int64(heapClassInst.heap32[(r1 + 21)])
                if (!(r3 == 0)) {
                    r4 = Int64(heapClassInst.heapU8[r0 + 88])
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
                    heapClassInst.heap32[(r1 + 21)] = 0
                }
                r3 = 1
                heapClassInst.heap8[r0 + 88] = Int8(r3)
                heapClassInst.heap32[(r1 + 21)] = 0
                heapClassInst.heap32[(r1 + 20)] = 0
            }
            while (true) {
                r0 = r2 << 2
                r3 = Int64(heapClassInst.heap32[(r1 + 21)])
                r0 = (r3 + r0) | 0
                r2 = (r2 + 1) | 0
                r0 = r0 >> 2
                heapClassInst.heap32[(r0)] = 0
                if (r2 != 0) {
                    continue
                } else {
                    break
                }
            }
        }
    } while (false);
    heapClassInst.heap32[(r1 + 19)] = 0
    return;
}

func _ZN23btDiscreteDynamicsWorld9addActionEP17btActionInterface(sp: Int64): Unit {
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
    r2 = Int64(heapClassInst.heap32[(r1 + 64)])
    r3 = Int64(heapClassInst.heap32[(r1 + 63)])
    r4 = Int64(heapClassInst.heap32[(fp + 1)])
    if (r2 == r3) {
        r5 = 1
        r6 = r3 << 1
        r6 = if (r3 == 0) {
            r5
        } else {
            r6
        };
        if (!(r2 >= r6)) {
            if (r6 != 0) {
                r2 = gNumAlignedAllocs
                r2 = r2 >> 2
                r7 = Int64(heapClassInst.heap32[(r2)])
                r8 = r6 << 2
                r7 = (r7 + 1) | 0
                r8 = r8 | 3
                heapClassInst.heap32[(r2)] = Int32(r7)
                r2 = (r8 + 16) | 0
                heapClassInst.heap32[(g0)] = Int32(r2)
                mallocNew(i7);
                r2 = commonVariable.r_g0
                if (r2 != 0) {
                    r7 = 0
                    r8 = (r2 + 4) | 0
                    r7 = (r7 - r8) | 0
                    r7 = r7 & 15
                    r7 = (r2 + r7) | 0
                    r8 = (r7 + 4) | 0
                    r7 = r7 >> 2
                    heapClassInst.heap32[(r7)] = Int32(r2)
                    r2 = r8
                }
            } else {
                r2 = 0
            }
            r7 = (r0 + 260) | 0
            if (r3 < 1) {
                r8 = r7 >> 2
                r9 = Int64(heapClassInst.heap32[(r8)])
            } else {
                r8 = 0
                while (true) {
                    r9 = r7 >> 2
                    r9 = Int64(heapClassInst.heap32[(r9)])
                    r10 = r8 << 2
                    r11 = (r9 + r10) | 0
                    r11 = r11 >> 2
                    r10 = (r2 + r10) | 0
                    r11 = Int64(heapClassInst.heap32[(r11)])
                    r8 = (r8 + 1) | 0
                    r10 = r10 >> 2
                    heapClassInst.heap32[(r10)] = Int32(r11)
                    if (!(r3 != r8)) {
                        break
                    }
                }
                r7 = (r0 + 260) | 0
            }
            if (r9 != 0) {
                r8 = Int64(heapClassInst.heapU8[r0 + 264])
                if (r8 != 0) {
                    r3 = gNumAlignedFree
                    r3 = r3 >> 2
                    r8 = Int64(heapClassInst.heap32[(r3)])
                    r8 = (r8 + 1) | 0
                    r9 = r9 >> 2
                    heapClassInst.heap32[(r3)] = Int32(r8)
                    r3 = Int64(heapClassInst.heap32[(r9 + (-1))])
                    heapClassInst.heap32[(g0)] = Int32(r3)
                    free(i7);
                    r3 = Int64(heapClassInst.heap32[(r1 + 63)])
                }
                r8 = r7 >> 2
                heapClassInst.heap32[(r8)] = 0
            }
            r7 = r7 >> 2
            heapClassInst.heap8[r0 + 264] = Int8(r5)
            heapClassInst.heap32[(r7)] = Int32(r2)
            heapClassInst.heap32[(r1 + 64)] = Int32(r6)
        }
    }
    r0 = r3 << 2
    r2 = Int64(heapClassInst.heap32[(r1 + 65)])
    r0 = (r2 + r0) | 0
    r0 = r0 >> 2
    heapClassInst.heap32[(r0)] = Int32(r4)
    r0 = Int64(heapClassInst.heap32[(r1 + 63)])
    r0 = (r0 + 1) | 0
    heapClassInst.heap32[(r1 + 63)] = Int32(r0)
    return;
}

func _ZN23btDiscreteDynamicsWorld19integrateTransformsEf(sp: Int64): Unit {
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
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var f7: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-264)
    var g0 = i7 >> 2;
    r0 = _E2_str794
    r1 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = r1 >> 2
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r2 = Int64(heapClassInst.heap32[(r0 + 52)])
    if (!(r2 < 1)) {
        f0 = Float64(heapClassInst.heapFloat[(fp + 1)])
        r2 = 0
        r15 = (-1)
        while (true) {
            r3 = Int64(heapClassInst.heap32[(r0 + 54)])
            r4 = r2 << 2
            r3 = (r3 + r4) | 0
            r3 = r3 >> 2
            r3 = Int64(heapClassInst.heap32[(r3)])
            r4 = r3 >> 2
            heapClassInst.heap32[(r4 + 60)] = 1065353216
            r5 = Int64(heapClassInst.heap32[(r4 + 54)])
            if (!(r5 == 2)) {
                if (!(r5 == 5)) {
                    r5 = Int64(heapClassInst.heapU8[r3 + 204])
                    r5 = r5 & 3
                    if (!(r5 != 0)) {
                        f1 = Float64(heapClassInst.heapFloat[(r4 + 76)])
                        f2 = Float64(heapClassInst.heapFloat[(r4 + 77)])
                        f3 = Float64(heapClassInst.heapFloat[(r4 + 78)])
                        r5 = (r3 + 320) | 0
                        r6 = (r3 + 4) | 0
                        r7 = sp + (-80)
                        heapClassInst.heap32[(g0)] = Int32(r6)
                        heapClassInst.heapFloat[(g0 + 1)] = Float32(f1)
                        heapClassInst.heapFloat[(g0 + 2)] = Float32(f2)
                        heapClassInst.heapFloat[(g0 + 3)] = Float32(f3)
                        heapClassInst.heap32[(g0 + 4)] = Int32(r5)
                        heapClassInst.heapFloat[(g0 + 5)] = Float32(f0)
                        heapClassInst.heap32[(g0 + 6)] = Int32(r7)
                        _ZN15btTransformUtil18integrateTransformERK11btTransformRK9btVector3S5_fRS0_(i7);
                        f1 = Float64(heapClassInst.heapFloat[(r4 + 62)])
                        f1 = f1 * f1
                        f2 = 0.0
                        do {
                            if (!(f1 == f2)) {
                                r8 = r7 >> 2
                                f2 = Float64(heapClassInst.heapFloat[(r8 + 14)])
                                f3 = Float64(heapClassInst.heapFloat[(r4 + 15)])
                                f4 = Float64(heapClassInst.heapFloat[(r8 + 13)])
                                f5 = Float64(heapClassInst.heapFloat[(r4 + 14)])
                                f6 = Float64(heapClassInst.heapFloat[(r8 + 12)])
                                f7 = Float64(heapClassInst.heapFloat[(r4 + 13)])
                                f2 = f2 - f3
                                f3 = f4 - f5
                                f4 = f6 - f7
                                f4 = f4 * f4
                                f3 = f3 * f3
                                f3 = f4 + f3
                                f2 = f2 * f2
                                f2 = f3 + f2
                                if (!(f1 >= f2)) {
                                    r9 = _E2_str895
                                    heapClassInst.heap32[(g0)] = Int32(r9)
                                    _ZN15CProfileManager13Start_ProfileEPKc(i7);
                                    r9 = Int64(heapClassInst.heap32[(r4 + 48)])
                                    r9 = r9 >> 2
                                    r9 = Int64(heapClassInst.heap32[(r9 + 1)])
                                    if (!(r9 > 19)) {
                                        r9 = gNumClampedCcdMotions
                                        r9 = r9 >> 2
                                        r10 = Int64(heapClassInst.heap32[(r9)])
                                        r10 = (r10 + 1) | 0
                                        heapClassInst.heap32[(r9)] = Int32(r10)
                                        r9 = Int64(heapClassInst.heap32[(r0 + 20)])
                                        r10 = r9 >> 2
                                        r10 = Int64(heapClassInst.heap32[(r10)])
                                        r10 = r10 >> 2
                                        r10 = Int64(heapClassInst.heap32[(r10 + 9)])
                                        r11 = Int64(heapClassInst.heap32[(r0 + 6)])
                                        r12 = sp + (-176)
                                        heapClassInst.heap32[(g0)] = Int32(r9)
                                        r9 = r12 >> 2
                                        __FUNCTION_TABLE__[(r10) >> 2](i7);
                                        r13 = 1
                                        heapClassInst.heap32[(r9 + 1)] = 1065353216
                                        r14 = _ZTVN16btCollisionWorld27ClosestConvexResultCallbackE
                                        heapClassInst.heap16[(sp + (-168)) >> 1] = Int16(r13)
                                        r13 = (r14 + 8) | 0
                                        heapClassInst.heap16[(sp + (-166)) >> 1] = Int16(r15)
                                        heapClassInst.heap32[(fp + (-44))] = Int32(r13)
                                        heapClassInst.heap32[(r9 + 3)] = heapClassInst.heap32[(r4 + 13)]
                                        heapClassInst.heap32[(r9 + 4)] = heapClassInst.heap32[(r4 + 14)]
                                        heapClassInst.heap32[(r9 + 5)] = heapClassInst.heap32[(r4 + 15)]
                                        heapClassInst.heap32[(r9 + 6)] = heapClassInst.heap32[(r4 + 16)]
                                        heapClassInst.heap32[(r9 + 7)] = heapClassInst.heap32[(r8 + 12)]
                                        heapClassInst.heap32[(r9 + 8)] = heapClassInst.heap32[(r8 + 13)]
                                        heapClassInst.heap32[(r9 + 9)] = heapClassInst.heap32[(r8 + 14)]
                                        r14 = _ZTV34btClosestNotMeConvexResultCallback
                                        heapClassInst.heap32[(r9 + 10)] = heapClassInst.heap32[(r8 + 15)]
                                        r8 = (r14 + 8) | 0
                                        heapClassInst.heap32[(r9 + 19)] = 0
                                        heapClassInst.heap32[(fp + (-44))] = Int32(r8)
                                        heapClassInst.heap32[(r9 + 20)] = Int32(r3)
                                        heapClassInst.heap32[(r9 + 21)] = 0
                                        heapClassInst.heap32[(r9 + 22)] = Int32(commonVariable.r_g0)
                                        r8 = sp + (-232)
                                        heapClassInst.heap32[(r9 + 23)] = Int32(r11)
                                        r10 = r8 >> 2
                                        f1 = Float64(heapClassInst.heapFloat[(r4 + 61)])
                                        heapClassInst.heap32[(r10 + 2)] = 0
                                        heapClassInst.heap32[(r10 + 3)] = 1065353216
                                        heapClassInst.heap32[(r10 + 4)] = 1065353216
                                        r11 = _ZTV13btSphereShape
                                        heapClassInst.heap32[(r10 + 5)] = 1065353216
                                        r11 = (r11 + 8) | 0
                                        heapClassInst.heap32[(r10 + 6)] = 0
                                        heapClassInst.heap32[(fp + (-58))] = Int32(r11)
                                        heapClassInst.heap32[(r10 + 1)] = 8
                                        heapClassInst.heapFloat[(r10 + 7)] = Float32(f1)
                                        heapClassInst.heapFloat[(r10 + 11)] = Float32(f1)
                                        r10 = Int64(heapClassInst.heap32[(r4 + 47)])
                                        r10 = Int64(heapClassInst.heapU16[(r10 + 4) >> 1])
                                        heapClassInst.heap16[(sp + (-168)) >> 1] = Int16(r10)
                                        r10 = Int64(heapClassInst.heap32[(r4 + 47)])
                                        r10 = Int64(heapClassInst.heapU16[(r10 + 6) >> 1])
                                        heapClassInst.heap16[(sp + (-166)) >> 1] = Int16(r10)
                                        heapClassInst.heap32[(g0)] = Int32(r1)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r6)
                                        heapClassInst.heap32[(g0 + 3)] = Int32(r7)
                                        heapClassInst.heap32[(g0 + 4)] = Int32(r12)
                                        heapClassInst.heap32[(g0 + 5)] = 0
                                        _ZNK16btCollisionWorld15convexSweepTestEPK13btConvexShapeRK11btTransformS5_RNS_20ConvexResultCallbackEf(
                                            i7);
                                        f1 = Float64(heapClassInst.heapFloat[(r9 + 1)])
                                        f2 = 1.0
                                        if (!(f1 >= f2)) {
                                            heapClassInst.heapFloat[(r4 + 60)] = Float32(f1)
                                            f2 = Float64(heapClassInst.heapFloat[(r4 + 76)])
                                            f3 = Float64(heapClassInst.heapFloat[(r4 + 77)])
                                            f4 = Float64(heapClassInst.heapFloat[(r4 + 78)])
                                            f1 = f1 * f0
                                            heapClassInst.heap32[(g0)] = Int32(r6)
                                            heapClassInst.heapFloat[(g0 + 1)] = Float32(f2)
                                            heapClassInst.heapFloat[(g0 + 2)] = Float32(f3)
                                            heapClassInst.heapFloat[(g0 + 3)] = Float32(f4)
                                            heapClassInst.heap32[(g0 + 4)] = Int32(r5)
                                            heapClassInst.heapFloat[(g0 + 5)] = Float32(f1)
                                            heapClassInst.heap32[(g0 + 6)] = Int32(r7)
                                            _ZN15btTransformUtil18integrateTransformERK11btTransformRK9btVector3S5_fRS0_(
                                                i7);
                                            heapClassInst.heap32[(r4 + 60)] = 0
                                        }
                                        r4 = _ZTV13btConvexShape
                                        r4 = (r4 + 8) | 0
                                        heapClassInst.heap32[(fp + (-58))] = Int32(r4)
                                        heapClassInst.heap32[(fp + (-44))] = Int32(r13)
                                    }
                                    r4 = _ZN15CProfileManager11CurrentNodeE
                                    r4 = r4 >> 2
                                    r5 = Int64(heapClassInst.heap32[(r4)])
                                    r6 = r5 >> 2
                                    r8 = Int64(heapClassInst.heap32[(r6 + 4)])
                                    r8 = (r8 + (-1)) | 0
                                    heapClassInst.heap32[(r6 + 4)] = Int32(r8)
                                    if (!(r8 != 0)) {
                                        r8 = Int64(heapClassInst.heap32[(r6 + 1)])
                                        if (r8 != 0) {
                                            r5 = sp + (-8)
                                            heapClassInst.heap32[(g0)] = Int32(r5)
                                            heapClassInst.heap32[(g0 + 1)] = 0
                                            r8 = _ZL13gProfileClock_2E_0
                                            gettimeofday(i7);
                                            r8 = r8 >> 2
                                            r8 = Int64(heapClassInst.heap32[(r8)])
                                            r8 = r8 >> 2
                                            r5 = r5 >> 2
                                            r9 = Int64(heapClassInst.heap32[(fp + (-2))])
                                            r10 = Int64(heapClassInst.heap32[(r8)])
                                            r9 = (r9 - r10) | 0
                                            r5 = Int64(heapClassInst.heap32[(r5 + 1)])
                                            r8 = Int64(heapClassInst.heap32[(r8 + 1)])
                                            r5 = (r5 - r8) | 0
                                            r8 = (r9 * 1000000) | 0
                                            r5 = (r5 + r8) | 0
                                            r8 = Int64(heapClassInst.heap32[(r6 + 3)])
                                            r5 = (r5 - r8) | 0
                                            f1 = Float64(`UIntNative`(r5))
                                            f2 = 1000.0
                                            f3 = Float64(heapClassInst.heapFloat[(r6 + 2)])
                                            f1 = f1 / f2
                                            f1 = f3 + f1
                                            heapClassInst.heapFloat[(r6 + 2)] = Float32(f1)
                                            r5 = Int64(heapClassInst.heap32[(r6 + 4)])
                                            if (r5 != 0) {
                                                break
                                            } else {
                                                r5 = Int64(heapClassInst.heap32[(r4)])
                                            }
                                        }
                                        r5 = r5 >> 2
                                        r5 = Int64(heapClassInst.heap32[(r5 + 5)])
                                        heapClassInst.heap32[(r4)] = Int32(r5)
                                    }
                                }
                            }
                        } while (false);
                        heapClassInst.heap32[(g0)] = Int32(r3)
                        heapClassInst.heap32[(g0 + 1)] = Int32(r7)
                        _ZN11btRigidBody18proceedToTransformERK11btTransform(i7);
                    }
                }
            }
            r2 = (r2 + 1) | 0
            r3 = Int64(heapClassInst.heap32[(r0 + 52)])
            if (r3 > r2) {
                continue
            } else {
                break
            }
        }
    }
    r0 = _ZN15CProfileManager11CurrentNodeE
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    r3 = (r3 + (-1)) | 0
    heapClassInst.heap32[(r2 + 4)] = Int32(r3)
    do {
        if (!(r3 != 0)) {
            r3 = Int64(heapClassInst.heap32[(r2 + 1)])
            if (r3 != 0) {
                r1 = sp + (-16)
                heapClassInst.heap32[(g0)] = Int32(r1)
                heapClassInst.heap32[(g0 + 1)] = 0
                r3 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r3 = r3 >> 2
                r3 = Int64(heapClassInst.heap32[(r3)])
                r3 = r3 >> 2
                r1 = r1 >> 2
                r4 = Int64(heapClassInst.heap32[(fp + (-4))])
                r5 = Int64(heapClassInst.heap32[(r3)])
                r4 = (r4 - r5) | 0
                r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r1 = (r1 - r3) | 0
                r3 = (r4 * 1000000) | 0
                r1 = (r1 + r3) | 0
                r3 = Int64(heapClassInst.heap32[(r2 + 3)])
                r1 = (r1 - r3) | 0
                f0 = Float64(`UIntNative`(r1))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r2 + 2)] = Float32(f0)
                r1 = Int64(heapClassInst.heap32[(r2 + 4)])
                if (r1 != 0) {
                    break
                } else {
                    r1 = Int64(heapClassInst.heap32[(r0)])
                }
            }
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            heapClassInst.heap32[(r0)] = Int32(r1)
        }
    } while (false);
    return;
}

func _ZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfo(sp: Int64): Unit {
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
    var r24: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-168)
    var g0 = i7 >> 2;
    r0 = _E2_str996
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = sp + (-48)
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r1 = 1
    r2 = r0 >> 2
    heapClassInst.heap8[sp + (-32)] = Int8(r1)
    heapClassInst.heap32[(r2 + 3)] = 0
    r3 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(r2 + 1)] = 0
    r4 = r3 >> 2
    heapClassInst.heap32[(r2 + 2)] = 0
    r5 = Int64(heapClassInst.heap32[(r4 + 47)])
    if (!(r5 < 1)) {
        r6 = gNumAlignedAllocs
        r6 = r6 >> 2
        r7 = Int64(heapClassInst.heap32[(r6)])
        r8 = r5 << 2
        r7 = (r7 + 1) | 0
        r8 = r8 | 3
        heapClassInst.heap32[(r6)] = Int32(r7)
        r6 = (r8 + 16) | 0
        heapClassInst.heap32[(g0)] = Int32(r6)
        mallocNew(i7);
        r6 = commonVariable.r_g0
        if (r6 != 0) {
            r7 = 0
            r8 = (r6 + 4) | 0
            r7 = (r7 - r8) | 0
            r7 = r7 & 15
            r7 = (r6 + r7) | 0
            r8 = (r7 + 4) | 0
            r7 = r7 >> 2
            heapClassInst.heap32[(r7)] = Int32(r6)
            r6 = r8
        }
        r7 = 1
        heapClassInst.heap8[sp + (-32)] = Int8(r7)
        r7 = (r7 - r5) | 0
        r8 = 0
        heapClassInst.heap32[(r2 + 3)] = Int32(r6)
        heapClassInst.heap32[(r2 + 2)] = Int32(r5)
        while (true) {
            r9 = r8 << 2
            r6 = (r6 - r9) | 0
            r6 = r6 >> 2
            heapClassInst.heap32[(r6)] = 0
            if (r7 == r8) {
                break
            } else {
                r6 = Int64(heapClassInst.heap32[(r2 + 3)])
                r8 = (r8 + (-1)) | 0
                continue
            }
        }
    }
    heapClassInst.heap32[(r2 + 1)] = Int32(r5)
    r5 = Int64(heapClassInst.heap32[(r4)])
    r5 = r5 >> 2
    r5 = Int64(heapClassInst.heap32[(r5 + 24)])
    heapClassInst.heap32[(g0)] = Int32(r3)
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    r5 = commonVariable.r_g0
    do {
        if (!(r5 < 1)) {
            r5 = 0
            while (true) {
                r6 = r5 << 2
                r7 = Int64(heapClassInst.heap32[(r4 + 49)])
                r7 = (r7 + r6) | 0
                r7 = r7 >> 2
                r8 = Int64(heapClassInst.heap32[(r2 + 3)])
                r6 = (r8 + r6) | 0
                r7 = Int64(heapClassInst.heap32[(r7)])
                r6 = r6 >> 2
                heapClassInst.heap32[(r6)] = Int32(r7)
                r6 = Int64(heapClassInst.heap32[(r4)])
                r6 = r6 >> 2
                r6 = Int64(heapClassInst.heap32[(r6 + 24)])
                r5 = (r5 + 1) | 0
                heapClassInst.heap32[(g0)] = Int32(r3)
                __FUNCTION_TABLE__[(r6) >> 2](i7);
                r6 = commonVariable.r_g0
                if (r6 > r5) {
                    continue
                } else {
                    break
                }
            }
        }
    } while (false);
    r5 = Int64(heapClassInst.heap32[(r2 + 1)])
    if (!(r5 < 2)) {
        r5 = (r5 + (-1)) | 0
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = 0
        heapClassInst.heap32[(g0 + 2)] = Int32(r5)
        _ZN20btAlignedObjectArrayIP17btTypedConstraintE17quickSortInternalI33btSortConstraintOnIslandPredicateEEvT_ii(
            i7);
    }
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r5 = Int64(heapClassInst.heap32[(r4)])
    r5 = r5 >> 2
    r5 = Int64(heapClassInst.heap32[(r5 + 24)])
    heapClassInst.heap32[(g0)] = Int32(r3)
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    r3 = commonVariable.r_g0
    if (r3 != 0) {
        r3 = Int64(heapClassInst.heap32[(r2 + 3)])
    } else {
        r3 = 0
    }
    r5 = Int64(heapClassInst.heap32[(r4 + 6)])
    r6 = Int64(heapClassInst.heap32[(r4 + 44)])
    r7 = _ZTVZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoE27InplaceSolverIslandCallback
    r8 = Int64(heapClassInst.heap32[(r4 + 19)])
    r9 = Int64(heapClassInst.heap32[(r4 + 21)])
    r10 = Int64(heapClassInst.heap32[(r2 + 1)])
    r11 = sp + (-144)
    r7 = (r7 + 8) | 0
    r12 = r11 >> 2
    heapClassInst.heap32[(fp + (-36))] = Int32(r7)
    heapClassInst.heap32[(r12 + 1)] = Int32(r0)
    heapClassInst.heap32[(r12 + 2)] = Int32(r6)
    heapClassInst.heap32[(r12 + 3)] = Int32(r3)
    heapClassInst.heap32[(r12 + 4)] = Int32(r10)
    heapClassInst.heap32[(r12 + 5)] = Int32(r9)
    heapClassInst.heap32[(r12 + 6)] = Int32(r8)
    heapClassInst.heap32[(r12 + 7)] = Int32(r5)
    heapClassInst.heap8[sp + (-96)] = Int8(r1)
    heapClassInst.heap32[(r12 + 11)] = 0
    heapClassInst.heap32[(r12 + 9)] = 0
    heapClassInst.heap32[(r12 + 10)] = 0
    heapClassInst.heap8[sp + (-76)] = Int8(r1)
    heapClassInst.heap32[(r12 + 16)] = 0
    heapClassInst.heap32[(r12 + 14)] = 0
    heapClassInst.heap32[(r12 + 15)] = 0
    heapClassInst.heap8[sp + (-56)] = Int8(r1)
    heapClassInst.heap32[(r12 + 21)] = 0
    heapClassInst.heap32[(r12 + 19)] = 0
    r3 = r6 >> 2
    heapClassInst.heap32[(r12 + 20)] = 0
    r6 = r5 >> 2
    r3 = Int64(heapClassInst.heap32[(r3)])
    r6 = Int64(heapClassInst.heap32[(r6)])
    r3 = r3 >> 2
    r6 = r6 >> 2
    r3 = Int64(heapClassInst.heap32[(r3 + 2)])
    r6 = Int64(heapClassInst.heap32[(r6 + 9)])
    heapClassInst.heap32[(g0)] = Int32(r5)
    __FUNCTION_TABLE__[(r6) >> 2](i7);
    r6 = Int64(heapClassInst.heap32[(r4 + 2)])
    r8 = Int64(heapClassInst.heap32[(r4 + 44)])
    heapClassInst.heap32[(g0)] = Int32(r8)
    heapClassInst.heap32[(g0 + 1)] = Int32(r6)
    heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0)
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    r3 = Int64(heapClassInst.heap32[(r4 + 45)])
    r5 = Int64(heapClassInst.heap32[(r4 + 6)])
    r6 = _E2_str155
    heapClassInst.heap32[(g0)] = Int32(r6)
    r6 = r3 >> 2
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r8 = Int64(heapClassInst.heap32[(r6 + 7)])
    do {
        if (!(r8 > (-1))) {
            r9 = Int64(heapClassInst.heap32[(r6 + 8)])
            if (!(r9 > (-1))) {
                r9 = Int64(heapClassInst.heap32[(r6 + 9)])
                if (!(r9 == 0)) {
                    r10 = Int64(heapClassInst.heapU8[r3 + 40])
                    if (!(r10 == 0)) {
                        r10 = gNumAlignedFree
                        r10 = r10 >> 2
                        r13 = Int64(heapClassInst.heap32[(r10)])
                        r13 = (r13 + 1) | 0
                        r9 = r9 >> 2
                        heapClassInst.heap32[(r10)] = Int32(r13)
                        r9 = Int64(heapClassInst.heap32[(r9 + (-1))])
                        heapClassInst.heap32[(g0)] = Int32(r9)
                        free(i7);
                    }
                    heapClassInst.heap32[(r6 + 9)] = 0
                }
                r9 = 1
                heapClassInst.heap8[r3 + 40] = Int8(r9)
                heapClassInst.heap32[(r6 + 9)] = 0
                heapClassInst.heap32[(r6 + 8)] = 0
            }
            while (true) {
                r9 = r8 << 2
                r10 = Int64(heapClassInst.heap32[(r6 + 9)])
                r9 = (r10 + r9) | 0
                r8 = (r8 + 1) | 0
                r9 = r9 >> 2
                heapClassInst.heap32[(r9)] = 0
                if (r8 != 0) {
                    continue
                } else {
                    break
                }
            }
        }
    } while (false);
    heapClassInst.heap32[(r6 + 7)] = 0
    r8 = Int64(heapClassInst.heap32[(r6 + 2)])
    if (r8 > 0) {
        r9 = 0
        while (true) {
            r10 = Int64(heapClassInst.heap32[(r6 + 4)])
            r13 = r9 << 3
            r13 = (r10 + r13) | 0
            r13 = r13 >> 2
            r13 = Int64(heapClassInst.heap32[(r13)])
            r14 = r9 << 1
            if (r9 == r13) {
                r16 = r9
            } else {
                r15 = r10
                r16 = r9
                while (true) {
                    r13 = r13 << 3
                    r16 = r16 << 3
                    r13 = (r15 + r13) | 0
                    r15 = (r15 + r16) | 0
                    r13 = r13 >> 2
                    r15 = r15 >> 2
                    r16 = Int64(heapClassInst.heap32[(r13)])
                    heapClassInst.heap32[(r15)] = Int32(r16)
                    r16 = Int64(heapClassInst.heap32[(r13)])
                    r15 = Int64(heapClassInst.heap32[(r6 + 4)])
                    r13 = r16 << 3
                    r13 = (r15 + r13) | 0
                    r13 = r13 >> 2
                    r13 = Int64(heapClassInst.heap32[(r13)])
                    if (!(r13 != r16)) {
                        break
                    }
                }
            }
            r13 = r14 << 2
            r10 = (r10 + r13) | 0
            r9 = (r9 + 1) | 0
            r10 = r10 >> 2
            heapClassInst.heap32[(r10)] = Int32(r16)
            if (!(r8 != r9)) {
                break
            }
        }
        r8 = Int64(heapClassInst.heap32[(r6 + 2)])
        if (r8 > 1) {
            r9 = (r3 + 4) | 0
            r8 = (r8 + (-1)) | 0
            heapClassInst.heap32[(g0)] = Int32(r9)
            heapClassInst.heap32[(g0 + 1)] = 0
            heapClassInst.heap32[(g0 + 2)] = Int32(r8)
            _ZN20btAlignedObjectArrayI9btElementE17quickSortInternalI31btUnionFindElementSortPredicateEEvT_ii(i7);
            r8 = Int64(heapClassInst.heap32[(r6 + 2)])
        }
    }
    r9 = 0
    var break_flag3 = 0;
    var continue_flag3 = 0;
    while (true) {
        r10 = r9
        if (r10 < r8) {
            r13 = Int64(heapClassInst.heap32[(r6 + 4)])
            r9 = r10 << 3
            r9 = (r13 + r9) | 0
            r9 = r9 >> 2
            r14 = Int64(heapClassInst.heap32[(r9)])
            r15 = (r10 + 1) | 0
            while (true) {
                r9 = r15
                if (r9 >= r8) {
                    break
                } else {
                    r15 = r9 << 3
                    r15 = (r13 + r15) | 0
                    r16 = r15 >> 2
                    r15 = (r9 + 1) | 0
                    r16 = Int64(heapClassInst.heap32[(r16)])
                    if (!(r16 == r14)) {
                        break
                    }
                }
            }
            r16 = 1
            r15 = r10
            while (true) {
                if (r15 < r9) {
                    r17 = r15 << 3
                    r17 = (r13 + r17) | 0
                    r17 = r17 >> 2
                    r17 = Int64(heapClassInst.heap32[(r17 + 1)])
                    r18 = Int64(heapClassInst.heap32[(r4 + 4)])
                    r17 = r17 << 2
                    r17 = (r18 + r17) | 0
                    r17 = r17 >> 2
                    r17 = Int64(heapClassInst.heap32[(r17)])
                    r17 = r17 >> 2
                    r18 = Int64(heapClassInst.heap32[(r17 + 52)])
                    if (r18 == r14) {
                        r17 = Int64(heapClassInst.heap32[(r17 + 54)])
                        r18 = 0
                        if (r17 == 4) {
                            r16 = r18
                        } else {
                            r16 = if (r17 == 1) {
                                r18
                            } else {
                                r16
                            };
                        }
                    } else {
                        if (r18 != (-1)) {
                            __label__ = 37
                            break_flag3 = 1
                            break
                        }
                    }
                    r15 = (r15 + 1) | 0
                } else {
                    break
                }
            }
            if (break_flag3 == 1) {
              break
            }
            r13 = r16 & 255
            if (r13 == 0) {
                while (true) {
                    if (r10 < r9) {
                        r13 = Int64(heapClassInst.heap32[(r6 + 4)])
                        r15 = r10 << 3
                        r13 = (r13 + r15) | 0
                        r13 = r13 >> 2
                        r13 = Int64(heapClassInst.heap32[(r13 + 1)])
                        r15 = Int64(heapClassInst.heap32[(r4 + 4)])
                        r13 = r13 << 2
                        r13 = (r15 + r13) | 0
                        r13 = r13 >> 2
                        r13 = Int64(heapClassInst.heap32[(r13)])
                        r13 = r13 >> 2
                        r15 = Int64(heapClassInst.heap32[(r13 + 52)])
                        if (r15 == r14) {
                            r15 = Int64(heapClassInst.heap32[(r13 + 54)])
                            if (!(r15 != 2)) {
                                heapClassInst.heap32[(r13 + 54)] = 3
                                heapClassInst.heap32[(r13 + 55)] = 0
                            }
                        } else {
                            if (!(r15 == (-1))) {
                                __label__ = 54
                                break_flag3 = 1
                                break
                            }
                        }
                        r10 = (r10 + 1) | 0
                        continue
                    } else {
                      continue_flag3 = 1
                      break
                    }
                }
                if (break_flag3 == 1) {
                  break_flag3 = 0
                  break
                } 
                else if (continue_flag3 == 1) {
                  continue_flag3 = 0
                  continue
                }
            } else {
                while (true) {
                    if (r10 < r9) {
                        r13 = Int64(heapClassInst.heap32[(r6 + 4)])
                        r15 = r10 << 3
                        r13 = (r13 + r15) | 0
                        r13 = r13 >> 2
                        r13 = Int64(heapClassInst.heap32[(r13 + 1)])
                        r15 = Int64(heapClassInst.heap32[(r4 + 4)])
                        r13 = r13 << 2
                        r13 = (r15 + r13) | 0
                        r13 = r13 >> 2
                        r13 = Int64(heapClassInst.heap32[(r13)])
                        r13 = r13 >> 2
                        r15 = Int64(heapClassInst.heap32[(r13 + 52)])
                        if (r15 == r14) {
                            r15 = Int64(heapClassInst.heap32[(r13 + 54)])
                            r15 = (r15 + (-4)) | 0
                            if (!(`UIntNative`(r15) < `UIntNative`(2))) {
                                heapClassInst.heap32[(r13 + 54)] = 2
                            }
                        } else {
                            if (!(r15 == (-1))) {
                                __label__ = 47
                                break_flag3 = 1
                                break
                            }
                        }
                        r10 = (r10 + 1) | 0
                        continue
                    } else {
                        continue_flag3 = 1
                        break
                    }
                }
                if (break_flag3 == 1) {
                  break_flag3 = 0
                  break
                } 
                else if (continue_flag3 == 1) {
                  continue_flag3 = 0
                  continue
                }
            }
        } else {
            __label__ = 60
            break
        }
    }
    match (__label__) {
        case 37 =>
            r0 = _E2_str1156
            r1 = _E2_str2157
            heapClassInst.heap32[(g0)] = Int32(r0)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heap32[(g0 + 2)] = 242
            _assert(i7);
        case 54 =>
            r0 = _E2_str1156
            r1 = _E2_str2157
            heapClassInst.heap32[(g0)] = Int32(r0)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heap32[(g0 + 2)] = 290
            _assert(i7);
        case 60 =>
            r8 = r5 >> 2
            r9 = Int64(heapClassInst.heap32[(r8)])
            r9 = r9 >> 2
            r9 = Int64(heapClassInst.heap32[(r9 + 9)])
            heapClassInst.heap32[(g0)] = Int32(r5)
            __FUNCTION_TABLE__[(r9) >> 2](i7);
            r9 = commonVariable.r_g0
            do {
                if (!(r9 < 1)) {
                    r10 = 0
                    while (true) {
                        r13 = Int64(heapClassInst.heap32[(r8)])
                        r13 = r13 >> 2
                        r13 = Int64(heapClassInst.heap32[(r13 + 10)])
                        heapClassInst.heap32[(g0)] = Int32(r5)
                        heapClassInst.heap32[(g0 + 1)] = Int32(r10)
                        __FUNCTION_TABLE__[(r13) >> 2](i7);
                        r13 = commonVariable.r_g0
                        r14 = r13 >> 2
                        r15 = Int64(heapClassInst.heap32[(r14 + 277)])
                        r14 = Int64(heapClassInst.heap32[(r14 + 278)])
                        if (r15 == 0) {
                            __label__ = 64
                        } else {
                            r16 = r15 >> 2
                            r16 = Int64(heapClassInst.heap32[(r16 + 54)])
                            if (r16 != 2) {
                                __label__ = 66
                            } else {
                                __label__ = 64
                            }
                        }
                        if (__label__ == 64) {
                            if (r14 == 0) {
                                __label__ = 95
                            } else {
                                r16 = r14 >> 2
                                r16 = Int64(heapClassInst.heap32[(r16 + 54)])
                                if (r16 == 2) {
                                    __label__ = 95
                                } else {
                                    __label__ = 66
                                }
                            }
                        }
                        if (__label__ == 66) {
                            r16 = Int64(heapClassInst.heapU8[r15 + 204])
                            r16 = r16 & 2
                            if (!(r16 == 0)) {
                                r16 = r15 >> 2
                                r16 = Int64(heapClassInst.heap32[(r16 + 54)])
                                if (!(r16 == 2)) {
                                    r16 = Int64(heapClassInst.heapU8[r14 + 204])
                                    r16 = r16 & 3
                                    if (!(r16 != 0)) {
                                        r16 = r14 >> 2
                                        r17 = Int64(heapClassInst.heap32[(r16 + 54)])
                                        r17 = (r17 + (-4)) | 0
                                        if (!(`UIntNative`(r17) < `UIntNative`(2))) {
                                            heapClassInst.heap32[(r16 + 54)] = 1
                                        }
                                        heapClassInst.heap32[(r16 + 55)] = 0
                                    }
                                }
                            }
                            r16 = Int64(heapClassInst.heapU8[r14 + 204])
                            r16 = r16 & 2
                            if (!(r16 == 0)) {
                                r16 = r14 >> 2
                                r16 = Int64(heapClassInst.heap32[(r16 + 54)])
                                if (!(r16 == 2)) {
                                    r16 = Int64(heapClassInst.heapU8[r15 + 204])
                                    r16 = r16 & 3
                                    if (!(r16 != 0)) {
                                        r16 = r15 >> 2
                                        r17 = Int64(heapClassInst.heap32[(r16 + 54)])
                                        r17 = (r17 + (-4)) | 0
                                        if (!(`UIntNative`(r17) < `UIntNative`(2))) {
                                            heapClassInst.heap32[(r16 + 54)] = 1
                                        }
                                        heapClassInst.heap32[(r16 + 55)] = 0
                                    }
                                }
                            }
                            r16 = Int64(heapClassInst.heapU8[r3 + 64])
                            if (!(r16 == 0)) {
                                r16 = Int64(heapClassInst.heap32[(r8)])
                                r16 = r16 >> 2
                                r16 = Int64(heapClassInst.heap32[(r16 + 7)])
                                heapClassInst.heap32[(g0)] = Int32(r5)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r15)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r14)
                                __FUNCTION_TABLE__[(r16) >> 2](i7);
                                r14 = commonVariable.r_g0
                                if (!(r14 == 0)) {
                                    r14 = Int64(heapClassInst.heap32[(r6 + 8)])
                                    r15 = Int64(heapClassInst.heap32[(r6 + 7)])
                                    if (r14 == r15) {
                                        r16 = 1
                                        r17 = r15 << 1
                                        r17 = if (r15 == 0) {
                                            r16
                                        } else {
                                            r17
                                        };
                                        if (!(r14 >= r17)) {
                                            if (r17 != 0) {
                                                r14 = gNumAlignedAllocs
                                                r14 = r14 >> 2
                                                r18 = Int64(heapClassInst.heap32[(r14)])
                                                r19 = r17 << 2
                                                r18 = (r18 + 1) | 0
                                                r19 = r19 | 3
                                                heapClassInst.heap32[(r14)] = Int32(r18)
                                                r14 = (r19 + 16) | 0
                                                heapClassInst.heap32[(g0)] = Int32(r14)
                                                mallocNew(i7);
                                                r14 = commonVariable.r_g0
                                                if (r14 != 0) {
                                                    r15 = 0
                                                    r18 = (r14 + 4) | 0
                                                    r15 = (r15 - r18) | 0
                                                    r15 = r15 & 15
                                                    r15 = (r14 + r15) | 0
                                                    r18 = r15 >> 2
                                                    heapClassInst.heap32[(r18)] = Int32(r14)
                                                    r14 = (r15 + 4) | 0
                                                    r15 = Int64(heapClassInst.heap32[(r6 + 7)])
                                                }
                                            } else {
                                                r14 = 0
                                            }
                                            if (!(r15 < 1)) {
                                                r18 = 0
                                                while (true) {
                                                    r19 = r18 << 2
                                                    r20 = Int64(heapClassInst.heap32[(r6 + 9)])
                                                    r20 = (r20 + r19) | 0
                                                    r20 = r20 >> 2
                                                    r19 = (r14 + r19) | 0
                                                    r20 = Int64(heapClassInst.heap32[(r20)])
                                                    r18 = (r18 + 1) | 0
                                                    r19 = r19 >> 2
                                                    heapClassInst.heap32[(r19)] = Int32(r20)
                                                    if (!(r15 != r18)) {
                                                        break
                                                    }
                                                }
                                            }
                                            r15 = Int64(heapClassInst.heap32[(r6 + 9)])
                                            if (!(r15 == 0)) {
                                                r18 = Int64(heapClassInst.heapU8[r3 + 40])
                                                if (!(r18 == 0)) {
                                                    r18 = gNumAlignedFree
                                                    r18 = r18 >> 2
                                                    r19 = Int64(heapClassInst.heap32[(r18)])
                                                    r19 = (r19 + 1) | 0
                                                    r15 = r15 >> 2
                                                    heapClassInst.heap32[(r18)] = Int32(r19)
                                                    r15 = Int64(heapClassInst.heap32[(r15 + (-1))])
                                                    heapClassInst.heap32[(g0)] = Int32(r15)
                                                    free(i7);
                                                }
                                                heapClassInst.heap32[(r6 + 9)] = 0
                                            }
                                            heapClassInst.heap8[r3 + 40] = Int8(r16)
                                            heapClassInst.heap32[(r6 + 9)] = Int32(r14)
                                            heapClassInst.heap32[(r6 + 8)] = Int32(r17)
                                            r15 = Int64(heapClassInst.heap32[(r6 + 7)])
                                        }
                                    }
                                    r14 = r15 << 2
                                    r15 = Int64(heapClassInst.heap32[(r6 + 9)])
                                    r14 = (r15 + r14) | 0
                                    r14 = r14 >> 2
                                    heapClassInst.heap32[(r14)] = Int32(r13)
                                    r13 = Int64(heapClassInst.heap32[(r6 + 7)])
                                    r13 = (r13 + 1) | 0
                                    heapClassInst.heap32[(r6 + 7)] = Int32(r13)
                                }
                            }
                        }
                        r10 = (r10 + 1) | 0
                        if (r9 != r10) {
                            continue
                        } else {
                            break
                        }
                    }
                }
            } while (false);
            r9 = _ZN15CProfileManager11CurrentNodeE
            r9 = r9 >> 2
            r10 = Int64(heapClassInst.heap32[(r9)])
            r13 = r10 >> 2
            r14 = Int64(heapClassInst.heap32[(r13 + 4)])
            r14 = (r14 + (-1)) | 0
            heapClassInst.heap32[(r13 + 4)] = Int32(r14)
            do {
                if (!(r14 != 0)) {
                    r14 = Int64(heapClassInst.heap32[(r13 + 1)])
                    if (r14 != 0) {
                        r10 = sp + (-24)
                        heapClassInst.heap32[(g0)] = Int32(r10)
                        heapClassInst.heap32[(g0 + 1)] = 0
                        r14 = _ZL13gProfileClock_2E_0
                        gettimeofday(i7);
                        r14 = r14 >> 2
                        r14 = Int64(heapClassInst.heap32[(r14)])
                        r14 = r14 >> 2
                        r10 = r10 >> 2
                        r15 = Int64(heapClassInst.heap32[(fp + (-6))])
                        r16 = Int64(heapClassInst.heap32[(r14)])
                        r15 = (r15 - r16) | 0
                        r10 = Int64(heapClassInst.heap32[(r10 + 1)])
                        r14 = Int64(heapClassInst.heap32[(r14 + 1)])
                        r10 = (r10 - r14) | 0
                        r14 = (r15 * 1000000) | 0
                        r10 = (r10 + r14) | 0
                        r14 = Int64(heapClassInst.heap32[(r13 + 3)])
                        r10 = (r10 - r14) | 0
                        f0 = Float64(`UIntNative`(r10))
                        f1 = 1000.0
                        f2 = Float64(heapClassInst.heapFloat[(r13 + 2)])
                        f0 = f0 / f1
                        f0 = f2 + f0
                        heapClassInst.heapFloat[(r13 + 2)] = Float32(f0)
                        r10 = Int64(heapClassInst.heap32[(r13 + 4)])
                        if (r10 != 0) {
                            break
                        } else {
                            r10 = Int64(heapClassInst.heap32[(r9)])
                        }
                    }
                    r10 = r10 >> 2
                    r10 = Int64(heapClassInst.heap32[(r10 + 5)])
                    heapClassInst.heap32[(r9)] = Int32(r10)
                }
            } while (false);
            r10 = Int64(heapClassInst.heap32[(r6 + 2)])
            r13 = _E2_str3158
            heapClassInst.heap32[(g0)] = Int32(r13)
            _ZN15CProfileManager13Start_ProfileEPKc(i7);
            r13 = Int64(heapClassInst.heapU8[r3 + 64])
            do {
                if (r13 != 0) {
                    r5 = Int64(heapClassInst.heap32[(r6 + 7)])
                    if (!(r5 < 2)) {
                        r8 = (r3 + 24) | 0
                        r13 = (r5 + (-1)) | 0
                        heapClassInst.heap32[(g0)] = Int32(r8)
                        heapClassInst.heap32[(g0 + 1)] = 0
                        heapClassInst.heap32[(g0 + 2)] = Int32(r13)
                        _ZN20btAlignedObjectArrayIP20btPersistentManifoldE17quickSortInternalI33btPersistentManifoldSortPredicateEEvT_ii(
                            i7);
                    }
                    if (!(r10 < 1)) {
                        r8 = 0
                        r13 = r8
                        r14 = r8
                        while (true) {
                            r15 = Int64(heapClassInst.heap32[(r6 + 4)])
                            r16 = r14 << 3
                            r15 = (r15 + r16) | 0
                            r15 = r15 >> 2
                            r15 = Int64(heapClassInst.heap32[(r15)])
                            r16 = r8
                            while (true) {
                                if (r14 >= r10) {
                                    break
                                } else {
                                    r17 = Int64(heapClassInst.heap32[(r6 + 4)])
                                    r18 = r14 << 3
                                    r17 = (r17 + r18) | 0
                                    r17 = r17 >> 2
                                    r18 = Int64(heapClassInst.heap32[(r17)])
                                    if (r18 == r15) {
                                        r17 = Int64(heapClassInst.heap32[(r17 + 1)])
                                        r18 = Int64(heapClassInst.heap32[(r4 + 4)])
                                        r17 = r17 << 2
                                        r17 = (r18 + r17) | 0
                                        r17 = r17 >> 2
                                        r18 = Int64(heapClassInst.heap32[(r6 + 13)])
                                        r19 = Int64(heapClassInst.heap32[(r6 + 12)])
                                        r17 = Int64(heapClassInst.heap32[(r17)])
                                        if (r18 == r19) {
                                            r20 = 1
                                            r21 = r19 << 1
                                            r21 = if (r19 == 0) {
                                                r20
                                            } else {
                                                r21
                                            };
                                            if (!(r18 >= r21)) {
                                                if (r21 != 0) {
                                                    r18 = gNumAlignedAllocs
                                                    r18 = r18 >> 2
                                                    r22 = Int64(heapClassInst.heap32[(r18)])
                                                    r23 = r21 << 2
                                                    r22 = (r22 + 1) | 0
                                                    r23 = r23 | 3
                                                    heapClassInst.heap32[(r18)] = Int32(r22)
                                                    r18 = (r23 + 16) | 0
                                                    heapClassInst.heap32[(g0)] = Int32(r18)
                                                    mallocNew(i7);
                                                    r18 = commonVariable.r_g0
                                                    if (r18 != 0) {
                                                        r19 = 0
                                                        r22 = (r18 + 4) | 0
                                                        r19 = (r19 - r22) | 0
                                                        r19 = r19 & 15
                                                        r19 = (r18 + r19) | 0
                                                        r22 = r19 >> 2
                                                        heapClassInst.heap32[(r22)] = Int32(r18)
                                                        r18 = (r19 + 4) | 0
                                                        r19 = Int64(heapClassInst.heap32[(r6 + 12)])
                                                    }
                                                } else {
                                                    r18 = 0
                                                }
                                                if (!(r19 < 1)) {
                                                    r22 = 0
                                                    while (true) {
                                                        r23 = r22 << 2
                                                        r24 = Int64(heapClassInst.heap32[(r6 + 14)])
                                                        r24 = (r24 + r23) | 0
                                                        r24 = r24 >> 2
                                                        r23 = (r18 + r23) | 0
                                                        r24 = Int64(heapClassInst.heap32[(r24)])
                                                        r22 = (r22 + 1) | 0
                                                        r23 = r23 >> 2
                                                        heapClassInst.heap32[(r23)] = Int32(r24)
                                                        if (!(r19 != r22)) {
                                                            break
                                                        }
                                                    }
                                                }
                                                r19 = Int64(heapClassInst.heap32[(r6 + 14)])
                                                if (!(r19 == 0)) {
                                                    r22 = Int64(heapClassInst.heapU8[r3 + 60])
                                                    if (!(r22 == 0)) {
                                                        r22 = gNumAlignedFree
                                                        r22 = r22 >> 2
                                                        r23 = Int64(heapClassInst.heap32[(r22)])
                                                        r23 = (r23 + 1) | 0
                                                        r19 = r19 >> 2
                                                        heapClassInst.heap32[(r22)] = Int32(r23)
                                                        r19 = Int64(heapClassInst.heap32[(r19 + (-1))])
                                                        heapClassInst.heap32[(g0)] = Int32(r19)
                                                        free(i7);
                                                    }
                                                    heapClassInst.heap32[(r6 + 14)] = 0
                                                }
                                                heapClassInst.heap8[r3 + 60] = Int8(r20)
                                                heapClassInst.heap32[(r6 + 14)] = Int32(r18)
                                                heapClassInst.heap32[(r6 + 13)] = Int32(r21)
                                                r19 = Int64(heapClassInst.heap32[(r6 + 12)])
                                            }
                                        }
                                        r18 = r19 << 2
                                        r19 = Int64(heapClassInst.heap32[(r6 + 14)])
                                        r18 = (r19 + r18) | 0
                                        r18 = r18 >> 2
                                        heapClassInst.heap32[(r18)] = Int32(r17)
                                        r18 = Int64(heapClassInst.heap32[(r6 + 12)])
                                        r18 = (r18 + 1) | 0
                                        r17 = r17 >> 2
                                        heapClassInst.heap32[(r6 + 12)] = Int32(r18)
                                        r17 = Int64(heapClassInst.heap32[(r17 + 54)])
                                        if (r17 != 2) {
                                            r18 = 1
                                            r16 = if (r17 == 5) {
                                                r18
                                            } else {
                                                r16
                                            };
                                        } else {
                                            r16 = 1
                                        }
                                        r14 = (r14 + 1) | 0
                                    } else {
                                        break
                                    }
                                }
                            }
                            do {
                                if (r13 < r5) {
                                    r17 = Int64(heapClassInst.heap32[(r6 + 9)])
                                    r19 = r13 << 2
                                    r18 = (r17 + r19) | 0
                                    r20 = r18 >> 2
                                    r20 = Int64(heapClassInst.heap32[(r20)])
                                    r20 = r20 >> 2
                                    r21 = Int64(heapClassInst.heap32[(r20 + 277)])
                                    r21 = r21 >> 2
                                    r21 = Int64(heapClassInst.heap32[(r21 + 52)])
                                    if (r21 < 0) {
                                        r21 = Int64(heapClassInst.heap32[(r20 + 278)])
                                        r21 = r21 >> 2
                                        r21 = Int64(heapClassInst.heap32[(r21 + 52)])
                                    }
                                    if (r21 != r15) {
                                        __label__ = 129
                                    } else {
                                        r19 = (r17 + r19) | 0
                                        r20 = 1
                                        while (true) {
                                            r17 = r20
                                            r1 = (r13 + r17) | 0
                                            if (r1 >= r5) {
                                                __label__ = 138
                                                break
                                            } else {
                                                r20 = r17 << 2
                                                r20 = (r19 + r20) | 0
                                                r20 = r20 >> 2
                                                r20 = Int64(heapClassInst.heap32[(r20)])
                                                r20 = r20 >> 2
                                                r21 = Int64(heapClassInst.heap32[(r20 + 277)])
                                                r21 = r21 >> 2
                                                r21 = Int64(heapClassInst.heap32[(r21 + 52)])
                                                if (r21 < 0) {
                                                    r20 = Int64(heapClassInst.heap32[(r20 + 278)])
                                                    r20 = r20 >> 2
                                                    r21 = Int64(heapClassInst.heap32[(r20 + 52)])
                                                }
                                                r20 = (r17 + 1) | 0
                                                if (!(r21 == r15)) {
                                                    __label__ = 138
                                                    break
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    __label__ = 129
                                }
                            } while (false);
                            if (__label__ == 129) {
                                r17 = 0
                                r18 = r17
                            }
                            r16 = r16 & 255
                            if (!(r16 != 0)) {
                                r16 = Int64(heapClassInst.heap32[(fp + (-36))])
                                r16 = r16 >> 2
                                r16 = Int64(heapClassInst.heap32[(r16 + 2)])
                                r19 = Int64(heapClassInst.heap32[(r6 + 12)])
                                r20 = Int64(heapClassInst.heap32[(r6 + 14)])
                                heapClassInst.heap32[(g0)] = Int32(r11)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r20)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r19)
                                heapClassInst.heap32[(g0 + 3)] = Int32(r18)
                                heapClassInst.heap32[(g0 + 4)] = Int32(r17)
                                heapClassInst.heap32[(g0 + 5)] = Int32(r15)
                                __FUNCTION_TABLE__[(r16) >> 2](i7);
                            }
                            r15 = Int64(heapClassInst.heap32[(r6 + 12)])
                            do {
                                if (!(r15 > (-1))) {
                                    r16 = Int64(heapClassInst.heap32[(r6 + 13)])
                                    if (r16 < 0) {
                                        r16 = Int64(heapClassInst.heap32[(r6 + 14)])
                                        if (!(r16 == 0)) {
                                            r18 = Int64(heapClassInst.heapU8[r3 + 60])
                                            if (!(r18 == 0)) {
                                                r18 = gNumAlignedFree
                                                r18 = r18 >> 2
                                                r19 = Int64(heapClassInst.heap32[(r18)])
                                                r19 = (r19 + 1) | 0
                                                r16 = r16 >> 2
                                                heapClassInst.heap32[(r18)] = Int32(r19)
                                                r16 = Int64(heapClassInst.heap32[(r16 + (-1))])
                                                heapClassInst.heap32[(g0)] = Int32(r16)
                                                free(i7);
                                            }
                                            heapClassInst.heap32[(r6 + 14)] = 0
                                        }
                                        r16 = 1
                                        heapClassInst.heap8[r3 + 60] = Int8(r16)
                                        heapClassInst.heap32[(r6 + 14)] = 0
                                        heapClassInst.heap32[(r6 + 13)] = 0
                                    }
                                    while (true) {
                                        r16 = r15 << 2
                                        r18 = Int64(heapClassInst.heap32[(r6 + 14)])
                                        r16 = (r18 + r16) | 0
                                        r15 = (r15 + 1) | 0
                                        r16 = r16 >> 2
                                        heapClassInst.heap32[(r16)] = 0
                                        if (!(r15 != 0)) {
                                            break
                                        }
                                    }
                                }
                            } while (false);
                            r13 = if (r17 == 0) {
                                r13
                            } else {
                                r1
                            };
                            heapClassInst.heap32[(r6 + 12)] = 0
                            if (r14 < r10) {
                                continue
                            } else {
                                break
                            }
                        }
                    }
                } else {
                    r1 = Int64(heapClassInst.heap32[(r8)])
                    r1 = r1 >> 2
                    r1 = Int64(heapClassInst.heap32[(r1 + 11)])
                    heapClassInst.heap32[(g0)] = Int32(r5)
                    __FUNCTION_TABLE__[(r1) >> 2](i7);
                    r1 = commonVariable.r_g0
                    r3 = Int64(heapClassInst.heap32[(r8)])
                    r3 = r3 >> 2
                    r3 = Int64(heapClassInst.heap32[(r3 + 9)])
                    heapClassInst.heap32[(g0)] = Int32(r5)
                    __FUNCTION_TABLE__[(r3) >> 2](i7);
                    r6 = Int64(heapClassInst.heap32[(fp + (-36))])
                    r6 = r6 >> 2
                    r6 = Int64(heapClassInst.heap32[(r6 + 2)])
                    r10 = Int64(heapClassInst.heap32[(r4 + 2)])
                    r5 = Int64(heapClassInst.heap32[(r4 + 4)])
                    heapClassInst.heap32[(g0)] = Int32(r11)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r5)
                    heapClassInst.heap32[(g0 + 2)] = Int32(r10)
                    heapClassInst.heap32[(g0 + 3)] = Int32(r1)
                    heapClassInst.heap32[(g0 + 4)] = Int32(commonVariable.r_g0)
                    heapClassInst.heap32[(g0 + 5)] = (-1)
                    __FUNCTION_TABLE__[(r6) >> 2](i7);
                }
            } while (false);
            r1 = Int64(heapClassInst.heap32[(r9)])
            r3 = r1 >> 2
            r5 = Int64(heapClassInst.heap32[(r3 + 4)])
            r5 = (r5 + (-1)) | 0
            heapClassInst.heap32[(r3 + 4)] = Int32(r5)
            do {
                if (!(r5 != 0)) {
                    r5 = Int64(heapClassInst.heap32[(r3 + 1)])
                    if (r5 != 0) {
                        r1 = sp + (-16)
                        heapClassInst.heap32[(g0)] = Int32(r1)
                        heapClassInst.heap32[(g0 + 1)] = 0
                        r5 = _ZL13gProfileClock_2E_0
                        gettimeofday(i7);
                        r5 = r5 >> 2
                        r5 = Int64(heapClassInst.heap32[(r5)])
                        r5 = r5 >> 2
                        r1 = r1 >> 2
                        r6 = Int64(heapClassInst.heap32[(fp + (-4))])
                        r8 = Int64(heapClassInst.heap32[(r5)])
                        r6 = (r6 - r8) | 0
                        r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                        r5 = Int64(heapClassInst.heap32[(r5 + 1)])
                        r1 = (r1 - r5) | 0
                        r5 = (r6 * 1000000) | 0
                        r1 = (r1 + r5) | 0
                        r5 = Int64(heapClassInst.heap32[(r3 + 3)])
                        r1 = (r1 - r5) | 0
                        f0 = Float64(`UIntNative`(r1))
                        f1 = 1000.0
                        f2 = Float64(heapClassInst.heapFloat[(r3 + 2)])
                        f0 = f0 / f1
                        f0 = f2 + f0
                        heapClassInst.heapFloat[(r3 + 2)] = Float32(f0)
                        r1 = Int64(heapClassInst.heap32[(r3 + 4)])
                        if (r1 != 0) {
                            break
                        } else {
                            r1 = Int64(heapClassInst.heap32[(r9)])
                        }
                    }
                    r1 = r1 >> 2
                    r1 = Int64(heapClassInst.heap32[(r1 + 5)])
                    heapClassInst.heap32[(r9)] = Int32(r1)
                }
            } while (false);
            heapClassInst.heap32[(g0)] = Int32(r11)
            _ZZN23btDiscreteDynamicsWorld16solveConstraintsER19btContactSolverInfoEN27InplaceSolverIslandCallback18processConstraintsEv(
                i7);
            r1 = Int64(heapClassInst.heap32[(r4 + 44)])
            r3 = r1 >> 2
            r3 = Int64(heapClassInst.heap32[(r3)])
            r3 = r3 >> 2
            r3 = Int64(heapClassInst.heap32[(r3 + 4)])
            r5 = Int64(heapClassInst.heap32[(r4 + 19)])
            r4 = Int64(heapClassInst.heap32[(r4 + 21)])
            heapClassInst.heap32[(g0)] = Int32(r1)
            heapClassInst.heap32[(g0 + 1)] = Int32(r0)
            heapClassInst.heap32[(g0 + 2)] = Int32(r4)
            heapClassInst.heap32[(g0 + 3)] = Int32(r5)
            __FUNCTION_TABLE__[(r3) >> 2](i7);
            heapClassInst.heap32[(fp + (-36))] = Int32(r7)
            r0 = Int64(heapClassInst.heap32[(r12 + 21)])
            if (!(r0 == 0)) {
                r1 = Int64(heapClassInst.heapU8[sp + (-56)])
                if (!(r1 == 0)) {
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
                heapClassInst.heap32[(r12 + 21)] = 0
            }
            r0 = 1
            heapClassInst.heap8[sp + (-56)] = Int8(r0)
            heapClassInst.heap32[(r12 + 21)] = 0
            heapClassInst.heap32[(r12 + 19)] = 0
            heapClassInst.heap32[(r12 + 20)] = 0
            r1 = Int64(heapClassInst.heap32[(r12 + 16)])
            if (!(r1 == 0)) {
                r3 = Int64(heapClassInst.heapU8[sp + (-76)])
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
                heapClassInst.heap32[(r12 + 16)] = 0
            }
            heapClassInst.heap8[sp + (-76)] = Int8(r0)
            heapClassInst.heap32[(r12 + 16)] = 0
            heapClassInst.heap32[(r12 + 14)] = 0
            heapClassInst.heap32[(r12 + 15)] = 0
            r1 = Int64(heapClassInst.heap32[(r12 + 11)])
            if (!(r1 == 0)) {
                r3 = Int64(heapClassInst.heapU8[sp + (-96)])
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
                heapClassInst.heap32[(r12 + 11)] = 0
            }
            heapClassInst.heap8[sp + (-96)] = Int8(r0)
            heapClassInst.heap32[(r12 + 11)] = 0
            heapClassInst.heap32[(r12 + 9)] = 0
            heapClassInst.heap32[(r12 + 10)] = 0
            r1 = Int64(heapClassInst.heap32[(r2 + 3)])
            if (!(r1 == 0)) {
                r3 = Int64(heapClassInst.heapU8[sp + (-32)])
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
                heapClassInst.heap32[(r2 + 3)] = 0
            }
            heapClassInst.heap8[sp + (-32)] = Int8(r0)
            heapClassInst.heap32[(r2 + 3)] = 0
            heapClassInst.heap32[(r2 + 1)] = 0
            heapClassInst.heap32[(r2 + 2)] = 0
            r0 = Int64(heapClassInst.heap32[(r9)])
            r1 = r0 >> 2
            r2 = Int64(heapClassInst.heap32[(r1 + 4)])
            r2 = (r2 + (-1)) | 0
            heapClassInst.heap32[(r1 + 4)] = Int32(r2)
            do {
                if (!(r2 != 0)) {
                    r2 = Int64(heapClassInst.heap32[(r1 + 1)])
                    if (r2 != 0) {
                        r0 = sp + (-8)
                        heapClassInst.heap32[(g0)] = Int32(r0)
                        heapClassInst.heap32[(g0 + 1)] = 0
                        r2 = _ZL13gProfileClock_2E_0
                        gettimeofday(i7);
                        r2 = r2 >> 2
                        r2 = Int64(heapClassInst.heap32[(r2)])
                        r2 = r2 >> 2
                        r0 = r0 >> 2
                        r3 = Int64(heapClassInst.heap32[(fp + (-2))])
                        r4 = Int64(heapClassInst.heap32[(r2)])
                        r3 = (r3 - r4) | 0
                        r0 = Int64(heapClassInst.heap32[(r0 + 1)])
                        r2 = Int64(heapClassInst.heap32[(r2 + 1)])
                        r0 = (r0 - r2) | 0
                        r2 = (r3 * 1000000) | 0
                        r0 = (r0 + r2) | 0
                        r2 = Int64(heapClassInst.heap32[(r1 + 3)])
                        r0 = (r0 - r2) | 0
                        f0 = Float64(`UIntNative`(r0))
                        f1 = 1000.0
                        f2 = Float64(heapClassInst.heapFloat[(r1 + 2)])
                        f0 = f0 / f1
                        f0 = f2 + f0
                        heapClassInst.heapFloat[(r1 + 2)] = Float32(f0)
                        r0 = Int64(heapClassInst.heap32[(r1 + 4)])
                        if (r0 != 0) {
                            break
                        } else {
                            r0 = Int64(heapClassInst.heap32[(r9)])
                        }
                    }
                    r0 = r0 >> 2
                    r0 = Int64(heapClassInst.heap32[(r0 + 5)])
                    heapClassInst.heap32[(r9)] = Int32(r0)
                }
            } while (false);
            return;
        case 47 =>
            r0 = _E2_str1156
            r1 = _E2_str2157
            heapClassInst.heap32[(g0)] = Int32(r0)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heap32[(g0 + 2)] = 269
            _assert(i7);
        case _ => println("break")
    }
}

func _ZN23btDiscreteDynamicsWorld16removeConstraintEP17btTypedConstraint(sp: Int64): Unit {
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
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = Int64(heapClassInst.heap32[(r0 + 47)])
    r3 = 0
    while (true) {
        if (r2 > r3) {
            r4 = Int64(heapClassInst.heap32[(r0 + 49)])
            r5 = r3 << 2
            r4 = (r4 + r5) | 0
            r4 = r4 >> 2
            r4 = Int64(heapClassInst.heap32[(r4)])
            if (r4 != r1) {
                r3 = (r3 + 1) | 0
                continue
            } else {
                __label__ = 5
                break
            }
        } else {
            __label__ = 4
            break
        }
    }
    if (__label__ == 4) {
        r3 = r2
    }
    if (!(r2 <= r3)) {
        r2 = (r2 + (-1)) | 0
        r3 = r3 << 2
        r4 = Int64(heapClassInst.heap32[(r0 + 49)])
        r2 = r2 << 2
        r3 = (r4 + r3) | 0
        r4 = (r4 + r2) | 0
        r3 = r3 >> 2
        r4 = r4 >> 2
        r5 = Int64(heapClassInst.heap32[(r3)])
        r4 = Int64(heapClassInst.heap32[(r4)])
        heapClassInst.heap32[(r3)] = Int32(r4)
        r3 = Int64(heapClassInst.heap32[(r0 + 49)])
        r2 = (r3 + r2) | 0
        r2 = r2 >> 2
        heapClassInst.heap32[(r2)] = Int32(r5)
        r2 = Int64(heapClassInst.heap32[(r0 + 47)])
        r2 = (r2 + (-1)) | 0
        heapClassInst.heap32[(r0 + 47)] = Int32(r2)
    }
    r0 = r1 >> 2
    r2 = Int64(heapClassInst.heap32[(r0 + 5)])
    r2 = r2 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 120)])
    r4 = 0
    while (true) {
        if (r3 > r4) {
            r5 = Int64(heapClassInst.heap32[(r2 + 122)])
            r6 = r4 << 2
            r5 = (r5 + r6) | 0
            r5 = r5 >> 2
            r5 = Int64(heapClassInst.heap32[(r5)])
            if (r5 != r1) {
                r4 = (r4 + 1) | 0
                continue
            } else {
                __label__ = 12
                break
            }
        } else {
            __label__ = 11
            break
        }
    }
    if (__label__ == 11) {
        r4 = r3
    }
    if (r3 > r4) {
        r3 = (r3 + (-1)) | 0
        r4 = r4 << 2
        r5 = Int64(heapClassInst.heap32[(r2 + 122)])
        r3 = r3 << 2
        r4 = (r5 + r4) | 0
        r5 = (r5 + r3) | 0
        r4 = r4 >> 2
        r5 = r5 >> 2
        r6 = Int64(heapClassInst.heap32[(r4)])
        r5 = Int64(heapClassInst.heap32[(r5)])
        heapClassInst.heap32[(r4)] = Int32(r5)
        r4 = Int64(heapClassInst.heap32[(r2 + 122)])
        r3 = (r4 + r3) | 0
        r3 = r3 >> 2
        heapClassInst.heap32[(r3)] = Int32(r6)
        r3 = Int64(heapClassInst.heap32[(r2 + 120)])
        r3 = (r3 + (-1)) | 0
        heapClassInst.heap32[(r2 + 120)] = Int32(r3)
    }
    r4 = 0
    r3 = if (r3 > r4) {
        1
    } else {
        0
    };
    r3 = r3 & 1
    heapClassInst.heap32[(r2 + 63)] = Int32(r3)
    r0 = Int64(heapClassInst.heap32[(r0 + 6)])
    r0 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r0 + 120)])
    while (true) {
        if (r2 > r4) {
            r3 = Int64(heapClassInst.heap32[(r0 + 122)])
            r5 = r4 << 2
            r3 = (r3 + r5) | 0
            r3 = r3 >> 2
            r3 = Int64(heapClassInst.heap32[(r3)])
            if (r3 != r1) {
                r4 = (r4 + 1) | 0
                continue
            } else {
                __label__ = 19
                break
            }
        } else {
            __label__ = 18
            break
        }
    }
    if (__label__ == 18) {
        r4 = r2
    }
    if (r2 > r4) {
        r2 = (r2 + (-1)) | 0
        r1 = r4 << 2
        r3 = Int64(heapClassInst.heap32[(r0 + 122)])
        r2 = r2 << 2
        r1 = (r3 + r1) | 0
        r3 = (r3 + r2) | 0
        r1 = r1 >> 2
        r3 = r3 >> 2
        r4 = Int64(heapClassInst.heap32[(r1)])
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(r1)] = Int32(r3)
        r1 = Int64(heapClassInst.heap32[(r0 + 122)])
        r2 = (r1 + r2) | 0
        r2 = r2 >> 2
        heapClassInst.heap32[(r2)] = Int32(r4)
        r2 = Int64(heapClassInst.heap32[(r0 + 120)])
        r2 = (r2 + (-1)) | 0
        heapClassInst.heap32[(r0 + 120)] = Int32(r2)
    }
    r1 = 0
    r1 = if (r2 > r1) {
        1
    } else {
        0
    };
    r1 = r1 & 1
    heapClassInst.heap32[(r0 + 63)] = Int32(r1)
    return;
}

func _ZN23btDiscreteDynamicsWorld13addConstraintEP17btTypedConstraintb(sp: Int64): Unit {
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
    r2 = Int64(heapClassInst.heap32[(r1 + 48)])
    r3 = Int64(heapClassInst.heap32[(r1 + 47)])
    r4 = Int64(heapClassInst.heap32[(fp + 1)])
    r5 = Int64(heapClassInst.heap32[(fp + 2)])
    if (r2 == r3) {
        r6 = 1
        r7 = r3 << 1
        r7 = if (r3 == 0) {
            r6
        } else {
            r7
        };
        if (!(r2 >= r7)) {
            if (r7 != 0) {
                r2 = gNumAlignedAllocs
                r2 = r2 >> 2
                r8 = Int64(heapClassInst.heap32[(r2)])
                r9 = r7 << 2
                r8 = (r8 + 1) | 0
                r9 = r9 | 3
                heapClassInst.heap32[(r2)] = Int32(r8)
                r2 = (r9 + 16) | 0
                heapClassInst.heap32[(g0)] = Int32(r2)
                mallocNew(i7);
                r2 = commonVariable.r_g0
                if (r2 != 0) {
                    r8 = 0
                    r9 = (r2 + 4) | 0
                    r8 = (r8 - r9) | 0
                    r8 = r8 & 15
                    r8 = (r2 + r8) | 0
                    r9 = (r8 + 4) | 0
                    r8 = r8 >> 2
                    heapClassInst.heap32[(r8)] = Int32(r2)
                    r2 = r9
                }
            } else {
                r2 = 0
            }
            r8 = (r0 + 196) | 0
            if (r3 < 1) {
                r9 = r8 >> 2
                r10 = Int64(heapClassInst.heap32[(r9)])
            } else {
                r9 = 0
                while (true) {
                    r10 = r8 >> 2
                    r10 = Int64(heapClassInst.heap32[(r10)])
                    r11 = r9 << 2
                    r12 = (r10 + r11) | 0
                    r12 = r12 >> 2
                    r11 = (r2 + r11) | 0
                    r12 = Int64(heapClassInst.heap32[(r12)])
                    r9 = (r9 + 1) | 0
                    r11 = r11 >> 2
                    heapClassInst.heap32[(r11)] = Int32(r12)
                    if (!(r3 != r9)) {
                        break
                    }
                }
                r8 = (r0 + 196) | 0
            }
            if (r10 != 0) {
                r9 = Int64(heapClassInst.heapU8[r0 + 200])
                if (r9 != 0) {
                    r3 = gNumAlignedFree
                    r3 = r3 >> 2
                    r9 = Int64(heapClassInst.heap32[(r3)])
                    r9 = (r9 + 1) | 0
                    r10 = r10 >> 2
                    heapClassInst.heap32[(r3)] = Int32(r9)
                    r3 = Int64(heapClassInst.heap32[(r10 + (-1))])
                    heapClassInst.heap32[(g0)] = Int32(r3)
                    free(i7);
                    r3 = Int64(heapClassInst.heap32[(r1 + 47)])
                }
                r9 = r8 >> 2
                heapClassInst.heap32[(r9)] = 0
            }
            r8 = r8 >> 2
            heapClassInst.heap8[r0 + 200] = Int8(r6)
            heapClassInst.heap32[(r8)] = Int32(r2)
            heapClassInst.heap32[(r1 + 48)] = Int32(r7)
        }
    }
    r0 = r3 << 2
    r2 = Int64(heapClassInst.heap32[(r1 + 49)])
    r0 = (r2 + r0) | 0
    r0 = r0 >> 2
    heapClassInst.heap32[(r0)] = Int32(r4)
    r0 = Int64(heapClassInst.heap32[(r1 + 47)])
    r0 = (r0 + 1) | 0
    heapClassInst.heap32[(r1 + 47)] = Int32(r0)
    if (!(r5 == 0)) {
        r0 = r4 >> 2
        r1 = Int64(heapClassInst.heap32[(r0 + 5)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heap32[(g0 + 1)] = Int32(r4)
        _ZN11btRigidBody16addConstraintRefEP17btTypedConstraint(i7);
        r0 = Int64(heapClassInst.heap32[(r0 + 6)])
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = Int32(r4)
        _ZN11btRigidBody16addConstraintRefEP17btTypedConstraint(i7);
    }
    return;
}

func _ZN23btDiscreteDynamicsWorld21updateActivationStateEf(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = _E2_str1097
    r1 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = r1 >> 2
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r1 = Int64(heapClassInst.heap32[(r0 + 52)])
    if (!(r1 < 1)) {
        f0 = Float64(heapClassInst.heapFloat[(fp + 1)])
        r1 = gDisableDeactivation
        r1 = Int64(heapClassInst.heapU8[r1])
        r2 = 0
        while (true) {
            r3 = Int64(heapClassInst.heap32[(r0 + 54)])
            r4 = r2 << 2
            r3 = (r3 + r4) | 0
            r3 = r3 >> 2
            r3 = Int64(heapClassInst.heap32[(r3)])
            do {
                if (!(r3 == 0)) {
                    r4 = r3 >> 2
                    r5 = Int64(heapClassInst.heap32[(r4 + 54)])
                    if (!(r5 == 4)) {
                        do {
                            if (r5 != 2) {
                                f1 = Float64(heapClassInst.heapFloat[(r4 + 76)])
                                f2 = Float64(heapClassInst.heapFloat[(r4 + 77)])
                                f3 = Float64(heapClassInst.heapFloat[(r4 + 78)])
                                f1 = f1 * f1
                                f2 = f2 * f2
                                f4 = Float64(heapClassInst.heapFloat[(r4 + 116)])
                                f1 = f1 + f2
                                f2 = f3 * f3
                                f1 = f1 + f2
                                f2 = f4 * f4
                                if (f1 >= f2) {
                                    __label__ = 8
                                } else {
                                    f1 = Float64(heapClassInst.heapFloat[(r4 + 80)])
                                    f2 = Float64(heapClassInst.heapFloat[(r4 + 81)])
                                    f3 = Float64(heapClassInst.heapFloat[(r4 + 82)])
                                    f1 = f1 * f1
                                    f2 = f2 * f2
                                    f4 = Float64(heapClassInst.heapFloat[(r4 + 117)])
                                    f1 = f1 + f2
                                    f2 = f3 * f3
                                    f1 = f1 + f2
                                    f2 = f4 * f4
                                    if (f1 >= f2) {
                                        __label__ = 8
                                    } else {
                                        f1 = Float64(heapClassInst.heapFloat[(r4 + 55)])
                                        f1 = f1 + f0
                                        heapClassInst.heapFloat[(r4 + 55)] = Float32(f1)
                                        __label__ = 10
                                    }
                                }
                                if (__label__ == 8) {
                                    r6 = (r5 + (-4)) | 0
                                    heapClassInst.heap32[(r4 + 55)] = 0
                                    if (!(`UIntNative`(r6) < `UIntNative`(2))) {
                                        r5 = 0
                                        heapClassInst.heap32[(r4 + 54)] = 0
                                        break
                                    }
                                }
                                if (r5 == 4) {
                                    break
                                }
                            }
                        } while (false);
                        r6 = r1 & 255
                        do {
                            if (!(r6 != 0)) {
                                r6 = (r5 + (-2)) | 0
                                if (!(`UIntNative`(r6) < `UIntNative`(2))) {
                                    f1 = Float64(heapClassInst.heapFloat[(r4 + 55)])
                                    f2 = 2.0
                                    if (f1 <= f2) {
                                        break
                                    }
                                }
                                r3 = Int64(heapClassInst.heapU8[r3 + 204])
                                r3 = r3 & 3
                                if (r3 == 0) {
                                    if (r5 == 2) {
                                        heapClassInst.heap32[(r4 + 76)] = 0
                                        heapClassInst.heap32[(r4 + 77)] = 0
                                        heapClassInst.heap32[(r4 + 78)] = 0
                                        heapClassInst.heap32[(r4 + 79)] = 0
                                        heapClassInst.heap32[(r4 + 80)] = 0
                                        heapClassInst.heap32[(r4 + 81)] = 0
                                        heapClassInst.heap32[(r4 + 82)] = 0
                                        heapClassInst.heap32[(r4 + 83)] = 0
                                        break
                                    } else {
                                        if (r5 != 1) {
                                            break
                                        } else {
                                            heapClassInst.heap32[(r4 + 54)] = 3
                                            break
                                        }
                                    }
                                } else {
                                    r5 = (r5 + (-4)) | 0
                                    if (`UIntNative`(r5) < `UIntNative`(2)) {
                                        break
                                    } else {
                                        heapClassInst.heap32[(r4 + 54)] = 2
                                        break
                                    }
                                }
                            }
                        } while (false);
                        r3 = (r5 + (-4)) | 0
                        if (!(`UIntNative`(r3) < `UIntNative`(2))) {
                            heapClassInst.heap32[(r4 + 54)] = 1
                        }
                    }
                }
            } while (false);
            r2 = (r2 + 1) | 0
            r3 = Int64(heapClassInst.heap32[(r0 + 52)])
            if (r3 > r2) {
                continue
            } else {
                break
            }
        }
    }
    r0 = _ZN15CProfileManager11CurrentNodeE
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    r3 = (r3 + (-1)) | 0
    heapClassInst.heap32[(r2 + 4)] = Int32(r3)
    do {
        if (!(r3 != 0)) {
            r3 = Int64(heapClassInst.heap32[(r2 + 1)])
            if (r3 != 0) {
                r1 = sp + (-8)
                heapClassInst.heap32[(g0)] = Int32(r1)
                heapClassInst.heap32[(g0 + 1)] = 0
                r3 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r3 = r3 >> 2
                r3 = Int64(heapClassInst.heap32[(r3)])
                r3 = r3 >> 2
                r1 = r1 >> 2
                r4 = Int64(heapClassInst.heap32[(fp + (-2))])
                r5 = Int64(heapClassInst.heap32[(r3)])
                r4 = (r4 - r5) | 0
                r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r1 = (r1 - r3) | 0
                r3 = (r4 * 1000000) | 0
                r1 = (r1 + r3) | 0
                r3 = Int64(heapClassInst.heap32[(r2 + 3)])
                r1 = (r1 - r3) | 0
                f0 = Float64(`UIntNative`(r1))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r2 + 2)] = Float32(f0)
                r1 = Int64(heapClassInst.heap32[(r2 + 4)])
                if (r1 != 0) {
                    break
                } else {
                    r1 = Int64(heapClassInst.heap32[(r0)])
                }
            }
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            heapClassInst.heap32[(r0)] = Int32(r1)
        }
    } while (false);
    return;
}

func _ZN23btDiscreteDynamicsWorld28internalSingleStepSimulationEf(sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-32)
    var g0 = i7 >> 2;
    r0 = _E2_str1198
    r1 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = r1 >> 2
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r2 = Int64(heapClassInst.heap32[(r0 + 24)])
    f0 = Float64(heapClassInst.heapFloat[(fp + 1)])
    if (!(r2 == 0)) {
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heapFloat[(g0 + 1)] = Float32(f0)
        __FUNCTION_TABLE__[(r2) >> 2](i7);
    }
    r2 = Int64(heapClassInst.heap32[(r0)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 33)])
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heapFloat[(g0 + 1)] = Float32(f0)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    heapClassInst.heapFloat[(r0 + 7)] = Float32(f0)
    heapClassInst.heap32[(r0 + 8)] = 0
    r2 = Int64(heapClassInst.heap32[(r0)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 4)])
    heapClassInst.heap32[(g0)] = Int32(r1)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    heapClassInst.heap32[(r0 + 12)] = Int32(commonVariable.r_g0)
    r2 = Int64(heapClassInst.heap32[(r0)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 10)])
    heapClassInst.heap32[(g0)] = Int32(r1)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    r2 = Int64(heapClassInst.heap32[(r0)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 35)])
    heapClassInst.heap32[(g0)] = Int32(r1)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    heapClassInst.heapFloat[(r0 + 29)] = Float32(f0)
    r2 = Int64(heapClassInst.heap32[(r0)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 36)])
    r3 = (r1 + 104) | 0
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heap32[(g0 + 1)] = Int32(r3)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    r2 = Int64(heapClassInst.heap32[(r0)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 34)])
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heapFloat[(g0 + 1)] = Float32(f0)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    r2 = _E2_str289
    heapClassInst.heap32[(g0)] = Int32(r2)
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r2 = Int64(heapClassInst.heap32[(r0 + 63)])
    if (!(r2 < 1)) {
        r2 = 0
        while (true) {
            r3 = Int64(heapClassInst.heap32[(r0 + 65)])
            r4 = r2 << 2
            r3 = (r3 + r4) | 0
            r3 = r3 >> 2
            r3 = Int64(heapClassInst.heap32[(r3)])
            r4 = r3 >> 2
            r4 = Int64(heapClassInst.heap32[(r4)])
            r4 = r4 >> 2
            r4 = Int64(heapClassInst.heap32[(r4 + 2)])
            heapClassInst.heap32[(g0)] = Int32(r3)
            heapClassInst.heap32[(g0 + 1)] = Int32(r1)
            heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
            r2 = (r2 + 1) | 0
            __FUNCTION_TABLE__[(r4) >> 2](i7);
            r3 = Int64(heapClassInst.heap32[(r0 + 63)])
            if (r3 > r2) {
                continue
            } else {
                break
            }
        }
    }
    r2 = _ZN15CProfileManager11CurrentNodeE
    r2 = r2 >> 2
    r3 = Int64(heapClassInst.heap32[(r2)])
    r4 = r3 >> 2
    r5 = Int64(heapClassInst.heap32[(r4 + 4)])
    r5 = (r5 + (-1)) | 0
    heapClassInst.heap32[(r4 + 4)] = Int32(r5)
    do {
        if (!(r5 != 0)) {
            r5 = Int64(heapClassInst.heap32[(r4 + 1)])
            if (r5 != 0) {
                r3 = sp + (-16)
                heapClassInst.heap32[(g0)] = Int32(r3)
                heapClassInst.heap32[(g0 + 1)] = 0
                r5 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r5 = r5 >> 2
                r5 = Int64(heapClassInst.heap32[(r5)])
                r5 = r5 >> 2
                r3 = r3 >> 2
                r6 = Int64(heapClassInst.heap32[(fp + (-4))])
                r7 = Int64(heapClassInst.heap32[(r5)])
                r6 = (r6 - r7) | 0
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r5 = Int64(heapClassInst.heap32[(r5 + 1)])
                r3 = (r3 - r5) | 0
                r5 = (r6 * 1000000) | 0
                r3 = (r3 + r5) | 0
                r5 = Int64(heapClassInst.heap32[(r4 + 3)])
                r3 = (r3 - r5) | 0
                f1 = Float64(`UIntNative`(r3))
                f2 = 1000.0
                f3 = Float64(heapClassInst.heapFloat[(r4 + 2)])
                f1 = f1 / f2
                f1 = f3 + f1
                heapClassInst.heapFloat[(r4 + 2)] = Float32(f1)
                r3 = Int64(heapClassInst.heap32[(r4 + 4)])
                if (r3 != 0) {
                    break
                } else {
                    r3 = Int64(heapClassInst.heap32[(r2)])
                }
            }
            r3 = r3 >> 2
            r3 = Int64(heapClassInst.heap32[(r3 + 5)])
            heapClassInst.heap32[(r2)] = Int32(r3)
        }
    } while (false);
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heapFloat[(g0 + 1)] = Float32(f0)
    _ZN23btDiscreteDynamicsWorld21updateActivationStateEf(i7);
    r0 = Int64(heapClassInst.heap32[(r0 + 23)])
    if (!(r0 == 0)) {
        heapClassInst.heap32[(g0)] = Int32(r1)
        heapClassInst.heapFloat[(g0 + 1)] = Float32(f0)
        __FUNCTION_TABLE__[(r0) >> 2](i7);
    }
    r0 = Int64(heapClassInst.heap32[(r2)])
    r1 = r0 >> 2
    r3 = Int64(heapClassInst.heap32[(r1 + 4)])
    r3 = (r3 + (-1)) | 0
    heapClassInst.heap32[(r1 + 4)] = Int32(r3)
    do {
        if (!(r3 != 0)) {
            r3 = Int64(heapClassInst.heap32[(r1 + 1)])
            if (r3 != 0) {
                r0 = sp + (-8)
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = 0
                r3 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r3 = r3 >> 2
                r3 = Int64(heapClassInst.heap32[(r3)])
                r3 = r3 >> 2
                r0 = r0 >> 2
                r4 = Int64(heapClassInst.heap32[(fp + (-2))])
                r5 = Int64(heapClassInst.heap32[(r3)])
                r4 = (r4 - r5) | 0
                r0 = Int64(heapClassInst.heap32[(r0 + 1)])
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r0 = (r0 - r3) | 0
                r3 = (r4 * 1000000) | 0
                r0 = (r0 + r3) | 0
                r3 = Int64(heapClassInst.heap32[(r1 + 3)])
                r0 = (r0 - r3) | 0
                f0 = Float64(`UIntNative`(r0))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r1 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r1 + 2)] = Float32(f0)
                r0 = Int64(heapClassInst.heap32[(r1 + 4)])
                if (r0 != 0) {
                    break
                } else {
                    r0 = Int64(heapClassInst.heap32[(r2)])
                }
            }
            r0 = r0 >> 2
            r0 = Int64(heapClassInst.heap32[(r0 + 5)])
            heapClassInst.heap32[(r2)] = Int32(r0)
        }
    } while (false);
    return;
}

func _ZN23btDiscreteDynamicsWorld12addRigidBodyEP11btRigidBodyss(sp: Int64): Unit {
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
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 51)])
    r3 = Int64(heapClassInst.heap32[(fp)])
    r4 = r2 & 3
    if (!(r4 != 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 496])
        r4 = r4 & 1
        if (!(r4 != 0)) {
            f0 = Float64(heapClassInst.heapFloat[(r1 + 84)])
            f1 = 0.0
            if (!(f0 == f1)) {
                r4 = r3 >> 2
                f1 = 1.0
                f0 = f1 / f0
                f1 = Float64(heapClassInst.heapFloat[(r4 + 58)])
                f2 = Float64(heapClassInst.heapFloat[(r4 + 57)])
                f3 = Float64(heapClassInst.heapFloat[(r4 + 56)])
                f3 = f3 * f0
                f2 = f2 * f0
                heapClassInst.heapFloat[(r1 + 89)] = Float32(f3)
                f0 = f1 * f0
                heapClassInst.heapFloat[(r1 + 90)] = Float32(f2)
                heapClassInst.heapFloat[(r1 + 91)] = Float32(f0)
                heapClassInst.heap32[(r1 + 92)] = 0
            }
            r4 = r3 >> 2
            heapClassInst.heap32[(r1 + 93)] = heapClassInst.heap32[(r4 + 56)]
            heapClassInst.heap32[(r1 + 94)] = heapClassInst.heap32[(r4 + 57)]
            heapClassInst.heap32[(r1 + 95)] = heapClassInst.heap32[(r4 + 58)]
            heapClassInst.heap32[(r1 + 96)] = heapClassInst.heap32[(r4 + 59)]
        }
    }
    r4 = Int64(heapClassInst.heap32[(r1 + 48)])
    if (!(r4 == 0)) {
        r4 = Int64(heapClassInst.heap32[(fp + 2)])
        r5 = Int64(heapClassInst.heap32[(fp + 3)])
        r2 = r2 & 1
        do {
            if (r2 != 0) {
                r2 = Int64(heapClassInst.heap32[(r1 + 54)])
                r2 = (r2 + (-4)) | 0
                if (`UIntNative`(r2) < `UIntNative`(2)) {
                    break
                } else {
                    heapClassInst.heap32[(r1 + 54)] = 2
                }
            } else {
                r1 = r3 >> 2
                r2 = Int64(heapClassInst.heap32[(r1 + 53)])
                r6 = Int64(heapClassInst.heap32[(r1 + 52)])
                if (r2 == r6) {
                    r7 = 1
                    r8 = r6 << 1
                    r8 = if (r6 == 0) {
                        r7
                    } else {
                        r8
                    };
                    if (!(r2 >= r8)) {
                        if (r8 != 0) {
                            r2 = gNumAlignedAllocs
                            r2 = r2 >> 2
                            r9 = Int64(heapClassInst.heap32[(r2)])
                            r10 = r8 << 2
                            r9 = (r9 + 1) | 0
                            r10 = r10 | 3
                            heapClassInst.heap32[(r2)] = Int32(r9)
                            r2 = (r10 + 16) | 0
                            heapClassInst.heap32[(g0)] = Int32(r2)
                            mallocNew(i7);
                            r2 = commonVariable.r_g0
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
                        } else {
                            r2 = 0
                        }
                        r9 = (r3 + 216) | 0
                        if (r6 < 1) {
                            r10 = r9 >> 2
                            r11 = Int64(heapClassInst.heap32[(r10)])
                        } else {
                            r10 = 0
                            while (true) {
                                r11 = r9 >> 2
                                r11 = Int64(heapClassInst.heap32[(r11)])
                                r12 = r10 << 2
                                r13 = (r11 + r12) | 0
                                r13 = r13 >> 2
                                r12 = (r2 + r12) | 0
                                r13 = Int64(heapClassInst.heap32[(r13)])
                                r10 = (r10 + 1) | 0
                                r12 = r12 >> 2
                                heapClassInst.heap32[(r12)] = Int32(r13)
                                if (!(r6 != r10)) {
                                    break
                                }
                            }
                            r9 = (r3 + 216) | 0
                        }
                        if (r11 != 0) {
                            r10 = Int64(heapClassInst.heapU8[r3 + 220])
                            if (r10 != 0) {
                                r6 = gNumAlignedFree
                                r6 = r6 >> 2
                                r10 = Int64(heapClassInst.heap32[(r6)])
                                r10 = (r10 + 1) | 0
                                r11 = r11 >> 2
                                heapClassInst.heap32[(r6)] = Int32(r10)
                                r6 = Int64(heapClassInst.heap32[(r11 + (-1))])
                                heapClassInst.heap32[(g0)] = Int32(r6)
                                free(i7);
                                r6 = Int64(heapClassInst.heap32[(r1 + 52)])
                            }
                            r10 = r9 >> 2
                            heapClassInst.heap32[(r10)] = 0
                        }
                        r9 = r9 >> 2
                        heapClassInst.heap8[r3 + 220] = Int8(r7)
                        heapClassInst.heap32[(r9)] = Int32(r2)
                        heapClassInst.heap32[(r1 + 53)] = Int32(r8)
                    }
                }
                r2 = r6 << 2
                r6 = Int64(heapClassInst.heap32[(r1 + 54)])
                r2 = (r6 + r2) | 0
                r2 = r2 >> 2
                heapClassInst.heap32[(r2)] = Int32(r0)
                r2 = Int64(heapClassInst.heap32[(r1 + 52)])
                r2 = (r2 + 1) | 0
                heapClassInst.heap32[(r1 + 52)] = Int32(r2)
            }
        } while (false);
        r1 = r3 >> 2
        r1 = Int64(heapClassInst.heap32[(r1)])
        r1 = r1 >> 2
        r1 = Int64(heapClassInst.heap32[(r1 + 8)])
        heapClassInst.heap32[(g0)] = Int32(r3)
        heapClassInst.heap32[(g0 + 1)] = Int32(r0)
        heapClassInst.heap32[(g0 + 2)] = Int32(r4)
        heapClassInst.heap32[(g0 + 3)] = Int32(r5)
        __FUNCTION_TABLE__[(r1) >> 2](i7);
    }
    return;
}

func _ZN23btDiscreteDynamicsWorld12addRigidBodyEP11btRigidBody(sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1 + 51)])
    r3 = Int64(heapClassInst.heap32[(fp)])
    r4 = r2 & 3
    if (!(r4 != 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 496])
        r4 = r4 & 1
        if (!(r4 != 0)) {
            f0 = Float64(heapClassInst.heapFloat[(r1 + 84)])
            f1 = 0.0
            if (!(f0 == f1)) {
                r4 = r3 >> 2
                f1 = 1.0
                f0 = f1 / f0
                f1 = Float64(heapClassInst.heapFloat[(r4 + 58)])
                f2 = Float64(heapClassInst.heapFloat[(r4 + 57)])
                f3 = Float64(heapClassInst.heapFloat[(r4 + 56)])
                f3 = f3 * f0
                f2 = f2 * f0
                heapClassInst.heapFloat[(r1 + 89)] = Float32(f3)
                f0 = f1 * f0
                heapClassInst.heapFloat[(r1 + 90)] = Float32(f2)
                heapClassInst.heapFloat[(r1 + 91)] = Float32(f0)
                heapClassInst.heap32[(r1 + 92)] = 0
            }
            r4 = r3 >> 2
            heapClassInst.heap32[(r1 + 93)] = heapClassInst.heap32[(r4 + 56)]
            heapClassInst.heap32[(r1 + 94)] = heapClassInst.heap32[(r4 + 57)]
            heapClassInst.heap32[(r1 + 95)] = heapClassInst.heap32[(r4 + 58)]
            heapClassInst.heap32[(r1 + 96)] = heapClassInst.heap32[(r4 + 59)]
        }
    }
    r4 = Int64(heapClassInst.heap32[(r1 + 48)])
    if (!(r4 == 0)) {
        r4 = r2 & 1
        do {
            if (r4 != 0) {
                r4 = Int64(heapClassInst.heap32[(r1 + 54)])
                r4 = (r4 + (-4)) | 0
                if (`UIntNative`(r4) > `UIntNative`(1)) {
                    heapClassInst.heap32[(r1 + 54)] = 2
                } else {
                    break
                }
            } else {
                r2 = r3 >> 2
                r4 = Int64(heapClassInst.heap32[(r2 + 53)])
                r5 = Int64(heapClassInst.heap32[(r2 + 52)])
                if (r4 == r5) {
                    r6 = 1
                    r7 = r5 << 1
                    r7 = if (r5 == 0) {
                        r6
                    } else {
                        r7
                    };
                    if (!(r4 >= r7)) {
                        if (r7 != 0) {
                            r4 = gNumAlignedAllocs
                            r4 = r4 >> 2
                            r8 = Int64(heapClassInst.heap32[(r4)])
                            r9 = r7 << 2
                            r8 = (r8 + 1) | 0
                            r9 = r9 | 3
                            heapClassInst.heap32[(r4)] = Int32(r8)
                            r4 = (r9 + 16) | 0
                            heapClassInst.heap32[(g0)] = Int32(r4)
                            mallocNew(i7);
                            r4 = commonVariable.r_g0
                            if (r4 != 0) {
                                r8 = 0
                                r9 = (r4 + 4) | 0
                                r8 = (r8 - r9) | 0
                                r8 = r8 & 15
                                r8 = (r4 + r8) | 0
                                r9 = (r8 + 4) | 0
                                r8 = r8 >> 2
                                heapClassInst.heap32[(r8)] = Int32(r4)
                                r4 = r9
                            }
                        } else {
                            r4 = 0
                        }
                        r8 = (r3 + 216) | 0
                        if (r5 < 1) {
                            r9 = r8 >> 2
                            r10 = Int64(heapClassInst.heap32[(r9)])
                        } else {
                            r9 = 0
                            while (true) {
                                r10 = r8 >> 2
                                r10 = Int64(heapClassInst.heap32[(r10)])
                                r11 = r9 << 2
                                r12 = (r10 + r11) | 0
                                r12 = r12 >> 2
                                r11 = (r4 + r11) | 0
                                r12 = Int64(heapClassInst.heap32[(r12)])
                                r9 = (r9 + 1) | 0
                                r11 = r11 >> 2
                                heapClassInst.heap32[(r11)] = Int32(r12)
                                if (!(r5 != r9)) {
                                    break
                                }
                            }
                            r8 = (r3 + 216) | 0
                        }
                        if (r10 != 0) {
                            r9 = Int64(heapClassInst.heapU8[r3 + 220])
                            if (r9 != 0) {
                                r5 = gNumAlignedFree
                                r5 = r5 >> 2
                                r9 = Int64(heapClassInst.heap32[(r5)])
                                r9 = (r9 + 1) | 0
                                r10 = r10 >> 2
                                heapClassInst.heap32[(r5)] = Int32(r9)
                                r5 = Int64(heapClassInst.heap32[(r10 + (-1))])
                                heapClassInst.heap32[(g0)] = Int32(r5)
                                free(i7);
                                r5 = Int64(heapClassInst.heap32[(r2 + 52)])
                            }
                            r9 = r8 >> 2
                            heapClassInst.heap32[(r9)] = 0
                        }
                        r8 = r8 >> 2
                        heapClassInst.heap8[r3 + 220] = Int8(r6)
                        heapClassInst.heap32[(r8)] = Int32(r4)
                        heapClassInst.heap32[(r2 + 53)] = Int32(r7)
                    }
                }
                r4 = r5 << 2
                r5 = Int64(heapClassInst.heap32[(r2 + 54)])
                r4 = (r5 + r4) | 0
                r4 = r4 >> 2
                heapClassInst.heap32[(r4)] = Int32(r0)
                r4 = Int64(heapClassInst.heap32[(r2 + 52)])
                r4 = (r4 + 1) | 0
                heapClassInst.heap32[(r2 + 52)] = Int32(r4)
                r2 = Int64(heapClassInst.heap32[(r1 + 51)])
            }
        } while (false);
        r1 = r3 >> 2
        r1 = Int64(heapClassInst.heap32[(r1)])
        r1 = r1 >> 2
        r1 = Int64(heapClassInst.heap32[(r1 + 8)])
        r4 = 2
        r5 = 1
        r2 = r2 & 3
        r6 = (-3)
        r7 = (-1)
        r4 = if (r2 != 0) {
            r4
        } else {
            r5
        };
        r2 = if (r2 != 0) {
            r6
        } else {
            r7
        };
        heapClassInst.heap32[(g0)] = Int32(r3)
        heapClassInst.heap32[(g0 + 1)] = Int32(r0)
        heapClassInst.heap32[(g0 + 2)] = Int32(r4)
        heapClassInst.heap32[(g0 + 3)] = Int32(r2)
        __FUNCTION_TABLE__[(r1) >> 2](i7);
    }
    return;
}

func _ZN23btDiscreteDynamicsWorld10setGravityERK9btVector3(sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r0 = r0 >> 2
    r1 = r1 >> 2
    heapClassInst.heap32[(r0 + 56)] = heapClassInst.heap32[(r1)]
    heapClassInst.heap32[(r0 + 57)] = heapClassInst.heap32[(r1 + 1)]
    heapClassInst.heap32[(r0 + 58)] = heapClassInst.heap32[(r1 + 2)]
    heapClassInst.heap32[(r0 + 59)] = heapClassInst.heap32[(r1 + 3)]
    r2 = Int64(heapClassInst.heap32[(r0 + 52)])
    if (!(r2 < 1)) {
        r2 = 0
        while (true) {
            r3 = Int64(heapClassInst.heap32[(r0 + 54)])
            r4 = r2 << 2
            r3 = (r3 + r4) | 0
            r3 = r3 >> 2
            r3 = Int64(heapClassInst.heap32[(r3)])
            r4 = r3 >> 2
            r5 = Int64(heapClassInst.heap32[(r4 + 54)])
            if (!(r5 == 2)) {
                if (!(r5 == 5)) {
                    r3 = Int64(heapClassInst.heapU8[r3 + 496])
                    r3 = r3 & 1
                    if (!(r3 != 0)) {
                        f0 = Float64(heapClassInst.heapFloat[(r4 + 84)])
                        f1 = 0.0
                        if (!(f0 == f1)) {
                            f1 = 1.0
                            f0 = f1 / f0
                            f1 = Float64(heapClassInst.heapFloat[(r1 + 2)])
                            f2 = Float64(heapClassInst.heapFloat[(r1 + 1)])
                            f3 = Float64(heapClassInst.heapFloat[(r1)])
                            f3 = f3 * f0
                            f2 = f2 * f0
                            heapClassInst.heapFloat[(r4 + 89)] = Float32(f3)
                            f0 = f1 * f0
                            heapClassInst.heapFloat[(r4 + 90)] = Float32(f2)
                            heapClassInst.heapFloat[(r4 + 91)] = Float32(f0)
                            heapClassInst.heap32[(r4 + 92)] = 0
                        }
                        heapClassInst.heap32[(r4 + 93)] = heapClassInst.heap32[(r1)]
                        heapClassInst.heap32[(r4 + 94)] = heapClassInst.heap32[(r1 + 1)]
                        heapClassInst.heap32[(r4 + 95)] = heapClassInst.heap32[(r1 + 2)]
                        heapClassInst.heap32[(r4 + 96)] = heapClassInst.heap32[(r1 + 3)]
                    }
                }
            }
            r2 = (r2 + 1) | 0
            r3 = Int64(heapClassInst.heap32[(r0 + 52)])
            if (r3 > r2) {
                continue
            } else {
                break
            }
        }
    }
    return;
}

func _ZN23btDiscreteDynamicsWorld15removeRigidBodyEP11btRigidBody(sp: Int64): Unit {
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
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    r3 = Int64(heapClassInst.heap32[(r1 + 52)])
    r4 = 0
    while (true) {
        if (r3 > r4) {
            r5 = Int64(heapClassInst.heap32[(r1 + 54)])
            r6 = r4 << 2
            r5 = (r5 + r6) | 0
            r5 = r5 >> 2
            r5 = Int64(heapClassInst.heap32[(r5)])
            if (r5 != r2) {
                r4 = (r4 + 1) | 0
                continue
            } else {
                __label__ = 5
                break
            }
        } else {
            __label__ = 4
            break
        }
    }
    if (__label__ == 4) {
        r4 = r3
    }
    if (!(r3 <= r4)) {
        r3 = (r3 + (-1)) | 0
        r4 = r4 << 2
        r5 = Int64(heapClassInst.heap32[(r1 + 54)])
        r3 = r3 << 2
        r4 = (r5 + r4) | 0
        r5 = (r5 + r3) | 0
        r4 = r4 >> 2
        r5 = r5 >> 2
        r6 = Int64(heapClassInst.heap32[(r4)])
        r5 = Int64(heapClassInst.heap32[(r5)])
        heapClassInst.heap32[(r4)] = Int32(r5)
        r4 = Int64(heapClassInst.heap32[(r1 + 54)])
        r3 = (r4 + r3) | 0
        r3 = r3 >> 2
        heapClassInst.heap32[(r3)] = Int32(r6)
        r3 = Int64(heapClassInst.heap32[(r1 + 52)])
        r3 = (r3 + (-1)) | 0
        heapClassInst.heap32[(r1 + 52)] = Int32(r3)
    }
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
    _ZN16btCollisionWorld21removeCollisionObjectEP17btCollisionObject(i7);
    return;
}

func _ZN23btDiscreteDynamicsWorld21removeCollisionObjectEP17btCollisionObject(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heap32[(fp)])
    r2 = Int64(heapClassInst.heapU8[r0 + 232])
    r2 = r2 & 2
    if (!(r2 == 0)) {
        if (!(r0 == 0)) {
            r2 = r1 >> 2
            r2 = Int64(heapClassInst.heap32[(r2)])
            r2 = r2 >> 2
            r2 = Int64(heapClassInst.heap32[(r2 + 21)])
            heapClassInst.heap32[(g0)] = Int32(r1)
            heapClassInst.heap32[(g0 + 1)] = Int32(r0)
            __FUNCTION_TABLE__[(r2) >> 2](i7);
            return;
        }
    }
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heap32[(g0 + 1)] = Int32(r0)
    _ZN16btCollisionWorld21removeCollisionObjectEP17btCollisionObject(i7);
    return;
}

func _ZN23btDiscreteDynamicsWorld18addCollisionObjectEP17btCollisionObjectss(sp: Int64): Unit {
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
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = Int64(heapClassInst.heap32[(fp + 2)])
    r3 = Int64(heapClassInst.heap32[(fp + 3)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r1)
    heapClassInst.heap32[(g0 + 2)] = Int32(r2)
    heapClassInst.heap32[(g0 + 3)] = Int32(r3)
    _ZN16btCollisionWorld18addCollisionObjectEP17btCollisionObjectss(i7);
    return;
}

func _ZN23btDiscreteDynamicsWorld14stepSimulationEfif(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    _ZN15CProfileManager5ResetEv(i7);
    r0 = _E2_str1299
    r1 = Int64(heapClassInst.heap32[(fp + 2)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = Int64(heapClassInst.heap32[(fp)])
    f0 = Float64(heapClassInst.heapFloat[(fp + 1)])
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    if (r1 == 0) {
        r1 = r0 >> 2
        f1 = 0.0
        heapClassInst.heapFloat[(r1 + 60)] = Float32(f0)
        if (f0 < f1) {
            f1 = -f0
        } else {
            f1 = f0
        }
        f2 = 1.1920928955078125e-007
        if (f1 >= f2) {
            r1 = 1
            f1 = f0
            r3 = r1
        } else {
            r1 = 0
            f1 = f0
            r3 = r1
        }
    } else {
        f1 = Float64(heapClassInst.heapFloat[(fp + 3)])
        r2 = r0 >> 2
        f2 = Float64(heapClassInst.heapFloat[(r2 + 60)])
        f0 = f2 + f0
        heapClassInst.heapFloat[(r2 + 60)] = Float32(f0)
        if (f0 >= f1) {
            f2 = f0 / f1
            r3 = Int64(f2) | 0
            f2 = Float64(r3)
            f2 = f2 * f1
            f0 = f0 - f2
            heapClassInst.heapFloat[(r2 + 60)] = Float32(f0)
        } else {
            r3 = 0
        }
    }
    r2 = r0 >> 2
    r4 = Int64(heapClassInst.heap32[(r2)])
    r4 = r4 >> 2
    r4 = Int64(heapClassInst.heap32[(r4 + 4)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    __FUNCTION_TABLE__[(r4) >> 2](i7);
    r4 = commonVariable.r_g0
    if (!(r4 == 0)) {
        r4 = Int64(heapClassInst.heap32[(r2)])
        r4 = r4 >> 2
        r4 = Int64(heapClassInst.heap32[(r4 + 4)])
        heapClassInst.heap32[(g0)] = Int32(r0)
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r5 = commonVariable.r_g0 >> 2
        r5 = Int64(heapClassInst.heap32[(r5)])
        r5 = r5 >> 2
        r5 = Int64(heapClassInst.heap32[(r5 + 12)])
        heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
        __FUNCTION_TABLE__[(r5) >> 2](i7);
        r4 = commonVariable.r_g0 >> 4
        r5 = gDisableDeactivation
        r4 = r4 & 1
        heapClassInst.heap8[r5] = Int8(r4)
    }
    if (r3 == 0) {
        r1 = Int64(heapClassInst.heap32[(r2)])
        r1 = r1 >> 2
        r1 = Int64(heapClassInst.heap32[(r1 + 19)])
        heapClassInst.heap32[(g0)] = Int32(r0)
        __FUNCTION_TABLE__[(r1) >> 2](i7);
    } else {
        r4 = Int64(heapClassInst.heap32[(r2)])
        r4 = r4 >> 2
        r5 = if (r3 > r1) {
            r1
        } else {
            r3
        };
        r4 = Int64(heapClassInst.heap32[(r4 + 38)])
        f0 = Float64(r5)
        f0 = f0 * f1
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heapFloat[(g0 + 1)] = Float32(f0)
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        r4 = Int64(heapClassInst.heap32[(r2)])
        r4 = r4 >> 2
        r4 = Int64(heapClassInst.heap32[(r4 + 40)])
        heapClassInst.heap32[(g0)] = Int32(r0)
        __FUNCTION_TABLE__[(r4) >> 2](i7);
        if (!(r5 < 1)) {
            r4 = r3 ^ (-1)
            r1 = r1 ^ (-1)
            r1 = if (r4 > r1) {
                r4
            } else {
                r1
            };
            r1 = r1 ^ (-1)
            while (true) {
                r4 = Int64(heapClassInst.heap32[(r2)])
                r4 = r4 >> 2
                r4 = Int64(heapClassInst.heap32[(r4 + 37)])
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heapFloat[(g0 + 1)] = Float32(f1)
                __FUNCTION_TABLE__[(r4) >> 2](i7);
                r4 = Int64(heapClassInst.heap32[(r2)])
                r4 = r4 >> 2
                r4 = Int64(heapClassInst.heap32[(r4 + 19)])
                r1 = (r1 + (-1)) | 0
                heapClassInst.heap32[(g0)] = Int32(r0)
                __FUNCTION_TABLE__[(r4) >> 2](i7);
                if (r1 == 0) {
                    break
                } else {
                    continue
                }
            }
        }
    }
    r1 = Int64(heapClassInst.heap32[(r2)])
    r1 = r1 >> 2
    r1 = Int64(heapClassInst.heap32[(r1 + 28)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = _ZN15CProfileManager12FrameCounterE
    __FUNCTION_TABLE__[(r1) >> 2](i7);
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = _ZN15CProfileManager11CurrentNodeE
    r1 = (r1 + 1) | 0
    r2 = r2 >> 2
    heapClassInst.heap32[(r0)] = Int32(r1)
    r0 = Int64(heapClassInst.heap32[(r2)])
    r1 = r0 >> 2
    r4 = Int64(heapClassInst.heap32[(r1 + 4)])
    r4 = (r4 + (-1)) | 0
    heapClassInst.heap32[(r1 + 4)] = Int32(r4)
    do {
        if (!(r4 != 0)) {
            r4 = Int64(heapClassInst.heap32[(r1 + 1)])
            if (r4 != 0) {
                r0 = sp + (-8)
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = 0
                r4 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r4 = r4 >> 2
                r4 = Int64(heapClassInst.heap32[(r4)])
                r4 = r4 >> 2
                r0 = r0 >> 2
                r5 = Int64(heapClassInst.heap32[(fp + (-2))])
                r6 = Int64(heapClassInst.heap32[(r4)])
                r5 = (r5 - r6) | 0
                r0 = Int64(heapClassInst.heap32[(r0 + 1)])
                r4 = Int64(heapClassInst.heap32[(r4 + 1)])
                r0 = (r0 - r4) | 0
                r4 = (r5 * 1000000) | 0
                r0 = (r0 + r4) | 0
                r4 = Int64(heapClassInst.heap32[(r1 + 3)])
                r0 = (r0 - r4) | 0
                f0 = Float64(`UIntNative`(r0))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r1 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r1 + 2)] = Float32(f0)
                r0 = Int64(heapClassInst.heap32[(r1 + 4)])
                if (r0 != 0) {
                    break
                } else {
                    r0 = Int64(heapClassInst.heap32[(r2)])
                }
            }
            r0 = r0 >> 2
            r0 = Int64(heapClassInst.heap32[(r0 + 5)])
            heapClassInst.heap32[(r2)] = Int32(r0)
        }
    } while (false);
    commonVariable.r_g0 = r3
    return;
}

func _ZN23btDiscreteDynamicsWorld28synchronizeSingleMotionStateEP11btRigidBody(sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-96)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    if (r0 != 0) {
        r1 = r0 >> 2
        r2 = Int64(heapClassInst.heap32[(r1 + 118)])
        if (!(r2 == 0)) {
            r2 = Int64(heapClassInst.heapU8[r0 + 204])
            r2 = r2 & 3
            if (r2 == 0) {
                r2 = Int64(heapClassInst.heap32[(fp)])
                r2 = r2 >> 2
                f0 = Float64(heapClassInst.heapFloat[(r2 + 60)])
                f1 = Float64(heapClassInst.heapFloat[(r1 + 60)])
                f2 = Float64(heapClassInst.heapFloat[(r1 + 33)])
                f3 = Float64(heapClassInst.heapFloat[(r1 + 34)])
                f4 = Float64(heapClassInst.heapFloat[(r1 + 35)])
                r2 = sp + (-64)
                r3 = (r0 + 68) | 0
                r0 = (r0 + 148) | 0
                f0 = f0 * f1
                heapClassInst.heap32[(g0)] = Int32(r3)
                heapClassInst.heapFloat[(g0 + 1)] = Float32(f2)
                heapClassInst.heapFloat[(g0 + 2)] = Float32(f3)
                heapClassInst.heapFloat[(g0 + 3)] = Float32(f4)
                heapClassInst.heap32[(g0 + 4)] = Int32(r0)
                heapClassInst.heapFloat[(g0 + 5)] = Float32(f0)
                heapClassInst.heap32[(g0 + 6)] = Int32(r2)
                _ZN15btTransformUtil18integrateTransformERK11btTransformRK9btVector3S5_fRS0_(i7);
                r0 = Int64(heapClassInst.heap32[(r1 + 118)])
                r1 = r0 >> 2
                r1 = Int64(heapClassInst.heap32[(r1)])
                r1 = r1 >> 2
                r1 = Int64(heapClassInst.heap32[(r1 + 3)])
                heapClassInst.heap32[(g0)] = Int32(r0)
                heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                __FUNCTION_TABLE__[(r1) >> 2](i7);
                return;
            }
        }
        return;
    } else {
        r0 = _E2_str13100
        r1 = _E2_str1461
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = Int32(r1)
        heapClassInst.heap32[(g0 + 2)] = 184
        _assert(i7);
    }
}

func _ZN23btDiscreteDynamicsWorld23synchronizeMotionStatesEv(sp: Int64): Unit {
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
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = _E2_str1562
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = Int64(heapClassInst.heap32[(fp)])
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r1 = Int64(heapClassInst.heapU8[r0 + 246])
    do {
        if (r1 != 0) {
            r1 = r0 >> 2
            r2 = Int64(heapClassInst.heap32[(r1 + 2)])
            if (!(r2 < 1)) {
                r2 = 0
                while (true) {
                    r3 = Int64(heapClassInst.heap32[(r1 + 4)])
                    r4 = r2 << 2
                    r3 = (r3 + r4) | 0
                    r3 = r3 >> 2
                    r3 = Int64(heapClassInst.heap32[(r3)])
                    r4 = Int64(heapClassInst.heapU8[r3 + 232])
                    r4 = r4 & 2
                    if (!(r4 == 0)) {
                        if (!(r3 == 0)) {
                            heapClassInst.heap32[(g0)] = Int32(r0)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                            _ZN23btDiscreteDynamicsWorld28synchronizeSingleMotionStateEP11btRigidBody(i7);
                        }
                    }
                    r2 = (r2 + 1) | 0
                    r3 = Int64(heapClassInst.heap32[(r1 + 2)])
                    if (r3 > r2) {
                        continue
                    } else {
                        break
                    }
                }
            }
        } else {
            r1 = r0 >> 2
            r2 = Int64(heapClassInst.heap32[(r1 + 52)])
            if (r2 > 0) {
                r2 = 0
                while (true) {
                    r3 = Int64(heapClassInst.heap32[(r1 + 54)])
                    r4 = r2 << 2
                    r3 = (r3 + r4) | 0
                    r3 = r3 >> 2
                    r3 = Int64(heapClassInst.heap32[(r3)])
                    r4 = r3 >> 2
                    r4 = Int64(heapClassInst.heap32[(r4 + 54)])
                    if (!(r4 == 2)) {
                        if (!(r4 == 5)) {
                            heapClassInst.heap32[(g0)] = Int32(r0)
                            heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                            _ZN23btDiscreteDynamicsWorld28synchronizeSingleMotionStateEP11btRigidBody(i7);
                        }
                    }
                    r2 = (r2 + 1) | 0
                    r3 = Int64(heapClassInst.heap32[(r1 + 52)])
                    if (r3 > r2) {
                        continue
                    } else {
                        break
                    }
                }
            }
        }
    } while (false);
    r0 = _ZN15CProfileManager11CurrentNodeE
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    r3 = (r3 + (-1)) | 0
    heapClassInst.heap32[(r2 + 4)] = Int32(r3)
    do {
        if (!(r3 != 0)) {
            r3 = Int64(heapClassInst.heap32[(r2 + 1)])
            if (r3 != 0) {
                r1 = sp + (-8)
                heapClassInst.heap32[(g0)] = Int32(r1)
                heapClassInst.heap32[(g0 + 1)] = 0
                r3 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r3 = r3 >> 2
                r3 = Int64(heapClassInst.heap32[(r3)])
                r3 = r3 >> 2
                r1 = r1 >> 2
                r4 = Int64(heapClassInst.heap32[(fp + (-2))])
                r5 = Int64(heapClassInst.heap32[(r3)])
                r4 = (r4 - r5) | 0
                r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r1 = (r1 - r3) | 0
                r3 = (r4 * 1000000) | 0
                r1 = (r1 + r3) | 0
                r3 = Int64(heapClassInst.heap32[(r2 + 3)])
                r1 = (r1 - r3) | 0
                f0 = Float64(`UIntNative`(r1))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r2 + 2)] = Float32(f0)
                r1 = Int64(heapClassInst.heap32[(r2 + 4)])
                if (r1 != 0) {
                    break
                } else {
                    r1 = Int64(heapClassInst.heap32[(r0)])
                }
            }
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            heapClassInst.heap32[(r0)] = Int32(r1)
        }
    } while (false);
    return;
}

func _ZN23btDiscreteDynamicsWorld12applyGravityEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0 + 52)])
    if (!(r1 < 1)) {
        r1 = 0
        while (true) {
            r2 = Int64(heapClassInst.heap32[(r0 + 54)])
            r3 = r1 << 2
            r2 = (r2 + r3) | 0
            r2 = r2 >> 2
            r2 = Int64(heapClassInst.heap32[(r2)])
            r3 = r2 >> 2
            r4 = Int64(heapClassInst.heap32[(r3 + 54)])
            if (!(r4 == 2)) {
                if (!(r4 == 5)) {
                    r2 = Int64(heapClassInst.heapU8[r2 + 204])
                    r2 = r2 & 3
                    if (!(r2 != 0)) {
                        f0 = Float64(heapClassInst.heapFloat[(r3 + 89)])
                        f1 = Float64(heapClassInst.heapFloat[(r3 + 85)])
                        f0 = f0 * f1
                        f1 = Float64(heapClassInst.heapFloat[(r3 + 101)])
                        f2 = Float64(heapClassInst.heapFloat[(r3 + 91)])
                        f3 = Float64(heapClassInst.heapFloat[(r3 + 87)])
                        f4 = Float64(heapClassInst.heapFloat[(r3 + 90)])
                        f5 = Float64(heapClassInst.heapFloat[(r3 + 86)])
                        f0 = f1 + f0
                        heapClassInst.heapFloat[(r3 + 101)] = Float32(f0)
                        f0 = f4 * f5
                        f1 = Float64(heapClassInst.heapFloat[(r3 + 102)])
                        f0 = f1 + f0
                        heapClassInst.heapFloat[(r3 + 102)] = Float32(f0)
                        f0 = f2 * f3
                        f1 = Float64(heapClassInst.heapFloat[(r3 + 103)])
                        f0 = f1 + f0
                        heapClassInst.heapFloat[(r3 + 103)] = Float32(f0)
                    }
                }
            }
            r1 = (r1 + 1) | 0
            r2 = Int64(heapClassInst.heap32[(r0 + 52)])
            if (r2 > r1) {
                continue
            } else {
                break
            }
        }
    }
    return;
}

func _ZN23btDiscreteDynamicsWorld14debugDrawWorldEv(sp: Int64): Unit {
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
    var f13: Float64 = 0.0
    var f14: Float64 = 0.0
    var f15: Float64 = 0.0
    var f16: Float64 = 0.0
    var f17: Float64 = 0.0
    var f18: Float64 = 0.0
    var f19: Float64 = 0.0
    var f20: Float64 = 0.0
    var f21: Float64 = 0.0
    var f22: Float64 = 0.0
    var f23: Float64 = 0.0
    var f24: Float64 = 0.0
    var f25: Float64 = 0.0
    var f26: Float64 = 0.0
    var f27: Float64 = 0.0
    var f28: Float64 = 0.0
    var f29: Float64 = 0.0
    var f30: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-824)
    var g0 = i7 >> 2;
    r0 = _E2_str16101
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN15CProfileManager13Start_ProfileEPKc(i7);
    r0 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN16btCollisionWorld14debugDrawWorldEv(i7);
    r1 = r0 >> 2
    r2 = Int64(heapClassInst.heap32[(r1)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 4)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    r2 = commonVariable.r_g0
    if (!(r2 == 0)) {
        r2 = Int64(heapClassInst.heap32[(r1)])
        r2 = r2 >> 2
        r2 = Int64(heapClassInst.heap32[(r2 + 4)])
        heapClassInst.heap32[(g0)] = Int32(r0)
        __FUNCTION_TABLE__[(r2) >> 2](i7);
        r3 = commonVariable.r_g0 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3 + 12)])
        heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r2 = commonVariable.r_g0 & 6144
        if (!(r2 == 0)) {
            r2 = Int64(heapClassInst.heap32[(r1)])
            r2 = r2 >> 2
            r2 = Int64(heapClassInst.heap32[(r2 + 24)])
            heapClassInst.heap32[(g0)] = Int32(r0)
            __FUNCTION_TABLE__[(r2) >> 2](i7);
            r2 = commonVariable.r_g0
            r3 = (r2 + (-1)) | 0
            if (!(r3 < 0)) {
                r3 = sp + (-296)
                r4 = sp + (-392)
                r5 = (r3 + 48) | 0
                r6 = (r4 + 48) | 0
                r2 = (r2 + (-1)) | 0
                while (true) {
                    r7 = r2
                    r2 = Int64(heapClassInst.heap32[(r1)])
                    r2 = r2 >> 2
                    r2 = Int64(heapClassInst.heap32[(r2 + 25)])
                    heapClassInst.heap32[(g0)] = Int32(r0)
                    heapClassInst.heap32[(g0 + 1)] = Int32(r7)
                    __FUNCTION_TABLE__[(r2) >> 2](i7);
                    r2 = commonVariable.r_g0
                    r8 = Int64(heapClassInst.heap32[(r1)])
                    r8 = r8 >> 2
                    r8 = Int64(heapClassInst.heap32[(r8 + 4)])
                    heapClassInst.heap32[(g0)] = Int32(r0)
                    __FUNCTION_TABLE__[(r8) >> 2](i7);
                    r9 = commonVariable.r_g0 >> 2
                    r9 = Int64(heapClassInst.heap32[(r9)])
                    r9 = r9 >> 2
                    r9 = Int64(heapClassInst.heap32[(r9 + 12)])
                    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                    __FUNCTION_TABLE__[(r9) >> 2](i7);
                    r8 = commonVariable.r_g0
                    r9 = Int64(heapClassInst.heap32[(r1)])
                    r9 = r9 >> 2
                    r9 = Int64(heapClassInst.heap32[(r9 + 4)])
                    heapClassInst.heap32[(g0)] = Int32(r0)
                    __FUNCTION_TABLE__[(r9) >> 2](i7);
                    r10 = commonVariable.r_g0 >> 2
                    r10 = Int64(heapClassInst.heap32[(r10)])
                    r10 = r10 >> 2
                    r10 = Int64(heapClassInst.heap32[(r10 + 12)])
                    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                    __FUNCTION_TABLE__[(r10) >> 2](i7);
                    r9 = commonVariable.r_g0
                    r10 = r2 >> 2
                    f0 = Float64(heapClassInst.heapFloat[(r10 + 8)])
                    heapClassInst.heapFloat[(fp + (-191))] = Float32(f0)
                    f1 = 0.0
                    heapClassInst.heapFloat[(fp + (-192))] = Float32(f1)
                    do {
                        if (!(f0 <= f1)) {
                            r8 = r8 >> 11
                            r9 = r9 >> 12
                            r8 = r8 & 1
                            r9 = r9 & 1
                            r10 = r2 >> 2
                            r11 = Int64(heapClassInst.heap32[(r10 + 1)])
                            if (r11 > 4) {
                                if (r11 == 5) {
                                    r11 = Int64(heapClassInst.heap32[(r10 + 5)])
                                    r11 = r11 >> 2
                                    f0 = Float64(heapClassInst.heapFloat[(r11 + 1)])
                                    f1 = Float64(heapClassInst.heapFloat[(r10 + 72)])
                                    f2 = Float64(heapClassInst.heapFloat[(r11 + 2)])
                                    f3 = Float64(heapClassInst.heapFloat[(r10 + 76)])
                                    f4 = Float64(heapClassInst.heapFloat[(r10 + 73)])
                                    f5 = Float64(heapClassInst.heapFloat[(r10 + 77)])
                                    f6 = f1 * f0
                                    f7 = f3 * f2
                                    f8 = Float64(heapClassInst.heapFloat[(r11 + 3)])
                                    f9 = Float64(heapClassInst.heapFloat[(r10 + 80)])
                                    f10 = Float64(heapClassInst.heapFloat[(r11 + 9)])
                                    f11 = Float64(heapClassInst.heapFloat[(r10 + 84)])
                                    f12 = Float64(heapClassInst.heapFloat[(r11 + 5)])
                                    f13 = Float64(heapClassInst.heapFloat[(r10 + 74)])
                                    f14 = Float64(heapClassInst.heapFloat[(r11 + 10)])
                                    f15 = Float64(heapClassInst.heapFloat[(r10 + 85)])
                                    f16 = Float64(heapClassInst.heapFloat[(r11 + 6)])
                                    f17 = Float64(heapClassInst.heapFloat[(r10 + 78)])
                                    f18 = Float64(heapClassInst.heapFloat[(r11 + 11)])
                                    f19 = Float64(heapClassInst.heapFloat[(r10 + 86)])
                                    f20 = Float64(heapClassInst.heapFloat[(r11 + 7)])
                                    f21 = Float64(heapClassInst.heapFloat[(r10 + 82)])
                                    f22 = Float64(heapClassInst.heapFloat[(r10 + 81)])
                                    f23 = f4 * f0
                                    f24 = f5 * f2
                                    f6 = f6 + f7
                                    f7 = f9 * f8
                                    f25 = Float64(heapClassInst.heapFloat[(r11 + 15)])
                                    f26 = Float64(heapClassInst.heapFloat[(r11 + 14)])
                                    f27 = Float64(heapClassInst.heapFloat[(r11 + 13)])
                                    f28 = f13 * f0
                                    f29 = f17 * f2
                                    f23 = f23 + f24
                                    f24 = f22 * f8
                                    f6 = f6 + f7
                                    r11 = r4 >> 2
                                    f7 = f28 + f29
                                    f28 = f21 * f8
                                    f23 = f23 + f24
                                    heapClassInst.heapFloat[(fp + (-98))] = Float32(f6)
                                    f6 = f1 * f12
                                    f24 = f3 * f16
                                    f7 = f7 + f28
                                    heapClassInst.heapFloat[(r11 + 1)] = Float32(f23)
                                    heapClassInst.heapFloat[(r11 + 2)] = Float32(f7)
                                    f7 = f4 * f12
                                    f23 = f5 * f16
                                    f6 = f6 + f24
                                    f24 = f9 * f20
                                    f28 = f13 * f12
                                    f29 = f17 * f16
                                    f7 = f7 + f23
                                    f23 = f22 * f20
                                    f6 = f6 + f24
                                    heapClassInst.heap32[(r11 + 3)] = 0
                                    f24 = f28 + f29
                                    f28 = f21 * f20
                                    f7 = f7 + f23
                                    heapClassInst.heapFloat[(r11 + 4)] = Float32(f6)
                                    f1 = f1 * f10
                                    f3 = f3 * f14
                                    f6 = f24 + f28
                                    heapClassInst.heapFloat[(r11 + 5)] = Float32(f7)
                                    heapClassInst.heapFloat[(r11 + 6)] = Float32(f6)
                                    f4 = f4 * f10
                                    f5 = f5 * f14
                                    f1 = f1 + f3
                                    f3 = f9 * f18
                                    f6 = f13 * f10
                                    f7 = f17 * f14
                                    f4 = f4 + f5
                                    f5 = f22 * f18
                                    f1 = f1 + f3
                                    heapClassInst.heap32[(r11 + 7)] = 0
                                    f0 = f0 * f11
                                    f2 = f2 * f15
                                    f3 = f6 + f7
                                    f6 = f21 * f18
                                    f4 = f4 + f5
                                    heapClassInst.heapFloat[(r11 + 8)] = Float32(f1)
                                    f1 = f12 * f11
                                    f5 = f16 * f15
                                    f0 = f0 + f2
                                    f2 = f8 * f19
                                    f3 = f3 + f6
                                    heapClassInst.heapFloat[(r11 + 9)] = Float32(f4)
                                    f0 = f0 + f2
                                    heapClassInst.heapFloat[(r11 + 10)] = Float32(f3)
                                    f2 = f10 * f11
                                    f3 = f14 * f15
                                    f1 = f1 + f5
                                    f4 = f20 * f19
                                    f1 = f1 + f4
                                    f2 = f2 + f3
                                    f3 = f18 * f19
                                    f0 = f0 + f27
                                    heapClassInst.heap32[(r11 + 11)] = 0
                                    f2 = f2 + f3
                                    f1 = f1 + f26
                                    heapClassInst.heapFloat[(r11 + 12)] = Float32(f0)
                                    f0 = f2 + f25
                                    heapClassInst.heapFloat[(r11 + 13)] = Float32(f1)
                                    heapClassInst.heapFloat[(r11 + 14)] = Float32(f0)
                                    heapClassInst.heap32[(r11 + 15)] = 0
                                    if (!(r8 == 0)) {
                                        r12 = Int64(heapClassInst.heap32[(r1)])
                                        r12 = r12 >> 2
                                        r12 = Int64(heapClassInst.heap32[(r12 + 4)])
                                        heapClassInst.heap32[(g0)] = Int32(r0)
                                        __FUNCTION_TABLE__[(r12) >> 2](i7);
                                        r13 = commonVariable.r_g0 >> 2
                                        r13 = Int64(heapClassInst.heap32[(r13)])
                                        r13 = r13 >> 2
                                        r13 = Int64(heapClassInst.heap32[(r13 + 14)])
                                        heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r4)
                                        f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                        heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                        __FUNCTION_TABLE__[(r13) >> 2](i7);
                                    }
                                    r12 = Int64(heapClassInst.heap32[(r10 + 6)])
                                    r12 = r12 >> 2
                                    f0 = Float64(heapClassInst.heapFloat[(r12 + 1)])
                                    f1 = Float64(heapClassInst.heapFloat[(r10 + 88)])
                                    f2 = Float64(heapClassInst.heapFloat[(r12 + 2)])
                                    f3 = Float64(heapClassInst.heapFloat[(r10 + 92)])
                                    f4 = Float64(heapClassInst.heapFloat[(r10 + 89)])
                                    f5 = Float64(heapClassInst.heapFloat[(r10 + 93)])
                                    f6 = f1 * f0
                                    f7 = f3 * f2
                                    f8 = Float64(heapClassInst.heapFloat[(r12 + 3)])
                                    f9 = Float64(heapClassInst.heapFloat[(r10 + 96)])
                                    f10 = Float64(heapClassInst.heapFloat[(r12 + 9)])
                                    f11 = Float64(heapClassInst.heapFloat[(r10 + 100)])
                                    f12 = Float64(heapClassInst.heapFloat[(r12 + 5)])
                                    f13 = Float64(heapClassInst.heapFloat[(r10 + 90)])
                                    f14 = Float64(heapClassInst.heapFloat[(r12 + 10)])
                                    f15 = Float64(heapClassInst.heapFloat[(r10 + 101)])
                                    f16 = Float64(heapClassInst.heapFloat[(r12 + 6)])
                                    f17 = Float64(heapClassInst.heapFloat[(r10 + 94)])
                                    f18 = Float64(heapClassInst.heapFloat[(r12 + 11)])
                                    f19 = Float64(heapClassInst.heapFloat[(r10 + 102)])
                                    f20 = Float64(heapClassInst.heapFloat[(r12 + 7)])
                                    f21 = Float64(heapClassInst.heapFloat[(r10 + 98)])
                                    f22 = Float64(heapClassInst.heapFloat[(r10 + 97)])
                                    f23 = f4 * f0
                                    f24 = f5 * f2
                                    f6 = f6 + f7
                                    f7 = f9 * f8
                                    f25 = Float64(heapClassInst.heapFloat[(r12 + 15)])
                                    f26 = Float64(heapClassInst.heapFloat[(r12 + 14)])
                                    f27 = Float64(heapClassInst.heapFloat[(r12 + 13)])
                                    f28 = f13 * f0
                                    f29 = f17 * f2
                                    f23 = f23 + f24
                                    f24 = f22 * f8
                                    f6 = f6 + f7
                                    f7 = f28 + f29
                                    f28 = f21 * f8
                                    f23 = f23 + f24
                                    heapClassInst.heapFloat[(fp + (-98))] = Float32(f6)
                                    f6 = f1 * f12
                                    f24 = f3 * f16
                                    f7 = f7 + f28
                                    heapClassInst.heapFloat[(r11 + 1)] = Float32(f23)
                                    heapClassInst.heapFloat[(r11 + 2)] = Float32(f7)
                                    f7 = f4 * f12
                                    f23 = f5 * f16
                                    f6 = f6 + f24
                                    f24 = f9 * f20
                                    f28 = f13 * f12
                                    f29 = f17 * f16
                                    f7 = f7 + f23
                                    f23 = f22 * f20
                                    f6 = f6 + f24
                                    heapClassInst.heap32[(r11 + 3)] = 0
                                    f24 = f28 + f29
                                    f28 = f21 * f20
                                    f7 = f7 + f23
                                    heapClassInst.heapFloat[(r11 + 4)] = Float32(f6)
                                    f1 = f1 * f10
                                    f3 = f3 * f14
                                    f6 = f24 + f28
                                    heapClassInst.heapFloat[(r11 + 5)] = Float32(f7)
                                    heapClassInst.heapFloat[(r11 + 6)] = Float32(f6)
                                    f4 = f4 * f10
                                    f5 = f5 * f14
                                    f1 = f1 + f3
                                    f3 = f9 * f18
                                    f6 = f13 * f10
                                    f7 = f17 * f14
                                    f4 = f4 + f5
                                    f5 = f22 * f18
                                    f1 = f1 + f3
                                    heapClassInst.heap32[(r11 + 7)] = 0
                                    f0 = f0 * f11
                                    f2 = f2 * f15
                                    f3 = f6 + f7
                                    f6 = f21 * f18
                                    f4 = f4 + f5
                                    heapClassInst.heapFloat[(r11 + 8)] = Float32(f1)
                                    f1 = f12 * f11
                                    f5 = f16 * f15
                                    f0 = f0 + f2
                                    f2 = f8 * f19
                                    f3 = f3 + f6
                                    heapClassInst.heapFloat[(r11 + 9)] = Float32(f4)
                                    f0 = f0 + f2
                                    heapClassInst.heapFloat[(r11 + 10)] = Float32(f3)
                                    f2 = f10 * f11
                                    f3 = f14 * f15
                                    f1 = f1 + f5
                                    f4 = f20 * f19
                                    f1 = f1 + f4
                                    f2 = f2 + f3
                                    f3 = f18 * f19
                                    f0 = f0 + f27
                                    heapClassInst.heap32[(r11 + 11)] = 0
                                    f2 = f2 + f3
                                    f1 = f1 + f26
                                    heapClassInst.heapFloat[(r11 + 12)] = Float32(f0)
                                    f0 = f2 + f25
                                    heapClassInst.heapFloat[(r11 + 13)] = Float32(f1)
                                    heapClassInst.heapFloat[(r11 + 14)] = Float32(f0)
                                    heapClassInst.heap32[(r11 + 15)] = 0
                                    if (!(r8 == 0)) {
                                        r8 = Int64(heapClassInst.heap32[(r1)])
                                        r8 = r8 >> 2
                                        r8 = Int64(heapClassInst.heap32[(r8 + 4)])
                                        heapClassInst.heap32[(g0)] = Int32(r0)
                                        __FUNCTION_TABLE__[(r8) >> 2](i7);
                                        r12 = commonVariable.r_g0 >> 2
                                        r12 = Int64(heapClassInst.heap32[(r12)])
                                        r12 = r12 >> 2
                                        r12 = Int64(heapClassInst.heap32[(r12 + 14)])
                                        heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r4)
                                        f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                        heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                        __FUNCTION_TABLE__[(r12) >> 2](i7);
                                    }
                                    if (r9 == 0) {
                                        break
                                    } else {
                                        r8 = sp + (-408)
                                        heapClassInst.heap32[(g0)] = Int32(r8)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                        heapClassInst.heap32[(g0 + 2)] = 1086506843
                                        f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                        heapClassInst.heapFloat[(g0 + 3)] = Float32(f0)
                                        _ZNK21btConeTwistConstraint16GetPointForAngleEff(i7);
                                        r9 = r8 >> 2
                                        f0 = Float64(heapClassInst.heapFloat[(fp + (-102))])
                                        f1 = Float64(heapClassInst.heapFloat[(fp + (-98))])
                                        f2 = Float64(heapClassInst.heapFloat[(r9 + 1)])
                                        f3 = Float64(heapClassInst.heapFloat[(r11 + 1)])
                                        f4 = Float64(heapClassInst.heapFloat[(r11 + 4)])
                                        f5 = Float64(heapClassInst.heapFloat[(r11 + 5)])
                                        f1 = f1 * f0
                                        f3 = f3 * f2
                                        f6 = Float64(heapClassInst.heapFloat[(r9 + 2)])
                                        f7 = Float64(heapClassInst.heapFloat[(r11 + 2)])
                                        f8 = Float64(heapClassInst.heapFloat[(r11 + 8)])
                                        f9 = Float64(heapClassInst.heapFloat[(r11 + 9)])
                                        f10 = Float64(heapClassInst.heapFloat[(r11 + 6)])
                                        f4 = f4 * f0
                                        f5 = f5 * f2
                                        f1 = f1 + f3
                                        f3 = f7 * f6
                                        f7 = Float64(heapClassInst.heapFloat[(r11 + 10)])
                                        f0 = f8 * f0
                                        f2 = f9 * f2
                                        f4 = f4 + f5
                                        f5 = f10 * f6
                                        f1 = f1 + f3
                                        f3 = Float64(heapClassInst.heapFloat[(r11 + 12)])
                                        f8 = Float64(heapClassInst.heapFloat[(r11 + 14)])
                                        f9 = Float64(heapClassInst.heapFloat[(r11 + 13)])
                                        f4 = f4 + f5
                                        f0 = f0 + f2
                                        f2 = f7 * f6
                                        f1 = f1 + f3
                                        f0 = f0 + f2
                                        f2 = f4 + f9
                                        heapClassInst.heapFloat[(fp + (-102))] = Float32(f1)
                                        f0 = f0 + f8
                                        heapClassInst.heapFloat[(r9 + 1)] = Float32(f2)
                                        r12 = 0
                                        heapClassInst.heapFloat[(r9 + 2)] = Float32(f0)
                                        heapClassInst.heap32[(r9 + 3)] = 0
                                        while (true) {
                                            f0 = Float64(r12)
                                            f1 = 6.2831850051879883
                                            f0 = f0 * f1
                                            f1 = 32.0
                                            r13 = sp + (-472)
                                            f0 = f0 / f1
                                            heapClassInst.heap32[(g0)] = Int32(r13)
                                            heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                            heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                            f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                            heapClassInst.heapFloat[(g0 + 3)] = Float32(f0)
                                            _ZNK21btConeTwistConstraint16GetPointForAngleEff(i7);
                                            r14 = r13 >> 2
                                            f0 = Float64(heapClassInst.heapFloat[(fp + (-118))])
                                            f1 = Float64(heapClassInst.heapFloat[(fp + (-98))])
                                            f2 = Float64(heapClassInst.heapFloat[(r14 + 1)])
                                            f3 = Float64(heapClassInst.heapFloat[(r11 + 1)])
                                            f4 = Float64(heapClassInst.heapFloat[(r11 + 4)])
                                            f5 = Float64(heapClassInst.heapFloat[(r11 + 5)])
                                            f1 = f1 * f0
                                            f3 = f3 * f2
                                            f6 = Float64(heapClassInst.heapFloat[(r14 + 2)])
                                            f7 = Float64(heapClassInst.heapFloat[(r11 + 2)])
                                            f8 = Float64(heapClassInst.heapFloat[(r11 + 8)])
                                            f9 = Float64(heapClassInst.heapFloat[(r11 + 9)])
                                            f10 = Float64(heapClassInst.heapFloat[(r11 + 6)])
                                            f4 = f4 * f0
                                            f5 = f5 * f2
                                            f1 = f1 + f3
                                            f3 = f7 * f6
                                            f7 = Float64(heapClassInst.heapFloat[(r11 + 10)])
                                            f0 = f8 * f0
                                            f2 = f9 * f2
                                            f4 = f4 + f5
                                            f5 = f10 * f6
                                            f1 = f1 + f3
                                            f3 = Float64(heapClassInst.heapFloat[(r11 + 12)])
                                            f8 = Float64(heapClassInst.heapFloat[(r11 + 14)])
                                            f9 = Float64(heapClassInst.heapFloat[(r11 + 13)])
                                            f4 = f4 + f5
                                            f0 = f0 + f2
                                            f2 = f7 * f6
                                            f1 = f1 + f3
                                            f0 = f0 + f2
                                            f2 = f4 + f9
                                            heapClassInst.heapFloat[(fp + (-118))] = Float32(f1)
                                            f0 = f0 + f8
                                            heapClassInst.heapFloat[(r14 + 1)] = Float32(f2)
                                            heapClassInst.heapFloat[(r14 + 2)] = Float32(f0)
                                            heapClassInst.heap32[(r14 + 3)] = 0
                                            r15 = Int64(heapClassInst.heap32[(r1)])
                                            r15 = r15 >> 2
                                            r15 = Int64(heapClassInst.heap32[(r15 + 4)])
                                            heapClassInst.heap32[(g0)] = Int32(r0)
                                            __FUNCTION_TABLE__[(r15) >> 2](i7);
                                            r16 = commonVariable.r_g0 >> 2
                                            r16 = Int64(heapClassInst.heap32[(r16)])
                                            r16 = r16 >> 2
                                            r16 = Int64(heapClassInst.heap32[(r16 + 2)])
                                            r17 = sp + (-152)
                                            r18 = r17 >> 2
                                            heapClassInst.heap32[(fp + (-38))] = 0
                                            heapClassInst.heap32[(r18 + 1)] = 0
                                            heapClassInst.heap32[(r18 + 2)] = 0
                                            heapClassInst.heap32[(r18 + 3)] = 0
                                            heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                            heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                            heapClassInst.heap32[(g0 + 2)] = Int32(r13)
                                            heapClassInst.heap32[(g0 + 3)] = Int32(r17)
                                            r15 = r12 & 3
                                            __FUNCTION_TABLE__[(r16) >> 2](i7);
                                            if (!(r15 != 0)) {
                                                r15 = Int64(heapClassInst.heap32[(r1)])
                                                r15 = r15 >> 2
                                                r15 = Int64(heapClassInst.heap32[(r15 + 4)])
                                                heapClassInst.heap32[(g0)] = Int32(r0)
                                                __FUNCTION_TABLE__[(r15) >> 2](i7);
                                                r16 = commonVariable.r_g0 >> 2
                                                r16 = Int64(heapClassInst.heap32[(r16)])
                                                r16 = r16 >> 2
                                                r16 = Int64(heapClassInst.heap32[(r16 + 2)])
                                                r17 = sp + (-136)
                                                r18 = r17 >> 2
                                                heapClassInst.heap32[(fp + (-34))] = 0
                                                heapClassInst.heap32[(r18 + 1)] = 0
                                                heapClassInst.heap32[(r18 + 2)] = 0
                                                heapClassInst.heap32[(r18 + 3)] = 0
                                                heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                                heapClassInst.heap32[(g0 + 1)] = Int32(r6)
                                                heapClassInst.heap32[(g0 + 2)] = Int32(r13)
                                                heapClassInst.heap32[(g0 + 3)] = Int32(r17)
                                                __FUNCTION_TABLE__[(r16) >> 2](i7);
                                            }
                                            heapClassInst.heap32[(fp + (-102))] = heapClassInst.heap32[(fp + (-118))]
                                            heapClassInst.heap32[(r9 + 1)] = heapClassInst.heap32[(r14 + 1)]
                                            r12 = (r12 + 1) | 0
                                            heapClassInst.heap32[(r9 + 2)] = heapClassInst.heap32[(r14 + 2)]
                                            heapClassInst.heap32[(r9 + 3)] = heapClassInst.heap32[(r14 + 3)]
                                            if (!(r12 != 32)) {
                                                break
                                            }
                                        }
                                        r2 = Int64(heapClassInst.heap32[(r10 + 6)])
                                        f0 = Float64(heapClassInst.heapFloat[(r10 + 110)])
                                        heapClassInst.heapFloat[(fp + (-193))] = Float32(f0)
                                        f0 = Float64(heapClassInst.heapFloat[(r10 + 125)])
                                        heapClassInst.heapFloat[(fp + (-194))] = Float32(f0)
                                        r2 = r2 >> 2
                                        f0 = Float64(heapClassInst.heapFloat[(r2 + 84)])
                                        f1 = Float64(heapClassInst.heapFloat[(fp + (-192))])
                                        if (f0 <= f1) {
                                            r2 = Int64(heapClassInst.heap32[(r10 + 5)])
                                            r2 = r2 >> 2
                                            f0 = Float64(heapClassInst.heapFloat[(r10 + 84)])
                                            f1 = Float64(heapClassInst.heapFloat[(r2 + 9)])
                                            f2 = Float64(heapClassInst.heapFloat[(r2 + 5)])
                                            f3 = Float64(heapClassInst.heapFloat[(r2 + 1)])
                                            f4 = Float64(heapClassInst.heapFloat[(r10 + 85)])
                                            f5 = Float64(heapClassInst.heapFloat[(r2 + 10)])
                                            f6 = Float64(heapClassInst.heapFloat[(r2 + 6)])
                                            f8 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                                            f12 = Float64(heapClassInst.heapFloat[(r10 + 74)])
                                            f13 = Float64(heapClassInst.heapFloat[(r10 + 78)])
                                            f14 = Float64(heapClassInst.heapFloat[(r10 + 73)])
                                            f15 = Float64(heapClassInst.heapFloat[(r10 + 77)])
                                            f7 = Float64(heapClassInst.heapFloat[(r10 + 72)])
                                            f9 = Float64(heapClassInst.heapFloat[(r10 + 76)])
                                            f10 = f1 * f0
                                            f11 = f5 * f4
                                            f16 = f2 * f0
                                            f17 = f6 * f4
                                            f0 = f3 * f0
                                            f4 = f8 * f4
                                            f18 = Float64(heapClassInst.heapFloat[(r10 + 86)])
                                            f19 = Float64(heapClassInst.heapFloat[(r2 + 11)])
                                            f20 = Float64(heapClassInst.heapFloat[(r2 + 7)])
                                            f21 = Float64(heapClassInst.heapFloat[(r2 + 3)])
                                            f22 = Float64(heapClassInst.heapFloat[(r10 + 82)])
                                            f23 = Float64(heapClassInst.heapFloat[(r10 + 81)])
                                            f24 = Float64(heapClassInst.heapFloat[(r10 + 80)])
                                            f10 = f10 + f11
                                            f11 = f19 * f18
                                            f16 = f16 + f17
                                            f17 = f20 * f18
                                            f0 = f0 + f4
                                            heapClassInst.heapFloat[(fp + (-192))] = Float32(f0)
                                            f4 = f21 * f18
                                            f18 = f12 * f1
                                            f25 = f13 * f5
                                            f26 = f14 * f1
                                            f27 = f15 * f5
                                            f1 = f7 * f1
                                            f5 = f9 * f5
                                            f28 = f12 * f2
                                            f29 = f13 * f6
                                            f30 = f14 * f2
                                            f0 = f15 * f6
                                            f2 = f7 * f2
                                            f6 = f9 * f6
                                            f12 = f12 * f3
                                            f13 = f13 * f8
                                            f14 = f14 * f3
                                            f15 = f15 * f8
                                            f3 = f7 * f3
                                            f8 = f9 * f8
                                            f7 = f10 + f11
                                            f9 = Float64(heapClassInst.heapFloat[(r2 + 15)])
                                            f10 = f16 + f17
                                            f11 = Float64(heapClassInst.heapFloat[(r2 + 14)])
                                            f16 = Float64(heapClassInst.heapFloat[(fp + (-192))])
                                            f4 = f16 + f4
                                            f16 = Float64(heapClassInst.heapFloat[(r2 + 13)])
                                            f17 = f18 + f25
                                            f18 = f22 * f19
                                            f25 = f26 + f27
                                            f26 = f23 * f19
                                            f1 = f1 + f5
                                            f5 = f24 * f19
                                            f19 = f28 + f29
                                            f27 = f22 * f20
                                            f0 = f30 + f0
                                            f28 = f23 * f20
                                            f2 = f2 + f6
                                            f6 = f24 * f20
                                            f20 = f12 + f13
                                            f22 = f22 * f21
                                            f29 = f14 + f15
                                            f23 = f23 * f21
                                            f3 = f3 + f8
                                            f21 = f24 * f21
                                            f12 = f7 + f9
                                            f13 = f10 + f11
                                            f4 = f4 + f16
                                            f14 = f17 + f18
                                            f15 = f25 + f26
                                            f1 = f1 + f5
                                            f5 = f19 + f27
                                            f0 = f0 + f28
                                            f2 = f2 + f6
                                            f6 = f20 + f22
                                            f8 = f29 + f23
                                            f3 = f3 + f21
                                        } else {
                                            f0 = Float64(heapClassInst.heapFloat[(r10 + 100)])
                                            f1 = Float64(heapClassInst.heapFloat[(r2 + 9)])
                                            f2 = Float64(heapClassInst.heapFloat[(r2 + 5)])
                                            f3 = Float64(heapClassInst.heapFloat[(r2 + 1)])
                                            f4 = Float64(heapClassInst.heapFloat[(r10 + 101)])
                                            f5 = Float64(heapClassInst.heapFloat[(r2 + 10)])
                                            f6 = Float64(heapClassInst.heapFloat[(r2 + 6)])
                                            f7 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                                            f8 = Float64(heapClassInst.heapFloat[(r10 + 90)])
                                            f9 = Float64(heapClassInst.heapFloat[(r10 + 94)])
                                            f10 = Float64(heapClassInst.heapFloat[(r10 + 89)])
                                            f11 = Float64(heapClassInst.heapFloat[(r10 + 93)])
                                            f12 = Float64(heapClassInst.heapFloat[(r10 + 88)])
                                            f13 = Float64(heapClassInst.heapFloat[(r10 + 92)])
                                            f14 = f1 * f0
                                            f15 = f5 * f4
                                            f16 = f2 * f0
                                            f17 = f6 * f4
                                            f0 = f3 * f0
                                            f4 = f7 * f4
                                            f18 = Float64(heapClassInst.heapFloat[(r10 + 102)])
                                            f19 = Float64(heapClassInst.heapFloat[(r2 + 11)])
                                            f20 = Float64(heapClassInst.heapFloat[(r2 + 7)])
                                            f21 = Float64(heapClassInst.heapFloat[(r2 + 3)])
                                            f22 = Float64(heapClassInst.heapFloat[(r10 + 98)])
                                            f23 = Float64(heapClassInst.heapFloat[(r10 + 97)])
                                            f24 = Float64(heapClassInst.heapFloat[(r10 + 96)])
                                            f14 = f14 + f15
                                            f15 = f19 * f18
                                            f16 = f16 + f17
                                            f17 = f20 * f18
                                            f0 = f0 + f4
                                            heapClassInst.heapFloat[(fp + (-192))] = Float32(f0)
                                            f4 = f21 * f18
                                            f18 = f8 * f1
                                            f25 = f9 * f5
                                            f26 = f10 * f1
                                            f27 = f11 * f5
                                            f1 = f12 * f1
                                            f5 = f13 * f5
                                            f28 = f8 * f2
                                            f29 = f9 * f6
                                            f30 = f10 * f2
                                            f0 = f11 * f6
                                            f2 = f12 * f2
                                            f6 = f13 * f6
                                            f8 = f8 * f3
                                            f9 = f9 * f7
                                            f10 = f10 * f3
                                            f11 = f11 * f7
                                            f3 = f12 * f3
                                            f7 = f13 * f7
                                            f12 = f14 + f15
                                            f13 = Float64(heapClassInst.heapFloat[(r2 + 15)])
                                            f14 = f16 + f17
                                            f15 = Float64(heapClassInst.heapFloat[(r2 + 14)])
                                            f16 = Float64(heapClassInst.heapFloat[(fp + (-192))])
                                            f4 = f16 + f4
                                            f16 = Float64(heapClassInst.heapFloat[(r2 + 13)])
                                            f17 = f18 + f25
                                            f18 = f22 * f19
                                            f25 = f26 + f27
                                            f26 = f23 * f19
                                            f1 = f1 + f5
                                            f5 = f24 * f19
                                            f19 = f28 + f29
                                            f27 = f22 * f20
                                            f0 = f30 + f0
                                            f28 = f23 * f20
                                            f2 = f2 + f6
                                            f6 = f24 * f20
                                            f8 = f8 + f9
                                            f9 = f22 * f21
                                            f10 = f10 + f11
                                            f11 = f23 * f21
                                            f3 = f3 + f7
                                            f7 = f24 * f21
                                            f12 = f12 + f13
                                            f13 = f14 + f15
                                            f4 = f4 + f16
                                            f14 = f17 + f18
                                            f15 = f25 + f26
                                            f1 = f1 + f5
                                            f5 = f19 + f27
                                            f0 = f0 + f28
                                            f2 = f2 + f6
                                            f6 = f8 + f9
                                            f8 = f10 + f11
                                            f3 = f3 + f7
                                        }
                                        heapClassInst.heapFloat[(fp + (-98))] = Float32(f3)
                                        heapClassInst.heapFloat[(r11 + 1)] = Float32(f8)
                                        heapClassInst.heapFloat[(r11 + 2)] = Float32(f6)
                                        heapClassInst.heap32[(r11 + 3)] = 0
                                        heapClassInst.heapFloat[(r11 + 4)] = Float32(f2)
                                        heapClassInst.heapFloat[(r11 + 5)] = Float32(f0)
                                        heapClassInst.heapFloat[(r11 + 6)] = Float32(f5)
                                        heapClassInst.heap32[(r11 + 7)] = 0
                                        heapClassInst.heapFloat[(r11 + 8)] = Float32(f1)
                                        heapClassInst.heapFloat[(r11 + 9)] = Float32(f15)
                                        heapClassInst.heapFloat[(r11 + 10)] = Float32(f14)
                                        heapClassInst.heap32[(r11 + 11)] = 0
                                        heapClassInst.heapFloat[(r11 + 12)] = Float32(f4)
                                        heapClassInst.heapFloat[(r11 + 13)] = Float32(f13)
                                        heapClassInst.heapFloat[(r11 + 14)] = Float32(f12)
                                        r2 = sp + (-424)
                                        heapClassInst.heap32[(r11 + 15)] = 0
                                        r8 = r2 >> 2
                                        heapClassInst.heapFloat[(fp + (-106))] = Float32(f4)
                                        heapClassInst.heapFloat[(r8 + 1)] = Float32(f13)
                                        heapClassInst.heapFloat[(r8 + 2)] = Float32(f12)
                                        r9 = sp + (-440)
                                        heapClassInst.heap32[(r8 + 3)] = 0
                                        r8 = r9 >> 2
                                        heapClassInst.heapFloat[(fp + (-110))] = Float32(f3)
                                        heapClassInst.heapFloat[(r8 + 1)] = Float32(f2)
                                        heapClassInst.heapFloat[(r8 + 2)] = Float32(f1)
                                        r10 = sp + (-456)
                                        heapClassInst.heap32[(r8 + 3)] = 0
                                        r8 = r10 >> 2
                                        heapClassInst.heapFloat[(fp + (-114))] = Float32(f8)
                                        heapClassInst.heapFloat[(r8 + 1)] = Float32(f0)
                                        heapClassInst.heapFloat[(r8 + 2)] = Float32(f15)
                                        heapClassInst.heap32[(r8 + 3)] = 0
                                        r8 = Int64(heapClassInst.heap32[(r1)])
                                        r8 = r8 >> 2
                                        r8 = Int64(heapClassInst.heap32[(r8 + 4)])
                                        heapClassInst.heap32[(g0)] = Int32(r0)
                                        __FUNCTION_TABLE__[(r8) >> 2](i7);
                                        r11 = commonVariable.r_g0 >> 2
                                        r11 = Int64(heapClassInst.heap32[(r11)])
                                        r11 = r11 >> 2
                                        r11 = Int64(heapClassInst.heap32[(r11 + 15)])
                                        r12 = sp + (-120)
                                        r13 = r12 >> 2
                                        heapClassInst.heap32[(fp + (-30))] = 0
                                        heapClassInst.heap32[(r13 + 1)] = 0
                                        heapClassInst.heap32[(r13 + 2)] = 0
                                        heapClassInst.heap32[(r13 + 3)] = 0
                                        f0 = Float64(heapClassInst.heapFloat[(fp + (-194))])
                                        f1 = -f0
                                        f2 = Float64(heapClassInst.heapFloat[(fp + (-193))])
                                        f1 = f1 - f2
                                        f0 = f2 - f0
                                        heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                        heapClassInst.heap32[(g0 + 2)] = Int32(r9)
                                        heapClassInst.heap32[(g0 + 3)] = Int32(r10)
                                        f2 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                        heapClassInst.heapFloat[(g0 + 4)] = Float32(f2)
                                        heapClassInst.heapFloat[(g0 + 5)] = Float32(f2)
                                        heapClassInst.heapFloat[(g0 + 6)] = Float32(f1)
                                        heapClassInst.heapFloat[(g0 + 7)] = Float32(f0)
                                        heapClassInst.heap32[(g0 + 8)] = Int32(r12)
                                        heapClassInst.heap32[(g0 + 9)] = 1
                                        heapClassInst.heap32[(g0 + 10)] = 1092616192
                                        __FUNCTION_TABLE__[(r11) >> 2](i7);
                                    }
                                } else {
                                    if (r11 == 6) {
                                        r11 = sp + (-536)
                                        r12 = r11 >> 2
                                        heapClassInst.heap32[(fp + (-134))] = heapClassInst.heap32[(r10 + 263)]
                                        heapClassInst.heap32[(r12 + 1)] = heapClassInst.heap32[(r10 + 264)]
                                        heapClassInst.heap32[(r12 + 2)] = heapClassInst.heap32[(r10 + 265)]
                                        heapClassInst.heap32[(r12 + 3)] = heapClassInst.heap32[(r10 + 266)]
                                        heapClassInst.heap32[(r12 + 4)] = heapClassInst.heap32[(r10 + 267)]
                                        heapClassInst.heap32[(r12 + 5)] = heapClassInst.heap32[(r10 + 268)]
                                        heapClassInst.heap32[(r12 + 6)] = heapClassInst.heap32[(r10 + 269)]
                                        heapClassInst.heap32[(r12 + 7)] = heapClassInst.heap32[(r10 + 270)]
                                        heapClassInst.heap32[(r12 + 8)] = heapClassInst.heap32[(r10 + 271)]
                                        heapClassInst.heap32[(r12 + 9)] = heapClassInst.heap32[(r10 + 272)]
                                        heapClassInst.heap32[(r12 + 10)] = heapClassInst.heap32[(r10 + 273)]
                                        heapClassInst.heap32[(r12 + 11)] = heapClassInst.heap32[(r10 + 274)]
                                        heapClassInst.heap32[(r12 + 12)] = heapClassInst.heap32[(r10 + 275)]
                                        heapClassInst.heap32[(r12 + 13)] = heapClassInst.heap32[(r10 + 276)]
                                        heapClassInst.heap32[(r12 + 14)] = heapClassInst.heap32[(r10 + 277)]
                                        heapClassInst.heap32[(r12 + 15)] = heapClassInst.heap32[(r10 + 278)]
                                        if (!(r8 == 0)) {
                                            r13 = Int64(heapClassInst.heap32[(r1)])
                                            r13 = r13 >> 2
                                            r13 = Int64(heapClassInst.heap32[(r13 + 4)])
                                            heapClassInst.heap32[(g0)] = Int32(r0)
                                            __FUNCTION_TABLE__[(r13) >> 2](i7);
                                            r14 = commonVariable.r_g0 >> 2
                                            r14 = Int64(heapClassInst.heap32[(r14)])
                                            r14 = r14 >> 2
                                            r14 = Int64(heapClassInst.heap32[(r14 + 14)])
                                            heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                            heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                            f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                            heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                            __FUNCTION_TABLE__[(r14) >> 2](i7);
                                        }
                                        heapClassInst.heap32[(fp + (-134))] = heapClassInst.heap32[(r10 + 279)]
                                        heapClassInst.heap32[(r12 + 1)] = heapClassInst.heap32[(r10 + 280)]
                                        heapClassInst.heap32[(r12 + 2)] = heapClassInst.heap32[(r10 + 281)]
                                        heapClassInst.heap32[(r12 + 3)] = heapClassInst.heap32[(r10 + 282)]
                                        heapClassInst.heap32[(r12 + 4)] = heapClassInst.heap32[(r10 + 283)]
                                        heapClassInst.heap32[(r12 + 5)] = heapClassInst.heap32[(r10 + 284)]
                                        heapClassInst.heap32[(r12 + 6)] = heapClassInst.heap32[(r10 + 285)]
                                        heapClassInst.heap32[(r12 + 7)] = heapClassInst.heap32[(r10 + 286)]
                                        heapClassInst.heap32[(r12 + 8)] = heapClassInst.heap32[(r10 + 287)]
                                        heapClassInst.heap32[(r12 + 9)] = heapClassInst.heap32[(r10 + 288)]
                                        heapClassInst.heap32[(r12 + 10)] = heapClassInst.heap32[(r10 + 289)]
                                        heapClassInst.heap32[(r12 + 11)] = heapClassInst.heap32[(r10 + 290)]
                                        heapClassInst.heap32[(r12 + 12)] = heapClassInst.heap32[(r10 + 291)]
                                        heapClassInst.heap32[(r12 + 13)] = heapClassInst.heap32[(r10 + 292)]
                                        heapClassInst.heap32[(r12 + 14)] = heapClassInst.heap32[(r10 + 293)]
                                        heapClassInst.heap32[(r12 + 15)] = heapClassInst.heap32[(r10 + 294)]
                                        if (!(r8 == 0)) {
                                            r8 = Int64(heapClassInst.heap32[(r1)])
                                            r8 = r8 >> 2
                                            r8 = Int64(heapClassInst.heap32[(r8 + 4)])
                                            heapClassInst.heap32[(g0)] = Int32(r0)
                                            __FUNCTION_TABLE__[(r8) >> 2](i7);
                                            r13 = commonVariable.r_g0 >> 2
                                            r13 = Int64(heapClassInst.heap32[(r13)])
                                            r13 = r13 >> 2
                                            r13 = Int64(heapClassInst.heap32[(r13 + 14)])
                                            heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                            heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                            f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                            heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                            __FUNCTION_TABLE__[(r13) >> 2](i7);
                                        }
                                        if (r9 == 0) {
                                            break
                                        } else {
                                            r2 = (r2 + 1164) | 0
                                            f0 = Float64(heapClassInst.heapFloat[(r10 + 263)])
                                            heapClassInst.heapFloat[(fp + (-134))] = Float32(f0)
                                            heapClassInst.heap32[(r12 + 1)] = heapClassInst.heap32[(r10 + 264)]
                                            f1 = Float64(heapClassInst.heapFloat[(r10 + 265)])
                                            heapClassInst.heapFloat[(r12 + 2)] = Float32(f1)
                                            heapClassInst.heap32[(r12 + 3)] = heapClassInst.heap32[(r10 + 266)]
                                            f2 = Float64(heapClassInst.heapFloat[(r10 + 267)])
                                            heapClassInst.heapFloat[(r12 + 4)] = Float32(f2)
                                            heapClassInst.heap32[(r12 + 5)] = heapClassInst.heap32[(r10 + 268)]
                                            f3 = Float64(heapClassInst.heapFloat[(r10 + 269)])
                                            heapClassInst.heapFloat[(r12 + 6)] = Float32(f3)
                                            heapClassInst.heap32[(r12 + 7)] = heapClassInst.heap32[(r10 + 270)]
                                            f4 = Float64(heapClassInst.heapFloat[(r10 + 271)])
                                            heapClassInst.heapFloat[(r12 + 8)] = Float32(f4)
                                            heapClassInst.heap32[(r12 + 9)] = heapClassInst.heap32[(r10 + 272)]
                                            f5 = Float64(heapClassInst.heapFloat[(r10 + 273)])
                                            heapClassInst.heapFloat[(r12 + 10)] = Float32(f5)
                                            heapClassInst.heap32[(r12 + 11)] = heapClassInst.heap32[(r10 + 274)]
                                            heapClassInst.heap32[(r12 + 12)] = heapClassInst.heap32[(r10 + 275)]
                                            heapClassInst.heap32[(r12 + 13)] = heapClassInst.heap32[(r10 + 276)]
                                            heapClassInst.heap32[(r12 + 14)] = heapClassInst.heap32[(r10 + 277)]
                                            r8 = sp + (-552)
                                            heapClassInst.heap32[(r12 + 15)] = heapClassInst.heap32[(r10 + 278)]
                                            r9 = r8 >> 2
                                            heapClassInst.heapFloat[(fp + (-138))] = Float32(f1)
                                            heapClassInst.heapFloat[(r9 + 1)] = Float32(f3)
                                            heapClassInst.heapFloat[(r9 + 2)] = Float32(f5)
                                            heapClassInst.heap32[(r9 + 3)] = 0
                                            r9 = sp + (-568)
                                            heapClassInst.heapFloat[(fp + (-142))] = Float32(f0)
                                            r13 = r9 >> 2
                                            heapClassInst.heapFloat[(r13 + 1)] = Float32(f2)
                                            heapClassInst.heapFloat[(r13 + 2)] = Float32(f4)
                                            heapClassInst.heap32[(r13 + 3)] = 0
                                            r14 = Int64(heapClassInst.heap32[(r1)])
                                            r14 = r14 >> 2
                                            r14 = Int64(heapClassInst.heap32[(r14 + 4)])
                                            f0 = Float64(heapClassInst.heapFloat[(r10 + 230)])
                                            f1 = Float64(heapClassInst.heapFloat[(r10 + 231)])
                                            f2 = Float64(heapClassInst.heapFloat[(r10 + 246)])
                                            f3 = Float64(heapClassInst.heapFloat[(r10 + 247)])
                                            heapClassInst.heap32[(g0)] = Int32(r0)
                                            __FUNCTION_TABLE__[(r14) >> 2](i7);
                                            r15 = commonVariable.r_g0 >> 2
                                            r15 = Int64(heapClassInst.heap32[(r15)])
                                            r15 = r15 >> 2
                                            r15 = Int64(heapClassInst.heap32[(r15 + 16)])
                                            r16 = sp + (-104)
                                            r17 = r16 >> 2
                                            heapClassInst.heap32[(fp + (-26))] = 0
                                            heapClassInst.heap32[(r17 + 1)] = 0
                                            heapClassInst.heap32[(r17 + 2)] = 0
                                            heapClassInst.heap32[(r17 + 3)] = 0
                                            f4 = 0.89999997615814209
                                            f5 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                            f4 = f5 * f4
                                            heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                            heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                            heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                            heapClassInst.heap32[(g0 + 3)] = Int32(r9)
                                            heapClassInst.heapFloat[(g0 + 4)] = Float32(f4)
                                            heapClassInst.heapFloat[(g0 + 5)] = Float32(f0)
                                            heapClassInst.heapFloat[(g0 + 6)] = Float32(f1)
                                            heapClassInst.heapFloat[(g0 + 7)] = Float32(f2)
                                            heapClassInst.heapFloat[(g0 + 8)] = Float32(f3)
                                            heapClassInst.heap32[(g0 + 9)] = Int32(r16)
                                            heapClassInst.heap32[(g0 + 10)] = 1092616192
                                            __FUNCTION_TABLE__[(r15) >> 2](i7);
                                            f0 = Float64(heapClassInst.heapFloat[(r12 + 9)])
                                            f1 = Float64(heapClassInst.heapFloat[(r12 + 5)])
                                            heapClassInst.heap32[(fp + (-142))] = heapClassInst.heap32[(r12 + 1)]
                                            heapClassInst.heapFloat[(r13 + 1)] = Float32(f1)
                                            heapClassInst.heapFloat[(r13 + 2)] = Float32(f0)
                                            heapClassInst.heap32[(r13 + 3)] = 0
                                            f0 = Float64(heapClassInst.heapFloat[(r10 + 296)])
                                            f1 = Float64(heapClassInst.heapFloat[(r10 + 297)])
                                            heapClassInst.heapFloat[(g0)] = Float32(f0)
                                            cosf(i7);
                                            f2 = commonVariable.f_g0
                                            heapClassInst.heapFloat[(g0)] = Float32(f0)
                                            sinf(i7);
                                            f0 = commonVariable.f_g0
                                            heapClassInst.heapFloat[(g0)] = Float32(f1)
                                            cosf(i7);
                                            f3 = commonVariable.f_g0
                                            heapClassInst.heapFloat[(g0)] = Float32(f1)
                                            sinf(i7);
                                            f4 = Float64(heapClassInst.heapFloat[(fp + (-142))])
                                            f5 = f2 * f3
                                            f6 = Float64(heapClassInst.heapFloat[(r13 + 1)])
                                            f7 = f2 * commonVariable.f_g0
                                            f8 = Float64(heapClassInst.heapFloat[(r13 + 2)])
                                            f5 = f5 * f4
                                            f7 = f7 * f6
                                            f9 = f3 * f0
                                            f10 = commonVariable.f_g0 * f0
                                            f5 = f5 + f7
                                            f0 = f8 * f0
                                            r8 = sp + (-584)
                                            f7 = f9 * f4
                                            f9 = f10 * f6
                                            f3 = f6 * f3
                                            f1 = f4 * commonVariable.f_g0
                                            f0 = f5 - f0
                                            r9 = r8 >> 2
                                            f4 = f7 + f9
                                            f2 = f8 * f2
                                            f1 = f3 - f1
                                            heapClassInst.heapFloat[(fp + (-146))] = Float32(f0)
                                            f0 = f4 + f2
                                            heapClassInst.heapFloat[(r9 + 1)] = Float32(f1)
                                            heapClassInst.heapFloat[(r9 + 2)] = Float32(f0)
                                            f0 = Float64(heapClassInst.heapFloat[(r10 + 279)])
                                            heapClassInst.heapFloat[(fp + (-134))] = Float32(f0)
                                            heapClassInst.heap32[(r12 + 1)] = heapClassInst.heap32[(r10 + 280)]
                                            heapClassInst.heap32[(r12 + 2)] = heapClassInst.heap32[(r10 + 281)]
                                            heapClassInst.heap32[(r12 + 3)] = heapClassInst.heap32[(r10 + 282)]
                                            f1 = Float64(heapClassInst.heapFloat[(r10 + 283)])
                                            heapClassInst.heapFloat[(r12 + 4)] = Float32(f1)
                                            heapClassInst.heap32[(r12 + 5)] = heapClassInst.heap32[(r10 + 284)]
                                            heapClassInst.heap32[(r12 + 6)] = heapClassInst.heap32[(r10 + 285)]
                                            heapClassInst.heap32[(r12 + 7)] = heapClassInst.heap32[(r10 + 286)]
                                            f2 = Float64(heapClassInst.heapFloat[(r10 + 287)])
                                            heapClassInst.heapFloat[(r12 + 8)] = Float32(f2)
                                            heapClassInst.heap32[(r12 + 9)] = heapClassInst.heap32[(r10 + 288)]
                                            heapClassInst.heap32[(r12 + 10)] = heapClassInst.heap32[(r10 + 289)]
                                            heapClassInst.heap32[(r12 + 11)] = heapClassInst.heap32[(r10 + 290)]
                                            heapClassInst.heap32[(r12 + 12)] = heapClassInst.heap32[(r10 + 291)]
                                            heapClassInst.heap32[(r12 + 13)] = heapClassInst.heap32[(r10 + 292)]
                                            heapClassInst.heap32[(r12 + 14)] = heapClassInst.heap32[(r10 + 293)]
                                            r9 = sp + (-600)
                                            f0 = -f0
                                            heapClassInst.heap32[(r12 + 15)] = heapClassInst.heap32[(r10 + 294)]
                                            r13 = r9 >> 2
                                            f1 = -f1
                                            heapClassInst.heapFloat[(fp + (-150))] = Float32(f0)
                                            f0 = -f2
                                            heapClassInst.heapFloat[(r13 + 1)] = Float32(f1)
                                            heapClassInst.heapFloat[(r13 + 2)] = Float32(f0)
                                            heapClassInst.heap32[(r13 + 3)] = 0
                                            f0 = Float64(heapClassInst.heapFloat[(r10 + 214)])
                                            f1 = Float64(heapClassInst.heapFloat[(r10 + 215)])
                                            if (f0 <= f1) {
                                                if (!(f0 >= f1)) {
                                                    r13 = Int64(heapClassInst.heap32[(r1)])
                                                    r13 = r13 >> 2
                                                    r13 = Int64(heapClassInst.heap32[(r13 + 4)])
                                                    heapClassInst.heap32[(g0)] = Int32(r0)
                                                    __FUNCTION_TABLE__[(r13) >> 2](i7);
                                                    r14 = commonVariable.r_g0 >> 2
                                                    r14 = Int64(heapClassInst.heap32[(r14)])
                                                    r14 = r14 >> 2
                                                    r14 = Int64(heapClassInst.heap32[(r14 + 15)])
                                                    r15 = sp + (-72)
                                                    r16 = r15 >> 2
                                                    heapClassInst.heap32[(fp + (-18))] = 0
                                                    heapClassInst.heap32[(r16 + 1)] = 0
                                                    heapClassInst.heap32[(r16 + 2)] = 0
                                                    heapClassInst.heap32[(r16 + 3)] = 0
                                                    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                                    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                                    heapClassInst.heap32[(g0 + 2)] = Int32(r9)
                                                    heapClassInst.heap32[(g0 + 3)] = Int32(r8)
                                                    f2 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                                    heapClassInst.heapFloat[(g0 + 4)] = Float32(f2)
                                                    heapClassInst.heapFloat[(g0 + 5)] = Float32(f2)
                                                    heapClassInst.heapFloat[(g0 + 6)] = Float32(f0)
                                                    heapClassInst.heapFloat[(g0 + 7)] = Float32(f1)
                                                    heapClassInst.heap32[(g0 + 8)] = Int32(r15)
                                                    heapClassInst.heap32[(g0 + 9)] = 1
                                                    heapClassInst.heap32[(g0 + 10)] = 1092616192
                                                    __FUNCTION_TABLE__[(r14) >> 2](i7);
                                                }
                                            } else {
                                                r13 = Int64(heapClassInst.heap32[(r1)])
                                                r13 = r13 >> 2
                                                r13 = Int64(heapClassInst.heap32[(r13 + 4)])
                                                heapClassInst.heap32[(g0)] = Int32(r0)
                                                __FUNCTION_TABLE__[(r13) >> 2](i7);
                                                r14 = commonVariable.r_g0 >> 2
                                                r14 = Int64(heapClassInst.heap32[(r14)])
                                                r14 = r14 >> 2
                                                r14 = Int64(heapClassInst.heap32[(r14 + 15)])
                                                r15 = sp + (-88)
                                                r16 = r15 >> 2
                                                heapClassInst.heap32[(fp + (-22))] = 0
                                                heapClassInst.heap32[(r16 + 1)] = 0
                                                heapClassInst.heap32[(r16 + 2)] = 0
                                                heapClassInst.heap32[(r16 + 3)] = 0
                                                heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                                heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                                heapClassInst.heap32[(g0 + 2)] = Int32(r9)
                                                heapClassInst.heap32[(g0 + 3)] = Int32(r8)
                                                f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                                heapClassInst.heapFloat[(g0 + 4)] = Float32(f0)
                                                heapClassInst.heapFloat[(g0 + 5)] = Float32(f0)
                                                heapClassInst.heap32[(g0 + 6)] = (-1068953637)
                                                heapClassInst.heap32[(g0 + 7)] = 1078530011
                                                heapClassInst.heap32[(g0 + 8)] = Int32(r15)
                                                heapClassInst.heap32[(g0 + 9)] = 0
                                                heapClassInst.heap32[(g0 + 10)] = 1092616192
                                                __FUNCTION_TABLE__[(r14) >> 2](i7);
                                            }
                                            heapClassInst.heap32[(fp + (-134))] = heapClassInst.heap32[(r10 + 263)]
                                            heapClassInst.heap32[(r12 + 1)] = heapClassInst.heap32[(r10 + 264)]
                                            heapClassInst.heap32[(r12 + 2)] = heapClassInst.heap32[(r10 + 265)]
                                            heapClassInst.heap32[(r12 + 3)] = heapClassInst.heap32[(r10 + 266)]
                                            heapClassInst.heap32[(r12 + 4)] = heapClassInst.heap32[(r10 + 267)]
                                            heapClassInst.heap32[(r12 + 5)] = heapClassInst.heap32[(r10 + 268)]
                                            heapClassInst.heap32[(r12 + 6)] = heapClassInst.heap32[(r10 + 269)]
                                            heapClassInst.heap32[(r12 + 7)] = heapClassInst.heap32[(r10 + 270)]
                                            heapClassInst.heap32[(r12 + 8)] = heapClassInst.heap32[(r10 + 271)]
                                            heapClassInst.heap32[(r12 + 9)] = heapClassInst.heap32[(r10 + 272)]
                                            heapClassInst.heap32[(r12 + 10)] = heapClassInst.heap32[(r10 + 273)]
                                            heapClassInst.heap32[(r12 + 11)] = heapClassInst.heap32[(r10 + 274)]
                                            heapClassInst.heap32[(r12 + 12)] = heapClassInst.heap32[(r10 + 275)]
                                            heapClassInst.heap32[(r12 + 13)] = heapClassInst.heap32[(r10 + 276)]
                                            heapClassInst.heap32[(r12 + 14)] = heapClassInst.heap32[(r10 + 277)]
                                            r2 = sp + (-616)
                                            heapClassInst.heap32[(r12 + 15)] = heapClassInst.heap32[(r10 + 278)]
                                            r8 = r2 >> 2
                                            heapClassInst.heap32[(fp + (-154))] = heapClassInst.heap32[(r10 + 167)]
                                            heapClassInst.heap32[(r8 + 1)] = heapClassInst.heap32[(r10 + 168)]
                                            heapClassInst.heap32[(r8 + 2)] = heapClassInst.heap32[(r10 + 169)]
                                            r9 = sp + (-632)
                                            heapClassInst.heap32[(r8 + 3)] = heapClassInst.heap32[(r10 + 170)]
                                            r8 = r9 >> 2
                                            heapClassInst.heap32[(fp + (-158))] = heapClassInst.heap32[(r10 + 171)]
                                            heapClassInst.heap32[(r8 + 1)] = heapClassInst.heap32[(r10 + 172)]
                                            heapClassInst.heap32[(r8 + 2)] = heapClassInst.heap32[(r10 + 173)]
                                            heapClassInst.heap32[(r8 + 3)] = heapClassInst.heap32[(r10 + 174)]
                                            r8 = Int64(heapClassInst.heap32[(r1)])
                                            r8 = r8 >> 2
                                            r8 = Int64(heapClassInst.heap32[(r8 + 4)])
                                            heapClassInst.heap32[(g0)] = Int32(r0)
                                            __FUNCTION_TABLE__[(r8) >> 2](i7);
                                            r10 = commonVariable.r_g0 >> 2
                                            r10 = Int64(heapClassInst.heap32[(r10)])
                                            r10 = r10 >> 2
                                            r10 = Int64(heapClassInst.heap32[(r10 + 18)])
                                            r12 = sp + (-56)
                                            r13 = r12 >> 2
                                            heapClassInst.heap32[(fp + (-14))] = 0
                                            heapClassInst.heap32[(r13 + 1)] = 0
                                            heapClassInst.heap32[(r13 + 2)] = 0
                                            heapClassInst.heap32[(r13 + 3)] = 0
                                            heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                            heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                            heapClassInst.heap32[(g0 + 2)] = Int32(r9)
                                            heapClassInst.heap32[(g0 + 3)] = Int32(r11)
                                            heapClassInst.heap32[(g0 + 4)] = Int32(r12)
                                            __FUNCTION_TABLE__[(r10) >> 2](i7);
                                        }
                                    } else {
                                        if (r11 == 7) {
                                            r11 = sp + (-696)
                                            r12 = r11 >> 2
                                            heapClassInst.heap32[(fp + (-174))] = heapClassInst.heap32[(r10 + 203)]
                                            heapClassInst.heap32[(r12 + 1)] = heapClassInst.heap32[(r10 + 204)]
                                            heapClassInst.heap32[(r12 + 2)] = heapClassInst.heap32[(r10 + 205)]
                                            heapClassInst.heap32[(r12 + 3)] = heapClassInst.heap32[(r10 + 206)]
                                            heapClassInst.heap32[(r12 + 4)] = heapClassInst.heap32[(r10 + 207)]
                                            heapClassInst.heap32[(r12 + 5)] = heapClassInst.heap32[(r10 + 208)]
                                            heapClassInst.heap32[(r12 + 6)] = heapClassInst.heap32[(r10 + 209)]
                                            heapClassInst.heap32[(r12 + 7)] = heapClassInst.heap32[(r10 + 210)]
                                            heapClassInst.heap32[(r12 + 8)] = heapClassInst.heap32[(r10 + 211)]
                                            heapClassInst.heap32[(r12 + 9)] = heapClassInst.heap32[(r10 + 212)]
                                            heapClassInst.heap32[(r12 + 10)] = heapClassInst.heap32[(r10 + 213)]
                                            heapClassInst.heap32[(r12 + 11)] = heapClassInst.heap32[(r10 + 214)]
                                            heapClassInst.heap32[(r12 + 12)] = heapClassInst.heap32[(r10 + 215)]
                                            heapClassInst.heap32[(r12 + 13)] = heapClassInst.heap32[(r10 + 216)]
                                            heapClassInst.heap32[(r12 + 14)] = heapClassInst.heap32[(r10 + 217)]
                                            heapClassInst.heap32[(r12 + 15)] = heapClassInst.heap32[(r10 + 218)]
                                            if (!(r8 == 0)) {
                                                r13 = Int64(heapClassInst.heap32[(r1)])
                                                r13 = r13 >> 2
                                                r13 = Int64(heapClassInst.heap32[(r13 + 4)])
                                                heapClassInst.heap32[(g0)] = Int32(r0)
                                                __FUNCTION_TABLE__[(r13) >> 2](i7);
                                                r14 = commonVariable.r_g0 >> 2
                                                r14 = Int64(heapClassInst.heap32[(r14)])
                                                r14 = r14 >> 2
                                                r14 = Int64(heapClassInst.heap32[(r14 + 14)])
                                                heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                                f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                                heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                                __FUNCTION_TABLE__[(r14) >> 2](i7);
                                            }
                                            heapClassInst.heap32[(fp + (-174))] = heapClassInst.heap32[(r10 + 219)]
                                            heapClassInst.heap32[(r12 + 1)] = heapClassInst.heap32[(r10 + 220)]
                                            heapClassInst.heap32[(r12 + 2)] = heapClassInst.heap32[(r10 + 221)]
                                            heapClassInst.heap32[(r12 + 3)] = heapClassInst.heap32[(r10 + 222)]
                                            heapClassInst.heap32[(r12 + 4)] = heapClassInst.heap32[(r10 + 223)]
                                            heapClassInst.heap32[(r12 + 5)] = heapClassInst.heap32[(r10 + 224)]
                                            heapClassInst.heap32[(r12 + 6)] = heapClassInst.heap32[(r10 + 225)]
                                            heapClassInst.heap32[(r12 + 7)] = heapClassInst.heap32[(r10 + 226)]
                                            heapClassInst.heap32[(r12 + 8)] = heapClassInst.heap32[(r10 + 227)]
                                            heapClassInst.heap32[(r12 + 9)] = heapClassInst.heap32[(r10 + 228)]
                                            heapClassInst.heap32[(r12 + 10)] = heapClassInst.heap32[(r10 + 229)]
                                            heapClassInst.heap32[(r12 + 11)] = heapClassInst.heap32[(r10 + 230)]
                                            heapClassInst.heap32[(r12 + 12)] = heapClassInst.heap32[(r10 + 231)]
                                            heapClassInst.heap32[(r12 + 13)] = heapClassInst.heap32[(r10 + 232)]
                                            heapClassInst.heap32[(r12 + 14)] = heapClassInst.heap32[(r10 + 233)]
                                            heapClassInst.heap32[(r12 + 15)] = heapClassInst.heap32[(r10 + 234)]
                                            if (!(r8 == 0)) {
                                                r8 = Int64(heapClassInst.heap32[(r1)])
                                                r8 = r8 >> 2
                                                r8 = Int64(heapClassInst.heap32[(r8 + 4)])
                                                heapClassInst.heap32[(g0)] = Int32(r0)
                                                __FUNCTION_TABLE__[(r8) >> 2](i7);
                                                r12 = commonVariable.r_g0 >> 2
                                                r12 = Int64(heapClassInst.heap32[(r12)])
                                                r12 = r12 >> 2
                                                r12 = Int64(heapClassInst.heap32[(r12 + 14)])
                                                heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                                heapClassInst.heap32[(g0 + 1)] = Int32(r11)
                                                f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                                heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                                __FUNCTION_TABLE__[(r12) >> 2](i7);
                                            }
                                            if (r9 == 0) {
                                                break
                                            } else {
                                                r8 = (r2 + 924) | 0
                                                r9 = Int64(heapClassInst.heapU8[r2 + 168])
                                                if (r9 == 0) {
                                                    r2 = (r2 + 876) | 0
                                                } else {
                                                    r2 = (r2 + 812) | 0
                                                }
                                                r2 = r2 >> 2
                                                f0 = Float64(heapClassInst.heapFloat[(r2 + 1)])
                                                f1 = Float64(heapClassInst.heapFloat[(r10 + 43)])
                                                f2 = Float64(heapClassInst.heapFloat[(r2)])
                                                f3 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                                                f4 = Float64(heapClassInst.heapFloat[(r2 + 5)])
                                                f5 = Float64(heapClassInst.heapFloat[(r2 + 4)])
                                                f6 = f2 * f1
                                                f7 = Float64(heapClassInst.heapFloat[(fp + (-192))])
                                                f8 = f0 * f7
                                                f9 = Float64(heapClassInst.heapFloat[(r2 + 6)])
                                                f10 = Float64(heapClassInst.heapFloat[(r2 + 9)])
                                                f11 = Float64(heapClassInst.heapFloat[(r2 + 8)])
                                                f12 = f5 * f1
                                                f13 = f4 * f7
                                                f6 = f6 + f8
                                                f3 = f3 * f7
                                                f14 = Float64(heapClassInst.heapFloat[(r2 + 10)])
                                                f1 = f11 * f1
                                                f15 = f10 * f7
                                                f12 = f12 + f13
                                                f9 = f9 * f7
                                                f6 = f6 + f3
                                                f16 = Float64(heapClassInst.heapFloat[(r2 + 12)])
                                                f17 = Float64(heapClassInst.heapFloat[(r2 + 13)])
                                                f18 = Float64(heapClassInst.heapFloat[(r2 + 14)])
                                                r2 = sp + (-712)
                                                f12 = f12 + f9
                                                f1 = f1 + f15
                                                f7 = f14 * f7
                                                f6 = f6 + f16
                                                f1 = f1 + f7
                                                r9 = r2 >> 2
                                                f12 = f12 + f17
                                                heapClassInst.heapFloat[(fp + (-178))] = Float32(f6)
                                                f1 = f1 + f18
                                                heapClassInst.heapFloat[(r9 + 1)] = Float32(f12)
                                                heapClassInst.heapFloat[(r9 + 2)] = Float32(f1)
                                                heapClassInst.heap32[(r9 + 3)] = 0
                                                f1 = Float64(heapClassInst.heapFloat[(r10 + 44)])
                                                f6 = f2 * f1
                                                f12 = f5 * f1
                                                f6 = f6 + f8
                                                f1 = f11 * f1
                                                f8 = f12 + f13
                                                f3 = f6 + f3
                                                r9 = sp + (-728)
                                                f1 = f1 + f15
                                                f6 = f8 + f9
                                                f3 = f3 + f16
                                                f1 = f1 + f7
                                                r11 = r9 >> 2
                                                f6 = f6 + f17
                                                heapClassInst.heapFloat[(fp + (-182))] = Float32(f3)
                                                f1 = f1 + f18
                                                heapClassInst.heapFloat[(r11 + 1)] = Float32(f6)
                                                heapClassInst.heapFloat[(r11 + 2)] = Float32(f1)
                                                heapClassInst.heap32[(r11 + 3)] = 0
                                                r11 = Int64(heapClassInst.heap32[(r1)])
                                                r11 = r11 >> 2
                                                r11 = Int64(heapClassInst.heap32[(r11 + 4)])
                                                heapClassInst.heap32[(g0)] = Int32(r0)
                                                __FUNCTION_TABLE__[(r11) >> 2](i7);
                                                r12 = commonVariable.r_g0 >> 2
                                                r12 = Int64(heapClassInst.heap32[(r12)])
                                                r12 = r12 >> 2
                                                r12 = Int64(heapClassInst.heap32[(r12 + 2)])
                                                r13 = sp + (-40)
                                                r14 = r13 >> 2
                                                heapClassInst.heap32[(fp + (-10))] = 0
                                                heapClassInst.heap32[(r14 + 1)] = 0
                                                heapClassInst.heap32[(r14 + 2)] = 0
                                                heapClassInst.heap32[(r14 + 3)] = 0
                                                heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                                heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                                heapClassInst.heap32[(g0 + 2)] = Int32(r9)
                                                heapClassInst.heap32[(g0 + 3)] = Int32(r13)
                                                __FUNCTION_TABLE__[(r12) >> 2](i7);
                                                r2 = sp + (-744)
                                                r9 = r2 >> 2
                                                heapClassInst.heapFloat[(fp + (-186))] = Float32(f2)
                                                heapClassInst.heapFloat[(r9 + 1)] = Float32(f5)
                                                heapClassInst.heapFloat[(r9 + 2)] = Float32(f11)
                                                r11 = sp + (-760)
                                                heapClassInst.heap32[(r9 + 3)] = 0
                                                r9 = r11 >> 2
                                                heapClassInst.heapFloat[(fp + (-190))] = Float32(f0)
                                                heapClassInst.heapFloat[(r9 + 1)] = Float32(f4)
                                                heapClassInst.heapFloat[(r9 + 2)] = Float32(f10)
                                                heapClassInst.heap32[(r9 + 3)] = 0
                                                r9 = Int64(heapClassInst.heap32[(r1)])
                                                r9 = r9 >> 2
                                                r9 = Int64(heapClassInst.heap32[(r9 + 4)])
                                                f0 = Float64(heapClassInst.heapFloat[(r10 + 45)])
                                                f1 = Float64(heapClassInst.heapFloat[(r10 + 46)])
                                                heapClassInst.heap32[(g0)] = Int32(r0)
                                                __FUNCTION_TABLE__[(r9) >> 2](i7);
                                                r10 = commonVariable.r_g0 >> 2
                                                r10 = Int64(heapClassInst.heap32[(r10)])
                                                r10 = r10 >> 2
                                                r10 = Int64(heapClassInst.heap32[(r10 + 15)])
                                                r12 = sp + (-24)
                                                r13 = r12 >> 2
                                                heapClassInst.heap32[(fp + (-6))] = 0
                                                heapClassInst.heap32[(r13 + 1)] = 0
                                                heapClassInst.heap32[(r13 + 2)] = 0
                                                heapClassInst.heap32[(r13 + 3)] = 0
                                                heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                                heapClassInst.heap32[(g0 + 1)] = Int32(r8)
                                                heapClassInst.heap32[(g0 + 2)] = Int32(r2)
                                                heapClassInst.heap32[(g0 + 3)] = Int32(r11)
                                                f2 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                                heapClassInst.heapFloat[(g0 + 4)] = Float32(f2)
                                                heapClassInst.heapFloat[(g0 + 5)] = Float32(f2)
                                                heapClassInst.heapFloat[(g0 + 6)] = Float32(f0)
                                                heapClassInst.heapFloat[(g0 + 7)] = Float32(f1)
                                                heapClassInst.heap32[(g0 + 8)] = Int32(r12)
                                                heapClassInst.heap32[(g0 + 9)] = 1
                                                heapClassInst.heap32[(g0 + 10)] = 1092616192
                                                __FUNCTION_TABLE__[(r10) >> 2](i7);
                                            }
                                        } else {
                                            break
                                        }
                                    }
                                }
                            } else {
                                if (r11 == 3) {
                                    r2 = sp + (-232)
                                    r9 = r2 >> 2
                                    heapClassInst.heap32[(fp + (-58))] = 1065353216
                                    heapClassInst.heap32[(r9 + 1)] = 0
                                    heapClassInst.heap32[(r9 + 2)] = 0
                                    heapClassInst.heap32[(r9 + 3)] = 0
                                    heapClassInst.heap32[(r9 + 4)] = 0
                                    heapClassInst.heap32[(r9 + 5)] = 1065353216
                                    heapClassInst.heap32[(r9 + 6)] = 0
                                    heapClassInst.heap32[(r9 + 7)] = 0
                                    heapClassInst.heap32[(r9 + 8)] = 0
                                    heapClassInst.heap32[(r9 + 9)] = 0
                                    heapClassInst.heap32[(r9 + 10)] = 1065353216
                                    heapClassInst.heap32[(r9 + 11)] = 0
                                    heapClassInst.heap32[(r9 + 12)] = 0
                                    heapClassInst.heap32[(r9 + 13)] = 0
                                    heapClassInst.heap32[(r9 + 14)] = 0
                                    heapClassInst.heap32[(r9 + 15)] = 0
                                    r11 = Int64(heapClassInst.heap32[(r10 + 5)])
                                    r11 = r11 >> 2
                                    f0 = Float64(heapClassInst.heapFloat[(r10 + 72)])
                                    f1 = Float64(heapClassInst.heapFloat[(r11 + 1)])
                                    f2 = Float64(heapClassInst.heapFloat[(r10 + 73)])
                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 2)])
                                    f4 = Float64(heapClassInst.heapFloat[(r11 + 5)])
                                    f5 = Float64(heapClassInst.heapFloat[(r11 + 6)])
                                    f1 = f1 * f0
                                    f3 = f3 * f2
                                    f6 = Float64(heapClassInst.heapFloat[(r10 + 74)])
                                    f7 = Float64(heapClassInst.heapFloat[(r11 + 3)])
                                    f8 = Float64(heapClassInst.heapFloat[(r11 + 9)])
                                    f9 = Float64(heapClassInst.heapFloat[(r11 + 10)])
                                    f10 = Float64(heapClassInst.heapFloat[(r11 + 7)])
                                    f4 = f4 * f0
                                    f5 = f5 * f2
                                    f1 = f1 + f3
                                    f3 = f7 * f6
                                    f7 = Float64(heapClassInst.heapFloat[(r11 + 11)])
                                    f0 = f8 * f0
                                    f2 = f9 * f2
                                    f4 = f4 + f5
                                    f5 = f10 * f6
                                    f1 = f1 + f3
                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 13)])
                                    f8 = Float64(heapClassInst.heapFloat[(r11 + 15)])
                                    f9 = Float64(heapClassInst.heapFloat[(r11 + 14)])
                                    f4 = f4 + f5
                                    f0 = f0 + f2
                                    f2 = f7 * f6
                                    f1 = f1 + f3
                                    f0 = f0 + f2
                                    f2 = f4 + f9
                                    heapClassInst.heapFloat[(r9 + 12)] = Float32(f1)
                                    f0 = f0 + f8
                                    heapClassInst.heapFloat[(r9 + 13)] = Float32(f2)
                                    heapClassInst.heapFloat[(r9 + 14)] = Float32(f0)
                                    heapClassInst.heap32[(r9 + 15)] = 0
                                    r11 = Int64(heapClassInst.heap32[(r1)])
                                    r11 = r11 >> 2
                                    r11 = Int64(heapClassInst.heap32[(r11 + 4)])
                                    heapClassInst.heap32[(g0)] = Int32(r0)
                                    __FUNCTION_TABLE__[(r11) >> 2](i7);
                                    r12 = commonVariable.r_g0 >> 2
                                    r12 = Int64(heapClassInst.heap32[(r12)])
                                    r12 = r12 >> 2
                                    r12 = Int64(heapClassInst.heap32[(r12 + 14)])
                                    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                    heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                    f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                    heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                    __FUNCTION_TABLE__[(r12) >> 2](i7);
                                    r11 = Int64(heapClassInst.heap32[(r10 + 6)])
                                    r11 = r11 >> 2
                                    f0 = Float64(heapClassInst.heapFloat[(r10 + 76)])
                                    f1 = Float64(heapClassInst.heapFloat[(r11 + 1)])
                                    f2 = Float64(heapClassInst.heapFloat[(r10 + 77)])
                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 2)])
                                    f4 = Float64(heapClassInst.heapFloat[(r11 + 5)])
                                    f5 = Float64(heapClassInst.heapFloat[(r11 + 6)])
                                    f1 = f1 * f0
                                    f3 = f3 * f2
                                    f6 = Float64(heapClassInst.heapFloat[(r10 + 78)])
                                    f7 = Float64(heapClassInst.heapFloat[(r11 + 3)])
                                    f8 = Float64(heapClassInst.heapFloat[(r11 + 9)])
                                    f9 = Float64(heapClassInst.heapFloat[(r11 + 10)])
                                    f10 = Float64(heapClassInst.heapFloat[(r11 + 7)])
                                    f4 = f4 * f0
                                    f5 = f5 * f2
                                    f1 = f1 + f3
                                    f3 = f7 * f6
                                    f7 = Float64(heapClassInst.heapFloat[(r11 + 11)])
                                    f0 = f8 * f0
                                    f2 = f9 * f2
                                    f4 = f4 + f5
                                    f5 = f10 * f6
                                    f1 = f1 + f3
                                    f3 = Float64(heapClassInst.heapFloat[(r11 + 13)])
                                    f8 = Float64(heapClassInst.heapFloat[(r11 + 15)])
                                    f9 = Float64(heapClassInst.heapFloat[(r11 + 14)])
                                    f4 = f4 + f5
                                    f0 = f0 + f2
                                    f2 = f7 * f6
                                    f1 = f1 + f3
                                    f0 = f0 + f2
                                    f2 = f4 + f9
                                    heapClassInst.heapFloat[(r9 + 12)] = Float32(f1)
                                    f0 = f0 + f8
                                    heapClassInst.heapFloat[(r9 + 13)] = Float32(f2)
                                    heapClassInst.heapFloat[(r9 + 14)] = Float32(f0)
                                    heapClassInst.heap32[(r9 + 15)] = 0
                                    if (!(r8 == 0)) {
                                        r8 = Int64(heapClassInst.heap32[(r1)])
                                        r8 = r8 >> 2
                                        r8 = Int64(heapClassInst.heap32[(r8 + 4)])
                                        heapClassInst.heap32[(g0)] = Int32(r0)
                                        __FUNCTION_TABLE__[(r8) >> 2](i7);
                                        r9 = commonVariable.r_g0 >> 2
                                        r9 = Int64(heapClassInst.heap32[(r9)])
                                        r9 = r9 >> 2
                                        r9 = Int64(heapClassInst.heap32[(r9 + 14)])
                                        heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                        heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                        f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                        heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                        __FUNCTION_TABLE__[(r9) >> 2](i7);
                                    }
                                } else {
                                    if (r11 == 4) {
                                        r2 = Int64(heapClassInst.heap32[(r10 + 5)])
                                        r2 = r2 >> 2
                                        f0 = Float64(heapClassInst.heapFloat[(r2 + 1)])
                                        f1 = Float64(heapClassInst.heapFloat[(r10 + 135)])
                                        f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                                        f3 = Float64(heapClassInst.heapFloat[(r10 + 139)])
                                        f4 = Float64(heapClassInst.heapFloat[(r10 + 136)])
                                        f5 = Float64(heapClassInst.heapFloat[(r10 + 140)])
                                        f6 = f1 * f0
                                        f7 = f3 * f2
                                        f8 = Float64(heapClassInst.heapFloat[(r2 + 3)])
                                        f9 = Float64(heapClassInst.heapFloat[(r10 + 143)])
                                        f10 = Float64(heapClassInst.heapFloat[(r2 + 9)])
                                        f11 = Float64(heapClassInst.heapFloat[(r10 + 147)])
                                        f12 = Float64(heapClassInst.heapFloat[(r2 + 5)])
                                        f13 = Float64(heapClassInst.heapFloat[(r10 + 137)])
                                        f14 = Float64(heapClassInst.heapFloat[(r2 + 10)])
                                        f15 = Float64(heapClassInst.heapFloat[(r10 + 148)])
                                        f16 = Float64(heapClassInst.heapFloat[(r2 + 6)])
                                        f17 = Float64(heapClassInst.heapFloat[(r10 + 141)])
                                        f18 = Float64(heapClassInst.heapFloat[(r2 + 11)])
                                        f19 = Float64(heapClassInst.heapFloat[(r10 + 149)])
                                        f20 = Float64(heapClassInst.heapFloat[(r2 + 7)])
                                        f21 = Float64(heapClassInst.heapFloat[(r10 + 145)])
                                        f22 = Float64(heapClassInst.heapFloat[(r10 + 144)])
                                        f23 = f4 * f0
                                        f24 = f5 * f2
                                        f6 = f6 + f7
                                        f7 = f9 * f8
                                        f25 = Float64(heapClassInst.heapFloat[(r2 + 15)])
                                        f26 = Float64(heapClassInst.heapFloat[(r2 + 14)])
                                        f27 = Float64(heapClassInst.heapFloat[(r2 + 13)])
                                        f28 = f13 * f0
                                        f29 = f17 * f2
                                        f23 = f23 + f24
                                        f24 = f22 * f8
                                        f6 = f6 + f7
                                        r2 = r3 >> 2
                                        f7 = f28 + f29
                                        f28 = f21 * f8
                                        f23 = f23 + f24
                                        heapClassInst.heapFloat[(fp + (-74))] = Float32(f6)
                                        f6 = f1 * f12
                                        f24 = f3 * f16
                                        f7 = f7 + f28
                                        heapClassInst.heapFloat[(r2 + 1)] = Float32(f23)
                                        heapClassInst.heapFloat[(r2 + 2)] = Float32(f7)
                                        f7 = f4 * f12
                                        f23 = f5 * f16
                                        f6 = f6 + f24
                                        f24 = f9 * f20
                                        f28 = f13 * f12
                                        f29 = f17 * f16
                                        f7 = f7 + f23
                                        f23 = f22 * f20
                                        f6 = f6 + f24
                                        heapClassInst.heap32[(r2 + 3)] = 0
                                        f24 = f28 + f29
                                        f28 = f21 * f20
                                        f7 = f7 + f23
                                        heapClassInst.heapFloat[(r2 + 4)] = Float32(f6)
                                        f1 = f1 * f10
                                        f3 = f3 * f14
                                        f6 = f24 + f28
                                        heapClassInst.heapFloat[(r2 + 5)] = Float32(f7)
                                        heapClassInst.heapFloat[(r2 + 6)] = Float32(f6)
                                        f4 = f4 * f10
                                        f5 = f5 * f14
                                        f1 = f1 + f3
                                        f3 = f9 * f18
                                        f6 = f13 * f10
                                        f7 = f17 * f14
                                        f4 = f4 + f5
                                        f5 = f22 * f18
                                        f1 = f1 + f3
                                        heapClassInst.heap32[(r2 + 7)] = 0
                                        f0 = f0 * f11
                                        f2 = f2 * f15
                                        f3 = f6 + f7
                                        f6 = f21 * f18
                                        f4 = f4 + f5
                                        heapClassInst.heapFloat[(r2 + 8)] = Float32(f1)
                                        f1 = f12 * f11
                                        f5 = f16 * f15
                                        f0 = f0 + f2
                                        f2 = f8 * f19
                                        f3 = f3 + f6
                                        heapClassInst.heapFloat[(r2 + 9)] = Float32(f4)
                                        f0 = f0 + f2
                                        heapClassInst.heapFloat[(r2 + 10)] = Float32(f3)
                                        f2 = f10 * f11
                                        f3 = f14 * f15
                                        f1 = f1 + f5
                                        f4 = f20 * f19
                                        f1 = f1 + f4
                                        f2 = f2 + f3
                                        f3 = f18 * f19
                                        f0 = f0 + f27
                                        heapClassInst.heap32[(r2 + 11)] = 0
                                        f2 = f2 + f3
                                        f1 = f1 + f26
                                        heapClassInst.heapFloat[(r2 + 12)] = Float32(f0)
                                        f0 = f2 + f25
                                        heapClassInst.heapFloat[(r2 + 13)] = Float32(f1)
                                        heapClassInst.heapFloat[(r2 + 14)] = Float32(f0)
                                        heapClassInst.heap32[(r2 + 15)] = 0
                                        if (!(r8 == 0)) {
                                            r11 = Int64(heapClassInst.heap32[(r1)])
                                            r11 = r11 >> 2
                                            r11 = Int64(heapClassInst.heap32[(r11 + 4)])
                                            heapClassInst.heap32[(g0)] = Int32(r0)
                                            __FUNCTION_TABLE__[(r11) >> 2](i7);
                                            r12 = commonVariable.r_g0 >> 2
                                            r12 = Int64(heapClassInst.heap32[(r12)])
                                            r12 = r12 >> 2
                                            r12 = Int64(heapClassInst.heap32[(r12 + 14)])
                                            heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                            heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                                            f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                            heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                            __FUNCTION_TABLE__[(r12) >> 2](i7);
                                        }
                                        r11 = Int64(heapClassInst.heap32[(r10 + 6)])
                                        r11 = r11 >> 2
                                        f0 = Float64(heapClassInst.heapFloat[(r11 + 1)])
                                        f1 = Float64(heapClassInst.heapFloat[(r10 + 151)])
                                        f2 = Float64(heapClassInst.heapFloat[(r11 + 2)])
                                        f3 = Float64(heapClassInst.heapFloat[(r10 + 155)])
                                        f4 = Float64(heapClassInst.heapFloat[(r10 + 152)])
                                        f5 = Float64(heapClassInst.heapFloat[(r10 + 156)])
                                        f6 = f1 * f0
                                        f7 = f3 * f2
                                        f8 = Float64(heapClassInst.heapFloat[(r11 + 3)])
                                        f9 = Float64(heapClassInst.heapFloat[(r10 + 159)])
                                        f10 = Float64(heapClassInst.heapFloat[(r11 + 9)])
                                        f11 = Float64(heapClassInst.heapFloat[(r10 + 163)])
                                        f12 = Float64(heapClassInst.heapFloat[(r11 + 5)])
                                        f13 = Float64(heapClassInst.heapFloat[(r10 + 153)])
                                        f14 = Float64(heapClassInst.heapFloat[(r11 + 10)])
                                        f15 = Float64(heapClassInst.heapFloat[(r10 + 164)])
                                        f16 = Float64(heapClassInst.heapFloat[(r11 + 6)])
                                        f17 = Float64(heapClassInst.heapFloat[(r10 + 157)])
                                        f18 = Float64(heapClassInst.heapFloat[(r11 + 11)])
                                        f19 = Float64(heapClassInst.heapFloat[(r10 + 165)])
                                        f20 = Float64(heapClassInst.heapFloat[(r11 + 7)])
                                        f21 = Float64(heapClassInst.heapFloat[(r10 + 161)])
                                        f22 = Float64(heapClassInst.heapFloat[(r10 + 160)])
                                        f23 = f4 * f0
                                        f24 = f5 * f2
                                        f6 = f6 + f7
                                        f7 = f9 * f8
                                        f25 = Float64(heapClassInst.heapFloat[(r11 + 15)])
                                        f26 = Float64(heapClassInst.heapFloat[(r11 + 14)])
                                        f27 = Float64(heapClassInst.heapFloat[(r11 + 13)])
                                        f28 = f13 * f0
                                        f29 = f17 * f2
                                        f23 = f23 + f24
                                        f24 = f22 * f8
                                        f6 = f6 + f7
                                        f7 = f28 + f29
                                        f28 = f21 * f8
                                        f23 = f23 + f24
                                        heapClassInst.heapFloat[(fp + (-74))] = Float32(f6)
                                        f6 = f1 * f12
                                        f24 = f3 * f16
                                        f7 = f7 + f28
                                        heapClassInst.heapFloat[(r2 + 1)] = Float32(f23)
                                        heapClassInst.heapFloat[(r2 + 2)] = Float32(f7)
                                        f7 = f4 * f12
                                        f23 = f5 * f16
                                        f6 = f6 + f24
                                        f24 = f9 * f20
                                        f28 = f13 * f12
                                        f29 = f17 * f16
                                        f7 = f7 + f23
                                        f23 = f22 * f20
                                        f6 = f6 + f24
                                        heapClassInst.heap32[(r2 + 3)] = 0
                                        f24 = f28 + f29
                                        f28 = f21 * f20
                                        f7 = f7 + f23
                                        heapClassInst.heapFloat[(r2 + 4)] = Float32(f6)
                                        f1 = f1 * f10
                                        f3 = f3 * f14
                                        f6 = f24 + f28
                                        heapClassInst.heapFloat[(r2 + 5)] = Float32(f7)
                                        heapClassInst.heapFloat[(r2 + 6)] = Float32(f6)
                                        f4 = f4 * f10
                                        f5 = f5 * f14
                                        f1 = f1 + f3
                                        f3 = f9 * f18
                                        f6 = f13 * f10
                                        f7 = f17 * f14
                                        f4 = f4 + f5
                                        f5 = f22 * f18
                                        f1 = f1 + f3
                                        heapClassInst.heap32[(r2 + 7)] = 0
                                        f0 = f0 * f11
                                        f2 = f2 * f15
                                        f3 = f6 + f7
                                        f6 = f21 * f18
                                        f4 = f4 + f5
                                        heapClassInst.heapFloat[(r2 + 8)] = Float32(f1)
                                        f1 = f12 * f11
                                        f5 = f16 * f15
                                        f0 = f0 + f2
                                        f2 = f8 * f19
                                        f3 = f3 + f6
                                        heapClassInst.heapFloat[(r2 + 9)] = Float32(f4)
                                        f0 = f0 + f2
                                        heapClassInst.heapFloat[(r2 + 10)] = Float32(f3)
                                        f2 = f10 * f11
                                        f3 = f14 * f15
                                        f1 = f1 + f5
                                        f4 = f20 * f19
                                        f1 = f1 + f4
                                        f2 = f2 + f3
                                        f3 = f18 * f19
                                        f0 = f0 + f27
                                        heapClassInst.heap32[(r2 + 11)] = 0
                                        f2 = f2 + f3
                                        f1 = f1 + f26
                                        heapClassInst.heapFloat[(r2 + 12)] = Float32(f0)
                                        f0 = f2 + f25
                                        heapClassInst.heapFloat[(r2 + 13)] = Float32(f1)
                                        heapClassInst.heapFloat[(r2 + 14)] = Float32(f0)
                                        heapClassInst.heap32[(r2 + 15)] = 0
                                        if (!(r8 == 0)) {
                                            r8 = Int64(heapClassInst.heap32[(r1)])
                                            r8 = r8 >> 2
                                            r8 = Int64(heapClassInst.heap32[(r8 + 4)])
                                            heapClassInst.heap32[(g0)] = Int32(r0)
                                            __FUNCTION_TABLE__[(r8) >> 2](i7);
                                            r11 = commonVariable.r_g0 >> 2
                                            r11 = Int64(heapClassInst.heap32[(r11)])
                                            r11 = r11 >> 2
                                            r11 = Int64(heapClassInst.heap32[(r11 + 14)])
                                            heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                            heapClassInst.heap32[(g0 + 1)] = Int32(r3)
                                            f0 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                            heapClassInst.heapFloat[(g0 + 2)] = Float32(f0)
                                            __FUNCTION_TABLE__[(r11) >> 2](i7);
                                        }
                                        f0 = Float64(heapClassInst.heapFloat[(r10 + 172)])
                                        f1 = Float64(heapClassInst.heapFloat[(r10 + 173)])
                                        if (!(f0 == f1)) {
                                            if (!(r9 == 0)) {
                                                r8 = sp + (-312)
                                                r9 = r8 >> 2
                                                heapClassInst.heap32[(fp + (-78))] = heapClassInst.heap32[(r2 + 2)]
                                                heapClassInst.heap32[(r9 + 1)] = heapClassInst.heap32[(r2 + 6)]
                                                heapClassInst.heap32[(r9 + 2)] = heapClassInst.heap32[(r2 + 10)]
                                                r10 = sp + (-328)
                                                heapClassInst.heap32[(r9 + 3)] = 0
                                                r9 = r10 >> 2
                                                heapClassInst.heap32[(fp + (-82))] = heapClassInst.heap32[(fp + (-74))]
                                                heapClassInst.heap32[(r9 + 1)] = heapClassInst.heap32[(r2 + 4)]
                                                heapClassInst.heap32[(r9 + 2)] = heapClassInst.heap32[(r2 + 8)]
                                                heapClassInst.heap32[(r9 + 3)] = 0
                                                r2 = Int64(heapClassInst.heap32[(r1)])
                                                r2 = r2 >> 2
                                                r2 = Int64(heapClassInst.heap32[(r2 + 4)])
                                                heapClassInst.heap32[(g0)] = Int32(r0)
                                                __FUNCTION_TABLE__[(r2) >> 2](i7);
                                                r9 = commonVariable.r_g0 >> 2
                                                r9 = Int64(heapClassInst.heap32[(r9)])
                                                r9 = r9 >> 2
                                                r9 = Int64(heapClassInst.heap32[(r9 + 15)])
                                                r11 = sp + (-168)
                                                r12 = r11 >> 2
                                                heapClassInst.heap32[(fp + (-42))] = 0
                                                heapClassInst.heap32[(r12 + 1)] = 0
                                                heapClassInst.heap32[(r12 + 2)] = 0
                                                heapClassInst.heap32[(r12 + 3)] = 0
                                                f2 = 6.2831854820251465
                                                r12 = if (f0 <= f1) {
                                                    1
                                                } else {
                                                    0
                                                };
                                                f3 = Float64(heapClassInst.heapFloat[(fp + (-192))])
                                                f3 = if (f0 > f1) {
                                                    f3
                                                } else {
                                                    f0
                                                };
                                                f0 = if (f0 > f1) {
                                                    f2
                                                } else {
                                                    f1
                                                };
                                                r12 = r12 & 1
                                                heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                                                heapClassInst.heap32[(g0 + 1)] = Int32(r5)
                                                heapClassInst.heap32[(g0 + 2)] = Int32(r8)
                                                heapClassInst.heap32[(g0 + 3)] = Int32(r10)
                                                f1 = Float64(heapClassInst.heapFloat[(fp + (-191))])
                                                heapClassInst.heapFloat[(g0 + 4)] = Float32(f1)
                                                heapClassInst.heapFloat[(g0 + 5)] = Float32(f1)
                                                heapClassInst.heapFloat[(g0 + 6)] = Float32(f3)
                                                heapClassInst.heapFloat[(g0 + 7)] = Float32(f0)
                                                heapClassInst.heap32[(g0 + 8)] = Int32(r11)
                                                heapClassInst.heap32[(g0 + 9)] = Int32(r12)
                                                heapClassInst.heap32[(g0 + 10)] = 1092616192
                                                __FUNCTION_TABLE__[(r9) >> 2](i7);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } while (false);
                    r2 = (r7 + (-1)) | 0
                    if (r7 != 0) {
                        continue
                    } else {
                        break
                    }
                }
            }
        }
    }
    r2 = Int64(heapClassInst.heap32[(r1)])
    r2 = r2 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 4)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    r2 = commonVariable.r_g0
    do {
        if (!(r2 == 0)) {
            r2 = Int64(heapClassInst.heap32[(r1)])
            r2 = r2 >> 2
            r2 = Int64(heapClassInst.heap32[(r2 + 4)])
            heapClassInst.heap32[(g0)] = Int32(r0)
            __FUNCTION_TABLE__[(r2) >> 2](i7);
            r3 = commonVariable.r_g0 >> 2
            r3 = Int64(heapClassInst.heap32[(r3)])
            r3 = r3 >> 2
            r3 = Int64(heapClassInst.heap32[(r3 + 12)])
            heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
            __FUNCTION_TABLE__[(r3) >> 2](i7);
            r2 = commonVariable.r_g0 & 3
            if (!(r2 == 0)) {
                r2 = Int64(heapClassInst.heap32[(r1)])
                r2 = r2 >> 2
                r2 = Int64(heapClassInst.heap32[(r2 + 4)])
                heapClassInst.heap32[(g0)] = Int32(r0)
                __FUNCTION_TABLE__[(r2) >> 2](i7);
                r2 = commonVariable.r_g0
                if (!(r2 == 0)) {
                    r2 = Int64(heapClassInst.heap32[(r1)])
                    r2 = r2 >> 2
                    r2 = Int64(heapClassInst.heap32[(r2 + 4)])
                    heapClassInst.heap32[(g0)] = Int32(r0)
                    __FUNCTION_TABLE__[(r2) >> 2](i7);
                    r2 = commonVariable.r_g0 >> 2
                    r2 = Int64(heapClassInst.heap32[(r2)])
                    r2 = r2 >> 2
                    r2 = Int64(heapClassInst.heap32[(r2 + 12)])
                    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
                    __FUNCTION_TABLE__[(r2) >> 2](i7);
                    r0 = commonVariable.r_g0
                    if (!(r0 == 0)) {
                        r0 = Int64(heapClassInst.heap32[(r1 + 63)])
                        if (!(r0 < 1)) {
                            r0 = 0
                            while (true) {
                                r2 = Int64(heapClassInst.heap32[(r1 + 65)])
                                r3 = r0 << 2
                                r2 = (r2 + r3) | 0
                                r2 = r2 >> 2
                                r2 = Int64(heapClassInst.heap32[(r2)])
                                r3 = r2 >> 2
                                r3 = Int64(heapClassInst.heap32[(r3)])
                                r3 = r3 >> 2
                                r3 = Int64(heapClassInst.heap32[(r3 + 3)])
                                r4 = Int64(heapClassInst.heap32[(r1 + 21)])
                                heapClassInst.heap32[(g0)] = Int32(r2)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r4)
                                r0 = (r0 + 1) | 0
                                __FUNCTION_TABLE__[(r3) >> 2](i7);
                                r2 = Int64(heapClassInst.heap32[(r1 + 63)])
                                if (r2 > r0) {
                                    continue
                                } else {
                                    break
                                }
                            }
                        }
                    }
                }
            }
        }
    } while (false);
    r0 = _ZN15CProfileManager11CurrentNodeE
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    r2 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(r2 + 4)])
    r3 = (r3 + (-1)) | 0
    heapClassInst.heap32[(r2 + 4)] = Int32(r3)
    do {
        if (!(r3 != 0)) {
            r3 = Int64(heapClassInst.heap32[(r2 + 1)])
            if (r3 != 0) {
                r1 = sp + (-8)
                heapClassInst.heap32[(g0)] = Int32(r1)
                heapClassInst.heap32[(g0 + 1)] = 0
                r3 = _ZL13gProfileClock_2E_0
                gettimeofday(i7);
                r3 = r3 >> 2
                r3 = Int64(heapClassInst.heap32[(r3)])
                r3 = r3 >> 2
                r1 = r1 >> 2
                r4 = Int64(heapClassInst.heap32[(fp + (-2))])
                r5 = Int64(heapClassInst.heap32[(r3)])
                r4 = (r4 - r5) | 0
                r1 = Int64(heapClassInst.heap32[(r1 + 1)])
                r3 = Int64(heapClassInst.heap32[(r3 + 1)])
                r1 = (r1 - r3) | 0
                r3 = (r4 * 1000000) | 0
                r1 = (r1 + r3) | 0
                r3 = Int64(heapClassInst.heap32[(r2 + 3)])
                r1 = (r1 - r3) | 0
                f0 = Float64(`UIntNative`(r1))
                f1 = 1000.0
                f2 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                f0 = f0 / f1
                f0 = f2 + f0
                heapClassInst.heapFloat[(r2 + 2)] = Float32(f0)
                r1 = Int64(heapClassInst.heap32[(r2 + 4)])
                if (r1 != 0) {
                    break
                } else {
                    r1 = Int64(heapClassInst.heap32[(r0)])
                }
            }
            r1 = r1 >> 2
            r1 = Int64(heapClassInst.heap32[(r1 + 5)])
            heapClassInst.heap32[(r0)] = Int32(r1)
        }
    } while (false);
    return;
}

func _ZN23btDiscreteDynamicsWorld18saveKinematicStateEf(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var r6: Int64 = 0
    var f0: Float64 = 0.0
    var f1: Float64 = 0.0
    var f2: Float64 = 0.0
    var f3: Float64 = 0.0
    var f4: Float64 = 0.0
    var f5: Float64 = 0.0
    var f6: Float64 = 0.0
    var __label__ = 0;
    i7 = sp + (-40)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0 + 2)])
    if (!(r1 < 1)) {
        f0 = Float64(heapClassInst.heapFloat[(fp + 1)])
        f1 = 1.0
        f1 = f1 / f0
        r1 = 0
        while (true) {
            r2 = Int64(heapClassInst.heap32[(r0 + 4)])
            r3 = r1 << 2
            r2 = (r2 + r3) | 0
            r2 = r2 >> 2
            r2 = Int64(heapClassInst.heap32[(r2)])
            r3 = Int64(heapClassInst.heapU8[r2 + 232])
            r3 = r3 & 2
            if (!(r3 == 0)) {
                if (!(r2 == 0)) {
                    r3 = r2 >> 2
                    r4 = Int64(heapClassInst.heap32[(r3 + 54)])
                    if (!(r4 == 2)) {
                        r4 = Int64(heapClassInst.heapU8[r2 + 204])
                        r4 = r4 & 2
                        if (!(r4 == 0)) {
                            f2 = 0.0
                            if (!(f0 == f2)) {
                                r4 = Int64(heapClassInst.heap32[(r3 + 118)])
                                if (!(r4 == 0)) {
                                    r5 = r4 >> 2
                                    r5 = Int64(heapClassInst.heap32[(r5)])
                                    r5 = r5 >> 2
                                    r5 = Int64(heapClassInst.heap32[(r5 + 2)])
                                    r6 = (r2 + 4) | 0
                                    heapClassInst.heap32[(g0)] = Int32(r4)
                                    heapClassInst.heap32[(g0 + 1)] = Int32(r6)
                                    __FUNCTION_TABLE__[(r5) >> 2](i7);
                                }
                                f2 = Float64(heapClassInst.heapFloat[(r3 + 13)])
                                f3 = Float64(heapClassInst.heapFloat[(r3 + 29)])
                                f2 = f2 - f3
                                f3 = Float64(heapClassInst.heapFloat[(r3 + 15)])
                                f4 = Float64(heapClassInst.heapFloat[(r3 + 31)])
                                f5 = Float64(heapClassInst.heapFloat[(r3 + 14)])
                                f6 = Float64(heapClassInst.heapFloat[(r3 + 30)])
                                f5 = f5 - f6
                                f2 = f2 * f1
                                f3 = f3 - f4
                                f4 = f5 * f1
                                heapClassInst.heapFloat[(r3 + 76)] = Float32(f2)
                                f2 = f3 * f1
                                heapClassInst.heapFloat[(r3 + 77)] = Float32(f4)
                                heapClassInst.heapFloat[(r3 + 78)] = Float32(f2)
                                heapClassInst.heap32[(r3 + 79)] = 0
                                r4 = sp + (-16)
                                r5 = (r2 + 68) | 0
                                r2 = (r2 + 4) | 0
                                r6 = sp + (-20)
                                heapClassInst.heap32[(g0)] = Int32(r5)
                                heapClassInst.heap32[(g0 + 1)] = Int32(r2)
                                heapClassInst.heap32[(g0 + 2)] = Int32(r4)
                                heapClassInst.heap32[(g0 + 3)] = Int32(r6)
                                _ZN15btTransformUtil22calculateDiffAxisAngleERK11btTransformS2_R9btVector3Rf(i7);
                                r2 = r4 >> 2
                                f2 = Float64(heapClassInst.heapFloat[(fp + (-5))])
                                f3 = Float64(heapClassInst.heapFloat[(fp + (-4))])
                                f3 = f3 * f2
                                f4 = Float64(heapClassInst.heapFloat[(r2 + 2)])
                                f5 = Float64(heapClassInst.heapFloat[(r2 + 1)])
                                f5 = f5 * f2
                                f3 = f3 * f1
                                f2 = f4 * f2
                                f4 = f5 * f1
                                heapClassInst.heapFloat[(r3 + 80)] = Float32(f3)
                                f2 = f2 * f1
                                heapClassInst.heapFloat[(r3 + 81)] = Float32(f4)
                                heapClassInst.heapFloat[(r3 + 82)] = Float32(f2)
                                heapClassInst.heap32[(r3 + 83)] = 0
                                heapClassInst.heap32[(r3 + 33)] = heapClassInst.heap32[(r3 + 76)]
                                heapClassInst.heap32[(r3 + 34)] = heapClassInst.heap32[(r3 + 77)]
                                heapClassInst.heap32[(r3 + 35)] = heapClassInst.heap32[(r3 + 78)]
                                heapClassInst.heap32[(r3 + 36)] = heapClassInst.heap32[(r3 + 79)]
                                heapClassInst.heapFloat[(r3 + 37)] = Float32(f3)
                                heapClassInst.heapFloat[(r3 + 38)] = Float32(f4)
                                heapClassInst.heapFloat[(r3 + 39)] = Float32(f2)
                                heapClassInst.heap32[(r3 + 40)] = 0
                                heapClassInst.heap32[(r3 + 17)] = heapClassInst.heap32[(r3 + 1)]
                                heapClassInst.heap32[(r3 + 18)] = heapClassInst.heap32[(r3 + 2)]
                                heapClassInst.heap32[(r3 + 19)] = heapClassInst.heap32[(r3 + 3)]
                                heapClassInst.heap32[(r3 + 20)] = heapClassInst.heap32[(r3 + 4)]
                                heapClassInst.heap32[(r3 + 21)] = heapClassInst.heap32[(r3 + 5)]
                                heapClassInst.heap32[(r3 + 22)] = heapClassInst.heap32[(r3 + 6)]
                                heapClassInst.heap32[(r3 + 23)] = heapClassInst.heap32[(r3 + 7)]
                                heapClassInst.heap32[(r3 + 24)] = heapClassInst.heap32[(r3 + 8)]
                                heapClassInst.heap32[(r3 + 25)] = heapClassInst.heap32[(r3 + 9)]
                                heapClassInst.heap32[(r3 + 26)] = heapClassInst.heap32[(r3 + 10)]
                                heapClassInst.heap32[(r3 + 27)] = heapClassInst.heap32[(r3 + 11)]
                                heapClassInst.heap32[(r3 + 28)] = heapClassInst.heap32[(r3 + 12)]
                                heapClassInst.heap32[(r3 + 29)] = heapClassInst.heap32[(r3 + 13)]
                                heapClassInst.heap32[(r3 + 30)] = heapClassInst.heap32[(r3 + 14)]
                                heapClassInst.heap32[(r3 + 31)] = heapClassInst.heap32[(r3 + 15)]
                                heapClassInst.heap32[(r3 + 32)] = heapClassInst.heap32[(r3 + 16)]
                            }
                        }
                    }
                }
            }
            r1 = (r1 + 1) | 0
            r2 = Int64(heapClassInst.heap32[(r0 + 2)])
            if (r2 > r1) {
                continue
            } else {
                break
            }
        }
    }
    return;
}

func _ZN15btDynamicsWorldD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV15btDynamicsWorld
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN16btCollisionWorldD2Ev(i7);
    return;
}

func _ZN15btDynamicsWorldD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTV15btDynamicsWorld
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN16btCollisionWorldD2Ev(i7);
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

func _ZN23btDiscreteDynamicsWorldD0Ev(sp: Int64): Unit {
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
    r1 = _ZTV23btDiscreteDynamicsWorld
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heapU8[r0 + 244])
    if (!(r1 == 0)) {
        r1 = Int64(heapClassInst.heap32[(r2 + 45)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r2 + 45)])
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
    r1 = Int64(heapClassInst.heapU8[r0 + 245])
    if (!(r1 == 0)) {
        r1 = Int64(heapClassInst.heap32[(r2 + 44)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r2 + 44)])
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
    r1 = Int64(heapClassInst.heap32[(r2 + 65)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 264])
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
        heapClassInst.heap32[(r2 + 65)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 264] = Int8(r1)
    heapClassInst.heap32[(r2 + 65)] = 0
    heapClassInst.heap32[(r2 + 63)] = 0
    heapClassInst.heap32[(r2 + 64)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 54)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 220])
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
        heapClassInst.heap32[(r2 + 54)] = 0
    }
    heapClassInst.heap8[r0 + 220] = Int8(r1)
    heapClassInst.heap32[(r2 + 54)] = 0
    heapClassInst.heap32[(r2 + 52)] = 0
    heapClassInst.heap32[(r2 + 53)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 49)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 200])
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
        heapClassInst.heap32[(r2 + 49)] = 0
    }
    heapClassInst.heap8[r0 + 200] = Int8(r1)
    heapClassInst.heap32[(r2 + 49)] = 0
    r1 = _ZTV15btDynamicsWorld
    heapClassInst.heap32[(r2 + 47)] = 0
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2 + 48)] = 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN16btCollisionWorldD2Ev(i7);
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

func _ZN23btDiscreteDynamicsWorldD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN23btDiscreteDynamicsWorldD2Ev(i7);
    return;
}

func _ZN23btDiscreteDynamicsWorldD2Ev(sp: Int64): Unit {
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
    r1 = _ZTV23btDiscreteDynamicsWorld
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heapU8[r0 + 244])
    if (!(r1 == 0)) {
        r1 = Int64(heapClassInst.heap32[(r2 + 45)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r2 + 45)])
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
    r1 = Int64(heapClassInst.heapU8[r0 + 245])
    if (!(r1 == 0)) {
        r1 = Int64(heapClassInst.heap32[(r2 + 44)])
        r3 = r1 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        r3 = r3 >> 2
        r3 = Int64(heapClassInst.heap32[(r3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        __FUNCTION_TABLE__[(r3) >> 2](i7);
        r1 = Int64(heapClassInst.heap32[(r2 + 44)])
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
    r1 = Int64(heapClassInst.heap32[(r2 + 65)])
    if (!(r1 == 0)) {
        r3 = Int64(heapClassInst.heapU8[r0 + 264])
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
        heapClassInst.heap32[(r2 + 65)] = 0
    }
    r1 = 1
    heapClassInst.heap8[r0 + 264] = Int8(r1)
    heapClassInst.heap32[(r2 + 65)] = 0
    heapClassInst.heap32[(r2 + 63)] = 0
    heapClassInst.heap32[(r2 + 64)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 54)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 220])
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
        heapClassInst.heap32[(r2 + 54)] = 0
    }
    heapClassInst.heap8[r0 + 220] = Int8(r1)
    heapClassInst.heap32[(r2 + 54)] = 0
    heapClassInst.heap32[(r2 + 52)] = 0
    heapClassInst.heap32[(r2 + 53)] = 0
    r3 = Int64(heapClassInst.heap32[(r2 + 49)])
    if (!(r3 == 0)) {
        r4 = Int64(heapClassInst.heapU8[r0 + 200])
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
        heapClassInst.heap32[(r2 + 49)] = 0
    }
    heapClassInst.heap8[r0 + 200] = Int8(r1)
    heapClassInst.heap32[(r2 + 49)] = 0
    r1 = _ZTV15btDynamicsWorld
    heapClassInst.heap32[(r2 + 47)] = 0
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2 + 48)] = 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN16btCollisionWorldD2Ev(i7);
    return;
}

func _ZN11btRigidBody18proceedToTransformERK11btTransform(sp: Int64): Unit {
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
    var r24: Int64 = 0
    var r25: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-48)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = Int64(heapClassInst.heapU8[r0 + 204])
    r2 = r2 & 3
    if (r2 == 0) {
        r2 = r0 >> 2
        r24 = r1 >> 2
        heapClassInst.heap32[(r2 + 17)] = heapClassInst.heap32[(r24)]
        heapClassInst.heap32[(r2 + 18)] = heapClassInst.heap32[(r24 + 1)]
        heapClassInst.heap32[(r2 + 19)] = heapClassInst.heap32[(r24 + 2)]
        heapClassInst.heap32[(r2 + 20)] = heapClassInst.heap32[(r24 + 3)]
        heapClassInst.heap32[(r2 + 21)] = heapClassInst.heap32[(r24 + 4)]
        heapClassInst.heap32[(r2 + 22)] = heapClassInst.heap32[(r24 + 5)]
        heapClassInst.heap32[(r2 + 23)] = heapClassInst.heap32[(r24 + 6)]
        heapClassInst.heap32[(r2 + 24)] = heapClassInst.heap32[(r24 + 7)]
        heapClassInst.heap32[(r2 + 25)] = heapClassInst.heap32[(r24 + 8)]
        heapClassInst.heap32[(r2 + 26)] = heapClassInst.heap32[(r24 + 9)]
        heapClassInst.heap32[(r2 + 27)] = heapClassInst.heap32[(r24 + 10)]
        heapClassInst.heap32[(r2 + 28)] = heapClassInst.heap32[(r24 + 11)]
        heapClassInst.heap32[(r2 + 29)] = heapClassInst.heap32[(r24 + 12)]
        heapClassInst.heap32[(r2 + 30)] = heapClassInst.heap32[(r24 + 13)]
        r15 = (r1 + 4) | 0
        r16 = (r1 + 8) | 0
        r17 = (r1 + 12) | 0
        r18 = (r1 + 16) | 0
        r19 = (r1 + 20) | 0
        r20 = (r1 + 24) | 0
        r21 = (r1 + 28) | 0
        r22 = (r1 + 32) | 0
        r23 = (r1 + 36) | 0
        r3 = (r1 + 40) | 0
        heapClassInst.heap32[(fp + (-10))] = Int32(r3)
        r3 = (r1 + 44) | 0
        heapClassInst.heap32[(fp + (-4))] = Int32(r3)
        r3 = (r1 + 48) | 0
        heapClassInst.heap32[(fp + (-7))] = Int32(r3)
        r3 = (r1 + 52) | 0
        heapClassInst.heap32[(fp + (-6))] = Int32(r3)
        r3 = (r1 + 56) | 0
        heapClassInst.heap32[(fp + (-9))] = Int32(r3)
        r3 = (r1 + 60) | 0
        heapClassInst.heap32[(fp + (-8))] = Int32(r3)
        r3 = (r0 + 4) | 0
        r4 = (r0 + 8) | 0
        r5 = (r0 + 12) | 0
        r6 = (r0 + 16) | 0
        r7 = (r0 + 20) | 0
        r8 = (r0 + 24) | 0
        r9 = (r0 + 28) | 0
        r10 = (r0 + 32) | 0
        r11 = (r0 + 36) | 0
        r12 = (r0 + 40) | 0
        r13 = (r0 + 44) | 0
        r14 = (r0 + 48) | 0
        r25 = (r0 + 52) | 0
        heapClassInst.heap32[(fp + (-5))] = Int32(r25)
        r25 = (r0 + 56) | 0
        heapClassInst.heap32[(fp + (-3))] = Int32(r25)
        r25 = (r0 + 60) | 0
        heapClassInst.heap32[(fp + (-2))] = Int32(r25)
        r25 = (r0 + 64) | 0
        heapClassInst.heap32[(fp + (-1))] = Int32(r25)
        heapClassInst.heap32[(r2 + 31)] = heapClassInst.heap32[(r24 + 14)]
        heapClassInst.heap32[(r2 + 32)] = heapClassInst.heap32[(r24 + 15)]
    } else {
        r2 = r0 >> 2
        heapClassInst.heap32[(r2 + 17)] = heapClassInst.heap32[(r2 + 1)]
        heapClassInst.heap32[(r2 + 18)] = heapClassInst.heap32[(r2 + 2)]
        heapClassInst.heap32[(r2 + 19)] = heapClassInst.heap32[(r2 + 3)]
        heapClassInst.heap32[(r2 + 20)] = heapClassInst.heap32[(r2 + 4)]
        heapClassInst.heap32[(r2 + 21)] = heapClassInst.heap32[(r2 + 5)]
        heapClassInst.heap32[(r2 + 22)] = heapClassInst.heap32[(r2 + 6)]
        heapClassInst.heap32[(r2 + 23)] = heapClassInst.heap32[(r2 + 7)]
        heapClassInst.heap32[(r2 + 24)] = heapClassInst.heap32[(r2 + 8)]
        heapClassInst.heap32[(r2 + 25)] = heapClassInst.heap32[(r2 + 9)]
        heapClassInst.heap32[(r2 + 26)] = heapClassInst.heap32[(r2 + 10)]
        heapClassInst.heap32[(r2 + 27)] = heapClassInst.heap32[(r2 + 11)]
        heapClassInst.heap32[(r2 + 28)] = heapClassInst.heap32[(r2 + 12)]
        heapClassInst.heap32[(r2 + 29)] = heapClassInst.heap32[(r2 + 13)]
        heapClassInst.heap32[(r2 + 30)] = heapClassInst.heap32[(r2 + 14)]
        r3 = (r0 + 4) | 0
        r4 = (r0 + 8) | 0
        r5 = (r0 + 12) | 0
        r6 = (r0 + 16) | 0
        r7 = (r0 + 20) | 0
        r8 = (r0 + 24) | 0
        r9 = (r0 + 28) | 0
        r10 = (r0 + 32) | 0
        r11 = (r0 + 36) | 0
        r12 = (r0 + 40) | 0
        r13 = (r0 + 44) | 0
        r14 = (r0 + 48) | 0
        r15 = (r0 + 52) | 0
        heapClassInst.heap32[(fp + (-5))] = Int32(r15)
        r15 = (r0 + 56) | 0
        heapClassInst.heap32[(fp + (-3))] = Int32(r15)
        r15 = (r0 + 60) | 0
        heapClassInst.heap32[(fp + (-2))] = Int32(r15)
        r15 = (r0 + 64) | 0
        heapClassInst.heap32[(fp + (-1))] = Int32(r15)
        r15 = (r1 + 4) | 0
        r16 = (r1 + 8) | 0
        r17 = (r1 + 12) | 0
        r18 = (r1 + 16) | 0
        r19 = (r1 + 20) | 0
        r20 = (r1 + 24) | 0
        r21 = (r1 + 28) | 0
        r22 = (r1 + 32) | 0
        r23 = (r1 + 36) | 0
        r24 = (r1 + 40) | 0
        heapClassInst.heap32[(fp + (-10))] = Int32(r24)
        r24 = (r1 + 44) | 0
        heapClassInst.heap32[(fp + (-4))] = Int32(r24)
        r24 = (r1 + 48) | 0
        heapClassInst.heap32[(fp + (-7))] = Int32(r24)
        r24 = (r1 + 52) | 0
        heapClassInst.heap32[(fp + (-6))] = Int32(r24)
        r24 = (r1 + 56) | 0
        heapClassInst.heap32[(fp + (-9))] = Int32(r24)
        r24 = (r1 + 60) | 0
        heapClassInst.heap32[(fp + (-8))] = Int32(r24)
        heapClassInst.heap32[(r2 + 31)] = heapClassInst.heap32[(r2 + 15)]
        heapClassInst.heap32[(r2 + 32)] = heapClassInst.heap32[(r2 + 16)]
    }
    r2 = r0 >> 2
    heapClassInst.heap32[(r2 + 33)] = heapClassInst.heap32[(r2 + 76)]
    heapClassInst.heap32[(r2 + 34)] = heapClassInst.heap32[(r2 + 77)]
    heapClassInst.heap32[(r2 + 35)] = heapClassInst.heap32[(r2 + 78)]
    heapClassInst.heap32[(r2 + 36)] = heapClassInst.heap32[(r2 + 79)]
    heapClassInst.heap32[(r2 + 37)] = heapClassInst.heap32[(r2 + 80)]
    heapClassInst.heap32[(r2 + 38)] = heapClassInst.heap32[(r2 + 81)]
    heapClassInst.heap32[(r2 + 39)] = heapClassInst.heap32[(r2 + 82)]
    r3 = r3 >> 2
    r1 = r1 >> 2
    heapClassInst.heap32[(r2 + 40)] = heapClassInst.heap32[(r2 + 83)]
    r2 = r4 >> 2
    r4 = r15 >> 2
    heapClassInst.heap32[(r3)] = heapClassInst.heap32[(r1)]
    r1 = r5 >> 2
    r3 = r16 >> 2
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r4)]
    r2 = r6 >> 2
    r4 = r17 >> 2
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r3)]
    r1 = r7 >> 2
    r3 = r18 >> 2
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r4)]
    r2 = r8 >> 2
    r4 = r19 >> 2
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r3)]
    r1 = r9 >> 2
    r3 = r20 >> 2
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r4)]
    r2 = r10 >> 2
    r4 = r21 >> 2
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r3)]
    r1 = r11 >> 2
    r3 = r22 >> 2
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r4)]
    r2 = r12 >> 2
    r4 = r23 >> 2
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r3)]
    r1 = r13 >> 2
    r3 = Int64(heapClassInst.heap32[(fp + (-10))])
    r3 = r3 >> 2
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r4)]
    r2 = r14 >> 2
    r4 = Int64(heapClassInst.heap32[(fp + (-4))])
    r4 = r4 >> 2
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r3)]
    r1 = Int64(heapClassInst.heap32[(fp + (-5))])
    r1 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(fp + (-7))])
    r3 = r3 >> 2
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r4)]
    r2 = Int64(heapClassInst.heap32[(fp + (-3))])
    r2 = r2 >> 2
    r4 = Int64(heapClassInst.heap32[(fp + (-6))])
    r4 = r4 >> 2
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r3)]
    r1 = Int64(heapClassInst.heap32[(fp + (-2))])
    r1 = r1 >> 2
    r3 = Int64(heapClassInst.heap32[(fp + (-9))])
    r3 = r3 >> 2
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r4)]
    r2 = Int64(heapClassInst.heap32[(fp + (-1))])
    r2 = r2 >> 2
    r4 = Int64(heapClassInst.heap32[(fp + (-8))])
    r4 = r4 >> 2
    heapClassInst.heap32[(r1)] = heapClassInst.heap32[(r3)]
    heapClassInst.heap32[(r2)] = heapClassInst.heap32[(r4)]
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN11btRigidBody19updateInertiaTensorEv(i7);
    return;
}

func _ZNK11btRigidBody28calculateSerializeBufferSizeEv(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = 480
    commonVariable.r_g0 = r0
    return;
}

func _ZNK11btRigidBody21serializeSingleObjectEP12btSerializer(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-24)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = r0 >> 2
    r3 = r1 >> 2
    r4 = Int64(heapClassInst.heap32[(r3)])
    r5 = Int64(heapClassInst.heap32[(r2)])
    r4 = r4 >> 2
    r5 = r5 >> 2
    r4 = Int64(heapClassInst.heap32[(r4 + 4)])
    r5 = Int64(heapClassInst.heap32[(r5 + 4)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    __FUNCTION_TABLE__[(r5) >> 2](i7);
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heap32[(g0 + 1)] = Int32(commonVariable.r_g0)
    heapClassInst.heap32[(g0 + 2)] = 1
    __FUNCTION_TABLE__[(r4) >> 2](i7);
    r4 = commonVariable.r_g0
    r2 = Int64(heapClassInst.heap32[(r2)])
    r2 = r2 >> 2
    r5 = r4 >> 2
    r2 = Int64(heapClassInst.heap32[(r2 + 5)])
    r5 = Int64(heapClassInst.heap32[(r5 + 2)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r5)
    heapClassInst.heap32[(g0 + 2)] = Int32(r1)
    __FUNCTION_TABLE__[(r2) >> 2](i7);
    r3 = Int64(heapClassInst.heap32[(r3)])
    r3 = r3 >> 2
    r3 = Int64(heapClassInst.heap32[(r3 + 5)])
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heap32[(g0 + 1)] = Int32(r4)
    heapClassInst.heap32[(g0 + 2)] = Int32(commonVariable.r_g0)
    heapClassInst.heap32[(g0 + 3)] = 1497645650
    heapClassInst.heap32[(g0 + 4)] = Int32(r0)
    __FUNCTION_TABLE__[(r3) >> 2](i7);
    return;
}

func _ZN11btRigidBody24checkCollideWithOverrideEP17btCollisionObject(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var r4: Int64 = 0
    var r5: Int64 = 0
    var __label__ = 0;
    i7 = sp + 0
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp + 1)])
    r1 = Int64(heapClassInst.heapU8[r0 + 232])
    r1 = r1 & 2
    do {
        if (r1 != 0) {
            if (r0 == 0) {
                __label__ = 1
            } else {
                r1 = Int64(heapClassInst.heap32[(fp)])
                r1 = r1 >> 2
                r2 = Int64(heapClassInst.heap32[(r1 + 120)])
                r3 = 0
                while (true) {
                    if (r2 > r3) {
                        r4 = Int64(heapClassInst.heap32[(r1 + 122)])
                        r5 = r3 << 2
                        r4 = (r4 + r5) | 0
                        r4 = r4 >> 2
                        r4 = Int64(heapClassInst.heap32[(r4)])
                        r4 = r4 >> 2
                        r5 = Int64(heapClassInst.heap32[(r4 + 5)])
                        if (r5 != r0) {
                            r4 = Int64(heapClassInst.heap32[(r4 + 6)])
                            if (r4 == r0) {
                                break
                            } else {
                                r3 = (r3 + 1) | 0
                            }
                        } else {
                            break
                        }
                    } else {
                        __label__ = 1
                        break
                    }
                }
                r0 = 0
                __label__ = 9
            }
        } else {
            __label__ = 1
        }
    } while (false);
    if (__label__ == 1) {
        r0 = 1
    }
    r0 = r0 & 255
    commonVariable.r_g0 = r0
    return;
}

func _ZN11btRigidBodyD0Ev(sp: Int64): Unit {
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
    r1 = _ZTV11btRigidBody
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 120)])
    if (r1 == 0) {
        r1 = Int64(heapClassInst.heap32[(r2 + 122)])
        if (!(r1 == 0)) {
            r3 = Int64(heapClassInst.heapU8[r0 + 492])
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
            heapClassInst.heap32[(r2 + 122)] = 0
        }
        r1 = 1
        heapClassInst.heap8[r0 + 492] = Int8(r1)
        heapClassInst.heap32[(r2 + 122)] = 0
        r1 = _ZTV17btCollisionObject
        heapClassInst.heap32[(r2 + 120)] = 0
        r1 = (r1 + 8) | 0
        heapClassInst.heap32[(r2 + 121)] = 0
        heapClassInst.heap32[(r2)] = Int32(r1)
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
    } else {
        r0 = _E2_str248
        r2 = _E2_str34955
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = Int32(r2)
        heapClassInst.heap32[(g0 + 2)] = 175
        _assert(i7);
    }
}

func _ZN11btRigidBodyD1Ev(sp: Int64): Unit {
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
    r1 = _ZTV11btRigidBody
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 120)])
    if (r1 == 0) {
        r1 = Int64(heapClassInst.heap32[(r2 + 122)])
        if (!(r1 == 0)) {
            r3 = Int64(heapClassInst.heapU8[r0 + 492])
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
            heapClassInst.heap32[(r2 + 122)] = 0
        }
        r1 = 1
        heapClassInst.heap8[r0 + 492] = Int8(r1)
        heapClassInst.heap32[(r2 + 122)] = 0
        r0 = _ZTV17btCollisionObject
        heapClassInst.heap32[(r2 + 120)] = 0
        r0 = (r0 + 8) | 0
        heapClassInst.heap32[(r2 + 121)] = 0
        heapClassInst.heap32[(r2)] = Int32(r0)
        return;
    } else {
        r0 = _E2_str248
        r2 = _E2_str34955
        heapClassInst.heap32[(g0)] = Int32(r0)
        heapClassInst.heap32[(g0 + 1)] = Int32(r2)
        heapClassInst.heap32[(g0 + 2)] = 175
        _assert(i7);
    }
}

func _ZNK11btRigidBody9serializeEPvP12btSerializer(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-16)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = Int64(heapClassInst.heap32[(fp + 1)])
    r2 = Int64(heapClassInst.heap32[(fp + 2)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = Int32(r1)
    heapClassInst.heap32[(g0 + 2)] = Int32(r2)
    r1 = r1 >> 2
    r2 = r0 >> 2
    _ZNK17btCollisionObject9serializeEPvP12btSerializer(i7);
    heapClassInst.heap32[(r1 + 62)] = heapClassInst.heap32[(r2 + 64)]
    heapClassInst.heap32[(r1 + 63)] = heapClassInst.heap32[(r2 + 65)]
    heapClassInst.heap32[(r1 + 64)] = heapClassInst.heap32[(r2 + 66)]
    heapClassInst.heap32[(r1 + 65)] = heapClassInst.heap32[(r2 + 67)]
    heapClassInst.heap32[(r1 + 66)] = heapClassInst.heap32[(r2 + 68)]
    heapClassInst.heap32[(r1 + 67)] = heapClassInst.heap32[(r2 + 69)]
    heapClassInst.heap32[(r1 + 68)] = heapClassInst.heap32[(r2 + 70)]
    heapClassInst.heap32[(r1 + 69)] = heapClassInst.heap32[(r2 + 71)]
    heapClassInst.heap32[(r1 + 70)] = heapClassInst.heap32[(r2 + 72)]
    heapClassInst.heap32[(r1 + 71)] = heapClassInst.heap32[(r2 + 73)]
    heapClassInst.heap32[(r1 + 72)] = heapClassInst.heap32[(r2 + 74)]
    heapClassInst.heap32[(r1 + 73)] = heapClassInst.heap32[(r2 + 75)]
    heapClassInst.heap32[(r1 + 74)] = heapClassInst.heap32[(r2 + 76)]
    heapClassInst.heap32[(r1 + 75)] = heapClassInst.heap32[(r2 + 77)]
    heapClassInst.heap32[(r1 + 76)] = heapClassInst.heap32[(r2 + 78)]
    heapClassInst.heap32[(r1 + 77)] = heapClassInst.heap32[(r2 + 79)]
    heapClassInst.heap32[(r1 + 78)] = heapClassInst.heap32[(r2 + 80)]
    heapClassInst.heap32[(r1 + 79)] = heapClassInst.heap32[(r2 + 81)]
    heapClassInst.heap32[(r1 + 80)] = heapClassInst.heap32[(r2 + 82)]
    heapClassInst.heap32[(r1 + 81)] = heapClassInst.heap32[(r2 + 83)]
    heapClassInst.heap32[(r1 + 110)] = heapClassInst.heap32[(r2 + 84)]
    heapClassInst.heap32[(r1 + 82)] = heapClassInst.heap32[(r2 + 134)]
    heapClassInst.heap32[(r1 + 83)] = heapClassInst.heap32[(r2 + 135)]
    heapClassInst.heap32[(r1 + 84)] = heapClassInst.heap32[(r2 + 136)]
    heapClassInst.heap32[(r1 + 85)] = heapClassInst.heap32[(r2 + 137)]
    heapClassInst.heap32[(r1 + 86)] = heapClassInst.heap32[(r2 + 85)]
    heapClassInst.heap32[(r1 + 87)] = heapClassInst.heap32[(r2 + 86)]
    heapClassInst.heap32[(r1 + 88)] = heapClassInst.heap32[(r2 + 87)]
    heapClassInst.heap32[(r1 + 89)] = heapClassInst.heap32[(r2 + 88)]
    heapClassInst.heap32[(r1 + 90)] = heapClassInst.heap32[(r2 + 89)]
    heapClassInst.heap32[(r1 + 91)] = heapClassInst.heap32[(r2 + 90)]
    heapClassInst.heap32[(r1 + 92)] = heapClassInst.heap32[(r2 + 91)]
    heapClassInst.heap32[(r1 + 93)] = heapClassInst.heap32[(r2 + 92)]
    heapClassInst.heap32[(r1 + 94)] = heapClassInst.heap32[(r2 + 93)]
    heapClassInst.heap32[(r1 + 95)] = heapClassInst.heap32[(r2 + 94)]
    heapClassInst.heap32[(r1 + 96)] = heapClassInst.heap32[(r2 + 95)]
    heapClassInst.heap32[(r1 + 97)] = heapClassInst.heap32[(r2 + 96)]
    heapClassInst.heap32[(r1 + 98)] = heapClassInst.heap32[(r2 + 97)]
    heapClassInst.heap32[(r1 + 99)] = heapClassInst.heap32[(r2 + 98)]
    heapClassInst.heap32[(r1 + 100)] = heapClassInst.heap32[(r2 + 99)]
    heapClassInst.heap32[(r1 + 101)] = heapClassInst.heap32[(r2 + 100)]
    heapClassInst.heap32[(r1 + 102)] = heapClassInst.heap32[(r2 + 101)]
    heapClassInst.heap32[(r1 + 103)] = heapClassInst.heap32[(r2 + 102)]
    heapClassInst.heap32[(r1 + 104)] = heapClassInst.heap32[(r2 + 103)]
    heapClassInst.heap32[(r1 + 105)] = heapClassInst.heap32[(r2 + 104)]
    heapClassInst.heap32[(r1 + 106)] = heapClassInst.heap32[(r2 + 105)]
    heapClassInst.heap32[(r1 + 107)] = heapClassInst.heap32[(r2 + 106)]
    heapClassInst.heap32[(r1 + 108)] = heapClassInst.heap32[(r2 + 107)]
    heapClassInst.heap32[(r1 + 109)] = heapClassInst.heap32[(r2 + 108)]
    heapClassInst.heap32[(r1 + 111)] = heapClassInst.heap32[(r2 + 109)]
    heapClassInst.heap32[(r1 + 112)] = heapClassInst.heap32[(r2 + 110)]
    r0 = Int64(heapClassInst.heapU8[r0 + 444])
    heapClassInst.heap32[(r1 + 119)] = Int32(r0)
    heapClassInst.heap32[(r1 + 113)] = heapClassInst.heap32[(r2 + 112)]
    heapClassInst.heap32[(r1 + 114)] = heapClassInst.heap32[(r2 + 113)]
    heapClassInst.heap32[(r1 + 115)] = heapClassInst.heap32[(r2 + 114)]
    heapClassInst.heap32[(r1 + 116)] = heapClassInst.heap32[(r2 + 115)]
    heapClassInst.heap32[(r1 + 117)] = heapClassInst.heap32[(r2 + 116)]
    heapClassInst.heap32[(r1 + 118)] = heapClassInst.heap32[(r2 + 117)]
    r0 = _E2_str414
    commonVariable.r_g0 = r0
    return;
}

func _ZN11btRigidBody16addConstraintRefEP17btTypedConstraint(sp: Int64): Unit {
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
    r2 = Int64(heapClassInst.heap32[(fp + 1)])
    r3 = Int64(heapClassInst.heap32[(r1 + 120)])
    r4 = 0
    while (true) {
        if (r3 > r4) {
            r5 = Int64(heapClassInst.heap32[(r1 + 122)])
            r6 = r4 << 2
            r5 = (r5 + r6) | 0
            r5 = r5 >> 2
            r5 = Int64(heapClassInst.heap32[(r5)])
            if (r5 != r2) {
                r4 = (r4 + 1) | 0
                continue
            } else {
                __label__ = 5
                break
            }
        } else {
            __label__ = 4
            break
        }
    }
    if (__label__ == 4) {
        r4 = r3
    }
    if (!(r3 != r4)) {
        r4 = Int64(heapClassInst.heap32[(r1 + 121)])
        if (r4 == r3) {
            r5 = 1
            r6 = r3 << 1
            r6 = if (r3 == 0) {
                r5
            } else {
                r6
            };
            if (!(r4 >= r6)) {
                if (r6 != 0) {
                    r4 = gNumAlignedAllocs
                    r4 = r4 >> 2
                    r7 = Int64(heapClassInst.heap32[(r4)])
                    r8 = r6 << 2
                    r7 = (r7 + 1) | 0
                    r8 = r8 | 3
                    heapClassInst.heap32[(r4)] = Int32(r7)
                    r4 = (r8 + 16) | 0
                    heapClassInst.heap32[(g0)] = Int32(r4)
                    mallocNew(i7);
                    r4 = commonVariable.r_g0
                    if (r4 != 0) {
                        r7 = 0
                        r8 = (r4 + 4) | 0
                        r7 = (r7 - r8) | 0
                        r7 = r7 & 15
                        r7 = (r4 + r7) | 0
                        r8 = (r7 + 4) | 0
                        r7 = r7 >> 2
                        heapClassInst.heap32[(r7)] = Int32(r4)
                        r4 = r8
                    }
                } else {
                    r4 = 0
                }
                do {
                    if (r3 < 1) {
                        r8 = Int64(heapClassInst.heap32[(r1 + 122)])
                    } else {
                        r7 = 0
                        while (true) {
                            r8 = Int64(heapClassInst.heap32[(r1 + 122)])
                            r9 = r7 << 2
                            r10 = (r8 + r9) | 0
                            r10 = r10 >> 2
                            r9 = (r4 + r9) | 0
                            r10 = Int64(heapClassInst.heap32[(r10)])
                            r7 = (r7 + 1) | 0
                            r9 = r9 >> 2
                            heapClassInst.heap32[(r9)] = Int32(r10)
                            if (!(r3 != r7)) {
                                break
                            }
                        }
                    }
                } while (false);
                if (r8 != 0) {
                    r7 = Int64(heapClassInst.heapU8[r0 + 492])
                    if (r7 != 0) {
                        r3 = gNumAlignedFree
                        r3 = r3 >> 2
                        r7 = Int64(heapClassInst.heap32[(r3)])
                        r7 = (r7 + 1) | 0
                        r8 = r8 >> 2
                        heapClassInst.heap32[(r3)] = Int32(r7)
                        r3 = Int64(heapClassInst.heap32[(r8 + (-1))])
                        heapClassInst.heap32[(g0)] = Int32(r3)
                        free(i7);
                        r3 = Int64(heapClassInst.heap32[(r1 + 120)])
                    }
                    heapClassInst.heap32[(r1 + 122)] = 0
                }
                heapClassInst.heap8[r0 + 492] = Int8(r5)
                heapClassInst.heap32[(r1 + 122)] = Int32(r4)
                heapClassInst.heap32[(r1 + 121)] = Int32(r6)
            }
        }
        r0 = r3 << 2
        r3 = Int64(heapClassInst.heap32[(r1 + 122)])
        r0 = (r3 + r0) | 0
        r0 = r0 >> 2
        heapClassInst.heap32[(r0)] = Int32(r2)
        r0 = Int64(heapClassInst.heap32[(r1 + 120)])
        r0 = (r0 + 1) | 0
        heapClassInst.heap32[(r1 + 120)] = Int32(r0)
    }
    heapClassInst.heap32[(r1 + 63)] = 1
    return;
}

func _ZN11btRigidBody19integrateVelocitiesEf(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
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
    r1 = Int64(heapClassInst.heapU8[r0 + 204])
    r1 = r1 & 3
    if (!(r1 != 0)) {
        f0 = Float64(heapClassInst.heapFloat[(fp + 1)])
        r0 = r0 >> 2
        f1 = Float64(heapClassInst.heapFloat[(r0 + 84)])
        f1 = f1 * f0
        f2 = Float64(heapClassInst.heapFloat[(r0 + 101)])
        f3 = Float64(heapClassInst.heapFloat[(r0 + 103)])
        f4 = Float64(heapClassInst.heapFloat[(r0 + 102)])
        f5 = Float64(heapClassInst.heapFloat[(r0 + 76)])
        f2 = f2 * f1
        f2 = f5 + f2
        heapClassInst.heapFloat[(r0 + 76)] = Float32(f2)
        f2 = f4 * f1
        f4 = Float64(heapClassInst.heapFloat[(r0 + 77)])
        f2 = f4 + f2
        heapClassInst.heapFloat[(r0 + 77)] = Float32(f2)
        f1 = f3 * f1
        f2 = Float64(heapClassInst.heapFloat[(r0 + 78)])
        f1 = f2 + f1
        heapClassInst.heapFloat[(r0 + 78)] = Float32(f1)
        f1 = Float64(heapClassInst.heapFloat[(r0 + 105)])
        f2 = Float64(heapClassInst.heapFloat[(r0 + 64)])
        f3 = Float64(heapClassInst.heapFloat[(r0 + 106)])
        f4 = Float64(heapClassInst.heapFloat[(r0 + 65)])
        f2 = f2 * f1
        f4 = f4 * f3
        f5 = Float64(heapClassInst.heapFloat[(r0 + 107)])
        f6 = Float64(heapClassInst.heapFloat[(r0 + 66)])
        f2 = f2 + f4
        f4 = f6 * f5
        f2 = f2 + f4
        f4 = Float64(heapClassInst.heapFloat[(r0 + 68)])
        f6 = Float64(heapClassInst.heapFloat[(r0 + 69)])
        f7 = Float64(heapClassInst.heapFloat[(r0 + 72)])
        f8 = Float64(heapClassInst.heapFloat[(r0 + 73)])
        f9 = Float64(heapClassInst.heapFloat[(r0 + 74)])
        f10 = Float64(heapClassInst.heapFloat[(r0 + 70)])
        f11 = Float64(heapClassInst.heapFloat[(r0 + 80)])
        f2 = f2 * f0
        f4 = f4 * f1
        f6 = f6 * f3
        f2 = f11 + f2
        f4 = f4 + f6
        f6 = f10 * f5
        f4 = f4 + f6
        heapClassInst.heapFloat[(r0 + 80)] = Float32(f2)
        f1 = f7 * f1
        f3 = f8 * f3
        f4 = f4 * f0
        f6 = Float64(heapClassInst.heapFloat[(r0 + 81)])
        f4 = f6 + f4
        f1 = f1 + f3
        f3 = f9 * f5
        f1 = f1 + f3
        heapClassInst.heapFloat[(r0 + 81)] = Float32(f4)
        f1 = f1 * f0
        f3 = Float64(heapClassInst.heapFloat[(r0 + 82)])
        f1 = f3 + f1
        f2 = f2 * f2
        f3 = f4 * f4
        heapClassInst.heapFloat[(r0 + 82)] = Float32(f1)
        f2 = f2 + f3
        f1 = f1 * f1
        f1 = f2 + f1
        heapClassInst.heapFloat[(g0)] = Float32(f1)
        sqrtf(i7);
        f1 = commonVariable.f_g0
        f2 = f1 * f0
        f3 = 1.5707963705062866
        if (!(f2 <= f3)) {
            f0 = f3 / f0
            f0 = f0 / f1
            f1 = Float64(heapClassInst.heapFloat[(r0 + 80)])
            f1 = f1 * f0
            heapClassInst.heapFloat[(r0 + 80)] = Float32(f1)
            f1 = Float64(heapClassInst.heapFloat[(r0 + 81)])
            f1 = f1 * f0
            heapClassInst.heapFloat[(r0 + 81)] = Float32(f1)
            f1 = Float64(heapClassInst.heapFloat[(r0 + 82)])
            f0 = f1 * f0
            heapClassInst.heapFloat[(r0 + 82)] = Float32(f0)
        }
    }
    return;
}

func _ZN11btRigidBody12applyDampingEf(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
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
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = r0 >> 2
    f0 = Float64(heapClassInst.heapFloat[(r1 + 109)])
    f1 = 1.0
    f2 = Float64(heapClassInst.heapFloat[(fp + 1)])
    f0 = f1 - f0
    heapClassInst.heapFloat[(g0)] = Float32(f0)
    heapClassInst.heapFloat[(g0 + 1)] = Float32(f2)
    powf(i7);
    f3 = Float64(heapClassInst.heapFloat[(r1 + 76)])
    f3 = f3 * commonVariable.f_g0
    heapClassInst.heapFloat[(r1 + 76)] = Float32(f3)
    f3 = Float64(heapClassInst.heapFloat[(r1 + 77)])
    f3 = f3 * commonVariable.f_g0
    heapClassInst.heapFloat[(r1 + 77)] = Float32(f3)
    f3 = Float64(heapClassInst.heapFloat[(r1 + 78)])
    f0 = f3 * commonVariable.f_g0
    heapClassInst.heapFloat[(r1 + 78)] = Float32(f0)
    f0 = Float64(heapClassInst.heapFloat[(r1 + 110)])
    f0 = f1 - f0
    heapClassInst.heapFloat[(g0)] = Float32(f0)
    heapClassInst.heapFloat[(g0 + 1)] = Float32(f2)
    powf(i7);
    f2 = Float64(heapClassInst.heapFloat[(r1 + 80)])
    f2 = f2 * commonVariable.f_g0
    heapClassInst.heapFloat[(r1 + 80)] = Float32(f2)
    f3 = Float64(heapClassInst.heapFloat[(r1 + 81)])
    f3 = f3 * commonVariable.f_g0
    heapClassInst.heapFloat[(r1 + 81)] = Float32(f3)
    f4 = Float64(heapClassInst.heapFloat[(r1 + 82)])
    f0 = f4 * commonVariable.f_g0
    heapClassInst.heapFloat[(r1 + 82)] = Float32(f0)
    r0 = Int64(heapClassInst.heapU8[r0 + 444])
    if (!(r0 == 0)) {
        f4 = f2 * f2
        f5 = f3 * f3
        f6 = Float64(heapClassInst.heapFloat[(r1 + 76)])
        f4 = f4 + f5
        f5 = f0 * f0
        f4 = f4 + f5
        f5 = Float64(heapClassInst.heapFloat[(r1 + 114)])
        if (f4 < f5) {
            f4 = Float64(heapClassInst.heapFloat[(r1 + 77)])
            f5 = Float64(heapClassInst.heapFloat[(r1 + 78)])
            f7 = f6 * f6
            f8 = f4 * f4
            f7 = f7 + f8
            f8 = f5 * f5
            f7 = f7 + f8
            f8 = Float64(heapClassInst.heapFloat[(r1 + 113)])
            if (f7 < f8) {
                f7 = Float64(heapClassInst.heapFloat[(r1 + 112)])
                f2 = f2 * f7
                f3 = f3 * f7
                heapClassInst.heapFloat[(r1 + 80)] = Float32(f2)
                f0 = f0 * f7
                heapClassInst.heapFloat[(r1 + 81)] = Float32(f3)
                f6 = f6 * f7
                heapClassInst.heapFloat[(r1 + 82)] = Float32(f0)
                f4 = f4 * f7
                heapClassInst.heapFloat[(r1 + 76)] = Float32(f6)
                f5 = f5 * f7
                heapClassInst.heapFloat[(r1 + 77)] = Float32(f4)
                heapClassInst.heapFloat[(r1 + 78)] = Float32(f5)
            }
        } else {
            f4 = Float64(heapClassInst.heapFloat[(r1 + 77)])
            f5 = Float64(heapClassInst.heapFloat[(r1 + 78)])
        }
        f0 = f6 * f6
        f2 = f4 * f4
        f0 = f0 + f2
        f2 = f5 * f5
        f0 = f0 + f2
        heapClassInst.heapFloat[(g0)] = Float32(f0)
        sqrtf(i7);
        f0 = commonVariable.f_g0
        f2 = Float64(heapClassInst.heapFloat[(r1 + 109)])
        if (!(f2 <= f0)) {
            f2 = 0.004999999888241291
            if (f0 <= f2) {
                heapClassInst.heap32[(r1 + 76)] = 0
                heapClassInst.heap32[(r1 + 77)] = 0
                heapClassInst.heap32[(r1 + 78)] = 0
                heapClassInst.heap32[(r1 + 79)] = 0
            } else {
                f0 = Float64(heapClassInst.heapFloat[(r1 + 76)])
                f3 = Float64(heapClassInst.heapFloat[(r1 + 77)])
                f4 = Float64(heapClassInst.heapFloat[(r1 + 78)])
                f0 = f0 * f0
                f3 = f3 * f3
                f0 = f0 + f3
                f3 = f4 * f4
                f0 = f0 + f3
                heapClassInst.heapFloat[(g0)] = Float32(f0)
                sqrtf(i7);
                f0 = f1 / commonVariable.f_g0
                f3 = Float64(heapClassInst.heapFloat[(r1 + 76)])
                f4 = Float64(heapClassInst.heapFloat[(r1 + 77)])
                f5 = f3 * f0
                f6 = Float64(heapClassInst.heapFloat[(r1 + 78)])
                f7 = f4 * f0
                f5 = f5 * f2
                f0 = f6 * f0
                f7 = f7 * f2
                f3 = f3 - f5
                f0 = f0 * f2
                f2 = f4 - f7
                heapClassInst.heapFloat[(r1 + 76)] = Float32(f3)
                f0 = f6 - f0
                heapClassInst.heapFloat[(r1 + 77)] = Float32(f2)
                heapClassInst.heapFloat[(r1 + 78)] = Float32(f0)
            }
        }
        f0 = Float64(heapClassInst.heapFloat[(r1 + 80)])
        f2 = Float64(heapClassInst.heapFloat[(r1 + 81)])
        f3 = Float64(heapClassInst.heapFloat[(r1 + 82)])
        f0 = f0 * f0
        f2 = f2 * f2
        f0 = f0 + f2
        f2 = f3 * f3
        f0 = f0 + f2
        heapClassInst.heapFloat[(g0)] = Float32(f0)
        sqrtf(i7);
        f0 = commonVariable.f_g0
        f2 = Float64(heapClassInst.heapFloat[(r1 + 110)])
        if (!(f2 <= f0)) {
            f2 = 0.004999999888241291
            if (f0 <= f2) {
                heapClassInst.heap32[(r1 + 80)] = 0
                heapClassInst.heap32[(r1 + 81)] = 0
                heapClassInst.heap32[(r1 + 82)] = 0
                heapClassInst.heap32[(r1 + 83)] = 0
            } else {
                f0 = Float64(heapClassInst.heapFloat[(r1 + 80)])
                f3 = Float64(heapClassInst.heapFloat[(r1 + 81)])
                f4 = Float64(heapClassInst.heapFloat[(r1 + 82)])
                f0 = f0 * f0
                f3 = f3 * f3
                f0 = f0 + f3
                f3 = f4 * f4
                f0 = f0 + f3
                heapClassInst.heapFloat[(g0)] = Float32(f0)
                sqrtf(i7);
                f0 = f1 / commonVariable.f_g0
                f1 = Float64(heapClassInst.heapFloat[(r1 + 80)])
                f3 = Float64(heapClassInst.heapFloat[(r1 + 81)])
                f4 = f1 * f0
                f5 = Float64(heapClassInst.heapFloat[(r1 + 82)])
                f6 = f3 * f0
                f4 = f4 * f2
                f0 = f5 * f0
                f6 = f6 * f2
                f1 = f1 - f4
                f0 = f0 * f2
                f2 = f3 - f6
                heapClassInst.heapFloat[(r1 + 80)] = Float32(f1)
                f0 = f5 - f0
                heapClassInst.heapFloat[(r1 + 81)] = Float32(f2)
                heapClassInst.heapFloat[(r1 + 82)] = Float32(f0)
                return;
            }
        }
    }
    return;
}

func _GLOBAL__I__ZN7btClockC2Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = _ZL13gProfileClock_2E_0
    heapClassInst.heap32[(g0)] = 8
    r0 = r0 >> 2
    _Znwj(i7);
    heapClassInst.heap32[(r0)] = Int32(commonVariable.r_g0)
    heapClassInst.heap32[(g0)] = Int32(commonVariable.r_g0)
    heapClassInst.heap32[(g0 + 1)] = 0
    r0 = _ZN15CProfileManager4RootE
    r1 = r0 >> 2
    r2 = _E2_str729
    gettimeofday(i7);
    heapClassInst.heap32[(r1)] = Int32(r2)
    heapClassInst.heap32[(r1 + 1)] = 0
    heapClassInst.heap32[(r1 + 2)] = 0
    heapClassInst.heap32[(r1 + 3)] = 0
    heapClassInst.heap32[(r1 + 4)] = 0
    heapClassInst.heap32[(r1 + 5)] = 0
    heapClassInst.heap32[(r1 + 6)] = 0
    heapClassInst.heap32[(r1 + 7)] = 0
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZN12CProfileNode5ResetEv(i7);
    return;
}

func _GLOBAL__D__ZN7btClockC2Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = _ZN15CProfileManager4RootE
    r1 = _ZL13gProfileClock_2E_0
    heapClassInst.heap32[(g0)] = Int32(r0)
    r0 = r1 >> 2
    _ZN12CProfileNodeD1Ev(i7);
    r0 = Int64(heapClassInst.heap32[(r0)])
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

func _ZN12CProfileNodeD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0 + 6)])
    if (!(r1 == 0)) {
        heapClassInst.heap32[(g0)] = Int32(r1)
        _ZN12CProfileNodeD1Ev(i7);
        heapClassInst.heap32[(g0)] = Int32(r1)
        _ZdlPv(i7);
    }
    r0 = Int64(heapClassInst.heap32[(r0 + 7)])
    if (!(r0 == 0)) {
        heapClassInst.heap32[(g0)] = Int32(r0)
        _ZN12CProfileNodeD1Ev(i7);
        heapClassInst.heap32[(g0)] = Int32(r0)
        _ZdlPv(i7);
    }
    return;
}

func _ZN15CProfileManager5ResetEv(sp: Int64): Unit {
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
    r0 = _ZL13gProfileClock_2E_0
    r0 = r0 >> 2
    r1 = Int64(heapClassInst.heap32[(r0)])
    heapClassInst.heap32[(g0)] = Int32(r1)
    heapClassInst.heap32[(g0 + 1)] = 0
    gettimeofday(i7);
    r1 = _ZN15CProfileManager4RootE
    heapClassInst.heap32[(g0)] = Int32(r1)
    r1 = r1 >> 2
    _ZN12CProfileNode5ResetEv(i7);
    r2 = Int64(heapClassInst.heap32[(r1 + 1)])
    r2 = (r2 + 1) | 0
    heapClassInst.heap32[(r1 + 1)] = Int32(r2)
    r2 = Int64(heapClassInst.heap32[(r1 + 4)])
    r3 = (r2 + 1) | 0
    heapClassInst.heap32[(r1 + 4)] = Int32(r3)
    if (!(r2 != 0)) {
        r2 = sp + (-16)
        heapClassInst.heap32[(g0)] = Int32(r2)
        heapClassInst.heap32[(g0 + 1)] = 0
        gettimeofday(i7);
        r0 = Int64(heapClassInst.heap32[(r0)])
        r0 = r0 >> 2
        r2 = r2 >> 2
        r3 = Int64(heapClassInst.heap32[(fp + (-4))])
        r4 = Int64(heapClassInst.heap32[(r0)])
        r3 = (r3 - r4) | 0
        r2 = Int64(heapClassInst.heap32[(r2 + 1)])
        r0 = Int64(heapClassInst.heap32[(r0 + 1)])
        r0 = (r2 - r0) | 0
        r2 = (r3 * 1000000) | 0
        r0 = (r0 + r2) | 0
        heapClassInst.heap32[(r1 + 3)] = Int32(r0)
    }
    r0 = _ZN15CProfileManager12FrameCounterE
    r0 = r0 >> 2
    heapClassInst.heap32[(r0)] = 0
    r0 = sp + (-8)
    heapClassInst.heap32[(g0)] = Int32(r0)
    heapClassInst.heap32[(g0 + 1)] = 0
    gettimeofday(i7);
    return;
}

func _GLOBAL__I__ZN4__rw9__catfindEPNS_8__rw_catE(sp: Int64): Unit {
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
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = _ZN4__rwL12__rw_catlistE_2E_0
    r1 = _ZN4__rwL12__rw_catlistE_2E_1
    r0 = r0 >> 2
    r2 = _ZN4__rwL12__rw_catlistE_2E_2
    r1 = r1 >> 2
    heapClassInst.heap32[(r0)] = 0
    r2 = r2 >> 2
    heapClassInst.heap32[(r1)] = 0
    heapClassInst.heap32[(r2)] = 0
    heapClassInst.heap32[(g0)] = 136
    _Znwj(i7);
    r3 = commonVariable.r_g0
    if (!(r3 != 0)) {
        heapClassInst.heap32[(g0)] = 3
        _ZN4__rw10__rw_throwEiz(i7);
    }
    r4 = (r3 + 136) | 0
    heapClassInst.heap32[(g0)] = 0
    _ZdlPv(i7);
    r5 = Int64(heapClassInst.heap32[(r0)])
    if (r5 == 0) {
        r8 = r3
    } else {
        r6 = r5
        r7 = r3
        while (true) {
            r9 = r6 >> 2
            r6 = (r6 + 4) | 0
            r8 = (r7 + 4) | 0
            r7 = r7 >> 2
            r9 = Int64(heapClassInst.heap32[(r9)])
            heapClassInst.heap32[(r7)] = Int32(r9)
            r7 = r8
            if (r6 != 0) {
                continue
            } else {
                break
            }
        }
    }
    r6 = 0
    while (true) {
        r7 = r6 << 2
        r7 = (r8 + r7) | 0
        r6 = (r6 + 1) | 0
        r7 = r7 >> 2
        heapClassInst.heap32[(r7)] = 0
        if (r6 != 2) {
            continue
        } else {
            break
        }
    }
    r6 = Int64(heapClassInst.heap32[(r1)])
    if (r6 == 0) {
        r6 = (r8 + 8) | 0
        heapClassInst.heap32[(r0)] = Int32(r3)
        heapClassInst.heap32[(r1)] = Int32(r6)
        heapClassInst.heap32[(r2)] = Int32(r4)
        heapClassInst.heap32[(g0)] = Int32(r5)
        _ZdlPv(i7);
        return;
    } else {
        abort(i7);
    }
}

func _GLOBAL__D__ZN4__rw9__catfindEPNS_8__rw_catE(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = _ZN4__rwL12__rw_catlistE_2E_0
    r1 = _ZN4__rwL12__rw_catlistE_2E_1
    r0 = r0 >> 2
    r1 = r1 >> 2
    r0 = Int64(heapClassInst.heap32[(r0)])
    r2 = Int64(heapClassInst.heap32[(r1)])
    r3 = (r2 - r0) | 0
    r3 = r3 >> 2
    if (!(r3 == 0)) {
        r3 = r3 << 2
        r2 = (r2 - r3) | 0
        heapClassInst.heap32[(r1)] = Int32(r2)
    }
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}

func _ZN4__rw10__rw_facetD1Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTVN4__rw10__rw_facetE
    r0 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r0)] = Int32(r1)
    heapClassInst.heap32[(r0 + 5)] = (-1)
    r1 = Int64(heapClassInst.heap32[(r0 + 1)])
    r2 = Int64(heapClassInst.heap32[(r0 + 2)])
    if (!(r1 == r2)) {
        if (!(r1 == 0)) {
            heapClassInst.heap32[(g0)] = Int32(r1)
            _ZdaPv(i7);
        }
    }
    r1 = _ZZN4__rw10__rw_facetD4EvE9destroyed
    heapClassInst.heap32[(r0 + 1)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r0 + 4)])
    if (!(r1 != (-1))) {
        r0 = Int64(heapClassInst.heap32[(r0 + 3)])
        heapClassInst.heap32[(g0)] = Int32(r0)
        _ZdlPv(i7);
    }
    return;
}

func _ZN4__rw10__rw_facetD0Ev(sp: Int64): Unit {
    var i7: Int64 = 0
    var fp = sp >> 2;
    var r0: Int64 = 0
    var r1: Int64 = 0
    var r2: Int64 = 0
    var r3: Int64 = 0
    var __label__ = 0;
    i7 = sp + (-8)
    var g0 = i7 >> 2;
    r0 = Int64(heapClassInst.heap32[(fp)])
    r1 = _ZTVN4__rw10__rw_facetE
    r2 = r0 >> 2
    r1 = (r1 + 8) | 0
    heapClassInst.heap32[(r2)] = Int32(r1)
    heapClassInst.heap32[(r2 + 5)] = (-1)
    r1 = Int64(heapClassInst.heap32[(r2 + 1)])
    r3 = Int64(heapClassInst.heap32[(r2 + 2)])
    if (!(r1 == r3)) {
        if (!(r1 == 0)) {
            heapClassInst.heap32[(g0)] = Int32(r1)
            _ZdaPv(i7);
        }
    }
    r1 = _ZZN4__rw10__rw_facetD4EvE9destroyed
    heapClassInst.heap32[(r2 + 1)] = Int32(r1)
    r1 = Int64(heapClassInst.heap32[(r2 + 4)])
    if (!(r1 != (-1))) {
        r1 = Int64(heapClassInst.heap32[(r2 + 3)])
        heapClassInst.heap32[(g0)] = Int32(r1)
        _ZdlPv(i7);
    }
    heapClassInst.heap32[(g0)] = Int32(r0)
    _ZdlPv(i7);
    return;
}
