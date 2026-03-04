// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*
import java.lang.*

public enum TimeUnit {
    | Year(Int64)
    | Month(Int64)
    | Year
    | Month
}

extend TimeUnit {
    public func CalcMonth(): Unit {
        let s = match(this) {
            case Year(n) => "cj: x has ${n * 12} months\n"
            case Year => "cj: x has 12 months\n"
            case Month(n) => "cj: x has ${n} months\n"
            case Month => "cj: x has 1 month\n"
        }
        print(s, flush: true)
    }
}

extend TimeUnit {
    public static func TenYear(): TimeUnit {
        Year(10)
    }
}