/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public class JavaClass {
  public int v1 = 1;

  public JavaClass() {
    System.out.println("in JavaClass Init");
  }

  public int loaction_return(int a) {
    System.out.println("in JavaClass loaction_return");
    return a + v1;
  }

  public int loaction_param(int a) {
    System.out.println("in JavaClass loaction_param:" + a);
    return a + 2;
  }
}
