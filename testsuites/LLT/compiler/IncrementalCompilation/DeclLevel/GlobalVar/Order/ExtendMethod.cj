// DEPENDENCE: %n.1.cj %n.2.cj
// EXEC: %compiler %n.1.cj %n.2.cj -o %output %incrementalCompile %compile_lib_opt
// EXEC-PIPE-0: %compiler %n.1.cj %n.2.cj -o %output %incrementalCompile %compile_lib_opt | compare %f
// ASSERT: scan no change

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
