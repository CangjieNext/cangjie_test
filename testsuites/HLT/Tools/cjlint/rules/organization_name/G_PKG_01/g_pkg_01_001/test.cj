/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../
// EXEC-PIPE: %lint -f ./ 2>&1 -c %cangjieDir/tools | compare %f
// ASSERT: scan G.PKG.01: Avoid using the wildcard '*' in the import declaration 'org::std.ast'.

import org::std.ast.*

main(){
    return 1
}
