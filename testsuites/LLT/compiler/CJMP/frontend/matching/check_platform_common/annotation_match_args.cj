// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// case: specific decls inherit @Deprecated from common decls. No error for specific if @Deprecated is used on common.
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

@Annotation
public class Anno {
    public const init(_: Int) {}
}

@Annotation
public class AnnoStr {
    public const init(_: String) {}
}

@Annotation
public class AnnoStr2 {
    public const init(_: String) {}
}

@Anno[1] common func f1_mismatch(): Int
@Anno[2] common func f2_mismatch(): Int
@Anno[3] common func f3_ok(): Int

common func f4_mismatch(): Int

// multiple annotations
@Anno[5] @Anno[6] common func f56_mismatch(): Int
@Anno[7] common func f78_mismatch(): Int
@Anno[9] @Anno[10] common func f910_ok(): Int
@Anno[11] @Anno[11] common func f11_ok(): Int
@Anno[12] @Anno[12] common func f12_mismatch(): Int
@Anno[13] common func f13_mismatch(): Int

// string
@AnnoStr["s1"] common func f_str_s1_ok(): Int
@AnnoStr["s20"] common func f_str_s2_mismatch(): Int

@AnnoStr["s1"] common func f_str_s3_mismatch(): Int

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --error-count-limit=100 --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
// ASSERT: scan-12 sema_specific_has_different_annotation
package cmp

specific func f1_mismatch() { 1 } // 1 error
@Anno[222] specific func f2_mismatch() { 2 } // 2 errors
@Anno[3] specific func f3_ok() { 3 } // 0 errors

@Anno[4] specific func f4_mismatch() { 4 } // 1 error
@Anno[6] specific func f56_mismatch() { 56 } // 1 error
@Anno[8] @Anno[7] specific func f78_mismatch() { 78 } // 1 error
@Anno[10] @Anno[9] specific func f910_ok() { 910 } // 0 errors
@Anno[11] @Anno[11] specific func f11_ok() { 11 } // 0 errors
@Anno[12] specific func f12_mismatch() { 12 } // 1 error
@Anno[13] @Anno[13] specific func f13_mismatch() { 13 } // 1 error

// string
@AnnoStr["s1"] specific func f_str_s1_ok() { 1 }  // 0 errors
@AnnoStr["s21"] specific func f_str_s2_mismatch() { 2 } // 2 errors

// user-defined diffent identifiers
@AnnoStr2["s1"] specific func f_str_s3_mismatch() { 3 } // 2 errors
