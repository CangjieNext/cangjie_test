/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.CangjieEnum;

public class Main {
  public static void main(String[] args) {
    final CangjieEnum instance = CangjieEnum.A;
    final float actualResult = instance.foo(1L, new short[114514], new float[114514]);
    final float expectedResult = 114.514000F;
    final boolean comparisonResult = actualResult == expectedResult;
    System.out.println("result = " + comparisonResult);
  }
}
