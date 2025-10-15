// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %disableReflection %n.cj 2>&1 | compare %f
// ASSERT: regex call void @llvm\.cj\.gcwrite\.static\.struct\(i8\* bitcast \(%"record\.default:S"\* getelementptr inbounds \(%"record\.default:B", %"record\.default:B"\* @_CN7default1bE, i32 0, i32 2\) to i8\*\), i8\* %\d+, i64 8\)
// EXEC: %compiler %cmp_opt %disableReflection %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class A {
  public var a : Int64 = 0
}

struct S{
    var a:A= A()
}

struct B {
  public var a : A = A()
  public var b : Int64 = 0
  public var s:S = S()

}

var b : B = B()
main() {
  b.s = S()
}