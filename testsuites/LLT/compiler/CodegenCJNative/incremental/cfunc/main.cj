// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows and not Darwin) DEPENDENCE: a.old.cj a.new.cj main.old.cj main.new.cj
// (not Windows and not Darwin) EXEC: %compiler %incrementalCompile --lto=full  a.old.cj %compile_lib_opt -o a.%middle
// (not Windows and not Darwin) EXEC: %compiler %incrementalCompile --lto=full a.%middle main.old.cj -o %output
// (not Windows and not Darwin) EXEC: %rmfile a.old.cj main.old.cj
// (not Windows and not Darwin) EXEC: %move a.new.cj a.old.cj
// (not Windows and not Darwin) EXEC: %move main.new.cj main.old.cj
// (not Windows and not Darwin) EXEC: %compiler %incrementalCompile --lto=full a.old.cj %compile_lib_opt -o a.%middle
// (not Windows and not Darwin) EXEC: %compiler %incrementalCompile --lto=full a.%middle main.old.cj -o %output
// (not Windows and not Darwin) RUN-EXEC: %run %run_opt %output %run_args
