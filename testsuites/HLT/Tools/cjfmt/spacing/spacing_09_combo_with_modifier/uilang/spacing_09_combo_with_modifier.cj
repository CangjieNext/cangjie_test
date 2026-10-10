/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class VM {
    public static var sv: Int64 = 1
    public static func sf(): Int64 {
        return sv
    }
    private static func sp(): Int64 {
        return sv + 1
    }
    public init() {
    }
    public func use(): Int64 {
        return sf() + sp()
    }
}

class W {
    private static let wv: Int64 = 9
    public init() {
    }
    public func wu(): Int64 {
        return wv
    }
}

main() {
    let v = VM()
    let w = W()
    println(v.use())
    println(w.wu())
}
