// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
public struct S {
  var x: Float64
  public var y: Float64

  init(x: Float64, y: Float64) {
    this.x = x
    this.y = y
  }
}

func foo(x: S) {
  x
}

main() {}