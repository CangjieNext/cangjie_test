// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// EXEC: rm -rf bjc
// EXEC: ln -s `which cjc` bjc 
// EXEC: bjc %verbose_opt main.cj 2>&1 | compare %f
// ASSERT: regex bin/cjc-frontend["']
// EXEC: `pwd`/bjc %verbose_opt `pwd`/main.cj 2>&1 | compare %f
// ASSERT: regex bin/cjc-frontend["']
