// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg3

import define.*

public func test(): Int64 {
    test<Int64>()
    println(aa)
    if (aa != "pkg2") {
        return 1
    }
    return 0
}
