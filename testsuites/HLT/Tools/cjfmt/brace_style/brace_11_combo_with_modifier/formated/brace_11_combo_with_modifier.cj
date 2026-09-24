/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Mod {
    public static let s: Int64 = 1
    public init() {
    }
    public static func sf(): Int64 {
        return s
    }
    public func get(): Int64 {
        return sf()
    }
}

class Other {
    private static var v: Int64 = 5
    public static func ov(): Int64 {
        return v
    }
    public init() {
    }
    public func use(): Int64 {
        return Other.ov()
    }
}

main() {
    let m = Mod()
    let o = Other()
    println(m.get())
    println(o.use())
}
