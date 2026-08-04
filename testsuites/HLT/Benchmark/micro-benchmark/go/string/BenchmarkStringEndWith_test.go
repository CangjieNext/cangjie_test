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

var res_endWith bool

func BenchmarkStringEndWith_N1(b *testing.B){
	str := strings.Repeat("H", 1)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_endWith = strings.HasSuffix(str, "H")
	}
}

func BenchmarkStringEndWith_N1k(b *testing.B){
	str := strings.Repeat("H", 1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_endWith = strings.HasSuffix(str, "H")
	}
}

func BenchmarkStringEndWith_N1m(b *testing.B){
	str := strings.Repeat("H", 1024*1024)
	b.ResetTimer()
	for i := 0; i < b.N; i ++{
		res_endWith = strings.HasSuffix(str, "H")
	}
}
