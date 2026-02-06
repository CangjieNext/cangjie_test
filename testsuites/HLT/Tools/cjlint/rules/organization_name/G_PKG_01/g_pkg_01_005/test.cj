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
// ASSERT: scan-1 G.PKG.01: Avoid using the wildcard '*' in the import declaration 'org::a.b.c.a'.
// ASSERT: scan-1 G.PKG.01: Avoid using the wildcard '*' in the import declaration 'org::test'.

import org::{a.b.c.a.*,
                test.*}
main(){
    return 1
}

