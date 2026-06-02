/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package unusedImport.base_pkg2.base_pkg2_inner

public struct StructViaOverLoad {
    public var width: Int32 = 10
    public var length: UInt32 = 20

    public init() {}
    public init(par_1: Int32, par_2: UInt32) {
        this.width = par_1
        this.length = par_2
    }
    public func fun_withoutBody() : Unit {}
    public func fun_withoutBody(para_1: Int32) : Unit { para_1 }

    public func fun_r1(para_1: Int32, para_2!: Int32 = 1): Int32 {
        var a1: Int32 = para_1
        var b1: Int32 = para_2
        b1 = para_2 + 3
        return a1 + b1
    }

    public func fun_r1(para_1: Int32, para_2: Int32, para_3!: Int32 = -10): Int32 {
        var pri_v1: Int32 = para_1
        var pri_v2: Int32 = para_2
        var pri_v3: Int32 = para_3
        return pri_v1 + pri_v2 + para_3
    }

    public static func fun_rs1(pa_1: Int64) : Int64 {
        var res = (pa_1 + Int64(StructViaOverLoad(-12, 32).width)) << 2
        return res
    }

    public static func fun_rs1(pa_1: Int32, pa_2!: Int32, pa_3!: Int32 = 64) : Int32 {
        var va1 = pa_1
        return va1 + pa_2 + pa_3
    }
}
