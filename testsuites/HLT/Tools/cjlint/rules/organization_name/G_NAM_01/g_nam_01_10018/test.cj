/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../
// EXEC-PIPE: %lint -f ./ -c %cangjieDir/tools -m %cangjieDir 2>&1 | compare %f
// ASSERT: regex-not [0-9a-zA-Z]

package A1B_C::a_1a;

class X{}

main(){

}
