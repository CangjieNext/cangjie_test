/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com;

public strictfp class TestModifier01 {
  class TestModifier_01 {}

  final class TestModifier_02 extends TestModifier_01 {}

  strictfp class TestModifier_03 {}
}
