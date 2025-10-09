// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f


@JavaMirror
class M {
    public prop x: Int64 {
        get() { 0 }
    }
}

/* SCAN-IN
error: java-mirrored property cannot have getter
 ==> java_mirror_prop_getter.cj:6:5:
  | 
6 |       public prop x: Int64 {
  |  _____^
7 | |         get() { 0 }
8 | |     }
  | |_____^ java-mirrored property cannot have getter
  | 

*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

