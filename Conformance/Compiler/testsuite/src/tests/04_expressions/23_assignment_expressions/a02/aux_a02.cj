/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:  Aux file with classes and interfaces definitions.
  @Structure:    complex-aux
  @CompileWarning: ignore
*/

interface I {}

interface J <: I {}

interface K <: J {}

interface L <: I {}

open class A <: J {}

open class B <: A {}

class C <: B {}

class D <: A {}

class CI <: I { }

func i() : I { CI() }

class CJ <: J { }

func j() : J { CJ() }

class CK <: K { }

func k() : K { CK() }

class CL <: L { }

func l() : L { CL() }

