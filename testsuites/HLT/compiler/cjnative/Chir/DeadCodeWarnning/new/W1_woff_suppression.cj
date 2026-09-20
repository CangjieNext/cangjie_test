// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// [W1_woff_suppression] -Woff unused 抑制 unreachable 警告组
// Tier-A: 本地 SDK 1.3.0-alpha 实测计数一致，可常驻 CI。
// 规格: dt-design 接口测试用例4（unreachable 全部归 WarnGroup unused → -Woff unused 连带抑制; 对照: 默认配置 block+hint 2 条; 2026-09-20 修复: 裸 return 补分号绕开换行续行合并）
// EXEC-PIPE-0: %compiler %cmp_opt -Woff unused %f -o %output 2>&1 | compare %f

// ASSERT: scan-0 unreachable
// ASSERT: scan-0 useless

// 本用例的 EXEC 行自带 -Woff unused（HLT cmp_opt 是全局的, 抑制开关必须内联进
// 编译命令, 官方先例 LLT ControlFlow/inout01.cj）; 默认配置编译同一源码产生
// 2 条 unreachable。
// 裸 return 后必须带分号: 无分号时换行续行合并为 parse_nl_warning（parser 组,
// -Woff unused 压不掉, scan-not 会假红）。
main() {
    if (false) {
        println("dead then")
    }
    return;
    println("dead after return")
}
