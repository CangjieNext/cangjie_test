/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CM-older-minor(组: CrossPackage;执行域: automated)
// 用例意图: 编译成功、运行 exit 0;scan-not 版本不匹配串且 scan-not validation 串(静默=无任何版本诊断,非 warning 继续)
// fixture: dep_v000.cjo = 基准产物 cjoVersion 改 (0,0,0)(version 保留当前 cjc 版本)
// 判据: cjo_version_check/import/version_matrix/compat_older_minor
// 需求追溯: DFX#3;DT 设计正常场景 A;EC:minor<cur 类;BC:minor 下界 0;DT:跨包×静默读取
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: dep_v000.cjo
// EXEC-PIPE-0: %compiler %cmp_opt dep_v000.cjo %f -o %output 2>&1 | compare %f
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
