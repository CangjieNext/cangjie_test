/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

/*
 * Test description:
 *           Test class SocketException and class SocketTimeoutException
 * Test API:
 *           public func toString(): String
 * Test Exception:
 *           SocketException
 *          SocketTimeoutException
 */

internal import std.net.*

main(): Int64 {
    var socketException0 = SocketException()
    try {
        throw socketException0
    } catch (e: SocketException) {
        println(e)
    }
    var socketException = SocketException("This is a SocketException!")
    try {
        throw socketException
    } catch (e: SocketException) {
        if (e.message != "This is a SocketException!") {
            return 1
        }
    }

    var socketTimeoutException0 = SocketTimeoutException()
    try {
        throw socketTimeoutException0
    } catch (e: SocketTimeoutException) {
        println(e)
    }
    var socketTimeoutException = SocketTimeoutException("This is a SocketTimeoutException!")
    try {
        throw socketTimeoutException
    } catch (e: SocketTimeoutException) {
        if (e.message != "This is a SocketTimeoutException!") {
            return 2
        }
    }
    return 0
}
