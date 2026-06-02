/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
internal import std.math.*
internal import std.time.*

let OK = "ok"
let ERR = "err"
let ARITHMETIC_EXCEPTION_OF_DURATION = "Out of range of representation of 'Duration'!"
let HOUR_PER_DAY: Int64 = 24
let MS_PER_SECS: Int64 = 1000
let US_PER_MS: Int64 = 1000
let MINUTES_PER_HOUR: Int64 = 60
let SECS_PER_MINUTE: Int64 = 60
let NS_PER_US: Int64 = 1000
let NS_PER_MS: Int64 = 1000 * NS_PER_US
let NS_PER_SECOND: Int64 = 1000 * NS_PER_MS
let NS_PER_MINUTE: Int64 = 60 * NS_PER_SECOND
let NS_PER_HOUR: Int64 = 60 * NS_PER_MINUTE
let NS_PER_DAY: Int64 = 24 * NS_PER_HOUR
let INT64_MAX: Int64 = Int64.Max
let INT64_MIN: Int64 = Int64.Min
let DURATION_1234567 = getDuration(1, 2, 3, 4, 5, 6, 7)
let DURATION_7654321 = getDuration(7, 6, 5, 4, 3, 2, 1)
let DURATION_8888888 = getDuration(8, 8, 8, 8, 8, 8, 8)

public func getDuration(d: Int64, h: Int64, m: Int64, s: Int64, ms: Int64, us: Int64, ns: Int64): Duration {
    let rns = d * NS_PER_DAY + h * NS_PER_HOUR + m * NS_PER_MINUTE + s * NS_PER_SECOND + ms * NS_PER_MS + us * NS_PER_US +
        ns
    return Duration.nanosecond * rns
}

public func absDurationToString(duration: Duration): String {
    return try {
        duration.abs().toString()
    } catch (e: Exception) {
        e.message
    }
}

public func durationAdd(a: Duration, b: Duration): String {
    return try {
        (a + b).toString()
    } catch (e: ArithmeticException) {
        e.message
    }
}

public func durationSubstract(a: Duration, b: Duration): String {
    return try {
        (a - b).toString()
    } catch (e: ArithmeticException) {
        e.message
    }
}

public func durationMultiplyInt64(a: Duration, b: Int64): String {
    return try {
        (a * b).toString()
    } catch (e: ArithmeticException) {
        e.message
    }
}

public func durationMultiplyFloat64(a: Duration, b: Float64): String {
    return try {
        (a * b).toString()
    } catch (e: Exception) {
        e.message
    }
}

public func int64MultiplyDuration(a: Int64, b: Duration): String {
    return try {
        (a * b).toString()
    } catch (e: ArithmeticException) {
        e.message
    }
}

public func float64MultiplyDuration(a: Float64, b: Duration): String {
    return try {
        (a * b).toString()
    } catch (e: Exception) {
        e.message
    }
}

public func durationDivideInt64(a: Duration, b: Int64): String {
    return try {
        (a / b).toString()
    } catch (e: Exception) {
        e.message
    }
}

public func durationDivideFloat64(a: Duration, b: Float64): String {
    return try {
        (a / b).toString()
    } catch (e: Exception) {
        e.message
    }
}
