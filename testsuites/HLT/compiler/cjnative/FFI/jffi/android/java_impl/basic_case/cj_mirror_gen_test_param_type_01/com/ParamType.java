/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.hello.world.cangjieinterophelloworld.Logger;

public class ParamType {
  boolean aBoolean;
  byte aByte;
  short aShort;
  char aChar;
  int aInt;
  long aLong;
  float aFloat;
  double aDouble;

  public void setAllValues(
      boolean aBoolean,
      byte aByte,
      short aShort,
      char aChar,
      int aInt,
      long aLong,
      float aFloat,
      double aDouble) {
    this.aBoolean = aBoolean;
    this.aByte = aByte;
    this.aShort = aShort;
    this.aChar = aChar;
    this.aInt = aInt;
    this.aLong = aLong;
    this.aFloat = aFloat;
    this.aDouble = aDouble;
  }

  public static void printStaticValues(
      boolean aBoolean,
      byte aByte,
      short aShort,
      char aChar,
      int aInt,
      long aLong,
      float aFloat,
      double aDouble) {
    Logger.println(aBoolean);
    Logger.println(aByte);
    Logger.println(aShort);
    Logger.println("Char: " + aChar);
    Logger.println(aInt);
    Logger.println(aLong);
    Logger.println(aFloat);
    Logger.println(aDouble);
  }
}
