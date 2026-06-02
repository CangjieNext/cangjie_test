// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %f -o %output
// RUN-EXEC-1: %run %run_opt %output %run_args
foreign func exit(code: Int32): Unit

main() {
  unsafe {
    exit(1);
  }
  return 0;
}
