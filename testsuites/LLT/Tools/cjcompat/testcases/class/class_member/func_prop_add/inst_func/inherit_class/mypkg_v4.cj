// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I1 {
  func f1(): Int64
  func f2(): Int64
}
abstract class C0 <: I1 {
  public func f0(): Int64
  public open func f1(): Int64 { 0 }
}
public abstract class C1 <: C0 {

}

public abstract class C2 <: C1 {
  public func f0() { 1 }
}
