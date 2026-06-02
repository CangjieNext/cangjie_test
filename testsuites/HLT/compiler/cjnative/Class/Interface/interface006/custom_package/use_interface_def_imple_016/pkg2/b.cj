/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public class myClass<T> <: MyInterface<Bool> {
    static var x: Bool = true
    public static func f(): Bool {
        x = false
        return x
    }
    public static func foo1(): Bool {
        f()
    }
}

public func call(): Int64 {
    if (myClass<Bool>.foo2(a: true) && !myClass<Bool>.x) {
        return 0
    } else {
        return 1
    }
}
