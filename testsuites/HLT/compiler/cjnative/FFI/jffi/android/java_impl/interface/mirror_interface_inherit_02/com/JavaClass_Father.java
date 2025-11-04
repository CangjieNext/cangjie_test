/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.hello.world.cangjieinterophelloworld.Logger;

public class JavaClass_Father implements I1 {
  public JavaClass_Father() {
    Logger.println("in JavaClass_Father Init");
  }

  public I1 foo() {
    Logger.println("in JavaClass_Father foo");
    return new JavaClass_Father();
  }

  public int goo(I1 a) {
    Logger.println("in JavaClass_Father goo");
    return 10;
  }

  public static int bar() {
    Logger.println("in JavaClass_Father bar");
    return 100;
  }

  public int goo() {
    Logger.println("in JavaClass_Father new goo");
    return 1000;
  }

  public static int bar(int a) {
    Logger.println("in JavaClass_Father new bar");
    return a;
  }
}
