// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_miii`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_miid`
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// Tests basic constant evaluation with struct types.

struct MembersInitializedInInit {
  var a = 1
  let b = 2
  static const c = 3

  const init() {
  }
}

const miii = MembersInitializedInInit()

struct MembersInitializedInDefn {
  var a: Int64
  let b: Int64

  const init() {
    a = 1
    b = 1
  }
}

const miid = MembersInitializedInDefn()

main() {}
