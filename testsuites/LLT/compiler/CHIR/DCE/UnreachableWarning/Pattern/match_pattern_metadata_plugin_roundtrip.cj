// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a plugin round trip preserves match traversal metadata across pattern and sibling-case control flow.
// EXEC-PIPE-0: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin 2>&1 | compare %f

main() {
    const selector = 1
    match (selector) {
        case 1 => 0
        case value where true => 1
        case 2 => 2
        case _ => 3
    }
}

/* SCAN
warning: unreachable pattern
  ==> match_pattern_metadata_plugin_roundtrip.cj:14:14:
   | 
14 |         case value where true => 1
   |              ^^^^^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> match_pattern_metadata_plugin_roundtrip.cj:15:14:
   | 
15 |         case 2 => 2
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> match_pattern_metadata_plugin_roundtrip.cj:16:14:
   | 
16 |         case _ => 3
   |              ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

3 warnings generated, 3 warnings printed.
*/
