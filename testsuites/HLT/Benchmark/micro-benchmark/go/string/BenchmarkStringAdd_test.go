/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package string_test

import (
	"testing"
	"strings"
)

var res_add string

func benchmarkStringAdd(b *testing.B, strlen int){
	str := strings.Repeat("H", strlen)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_add = str + str
	}
}

func BenchmarkStringAdd_N8(b *testing.B){
	benchmarkStringAdd(b, 8)
}

func BenchmarkStringAdd_N32(b *testing.B){
	benchmarkStringAdd(b, 32)
}

func BenchmarkStringAdd_N256(b *testing.B){
	benchmarkStringAdd(b, 256)
}

func BenchmarkStringAdd_N1k(b *testing.B){
	benchmarkStringAdd(b, 1024)
}

func BenchmarkStringAdd_N1m(b *testing.B){
	benchmarkStringAdd(b, 1024 * 1024)
}