/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p2

import p1.C
import p1.Add

func Bar() {
    var obj2 = C() // OK, the imported class C is visible to all files of current package.
    1.add(2) // OK, the imported extend declaration is visible to all files of current package.
    2.minus(1) // OK, the extend declaration is visible to all files of current package.
}

public var b2: Int64 = Bar()
