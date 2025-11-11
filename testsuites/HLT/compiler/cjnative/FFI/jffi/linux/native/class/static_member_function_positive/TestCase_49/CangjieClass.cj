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

public enum AnotherCangjieEnum {
    | A(Int64)
    | B(Int64)
    | C(Int64)

    public func getValue(): Int64 {
        match (this) {
            case A(v) => v

            case B(v) => v

            case C(v) => v
        }
    }
}

public class CangjieClass {
    public static func foo(param0: JArray<Int8>, param1!: Int64, param2!: Float32 = 114.514000f32): AnotherCangjieEnum {
        AnotherCangjieEnum.A(114514i64)
    }
}
