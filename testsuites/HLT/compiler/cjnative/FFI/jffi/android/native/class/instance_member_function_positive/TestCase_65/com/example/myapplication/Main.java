/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.CangjieClass;

public class Main {
  public static void main(String[] args) {
    final CangjieClass instance = new CangjieClass();
    final short actualResult =
        instance.foo(
            new JavaClassThatImplementsAnotherCangjieInterface(), new char[114514], 114.514000F);
    final short expectedResult = (short) 1;
    final boolean comparisonResult = actualResult == expectedResult;
    Logger.println("result = " + comparisonResult);
  }
}
