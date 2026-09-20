/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// Case: TC-CJO-BC-legacy-upstream (group: CrossPackage; exec: automated)
// Intent: single-SDK backward-compat round. Upstream cjo archives are
//   compiled by the CURRENT cjc, then their cjoVersion triples are demoted
//   in-place to legacy shapes ((0,0,0) = pre-versioning all-zero form,
//   (0,0,1) = oldest minor/patch form). A downstream driver importing both
//   archives must compile silently (PIPE-0, no version diag, no verifier
//   diag) and run correctly. The gate only reads the triple, so a demoted
//   triple is indistinguishable from a real old-compiler artifact - no
//   dual-SDK environment needed.
// Fixture: pkg_l1/pkg_l2 compiled in-run by current cjc; copies demoted
//   to (0,0,0) / (0,0,1) via ../cjo_mutate.py --patch-cjo, then moved back
//   to the sibling positions (mutate works on copies so pristine build
//   outputs stay intact).
// Note: keep this file ASCII-only (framework re-opens it with locale
//   encoding once a SEPARATE-FILE directive is present).
// --------------------------------------------------------------


// DEPENDENCE: pkg_l1 pkg_l2 ../cjo_mutate.py diag_ok.txt
// EXEC: %compiler %pkg_opt pkg_l1 %compile_lib_opt -o l1.%middle
// EXEC: %compiler %pkg_opt pkg_l2 %compile_lib_opt -o l2.%middle
// EXEC: %cp l1.cjo l1_mut.cjo
// EXEC: %cp l2.cjo l2_mut.cjo
// EXEC: %python cjo_mutate.py --patch-cjo l1_mut.cjo --set-cjo-version 0.0.0
// EXEC: %python cjo_mutate.py --patch-cjo l2_mut.cjo --set-cjo-version 0.0.1
// EXEC: %cp l1_mut.cjo l1.cjo
// EXEC: %cp l2_mut.cjo l2.cjo
// EXEC-PIPE-0: %compiler %cmp_opt l1.%middle l2.%middle %f -o %output 2>&1 | compare diag_ok.txt
// ASSERT: scan-not is incompatible: compiled with cjc
// ASSERT: scan-not validation of
// EXEC-0: %run %run_opt %output %run_args

import l1.*
import l2.*

main(): Int64 {
    if (l1Value() + l2Value() == 30) {
        return 0
    }
    return 1
}
