// DEPENDENCE: %n.old.cj %n.new.cj
// (Linux) EXEC: %cpfile %n.old.cj %n.inc.cj
// (Linux) EXEC: %compiler --experimental --incremental-compile --lto=full --error-count-limit=all --diagnostic-format=noColor  %n.inc.cj -o %output
// (Linux) EXEC: %run %run_opt %output %run_args

// (Linux) EXEC: %cpfile %n.new.cj %n.inc.cj
// (Linux) EXEC: %compiler --experimental --incremental-compile --lto=full --error-count-limit=all --diagnostic-format=noColor  %n.inc.cj -o %output
// (Linux) EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
