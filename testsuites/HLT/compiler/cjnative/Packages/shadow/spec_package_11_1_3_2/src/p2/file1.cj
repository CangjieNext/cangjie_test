/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p2

import p1.foo as f1 // rename foo defined in p1 as f1

func foo() {
    return 1
}

public var result1: Int64 = f1()
public var result2: Int64= foo()
