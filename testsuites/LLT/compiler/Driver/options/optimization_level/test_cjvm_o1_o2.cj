// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// (not CJNATIVE) EXEC: %compiler main.cj -O1 -O2 --experimental %verbose_opt | compare %f
// (not CJNATIVE) ASSERT: scan-not +FastBackEnd
