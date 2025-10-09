// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@JavaMirror
class M {
    public prop x: Int64
}

/* SCAN-IN
warning: java-mirrored property is deprecated, use field instead
 ==> java_mirror_prop_deprecated.cj:5:5:
  | 
5 |     public prop x: Int64

*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

