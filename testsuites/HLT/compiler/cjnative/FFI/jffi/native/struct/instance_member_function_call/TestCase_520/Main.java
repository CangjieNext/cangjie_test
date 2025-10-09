/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package java_entry;

import UNNAMED.S;

public class Main {
  public static void main(String[] args) {
    final S s = new S();
    final String actualResult = s.foo(new char[114514], new byte[114514], 114.514000F);
    final boolean comparisonResult = actualResult.equals("hello");
    System.out.println("result = " + comparisonResult);
  }
}
