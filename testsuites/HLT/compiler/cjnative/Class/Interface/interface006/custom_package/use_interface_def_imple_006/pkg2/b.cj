/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg2

import pkg1.*

public class myClass1 <: MyInterface {
    public static var x: UInt8 = 10
    public static func foo1(): UInt8 {
        x = 20
        return x
    }
}

public class myClass2 <: MyInterface {
    public static var x: UInt8 = 10
    public static func foo1(): UInt8 {
        x = 30
        return x
    }
}

public class myClass3 <: MyInterface {
    public static var x: UInt8 = 10
    public static func foo1(): UInt8 {
        x = 40
        return x
    }
}
