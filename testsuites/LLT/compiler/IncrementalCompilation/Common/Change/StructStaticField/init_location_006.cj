// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// (not Windows) EXEC: %compiler %incrementalCompile --lto=full --error-count-limit=all --diagnostic-format=noColor %n.inc.cj -o %output
// (Windows) EXEC: %compiler %incrementalCompile --error-count-limit=all --diagnostic-format=noColor %n.inc.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// (not Windows) EXEC: %compiler %incrementalCompile --lto=full --error-count-limit=all --diagnostic-format=noColor %n.inc.cj -o %output
// (Windows) EXEC: %compiler %incrementalCompile --error-count-limit=all --diagnostic-format=noColor %n.inc.cj -o %output
// EXEC: %run %run_opt %output %run_args



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
