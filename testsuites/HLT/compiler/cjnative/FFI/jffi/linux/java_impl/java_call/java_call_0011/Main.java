/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import UNNAMED.CangjieInvoke;

public class Main {
  public static void main(String[] args) {
    System.out.println("run java");
    CangjieInvoke cjEntryPoint = new CangjieInvoke();
    if (cjEntryPoint.test(0)) {
      System.out.println("call success");
    }
  }
}
