/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.AnotherCangjieClass;
import UNNAMED.AnotherCangjieEnum;
import UNNAMED.AnotherCangjieStruct;
import UNNAMED.CangjieClass;

public class Main {
  public static void main(String[] args) {
    final CangjieClass instance = new CangjieClass();
    final short actualResult =
        instance.foo(
            new AnotherCangjieStruct(), new AnotherCangjieClass(), AnotherCangjieEnum.A(114514L));
    final short expectedResult = (short) 1;
    final boolean comparisonResult = actualResult == expectedResult;
    Logger.println("result = " + comparisonResult);
  }
}
