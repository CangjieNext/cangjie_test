/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.logger.SimpleLogger
import std.console.*

main(): Int64 {
  {
    => SimpleLogger(Console.stdOut).warn("""
      Login success ,user is and ~!@#$%^&*()_+{
      password}|[]\\-=`:"?><,./ is"""
    )
  }()
  0
}
