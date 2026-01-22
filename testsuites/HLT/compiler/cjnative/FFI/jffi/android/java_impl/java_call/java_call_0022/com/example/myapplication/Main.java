/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package com.example.myapplication;

import UNNAMED.CangjieInvoke;

public class Main {
  public static void main(String[] args) {
    Logger.println("run java");
    CangjieInvoke cjEntryPoint = new CangjieInvoke();
    CangjieInvoke test = new Test();
    if (cjEntryPoint.test() && test.test()) {
      Logger.println("call success");
    }
  }
}

class Test extends CangjieInvoke {}
