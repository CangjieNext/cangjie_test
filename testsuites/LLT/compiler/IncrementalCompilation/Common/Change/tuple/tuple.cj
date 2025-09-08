// DEPENDENCE: tuple.old.cj %n.new.cj
// EXEC: %cpfile tuple.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output -Woff unused
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.inc.cj -o %output -Woff unused 2>&1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
