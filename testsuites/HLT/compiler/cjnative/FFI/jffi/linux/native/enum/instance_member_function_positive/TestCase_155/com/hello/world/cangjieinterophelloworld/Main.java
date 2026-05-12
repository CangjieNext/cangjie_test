/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.hello.world.cangjieinterophelloworld;

import UNNAMED.AnotherCangjieClass;
import UNNAMED.CangjieEnum;

public class Main {
  public static void main(String[] args) {
    final CangjieEnum instance = CangjieEnum.A;
    final AnotherCangjieClass actualResult =
        instance.foo(new char[114514], 1L, new JavaClassThatImplementsAnotherCangjieInterface());
    final boolean comparisonResult = actualResult.getValue() == 114514L;
    System.out.println("result = " + comparisonResult);
  }
}
