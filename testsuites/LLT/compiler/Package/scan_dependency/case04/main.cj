// DEPENDENCE: pkg
// EXEC: %compiler %cmp_opt --scan-dependency -p pkg 2>&1 | compare %f
// ASSERT: scan "orPackage":"a.b"
// ASSERT: scan "orPackage":"a.c"
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

