// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package aac

public interface Ic {}

extend Rune <: Ic {}

public func doo() {
    var a: Ic = r'q'
    return 0
}
