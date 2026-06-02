/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan nihao
// ASSERT: scan-not never run here

/*
 * Test description: Test the funcs for string.cj
 * Test API: public class CurrentProcess {
 *             public static func atexit(callback: ()-> Unit): Unit
 *             public static func exit(code: Int64): Nothing
 *           }
 */
internal import std.process.*

main() {
    // atExit注册进程退出回调函数
    Process.current.atExit(printText)
    // exit当前进程退出函数，设置退出返回码
    Process.current.exit(10)
    // 后续步骤不会执行
    println("never run here")
    return 0
}

func printText(): Unit {
    println("nihao")
}
