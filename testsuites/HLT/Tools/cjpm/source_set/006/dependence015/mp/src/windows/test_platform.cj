/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

features { user.mp.windowsorlinux }
package mp

public specific func foo(): Unit {
    println("hello windowsorlinux")
}

public func test_plat(): Unit {
    foo()
}
