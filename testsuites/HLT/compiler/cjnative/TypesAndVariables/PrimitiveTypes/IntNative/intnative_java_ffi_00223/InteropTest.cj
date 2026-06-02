/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

import java.lang.*

@Java
public interface Serializable {}

@Java
public class InteropTest <: Serializable {
    public var firstName: IntNative = 0
    public var lastName: IntNative = 0
    public var description: Int32 = 0

    public static func serialize(interopTest: InteropTest): Unit {}
    public static func deserialize(): InteropTest {
        return InteropTest()
    }
}
