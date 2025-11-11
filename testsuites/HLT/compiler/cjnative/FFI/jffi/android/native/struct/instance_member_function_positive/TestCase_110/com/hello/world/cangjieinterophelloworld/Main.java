/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.AnotherCangjieClass;
import UNNAMED.CangjieStruct;

public class Main {
  public static void main(String[] args) {
    final CangjieStruct instance = new CangjieStruct();
    final int actualResult =
        instance.foo(new short[114514], 114.514000D, new AnotherCangjieClass());
    final int expectedResult = 1;
    final boolean comparisonResult = actualResult == expectedResult;
    Logger.println("result = " + comparisonResult);
  }
}
