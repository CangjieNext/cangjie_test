/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package enums

public struct SSSS <: Equatable<SSSS> & ToString {
    // public var xxxx: (Int64, Int32) = (555, Int32(444))
    public SSSS(public let xxxx: (Int64, Int32)) {}
    public operator func ==(another: SSSS): Bool {
        println("this.xxxx[0] = ${this.xxxx[0]}")
        println("another.xxxx[0] = ${another.xxxx[0]}")
        println("this.xxxx[1] = ${this.xxxx[1]}")
        println("another.xxxx[1] = ${another.xxxx[1]}")
        this.xxxx[0] == another.xxxx[0] && this.xxxx[1] == another.xxxx[1]
    }
    public operator func !=(another: SSSS): Bool {
        !(this == another)
    }
    public func toString(): String {
        "SSSS(${this.xxxx[0]}, ${this.xxxx[1]})"
    }
}