/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.AnotherCangjieEnum;
import UNNAMED.CangjieEnum;
import UNNAMED.JavaImplClass;

public class Main {
  public static void main(String[] args) {
    final CangjieEnum instance = CangjieEnum.A;
    final short[] actualResult =
        instance.foo(AnotherCangjieEnum.A(114514L), new JavaImplClass(), 1);
    final boolean comparisonResult = actualResult.length == 114514L;
    Logger.println("result = " + comparisonResult);
  }
}
