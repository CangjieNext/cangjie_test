/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public class MemberVar {
  public static boolean aBoolean;
  public static byte aByte;
  public static short aShort;
  public static char aChar;
  public static int aInt;
  public static long aLong;
  public static float aFloat;
  public static double aDouble;

  static {
    aBoolean = true;
    aByte = 1;
    aShort = 1;
    aChar = 1;
    aInt = 1;
    aLong = 1;
    aFloat = 0.0F;
    aDouble = 0.0;
  }
}
