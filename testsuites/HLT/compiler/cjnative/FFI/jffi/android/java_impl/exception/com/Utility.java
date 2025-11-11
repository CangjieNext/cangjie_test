/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public class Utility {
  public static int divide(int a, int b) {
    return a / b;
  }
  public static int access(int[] arr, int index) {
    return arr[index];
  }
  public static void throwing(byte kind) throws Exception {
    if (kind == (byte) 0) {
      // no throws
    } else if (kind == (byte) 1) {
      throw new Exception();
    } else if (kind == (byte) 2) {
      throw new Exception("my message from java");
    } else if (kind == (byte) 3) {
      divide(1, 0);
    } else if (kind == (byte) 4) {
      int[] arr = {1, 2, 3};
      access(arr, 4);
    }
  }
}
