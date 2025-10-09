import stdx.log.*
import std.io.*
import stdx.net.http.*
import std.regex.*

struct A{
  var a: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/foo")
}

main(): Int64 {
  var REGEX_PATTER: Regex = Regex(A().a.status.toString())
  0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
