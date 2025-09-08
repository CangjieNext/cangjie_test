package p2
import p1.*

public class B {
    var ip: Array<Byte> = Array<Byte>()
    var mask: Array<Byte> = Array<Byte>()

    public init(ip!: Array<Byte> = [], mask!: Array<Byte> = []) {
        this.ip = ip
        this.mask = mask
    }
}

public func too(): Unit {
    A().core()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
