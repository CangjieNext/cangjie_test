// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public let a = 1
public var b = 2

public func koo() {
    a + b
}

public interface IA {
    func foo(): Int64
}

public open class CBase <: IA {
    public func goo(): Int64 {
        5
    }

    public open func foo(): Int64 {
        8
    }
}

public class CA <: CBase & IA {
    public var a = 5
    public func foo(): Int64 {
        goo() + a
    }
}

main() {
    0
}
