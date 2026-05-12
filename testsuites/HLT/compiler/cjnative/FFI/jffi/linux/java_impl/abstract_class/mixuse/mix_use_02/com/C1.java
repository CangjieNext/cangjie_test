/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public abstract class C1 implements I1 {
  public C1() {
    System.out.println("in C1 init");
  }

  public int foo3() {
    return 300;
  }

  public static int goo3() {
    return 1000;
  }

  public abstract int foo4();
}
