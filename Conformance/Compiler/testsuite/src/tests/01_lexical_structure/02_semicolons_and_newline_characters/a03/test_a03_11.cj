/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a03_11

  @Level:         1

  @Assertion:    1.2(3) However, the meaning of newline character is not fixed, depending on its position, 
                        it can either be used as a separator of two tokens like the space character,
                        or as an ending character of an expression or declaration like ;.

  @Description:    Check the using of newline character for function calls. All tokens are on the different lines.

  @Mode:           run

  @Negative:       no

  @Structure:      single

  @CompileWarning: ignore        

*/

import utils.assert.Assert

main() {

    func
    foo1
    (
        arg
        :
        Int64
    )
    {
        return
        arg
    }
    
    func
    foo2
    (
        arg
        :
        Int64
    )
    {
        return
        arg
    }
    
        var
        x
        :
        Int64
        =
        foo1(
    	1
    	)
        +
        foo2(
    	2
    	)
    
        Assert.equals(
        	3
        	,
    	x
        )
}

