/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.AnotherCangjieEnum;
import UNNAMED.CangjieStruct;

public class Main {
  public static void main(String[] args) {
    final CangjieStruct instance = new CangjieStruct();
    final long actualResult =
        instance.foo(new double[114514], AnotherCangjieEnum.A(114514L), new float[114514]);
    final long expectedResult = 1L;
    final boolean comparisonResult = actualResult == expectedResult;
    Logger.println("result = " + comparisonResult);
  }
}
