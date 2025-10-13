open class C {
    public let x: Int64 = 0
    public let y: Int64 = 0

    static public let sx: Int64 = 0
    static public let sy: Int64 = 0

    public func f(): Int64 { 0 }
    public func g(): Int64 { 1 }

    public open func vf(): Int64 { 0 }
    public open func vg(): Int64 { 1 }

    static func sf(): Int64 { 0 }
    static func sg(): Int64 { 1 }

    func insideUseMemberFunc(): Int64 { g() }
}

func outsideUseMemberFunc(c: C): Int64 {
    c.g()
}

main() {
    let c = C()
    0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
