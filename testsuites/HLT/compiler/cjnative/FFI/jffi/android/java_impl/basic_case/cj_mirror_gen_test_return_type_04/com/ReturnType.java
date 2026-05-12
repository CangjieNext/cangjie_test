/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public class ReturnType {
  public Ref01 foo(Ref01 ref) {
    return ref;
  }

  public Ref02 goo(Ref02 ref) {
    return ref;
  }

  public static Ref01 staticfoo(Ref01 ref) {
    return ref;
  }

  public static Ref02 staticgoo(Ref02 ref) {
    return ref;
  }
}
