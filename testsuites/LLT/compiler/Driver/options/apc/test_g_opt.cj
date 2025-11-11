// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler -g -O2 %f -o %n.%suffix  --save-temps . &&  ls -l | grep -E ' [^.]+\.bc$' | wc -l  | compare %f
// ASSERT: scan 1
// EXEC-PIPE-0: %compiler -O2 %f -o %n.%suffix  --save-temps . &&  ls -l | grep -E ' [^.]+\.bc$' | wc -l  | compare %f
// ASSERT: scan 1

main(){
    return 0
}