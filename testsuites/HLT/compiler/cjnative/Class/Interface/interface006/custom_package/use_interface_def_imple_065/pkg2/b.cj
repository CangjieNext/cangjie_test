/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public var x: Int32 = 0

public enum myEnum<T> <: MyInterface<Int32> {
    A

    public static func foo1(): Int32 {
        x = 1
        return x
    }
}
