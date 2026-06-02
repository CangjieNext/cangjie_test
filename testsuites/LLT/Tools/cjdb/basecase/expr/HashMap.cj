// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.collection.*

var gmap = HashMap<String, Int64>([("tony", 30), ("Bob", 22), ("jack", 26)])
main() {
  var lmap = HashMap<String, Int64>([("tony", 30), ("Bob", 22), ("jack", 26)])
  gmap["tony"]  
  lmap["tony"]
  gmap.contains("tony")
  lmap.contains("a")
  gmap["tony"] = 3; gmap["tony"]
  lmap["tony"] = 3; lmap["tony"]
  0
}