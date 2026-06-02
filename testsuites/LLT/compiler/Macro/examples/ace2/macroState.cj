// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package state

internal import std.ast.*
/*
// other decl can use method like declHasAttr()
func declHasAttr(vardecl: NodeFormat_VarDecl, attr: String): Bool
{
  //vardecl.GetBase() is Option<NodeFormat_DeclBase>
  var declBase:NodeFormat_DeclBase = match (vardecl.GetBase()) {
    case Some(obj) => obj
    case None => NodeFormat_DeclBase(Array<UInt8>(0,0), 0)
  }
  return declBase.hasAttr(attr)
}

public macro State(input: Tokens) : Tokens
{
  var ret: Tokens = quote(\@Attribute[State]) + input

  var decl = parseDecl(ret) //NodeFormat_Decl
  var varDecl = decl.asVarDecl()  //NodeFormat_VarDecl

  if (declHasAttr(varDecl, "State")) {
    print("declHasAttr State true\n")
  }

  if (varDecl.hasAttr("State")) {
    print("State true\n")
  }
  if (varDecl.hasAttr("Binding")) {
    print("Binding true\n")
  }

  return ret
}
 */
public macro State(input: Tokens): Tokens {
    return quote(\@Attribute[State]) + input
}
