/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC-PIPE-1: bash -c 'bash $CANGJIE_HOME/envsetup.sh' 2>&1 | compare %f
// ASSERT: scan [ERROR] This script must be sourced, not executed directly.