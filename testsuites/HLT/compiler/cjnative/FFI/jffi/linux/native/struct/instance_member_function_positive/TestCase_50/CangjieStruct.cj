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

public struct CangjieStruct {
    public func foo(param0: Int8, param1!: Int8, param2!: Float64 = 114.514000f64): AnotherCangjieEnum {
        let comparisonResult_param0 = param0 == 1i8
        println("result_param0 = " + comparisonResult_param0.toString())
        let comparisonResult_param1 = param1 == 1i8
        println("result_param1 = " + comparisonResult_param1.toString())
        let comparisonResult_param2 = param2 == 114.514000f64
        println("result_param2 = " + comparisonResult_param2.toString())
        AnotherCangjieEnum.A(114514i64)
    }
}
