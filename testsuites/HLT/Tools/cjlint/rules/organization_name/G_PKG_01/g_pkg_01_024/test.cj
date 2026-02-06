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
// ASSERT: scan-1 G.PKG.01: Avoid using the wildcard '*' in the import declaration 'org::a'.
// ASSERT: scan-1 G.PKG.01: Avoid using the wildcard '*' in the import declaration 'org2::b'.
// ASSERT: scan-1 G.PKG.01: Avoid using the wildcard '*' in the import declaration 'org3::c'.
// ASSERT: scan-1 G.PKG.01: Avoid using the wildcard '*' in the import declaration 'org4::d'.

public import org::a.*
internal import org2::b.*
private import org3::c.*
protected import org4::d.*

main(){
    return 1
}
