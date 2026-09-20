/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CJ-compat(组: CJMP;执行域: automated)
// 用例意图: PreloadCommonPartOfPackage 加载兼容 CJO → 预加载成功并继续后续流程(复用跨包校验路径,无单独适配);scan-not 版本诊断
// fixture: c/p 均由当前 cjc 现场编译(公共部分 cjo 为原生 (0,1,0),无变体)
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: c p
// EXEC-0: %compiler --diagnostic-format=noColor --experimental c/c.cj --output-type=chir --output-dir ./c
// EXEC-PIPE-0: %compiler --diagnostic-format=json --experimental p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
// ASSERT: scan-not is incompatible: compiled with cjc
// ASSERT: scan-not validation of

