/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I {
    static func sf(): Int64 {
        return 1
    }
}

class C <: I {
    redef public static func sf(): Int64 {
        return 2
    }
}

class S {
    static public func sf(): Int64 {
        return 1
    }

    static private func sp(): Int64 {
        return 3
    }

    static protected func sq(): Int64 {
        return 4
    }

    static public var sv: Int64 = 2

    static private var sw: Int64 = 5

    public func use(): Int64 {
        return S.sf() + S.sp() + S.sq() + S.sv + S.sw
    }
}

main() {
    println(C.sf())
    println(S().use())
}
