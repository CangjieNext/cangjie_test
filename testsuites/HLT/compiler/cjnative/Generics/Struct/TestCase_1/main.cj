/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package packageA

public struct S<T> {
    public init(a: T) {
        this.a = a
    }
    let a: T

    public func f1(): Unit {
        this.f2()
        {
            => a
        }()
    }

    public func f2(): Unit {
    }
}

main(): Unit {
}
