// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*

public class User {
    public let id: Int32
    public init(id: Int32) {
        this.id = id
    }
}

extend User {
    public func getId(): Int32 {
        return id
    }
}

extend User {
    public static func hello(): Unit {
        print("cj: Hello from static func in cj.User\n", flush: true)
    }
}