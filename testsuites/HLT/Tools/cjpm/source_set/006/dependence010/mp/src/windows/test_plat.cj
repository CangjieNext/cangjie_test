/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

features { os.windows }
package mp
import mp1.*

public specific func f(): Int64 {
    println("Hello")
    0
}

public func test_plat(): Unit {
    f()
    println(a)
}
