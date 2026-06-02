// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package fibonacci

public const func fib(n: Int64) : Int64 {
  if (n < 2) {
    return n
  }
  return fib(n - 1) + fib(n - 2)
}

public const fifth_fibonacci = fib(5)