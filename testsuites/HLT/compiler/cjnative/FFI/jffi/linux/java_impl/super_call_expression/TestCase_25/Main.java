/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package java_entry;

import UNNAMED.ChildClass;

public class Main {
  public static void main(String[] args) {
    final ChildClass childClass =
        new ChildClass(
            new long[114514],
            new int[114514],
            new short[114514],
            (byte) 1,
            new short[114514],
            new short[114514],
            (char) 1,
            114.514000D,
            new double[114514],
            1);
    System.out.println("hello");
  }
}
