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
  public String str = "JavaClass str";
  public static String str2 = "JavaClass str2";

  public JavaClass() {
    Logger.println("in JavaClass Init");
  }

  public static String location_return() {
    Logger.println("in JavaClass location_return");
    return "JavaClass location_return";
  }

  public static void location_param(String param) {
    Logger.println("in JavaClass location_param:" + param);
  }
}
