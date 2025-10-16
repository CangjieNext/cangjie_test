// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package binDep2.aoo

import binDep1.aoo.*

public func binDep2Aoo(): Unit {
    binDep1Aoo()
    println("binDep2Aoo")
}
