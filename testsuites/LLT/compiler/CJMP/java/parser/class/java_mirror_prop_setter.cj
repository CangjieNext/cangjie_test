// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f


@JavaMirror
class M {
    public prop x: Int64 {
        set(val) { }
    }
}

/* SCAN-IN
error: java-mirrored property cannot have setter
 ==> java_mirror_prop_setter.cj:6:5:
  | 
6 |       public prop x: Int64 {
  |  _____^
7 | |         set(val) { }
8 | |     }
  | |_____^ java-mirrored property cannot have setter
  | 

*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

