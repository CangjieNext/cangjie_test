// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj inc.cj
// EXEC: %compiler %incrementalCompile %compile_lib_opt inc.cj -o %output %enableO2
// EXEC: %cpfile %n.new.cj inc.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %compile_lib_opt inc.cj -o %output %enableO2 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered

// Was IR failed. should pass


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
