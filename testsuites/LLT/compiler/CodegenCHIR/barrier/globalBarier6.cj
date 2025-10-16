// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir %cmp_opt %disableReflection %n.cj 2>&1 | compare %f
// ASSERT: regex call void @"_CN7default1A6<init>Hv"\(
// ASSERT: regex call void @llvm.cj.gcwrite.static\(i8 addrspace\(1\)\* \d+, i8 addrspace\(1\)\*\* getelementptr inbounds \(%struct._CN7default1EE, %struct._CN7default1EE\* @_CN7default1eE, i32 0, i32 1, i32 0\)\)
// ASSERT: regex store i64 1, i64\* getelementptr inbounds \(%struct._CN7default1EE, %struct._CN7default1EE\* @_CN7default1eE, i32 0, i32 1, i32 1\), align 8
// EXEC: %compiler %cmp_opt %disableReflection %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A {
  var a : Int64 = 0
}
struct B {
  var a : A = A()
  var b : Int64 = 0
  var c : Bool = false
}
class C {
  var b : B = B()
}

struct D {
  var c : C = C()
}

struct E {
  var d : D = D()
  var b : B = B()
}

var e : E = E()
main() {
  e.b.a = A() 
  e.b.b = 1 
}
