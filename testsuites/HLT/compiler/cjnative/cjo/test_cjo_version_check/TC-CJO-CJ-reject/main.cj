/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ═════════════════════════════════════════════════════════════════
// 用例: TC-CJO-CJ-reject(组: CJMP;执行域: automated)
// 用例意图: 预加载失败并报诊断(带版本 error 串);拒绝发生于读取公共部分之前——无部分加载产物;与跨包导入行为一致
// fixture: c 的公共部分 cjo 现场编译后由 cjo_mutate.py 将 cjoVersion 改 (0,2,0)(拒绝锚=版本 error 串+无产物;部分加载态甄别以实现日志落库时再校准,不臆测内部标记)
// 判据: cjo_version_check/import/cjmp/cjmp_reject
// 需求追溯: DFX#9 负向位;DT 设计正常场景 C;DT:CJMP 预加载×error(行为与跨包一致);部分加载状态甄别
// ═════════════════════════════════════════════════════════════════


// DEPENDENCE: c p ../cjo_mutate.py
// EXEC-0: %compiler --diagnostic-format=noColor --experimental c/c.cj --output-type=chir --output-dir ./c
// EXEC: %python cjo_mutate.py --patch-cjo c/cmp.cjo --set-cjo-version 0.2.0
// EXEC-PIPE-1: %compiler --diagnostic-format=json --experimental p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
// ASSERT: scan is incompatible: compiled with cjc
// (Linux)EXEC: test ! -f ./p/libp.so
// (Windows)EXEC: powershell -c "if (Test-Path ./p/libp.dll) { exit 1 }"

