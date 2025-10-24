/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.AnotherCangjieEnum;
import UNNAMED.CangjieClass;
import UNNAMED.JavaImplClass;

public class Main {
  public static void main(String[] args) {
    final CangjieClass instance = new CangjieClass();
    final double actualResult = instance.foo(AnotherCangjieEnum.A(114514L), new JavaImplClass(), 1);
    final double expectedResult = 114.514000D;
    final boolean comparisonResult = actualResult == expectedResult;
    Logger.println("result = " + comparisonResult);
  }
}
