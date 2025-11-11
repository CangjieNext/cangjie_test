/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.LogLevel
import stdx.logger.SimpleLogger
import std.console.*

main(): Int64 {
  var logger = SimpleLogger(Console.stdOut)
  try {
    throw ArithmeticException()
  } catch (e: Exception) { 
    var str:String = """
    Login success ,useauthr is asessionnd ~!@#$%^&*()_+{
    iivv}|[account]\\encode\\-=`:"?>mail<,./ ipasswds"""
    logger.log(LogLevel.ERROR,str)
  }
  0
}
