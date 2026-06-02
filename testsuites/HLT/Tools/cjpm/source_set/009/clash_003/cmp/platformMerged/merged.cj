// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

features { user.cmp.arch.little, user.cmp.arch.big }
package cmp

public specific func foo():Float64 {
 	   println("child")
	   return 4.0
 	 }
 	 
public func child() {
    foo()
}