// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface B0 {
  prop a0: Int64
}

public interface B1 {
  prop a1: Int64 {
    get() { 1 }
  }
}

interface B2 <: B0 {
  prop a2: Int64 {
    get() { 2 }
  }
}

interface B3 <: B1 {
  prop a3: Int64 {
    get() { 3 }
  }
}

interface B4 <: B2 {
  prop a0: Int64 {
    get() { 0 }
  }
  prop a3: Int64 {
    get() { 3 }
  }
}

public interface I1 <: B3 {
  
}