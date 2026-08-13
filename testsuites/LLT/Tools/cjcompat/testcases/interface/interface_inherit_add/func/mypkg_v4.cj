// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface B0 {
  func f0(): Unit
}

public interface B1 {
    func f1() {}
}

interface B2 <: B0 {
  func f2() {}
}

interface B3 <: B1 {
  func f3() {}
}

interface B4 <: B2 {
  func f0() {}
  func f3() {}
}

public interface I1 <: B3 {
  
}