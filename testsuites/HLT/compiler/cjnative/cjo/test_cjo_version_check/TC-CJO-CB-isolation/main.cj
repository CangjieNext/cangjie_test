/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// --------------------------------------------------------------
// Case: TC-CJO-CB-isolation (group: CrossPackage; domain: automated)
// Intent: after a first-compile reject, a second compile in the same
//   driver with only a+c succeeds and runs - a version failure must
//   not poison CjoManager loaded-package/cache state; repeated loads
//   accumulate no errors.
// fixture: b.cjo surgically set to (1,0,0) then restored to (0,1,0); a/c compatible; main_iso.cj
//   imports a/c only (second compile in same driver). The driver source
//   (main.cj) is materialized in work_dir via the trailing
//   // SEPARATE-FILE: main.cj directive (framework convention): the
//   framework only copies the container and DEPENDENCE entries into
//   work_dir, and separated files overwrite same-named copies.
//   diag_reject/diag_ok separate rule files (two compares are separate
//   processes, each picks its own ASSERTs).
// Note: keep this container ASCII-only: extract_separation_by_files
//   re-opens the case with locale encoding (gbk on zh-Windows) once a
//   SEPARATE-FILE directive is present; UTF-8 Chinese would raise.
// --------------------------------------------------------------


// DEPENDENCE: pkg_a pkg_c pkg_b ../tools/cjo_mutate.py diag_reject.txt diag_ok.txt
// EXEC: %compiler %pkg_opt pkg_a %compile_lib_opt -o a.%middle
// EXEC: %compiler %pkg_opt pkg_c %compile_lib_opt -o c.%middle
// EXEC: %compiler %pkg_opt pkg_b %compile_lib_opt -o b.%middle
// EXEC: %python cjo_mutate.py --patch-cjo b.cjo --set-cjo-version 1.0.0
// EXEC-PIPE-1: %compiler %cmp_opt a.%middle b.%middle c.%middle main.cj -o %output 2>&1 | compare diag_reject.txt
// ASSERT: scan is incompatible: compiled with cjc
// ASSERT: scan b.cjo
// EXEC: %python cjo_mutate.py --patch-cjo b.cjo --set-cjo-version 0.1.0
// EXEC-0: %compiler %cmp_opt a.%middle c.%middle main_iso.cj -o iso.%output 2>&1 | compare diag_ok.txt
// ASSERT: scan-not is incompatible: compiled with cjc
// EXEC-0: %run %run_opt iso.%output %run_args

// SEPARATE-FILE: main_iso.cj
import a.*
import c.*

main(): Int64 {
    if (aValue() + cValue() == 4) {
        return 0
    }
    return 1
}

// SEPARATE-FILE: main.cj
import a.*
import b.*
import c.*

main(): Int64 {
    if (aValue() + bValue() + cValue() == 126) {
        return 0
    }
    return 1
}
