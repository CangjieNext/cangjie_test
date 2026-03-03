// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { user.cmp.arch.big }
package cmp

import std.random.*

public specific func foo():String {
 	   println("user.cmp.arch.big")
	   return "big"
 	 }
 	 
public func p1() {
    foo()
}
