// LEVEL: 0
// EXEC-PIPE-0: %compiler %debugCHIROpt %enableO2 %disableCHIROpt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not The deref node in the line:11 and the column:10 was optimized by The opt: Constant Propagation

func foo(b: Bool) {
  var x = true
  if (b) {x = true}
  return x // can be propagated
}

main() {
  var res = foo(false)
  if (res) {
    0
  } else {
    1
  }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
