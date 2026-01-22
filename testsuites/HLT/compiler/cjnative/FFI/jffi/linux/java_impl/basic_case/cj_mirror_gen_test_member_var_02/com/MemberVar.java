/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public class MemberVar {
  public boolean aBoolean = true;
  public byte aByte = 1;
  public short aShort = 1;
  public char aChar = 1;
  public int aInt = 1;
  public long aLong = 1;
  public float aFloat = 1.0F;
  public double aDouble = 1.0;

  public MemberVar(
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
}
