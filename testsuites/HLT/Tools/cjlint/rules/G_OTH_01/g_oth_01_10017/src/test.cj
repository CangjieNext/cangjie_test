/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.logger.SimpleLogger
import std.console.Console

/*
 * @throws ArithmeticException
 */
main(): Int64 {
  try {
    throw ArithmeticException()
  } catch (e: Exception) { 
    var str:String = """
    Login success ,user is and ~!@#$%^&*()_+{
    auth}|[]\\-=`:"?><,./ is"""
    SimpleLogger(Console.stdOut).log(LogLevel.ERROR,"${str}")
  }
  0
