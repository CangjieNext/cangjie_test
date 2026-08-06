// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.

// Verify a plugin round trip preserves the false edge between source-level match cases.
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin 2>&1 | compare %f

main() {
    let value = 0
    match (value) {
        case 0 => 0
        case _ => 1
    }
}

/* SCAN
warning: unreachable pattern
  ==> match_case_plugin_roundtrip.cj:12:14:
   | 
12 |         case _ => 1
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
