// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package my_math
public func multiply(a: Int64, b: Int64): Int64 {
    return a * b
}
public func factorial(n: Int64): Int64 {
    if (n <= 1) { return 1 }
    return n * factorial(n - 1)
}