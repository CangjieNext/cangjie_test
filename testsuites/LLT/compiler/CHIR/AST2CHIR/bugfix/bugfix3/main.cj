// LEVEL: 0
// DEPENDENCE: pkg1.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %f pkg1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import pkg1.*

public enum enum1 <: I {
  A
}

main() {
  enum1.foo2<UInt32>(1u32)
  return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
