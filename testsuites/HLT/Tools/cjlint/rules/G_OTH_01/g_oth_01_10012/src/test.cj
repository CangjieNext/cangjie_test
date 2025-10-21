/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.logger.SimpleLogger
import std.console.*

class A{
  var str:String = ##"
  Login success ,user is and ~!@#$%^&token*()_+{
  }|[${pfesd}]\\-=`:"?><,./ is"##
}

main(): Int64 {
  if (A().str != ""){
    do{
      SimpleLogger(Console.stdOut).trace(A().str)
    }while(A().str == "")
  }
  0
