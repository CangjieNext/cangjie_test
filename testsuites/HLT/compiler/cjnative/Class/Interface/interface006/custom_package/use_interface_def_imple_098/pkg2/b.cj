/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public struct myStruct<T> {
    public var x: Bool = true
}

extend<T> myStruct<T> <: MyInterface<Bool> {
    public mut func foo1(): Bool {
        x = false
        return x
    }
}
