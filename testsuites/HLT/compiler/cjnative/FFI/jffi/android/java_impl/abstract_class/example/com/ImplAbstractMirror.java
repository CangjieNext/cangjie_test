/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

import com.example.myapplication.Logger;

public class ImplAbstractMirror extends AbstractMirror {
  public void abstractFunc() {
    Logger.println("abstractFunc()");
  }

  public AbstractMirror id(AbstractMirror x) {
    x.instanceFunc();
    return x;
  }

  public AbstractMirror idImpl(ImplAbstractMirror x) {
    x.instanceFunc();
    return x;
  }
}
