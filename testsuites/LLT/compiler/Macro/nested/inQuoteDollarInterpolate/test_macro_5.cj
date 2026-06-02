// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj
// EXEC: %compiler macroFoo.cj %cmp_macro
// ERRCHECK: %pwd_to_ld_path %compiler %cmp_opt %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan expected expression after '$', found a declaration

internal import std.ast.*
import define_a.*

main() : Int64 {
  var a = quote(1 + $(@testa var a = @testa(1)))
  a.dump()
  0
}
