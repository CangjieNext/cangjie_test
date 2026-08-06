// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Adding sealed to a non-generic root changes whether its direct subtype set is closed.
// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt inc.cj -o %output 2>&1
// EXEC: %cpfile %n.new.cj inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt inc.cj -o %output 2>&1
// ASSERT: scan Fallback info:
// ASSERT: scan changed subtype of sealed type:
// ASSERT: scan incremental compile result kind: rollback
