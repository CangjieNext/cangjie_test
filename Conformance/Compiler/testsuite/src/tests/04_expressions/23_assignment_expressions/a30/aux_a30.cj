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

type Tuple = (Int64, Int64)

type Array = Array<Int64>

type Range = Range<Int64>

interface I {}

interface J <: I {}

interface K <: J {}

interface L <: I {}

open class A <: J {}

open class B <: A {}

class C <: B {}

class D <: A {}

class CI <: I { static func i() : I { CI() } }

class CJ <: J { static func j() : J { CJ() } }

class CK <: K { static func k() : K { CK() } }

class CL <: L { static func l() : L { CL() } }

func iN() : IntNative { 1 }

func uN() : UIntNative { 1 }
