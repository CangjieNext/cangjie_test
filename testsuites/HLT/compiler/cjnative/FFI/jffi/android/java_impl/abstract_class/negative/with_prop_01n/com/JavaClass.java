/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.example.myapplication.Logger;

abstract class C1 {
  public int v1 = 1;
  public static int v2 = 2;

  public C1() {
    Logger.println("in C1 init" + v1 + v2);
  }

  public int goo() {
    Logger.println("in C1 goo");
    return v1;
  }

  public static int bar() {
    Logger.println("in C1 bar");
    return v2;
  }

  public abstract int newoo();
}

public class JavaClass extends C1 {
  public JavaClass() {
    Logger.println("in JavaClass Init" + v1 + v2);
  }

  public static int bar() {
    Logger.println("in JavaClass bar");
    return v2 + 100;
  }

  public int newoo() {
    Logger.println("in JavaClass new newoo");
    return v1 + 10000;
  }
}
