/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.example.myapplication.Logger;

public class JavaClass {
  public int value1 = 1;
  public static int value2 = 2;

  public JavaClass() {
    Logger.println("in JavaClass Init");
  }

  public int foo(int v1) {
    Logger.println("in JavaClass foo");
    return 10 + v1 + value1;
  }

  public static int goo(int v1, int v2) {
    Logger.println("in JavaClass goo");
    return 10 + v1 + v2 + value2;
  }
}
