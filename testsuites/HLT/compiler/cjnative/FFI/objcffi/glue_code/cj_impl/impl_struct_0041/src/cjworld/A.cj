/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public struct A {
    public static var stB: B = B()
    public static var stConstB: B = B()

    public static prop stP: B {get(){stB}}
    public static mut prop stMutP: B {get(){stB} set(v) { stB = v }}
}

public struct B {
    public var a: Int64 = 1
}
