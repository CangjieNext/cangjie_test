# TC-CJO-BC-legacy(组: External;执行域: external)

- 用例意图: 存量 cjo 逐个导入当前编译器 → 全部静默通过;若出现拒绝须逐例归因并升级为需求出口确认项(LTS 内 AnnoKind 族 enum 可能已有真实不兼容修改),不得静默放过
- fixture: 基准:当前 cjc 编译 pkg/(导出 public func depValue(): Int64)得 dep_v010.cjo(cjoVersion=(0,1,0),version=当前 cjc 版本)。变体 fixture:./flatc -t ./CjoFormat.fbs -- ./dep_v010.cjo 转 JSON(flatc 输出 relaxed JSON,键名不带引号;stderr 的 snake_case warning 可忽略)→ 按用例说明修改/删除 cjoVersion(必要时同步改 version 字符串)→ ./flatc -b ./CjoFormat.fbs ./dep_v010.json 得 dep_v010.bin → mv 改名回 dep_v010.cjo → 断言 Verifier 通过(仅版本字段变化不得引入结构错误)。字节定点修改仅作 flatc 不可用时的兜底。工具:cjo_mutate.py 一次性产出全部命名 fixture。缓存形态(增量缓存用例):被测门禁读的是缓存内 <hash>.cjo 的 cjoVersion 三元组(与跨包路径同一矩阵),手术目标即该字段(cjo_mutate.py --patch-cache 对 .cached 内 cjo 做 cjoVersion 手术,flatc/字节兜底同跨包配方)。注意勿混淆两类缓存机制:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁的字段(DT 设计 FN-05 明示两类机制勿混淆),不属于本特性手术目标。缓存 fixture 由 cjo_mutate.py 在现场编译产出 .cached 后手术;不以源码替换注入(同编译器重编源码版本必然一致,注入空转)。 本场景 fixture 为真实存量产物(非 flatc 变体):旧版 SDK 编译产出或存量库拉取。
- 判据: cjo_version_check/import/backward_compat/compat_legacy_0_1
- 需求追溯: DT 设计补盲#7(向后兼容,最大现实风险);EC:存量 0.1.0 全体;DT:跨包×静默;需求前提:现存 cjo 均满足向后兼容

存量回归 runner 规格(External:需旧版 SDK 产出的存量 fixture 池)

fixture:旧版本 SDK/编译器产出的存量 cjo 二进制(stdx 等二进制依赖、既有工程产物),版本 (0,1.0);
驱动模板(逐存量替换 dep 列表后复用 crossPositiveHeader 形态):

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// LEVEL: 1
// DEPENDENCE: legacya.cjo legacyb.cjo
// EXEC-PIPE-0: %compiler %cmp_opt legacya.cjo legacyb.cjo %f -o %output 2>&1 | compare %f
// ASSERT: scan-not is incompatible: compiled with cjc
// ASSERT: scan-not validation of
// EXEC-0: %run %run_opt %output %run_args

import legacya.*
import legacyb.*

main(): Int64 {
    if (legacyA() == legacyB()) {
        return 0
    }
    return 1
}
