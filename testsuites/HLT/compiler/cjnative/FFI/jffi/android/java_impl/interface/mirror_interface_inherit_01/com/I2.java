/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.hello.world.cangjieinterophelloworld.Logger;

public interface I2 extends I1 {
  public static int bar() {
    Logger.println("in I2 bar");
    return 2;
  }
}
