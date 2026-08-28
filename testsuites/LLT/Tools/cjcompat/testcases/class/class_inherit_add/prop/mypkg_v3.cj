// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I1 {
  prop a1: Int64
}

interface I2 {
  prop a2: Int64 {
    get() { 2 }
  }
}

interface I3 <: I1 {
  prop a3: Int64 {
    get() { 3 }
  }
}

interface I4 <: I2 {
  prop a4: Int64 {
    get() { 4 }
  }
}

interface I5 <: I3 {
  prop a1: Int64 {
    get() { 1 }
  }
  prop a5: Int64 {
    get() { 5 }
  }
}

public abstract class C1 <: I3 {

}

public class C2 {

}
