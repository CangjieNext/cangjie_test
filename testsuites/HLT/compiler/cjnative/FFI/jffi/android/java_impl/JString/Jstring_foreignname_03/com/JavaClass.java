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
  public int v1 = 1;

  public JavaClass() {
    Logger.println("in JavaClass Init");
  }

  public int location_return(int a) {
    Logger.println("in JavaClass location_return");
    return a + v1;
  }

  public int location_param(int a) {
    Logger.println("in JavaClass location_param:" + a);
    return a + 2;
  }
}
