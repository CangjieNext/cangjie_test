/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public interface I1 {
  public I1 foo();

  public int goo(I1 a);

  public static int bar() {
    System.out.println("in I1 bar");
    return 1;
  }
}
