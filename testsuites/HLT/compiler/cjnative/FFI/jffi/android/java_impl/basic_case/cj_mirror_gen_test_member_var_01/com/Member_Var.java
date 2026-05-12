/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;


public class Member_Var {
  public boolean aBoolean;
  public byte aByte;
  public short aShort;
  public char aChar;
  public int aInt;
  public long aLong;
  public float aFloat;
  public double aDouble;

  public Member_Var(
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
