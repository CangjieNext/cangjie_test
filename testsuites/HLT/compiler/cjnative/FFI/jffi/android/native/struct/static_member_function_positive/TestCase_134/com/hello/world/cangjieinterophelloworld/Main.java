/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.CangjieStruct;

public class Main {
  public static void main(String[] args) {
    final int actualResult = CangjieStruct.foo((byte) 1, (byte) 1, 114.514000D);
    final int expectedResult = 1;
    final boolean comparisonResult = actualResult == expectedResult;
    Logger.println("result = " + comparisonResult);
  }
}
