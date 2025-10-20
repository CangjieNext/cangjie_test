// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
package com.java.lib;
 
import cj.Vector;
 
public class Main {
 
    public static Vector getVector(int x, int y) {
        return new Vector(x, y);
    }
 
    public static HiddenVector getHiddenVector(int x, int y) {
	return new HiddenVector(x, y);
    }
    public static void main(String[] args) {
        Vector u = new Vector(1, 2);
        Vector v = getVector(3, 4);
	HiddenVector v = getHiddenVector(3, 4);
    }
}