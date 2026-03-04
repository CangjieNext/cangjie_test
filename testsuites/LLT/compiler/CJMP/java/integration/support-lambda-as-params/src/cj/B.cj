/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cj

import interoplib.interop.*
import java.lang.*

public open class B {
    public open func testLambda(a:(Int32) -> Int32):(Int32) -> Int32 {
        print("CJ: at cj B testLambda(), param fun ret: ${a(10)}\n", flush:true)
        return {b : Int32 => b + 2 }
    }
}