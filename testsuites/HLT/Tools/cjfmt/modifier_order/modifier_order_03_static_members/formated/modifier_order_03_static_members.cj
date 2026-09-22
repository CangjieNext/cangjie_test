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
    public static redef func sf(): Int64 {
        return 2
    }
}

class S {
    public static func sf(): Int64 {
        return 1
    }

    private static func sp(): Int64 {
        return 3
    }

    protected static func sq(): Int64 {
        return 4
    }

    public static var sv: Int64 = 2

    private static var sw: Int64 = 5

    public func use(): Int64 {
        return S.sf() + S.sp() + S.sq() + S.sv + S.sw
    }
}

main() {
    println(C.sf())
    println(S().use())
}
