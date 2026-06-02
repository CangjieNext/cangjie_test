// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.io.*
internal import stdx.net.http.*
internal import std.regex.*

class A{
  static var a: HttpResponse = ClientBuilder().build().get("http://127.0.0.1:10245/foo")
}

main(): Int64 {
  var REGEX_PATTER: Regex = Regex(A.a.toString())
  0
}