// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cmp

import cmp.pkg2.*

public common func foo(): Unit

public func boo() {
    print("call from boo: ")
    foo()

    f2()
}