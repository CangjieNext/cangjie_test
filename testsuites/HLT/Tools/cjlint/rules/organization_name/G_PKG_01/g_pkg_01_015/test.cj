/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// DEPENDENCE: ../
// EXEC-PIPE: %lint -f ./ 2>&1 -c %cangjieDir/tools | compare %f
// ASSERT: scan G.PKG.01: Avoid using the wildcard '*' in the import declaration 'org::a'.
// ASSERT: regex G.NAM.01: The name of the 'aa::AB' package must contain only digits, lowercase letters, and underscores \(_\).

package aa::AB

import org::a.*

main(){
    return 1
}

