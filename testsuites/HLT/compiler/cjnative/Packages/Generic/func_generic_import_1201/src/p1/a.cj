/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public func coo<T>(x: T) where T <: B {
    return x
}

public interface B {
    func boo() {
        return 2
    }
}

public class A <: B {
    public var a: Int32
    public init(x: Int32) {
        a = x
    }
}
