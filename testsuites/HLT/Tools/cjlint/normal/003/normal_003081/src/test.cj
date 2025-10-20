import stdx.logger.*
import stdx.net.http.*
import std.console.*

main(): Int64 {
  { =>
    var rep = HttpResponseBuilder().build()
    var sta: Int32 = Int32(rep.status)
    SimpleLogger(Console.stdOut).trace(rep.status.toString()) // cjlint-ignore !G.CHK.01 !G.CHK.02
  }()
  0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
