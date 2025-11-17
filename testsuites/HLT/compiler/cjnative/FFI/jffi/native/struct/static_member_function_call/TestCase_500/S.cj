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

interface I {}

public struct S <: I {
    public static func foo(param0: Int8, param1!: UInt16, param2!: JArray<Float32> = JArray<Float32>(114514i32)): UInt16 {
        1u16
    }
}
