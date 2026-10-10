/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0

package test0

public abstract class Base {
    public open func foo(): Int64
}

public class OnlyLocal <: Base {
    public func foo(): Int64 {
        2
    }
}

public func call(b: Base): Int64 {
    b.foo()
}

// Keep `call` reachable under executable-mode DCE when compiling this package alone.
public let __keepCall: Int64 = call(OnlyLocal())
