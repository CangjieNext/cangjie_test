/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.AnotherCangjieClass;
import UNNAMED.CangjieEnum;

public class Main {
  public static void main(String[] args) {
    final float actualResult = CangjieEnum.foo(new AnotherCangjieClass(), (short) 1, (char) 1);
    final float expectedResult = 114.514000F;
    final boolean comparisonResult = actualResult == expectedResult;
    Logger.println("result = " + comparisonResult);
  }
}
