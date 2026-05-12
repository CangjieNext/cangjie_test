/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public class JavaClass_Child extends JavaClass {
  public int subvalue1 = 100;
  public static int subvalue2 = 200;

  public JavaClass_Child() {
    super();
    System.out.println("in JavaClass_Child Init");
  }

  public int subfoo(int v1) {
    System.out.println("in JavaClass_Child subfoo");
    return 10 + v1 + value1 + subvalue1;
  }

  public static int subgoo(int v1, int v2) {
    System.out.println("in JavaClass_Child subgoo");
    return 10 + v1 + v2 + value2 + subvalue2;
  }

  public int foo(int v1) {
    System.out.println("in JavaClass_Child foo");
    return 666;
  }

  public static int goo(int v1, int v2) {
    System.out.println("in JavaClass_Child goo");
    return 888;
  }
}
