/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.log.*
import std.io.*
import stdx.net.http.*
import std.regex.*

func foo(a:HttpResponse){
	let REGEX_PATTER: Regex = Regex(a.status.toString())
  return a
}

main(): Int64 {
  try{
    var a: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/foo")
    foo(a)
  }catch(_){HttpResponseBuilder().build()}
  0
}

