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
  var logger = SimpleLogger(Console.stdOut)
  var str:String = ##"
  Login success ,user is and ~!@#$%^&token*()_+{
  }|["${9988psdkk}""]\\-=`:"?><,./ is"##
  do{
    if (str != ""){
      logger.info(str)
    }
  }while(str == "")
  0
}
