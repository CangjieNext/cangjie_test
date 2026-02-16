/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import UNNAMED.Impl;
import UNNAMED.MyClass;
import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;

public class UT {
    @Before
    public void setUp() {
    }
    
    @Test
    public void testAdd() {
        var m = new MyClass();
        m.foo();
    }
    
    // @Test(expected = IllegalArgumentException.class)
    // public void testDivideByZero() {
    //     calculator.divide(5, 0);
    // }
}
