/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.AnotherCangjieEnum;
import UNNAMED.CangjieStruct;
import UNNAMED.JavaImplClass;

public class Main {
  public static void main(String[] args) {
    final long actualResult =
        CangjieStruct.foo(AnotherCangjieEnum.A(114514L), new JavaImplClass(), 1);
    final long expectedResult = 1L;
    final boolean comparisonResult = actualResult == expectedResult;
    Logger.println("result = " + comparisonResult);
  }
}
