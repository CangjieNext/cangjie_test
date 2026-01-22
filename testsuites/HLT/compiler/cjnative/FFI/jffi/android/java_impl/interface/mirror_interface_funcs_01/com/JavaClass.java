/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.example.myapplication.Logger;

interface I1 {
  public I1 foo();

  public int goo(I1 a);

  public static int bar() {
    Logger.println("in I1 bar");
    return 1;
  }
}

public class JavaClass implements I1 {
  public JavaClass() {
    Logger.println("in JavaClass Init");
  }

  public I1 foo() {
    Logger.println("in JavaClass foo");
    return new JavaClass();
  }

  public int goo(I1 a) {
    Logger.println("in JavaClass goo");
    return 10;
  }

  public static int bar() {
    Logger.println("in JavaClass bar");
    return 100;
  }

  public int goo() {
    Logger.println("in JavaClass new goo");
    return 1000;
  }

  public static int bar(int a) {
    Logger.println("in JavaClass new bar");
    return a;
  }
}
