/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg3

import pkg2.*

public func call(): Int64 {
    if (myClass1.foo2<UInt8>(a: 1) == 1 && myClass2.foo2<UInt8>(a: 1) == 1 && myClass3.foo2<UInt8>(a: 1) == 1 &&
        myClass1.x == 20 && myClass2.x == 30 && myClass3.x == 40) {
        return 0
    }
    return 1
}
