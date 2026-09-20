/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CM-boundary-00255(组: CrossPackage;执行域: automated)
// 用例意图: 编译成功、运行 exit 0;minor 下界与 patch 上界同取时判定不受影响
// fixture: dep_v00255.cjo = cjoVersion 改 (0,0,255)(minor 下界 × patch 上界)
// 判据: cjo_version_check/import/version_matrix/compat_boundary_0_0_255
// 需求追溯: DT 设计正常场景 A 边界组合;EC×BC 组合位;DT:跨包×静默读取
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: dep_v00255.cjo
// EXEC-PIPE-0: %compiler %cmp_opt dep_v00255.cjo %f -o %output 2>&1 | compare %f
// ASSERT: scan-not is incompatible: compiled with cjc
// ASSERT: scan-not validation of
// EXEC-0: %run %run_opt %output %run_args

import pkg.*

main(): Int64 {
    if (depValue() == 42) {
        return 0
    }
    return 1
}
