/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public interface JavaInterface {
  public default void instanceMethod(byte kind) throws Exception {
    Utility.throwing(kind);
  }
  public static void staticMethod(byte kind) throws Exception {
    Utility.throwing(kind);
  }
}
