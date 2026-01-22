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

public struct CangjieStruct {
    public func foo(param0: JArray<Float64>, param1!: JArray<Int8>, param2!: Float64 = 114.514000f64): JArray<Int32> {
        let comparisonResult_param0 = param0.length == 114514i32
        println("result_param0 = " + comparisonResult_param0.toString())
        let comparisonResult_param1 = param1.length == 114514i32
        println("result_param1 = " + comparisonResult_param1.toString())
        let comparisonResult_param2 = param2 == 114.514000f64
        println("result_param2 = " + comparisonResult_param2.toString())
        JArray<Int32>(114514i32)
    }
}
