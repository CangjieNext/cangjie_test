// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I0 {
  prop p0: Int64 {
    get() { 1 }
  }
}

public struct S {
}

extend S {
  public prop area: Int64 {
    get() { 1 }
  }
}

extend S <: I0 {

}

interface I1 {
  prop p1: Int64 {
    get() { 1 }
  }
}

interface I2 <: I1 {
  prop p2: Int64 {
    get() { 2 }
  }
}

extend S <: I2 {
}
