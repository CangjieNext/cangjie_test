// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import ast.*

var top_a = 10

main() {
    let arrayTest: Array<Int64> = [0, 1, 2]

    try {
        let lastElement = arrayTest[3]
    } catch (e: ArithmeticException | ArrayIndexOutOfBoundsException) {
        print("exception info: " + e.toString())
    } catch (e: Exception) {
        print("neither ArithmeticException nor ArrayIndexOutOfBoundsException, exception info: " + e.toString())
    } finally {
        print("the finally block is executed")
    }

    try {
        let lastElement = arrayTest[3]
    } catch (_) {
        print("catch an exception!")
    }
    try {} catch (e: Exception) {} finally  {}
}
