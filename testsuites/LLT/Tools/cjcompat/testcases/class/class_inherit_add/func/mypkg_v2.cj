// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I1 {
  func f1(): Unit
}

interface I2 {
  func f2() {}
}

interface I3 <: I1 {
  func f3() {}
}

interface I4 <: I2 {
  func f4() {}
}

interface I5 <: I3 {
  func f1() {}
  func f5() {}
}

public abstract class C1 {

}

public class C2 <: I2 {

}