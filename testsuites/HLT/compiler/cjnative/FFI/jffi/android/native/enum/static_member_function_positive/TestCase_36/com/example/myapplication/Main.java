/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import UNNAMED.CangjieEnum;
import UNNAMED.JavaImplClass;

public class Main {
  public static void main(String[] args) {
    final JavaImplClass actualResult = CangjieEnum.foo(new byte[114514], 1L, 114.514000F);
    final boolean comparisonResult = actualResult.getValue() == 114514L;
    Logger.println("result = " + comparisonResult);
  }
}
