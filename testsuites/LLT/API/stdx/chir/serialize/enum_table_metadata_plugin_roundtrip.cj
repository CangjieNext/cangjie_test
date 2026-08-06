// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a plugin round trip preserves enum table traversal metadata.
// (Linux) EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt -O2 %f -o %output %collect_aspects_plugin 2>&1 | compare %f

enum TableState {
    | Left(Int64, Bool)
    | Right(Int64, Bool)
}

main() {
    let state = TableState.Left(0, true)
    match (state) {
        case Left(0, true) => 0
        case Left(_, true) | Right(0, true) => 1
        case Left(_, false) => 2
        case Right(_, true) => 3
        case Right(_, false) => 4
    }
}

/* SCAN
warning: unreachable pattern
  ==> enum_table_metadata_plugin_roundtrip.cj:21:14:
   | 
21 |         case Right(_, true) => 3
   |              ^^^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> enum_table_metadata_plugin_roundtrip.cj:22:14:
   | 
22 |         case Right(_, false) => 4
   |              ^^^^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
