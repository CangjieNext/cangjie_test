// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj macroBarAttr.cj
// EXEC: %compiler macroFoo.cj %compile_shared_lib_opt -o macroFoo.%dylib_suffix
// EXEC: %compiler macroBarAttr.cj %compile_shared_lib_opt -o macroBarAttr.%dylib_suffix
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output
// ASSERT: scan unexpected struct declaration in class body


internal import pkg1.*
internal import pkg4.*

@Foo
class Data {

  var a = @Foo(6)
  @Bar[let b = 3] let b = 3

  @Bar[let c = 4]
  struct A{}

  func getA(): Int64 {
    return a
  }

  func getB() {
    return b
  }

}

main() : Int64 {
  var data = Data()
  0
}
