import stdx.log.*
import stdx.net.http.*
import std.regex.*
import std.console.*

main(): Int64 {
  let arrayTest: Array<Int64> =[0, 1, 2]
  try {
    let lastElement = arrayTest[3]
  } catch (_) {
    var rep = HttpResponseBuilder().build()
    match (Regex("[A-Za-z0-9_]+").matcher(rep.bodySize.toString()).fullMatch()) {
      case None => SimpleLogger(Console.stdOut).error(rep.bodySize.toString())
      case _ => return 1
    }
  }
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
