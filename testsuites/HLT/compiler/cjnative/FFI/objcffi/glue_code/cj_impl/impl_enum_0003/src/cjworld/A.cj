/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package cjworld

import objc.lang.*

public enum A {
    | EBool(Bool)
    | Eu8(UInt8)
    | Eu16(UInt16)
    | Eu32(UInt32)
    | Eu64(UInt64)
    | EuN(UIntNative)
    | Ef32(Float32)
    | Ef64(Float64)
    public func f() {
        println("in cj enum")
    }
}
