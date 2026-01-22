/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.AnotherCangjieClass;
import UNNAMED.CangjieClass;

public class Main {
  public static void main(String[] args) {
    final float[] actualResult =
        CangjieClass.foo(new short[114514], 114.514000D, new AnotherCangjieClass());
    final boolean comparisonResult = actualResult.length == 114514L;
    Logger.println("result = " + comparisonResult);
  }
}
