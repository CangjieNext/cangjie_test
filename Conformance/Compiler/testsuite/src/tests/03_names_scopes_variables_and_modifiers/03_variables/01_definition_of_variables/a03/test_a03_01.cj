/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a03_01

  @Level:         1

  @Assertion:    3.3.1(3) The modifiers of top-level variables include public.

  @Description:  Check that variable declaration using right syntax will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

public let myPublicLetNotDefinedInitialized = 0.0
public var myPublicVarNotDefinedInitialized = 0.0
public let myPublicLetFloat16Initialized: Float16 = 0.0
public var myPublicVarFloat16Initialized: Float16 = 0.0
public let myPublicLetTupleInitialized = (0.0,"AAA")
public var myPublicVarTupleInitialized = (0.0,"BBB")

main() {
}