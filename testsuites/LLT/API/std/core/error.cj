/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan StackOverflowError
/*
 * Test description: Test the funcs for string.cj
 * Test API: public /* sealed */ open class Error <: ToString {
 *             public open prop message: String
 *             public open func toString(): String
 *             public func printStackTrace(): Unit
 *             public func getStackTrace(): Array<StackTraceElement>
 *           }
 */
var a = 1

main() {
    try {
        test()
    } catch (e: Error) {
        e.printStackTrace()
        var a = e.getStackTrace()
        println(e.toString())
    }
    return 0
}

func test(): Unit {
    test()
    a++
}
