// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjworld

import interoplib.objc.*

// =============================================
// Enum Definition: Basic Enum (TimeUnit)
// =============================================
public enum TimeUnit {
    | Year(Int64)
    | Month(Int64)
    | Year
    | Month

    public func NumCalcMonth(): Int64 {
        let s = match (this) {
            case Year(n) => n * 12
            case Year => 12
            case Month(n) => n
            case Month => 1
        }
        s
    }
    // The public method to Calculate how many months.
    public func CalcMonth(): Unit {
        let s = match (this) {
            case Year(n) => "x has ${n * 12} months\n"
            case Year => "x has 12 months\n"
            case Month(n) => "x has ${n} months\n"
            case Month => "x has 1 month\n"
        }
        print(s, flush: true)
    }

    // The static method to return ten years.
    public static func TenYear(): TimeUnit {
        Year(10)
    }

    // The static function with an enum param and return Int64
    public static func KindOfTime(timeUnit: TimeUnit): Int64 {
        let s = match (timeUnit) {
            case Year(n) => 0
            case Year => 1
            case Month(n) => 2
            case Month => 3
        }
        s
    }

    public prop item: Int64 {
        get() {
            112233
        }
    }

    // Prop return an enumty object.
    public prop toMonth: TimeUnit {
        get() {
            TimeUnit.Month(this.NumCalcMonth());
        }
    }
}
