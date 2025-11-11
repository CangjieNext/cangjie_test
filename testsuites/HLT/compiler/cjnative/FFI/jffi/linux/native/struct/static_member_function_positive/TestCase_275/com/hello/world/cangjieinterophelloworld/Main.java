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
    final double actualResult =
        CangjieStruct.foo(
            new JavaClassThatImplementsAnotherCangjieInterface(), new char[114514], 114.514000F);
    final double expectedResult = 114.514000D;
    final boolean comparisonResult = actualResult == expectedResult;
    System.out.println("result = " + comparisonResult);
  }
}
