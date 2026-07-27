/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cffi

import "testing"

func BenchmarkCffiCpointer1(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCPointer1()
	}
}

func BenchmarkCffiCpointer2(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCPointer2()
	}
}

func BenchmarkCffiCpointer3(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCPointer3()
	}
}

func BenchmarkCffiCpointer4(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCPointer4()
	}
}

func BenchmarkCffiCpointer5(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCPointer5()
	}
}

func BenchmarkCffiCpointer6(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCPointer6()
	}
}

func BenchmarkCffiCpointer7(b *testing.B) {
	for i := 0; i < b.N; i++ {
		RunCPointer7()
	}
}
