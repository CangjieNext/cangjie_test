/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
/*
  @No: 6.2.1.2.6
  @Scene: modify
  @Visibility: public
  @Object: interface
  @Behavior: delete @Java
  @Expect: api incompatible & abi incompatible
*/

// LEVEL: 1
// DEPENDENCE: main.cj, template.cj

// TEST CJCPL
// E-EXEC-PIPE: %cjcpl %old_cjo old.cjo %new_cjo test_stable_abi.cjo 2>&1 | compare template.cj
// TEST ABI Compatibility

// TEST API Compatibility


package test_stable_abi

// test interface: @Java

public interface I1 {
    public static func typename(): String {
        "interface I1"
    }
}

public interface I2 {
    public static func typename(): String {
        "interface I2"
    }
}
