import stdx.logger.*
import std.posix.*
import std.console.*

struct Test{
  var result = getuid()
  var logger = SimpleLogger(Console.stdOut)
  var c: String = "污点数据"
}

extend Test{
  func foo(){
    var s1 = result
    var s2 = (s1,s1)
    var s3 = [s2]
    var s4 = {s3}()
    var s5 = (s4)
    var s6 = s5[0]
    var s7 = s6[0]
    var s8 = s7.toString()

    logger.error(Test().c)
    logger.error(s8.toString())
    0
  }
}

main(): Int64 {
  Test().foo()
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
