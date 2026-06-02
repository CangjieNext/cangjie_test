/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: translationUnit
                  : NL* preamble end* topLevelObject* (end+ mainDefinition)?
                    NL* (topLevelObject (end+ topLevelObject?)*)? EOF
                  ;

              end
                  : NL | SEMI
                  ;

  @Description: Check positive translationUnit expressions examples.
  @Level:         1
                translationUnit = preamble end mainDefinition EOF

  @Mode: run

  @Negative: no
*/

// preamble
import std.core.*

// mainDefinition
main() {}

