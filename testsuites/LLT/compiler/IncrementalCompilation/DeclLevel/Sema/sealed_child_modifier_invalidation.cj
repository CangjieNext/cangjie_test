// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Changing a sealed child from a closed leaf to an open child invalidates
// exhaustive-match analysis even when the match does not name that child.
// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt inc.cj -o %output 2>&1
// EXEC: %cpfile %n.new.cj inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt inc.cj -o %output 2>&1
// ASSERT: scan-not sema_unreachable_pattern

