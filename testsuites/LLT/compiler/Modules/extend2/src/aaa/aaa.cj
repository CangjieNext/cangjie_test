// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package aaa

internal import aab.*
internal import aac.*

public interface Ia {}

extend Rune <: Ia {}

public func foo() {
    var a: Ia = r'q'
    return 0
}
