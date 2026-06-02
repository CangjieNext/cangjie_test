// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj inc.cj
// EXEC: %compiler %incrementalCompile %enableO2 inc.cj -o %output
// RUN-EXEC: %run %run_opt %output
// EXEC: %cpfile %n.new.cj inc.cj
// EXEC: %compiler %incrementalCompile %enableO2 inc.cj -o %output
// RUN-EXEC: %run %run_opt %output
