/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_02_a06_01

  @Level:         1

  @Assertion:    12.1.2(6) The following is an example of try-with-resources expressions.
                            try (input = FileInputStream("input.txt"), 
                                output = FileOutputStream("output.txt")) { 
                                    while (input.hasNextLine()) { 
                                        let lineString = input.readLine() 
                                        output.writeLine(lineString) 
                                    } 
                                } 

  @Description:  Checks the example from specification.

  @Mode:         compileonly

  @Negative:     yes

  @Issue:        0006447

  @Structure:    single

*/

main() {
    let e = try (input = FileInputStream("input.txt"), output = FileOutputStream("output.txt")) { 
        while (input.hasNextLine()) { 
            let lineString = input.readLine() 
            output.writeLine(lineString) 
        } 
    } 
}
