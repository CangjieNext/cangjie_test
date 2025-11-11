/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public class JavaClass {
  public int[] aInt = {1, 2, 3};
  public static int[] arrayInt = {0, 1, 2, 3};

  public JavaClass() {}

  public int[] getAInt() {
    return aInt;
  }

  public void setAInt(int[] aInt) {
    this.aInt = aInt;
  }

  public static int[] getArrayInt() {
    return arrayInt;
  }

  public static void setArrayInt(int[] aInt) {
    arrayInt = aInt;
  }
}
