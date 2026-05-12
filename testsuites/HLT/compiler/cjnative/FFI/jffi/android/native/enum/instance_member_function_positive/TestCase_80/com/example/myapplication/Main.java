/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.CangjieEnum;

public class Main {
  public static void main(String[] args) {
    final CangjieEnum instance = CangjieEnum.A;
    final short actualResult = instance.foo(new float[114514], (byte) 1, 1L);
    final short expectedResult = (short) 1;
    final boolean comparisonResult = actualResult == expectedResult;
    Logger.println("result = " + comparisonResult);
  }
}
