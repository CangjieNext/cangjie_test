// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package liba

import libb

public func greetA(): String {
    return "liba+" + libb.greetB()
}

public func wrapB(v: Int64): Int64 {
    return libb.ItemB(v).doubled()
}