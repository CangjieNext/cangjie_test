// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgB

internal import pkgA.*

var x = A<Int64>()

public func test(ins: I<Int64>) {
    return ins is A<Int64>
}
