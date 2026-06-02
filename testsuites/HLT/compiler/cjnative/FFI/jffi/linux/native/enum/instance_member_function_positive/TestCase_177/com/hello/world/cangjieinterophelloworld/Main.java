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
    final long actualResult =
        instance.foo((byte) 1, "hello", new JavaClassThatImplementsAnotherCangjieInterface());
    final long expectedResult = 1L;
    final boolean comparisonResult = actualResult == expectedResult;
    System.out.println("result = " + comparisonResult);
  }
}
