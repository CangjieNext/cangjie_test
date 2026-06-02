// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg2

internal import pkg1.*
internal import pkg1.*

public var t = 1

func f2() {
    t = t + 1
    return t
}

public var tTensor = f2()
