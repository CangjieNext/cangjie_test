/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package UNNAMED

import interoplib.interop.*
import java.lang.*

public interface AnotherCangjieInterface {
    public func getValue(): Int64
}

public class CangjieClassThatImplementsAnotherCangjieInterface <: AnotherCangjieInterface {
    public func getValue(): Int64 {
        114514i64
    }
}

public struct CangjieStruct {
    public static func foo(param0: Int8, param1!: JString,
        param2!: AnotherCangjieInterface = CangjieClassThatImplementsAnotherCangjieInterface()): JArray<Int32> {
        JArray<Int32>(114514i32)
    }
}
