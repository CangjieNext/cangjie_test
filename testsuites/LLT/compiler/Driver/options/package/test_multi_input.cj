// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/package00 ../src/package01a
// EXEC:%compiler -p package00 package01a 2>&1 | compare %f
// ASSERT: scan expect exact one package path to build
