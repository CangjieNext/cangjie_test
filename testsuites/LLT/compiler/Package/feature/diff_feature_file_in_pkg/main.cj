// DEPENDENCE: src
// EXEC-PIPE-1:%compiler %cmp_opt %compile_lib_opt %pkg_opt src 2>&1 | compare %f
/* SCAN
error: feature names must be consistent across all files within a source set
 ==> src/diff_features_02.cj:1:10:
  | 
1 | features { os.linux }
  |          ^^^^^^^^^^^^ 
  | 
note: perhaps you meant these features
 ==> src/main.cj:1:10:
  | 
1 | features { os.harmony, os.darwin }
  |          ^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

error: feature names must be consistent across all files within a source set
 ==> src/diff_features_03.cj:1:10:
  | 
1 | features { os.windows }
  |          ^^^^^^^^^^^^^^ 
  | 
note: perhaps you meant these features
 ==> src/main.cj:1:10:
  | 
1 | features { os.harmony, os.darwin }
  |          ^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

2 errors generated, 2 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

