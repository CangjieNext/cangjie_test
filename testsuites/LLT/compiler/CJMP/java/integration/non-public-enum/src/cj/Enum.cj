// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*
import java.lang.*

// =============================================
// Enum Definition: Basic Enum (TimeUnit)
// =============================================
enum TimeUnit {
    | Year(Int64)
    | Month(Int64)
    | Year
    | Month

    // The public method to Calculate how many months.
    public func CalcMonth(): Unit {
        let s = match (this) {
            case Year(n) => "x has ${n * 12} months\n"
            case Year => "x has 12 months\n"
            case TimeUnit.Month(n) => "x has ${n} months\n"
            case Month => "x has 1 month\n"
        }
        print(s, flush: true)
    }

    // The static method to return ten years.
    public static func TenYear(): TimeUnit {
        Year(10)
    }
}
