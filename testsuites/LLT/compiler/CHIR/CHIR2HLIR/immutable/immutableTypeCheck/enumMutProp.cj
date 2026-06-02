// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %noColor %f %diag_json 2>&1 | compare %f

enum A {
  E
  public mut prop a : Int64 { 
    get() {0}
    set(v) {}
  }
}
// ASSERT: scan parse_illegal_modifier_in_scope
