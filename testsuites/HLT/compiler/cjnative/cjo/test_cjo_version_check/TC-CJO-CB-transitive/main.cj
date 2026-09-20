/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CB-transitive(组: CrossPackage;执行域: automated)
// 用例意图: mid 编译即失败(其依赖闭包内含不兼容 dep_bad);诊断出现不兼容依赖标识(粒度以实现为准);传递链上不得静默放过不兼容 cjo
// fixture: mid 兼容但 import pkg;dep_bad.cjo = pkg 包 cjo 的 cjoVersion 改 (1,0,0)
// 判据: cjo_version_check/combo/deps/combo_transitive
// 需求追溯: DT 设计补盲#5(组合);DT:跨包×传递依赖×error;FN:传递闭包内校验
// ═════════════════════════════════════════════════════════════════


// LEVEL: 1
// DEPENDENCE: pkg_mid dep_bad.cjo
// EXEC-PIPE-1: %compiler %pkg_opt pkg_mid %compile_lib_opt -o mid.%middle dep_bad.cjo 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc

import mid.*

main(): Int64 {
    if (midValue() == 7) {
        return 0
    }
    return 1
}
