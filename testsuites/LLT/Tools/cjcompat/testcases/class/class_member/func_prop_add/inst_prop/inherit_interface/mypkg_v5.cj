// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I0 {
  prop a: Int64 {
    get() { 0 }
  }
}

public class C0 <: I0 {

}

interface I1 {
  prop a1: Int64
  prop a2: Int64
}

interface I2 <: I1 {
  prop a1: Int64 {
    get() { 0 }
  }
}
public abstract class C1 <: I1 {

}
public abstract class C2 <: I2 {
  public prop a2: Int64 {
    get() { 1 }
  }
}