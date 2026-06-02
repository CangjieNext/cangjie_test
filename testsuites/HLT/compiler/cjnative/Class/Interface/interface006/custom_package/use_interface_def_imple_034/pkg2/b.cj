/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public enum myEnum <: MyInterface1<Int32> & MyInterface2<Int32> & MyInterface3<Int32> {
    A

    public static func foo1(): Int32 {
        1
    }
    public static func foo2(): Int32 {
        2
    }
    public static func foo3(): Int32 {
        3
    }
}

public func call(): Int64 {
    if (myEnum.b1() == 1 && myEnum.b2() == 2 && myEnum.b3() == 3) {
        return 0
    } else {
        return 1
    }
}
