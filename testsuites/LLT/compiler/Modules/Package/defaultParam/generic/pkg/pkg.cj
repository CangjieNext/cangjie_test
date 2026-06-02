// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public func getb<T>(): Int32 {
    return 2
}

public func g<T>(b: T): T {
    return b
}

public func foo(a!: Int32 = 1, b!: Int32 = g<Int32>(2)): Int32 {
    return a + b
}
