/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.example.myapplication.Logger;

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
