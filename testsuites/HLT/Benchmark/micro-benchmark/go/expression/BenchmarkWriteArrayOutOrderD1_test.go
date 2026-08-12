/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package expression_test

import (
	"testing"
)

func benchmarkWriteOutOrderD1Run(b *testing.B, arrLen int) {
	arr := make([]int, arrLen)
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j := 0; j < arrLen; j+=step {
			arr[j] = j
		}
	}
}

func BenchmarkWriteArrayOutOfOrderD1_N32(b *testing.B)   { benchmarkWriteOutOrderD1Run(b, arrLen[0]) }
func BenchmarkWriteArrayOutOfOrderD1_N256(b *testing.B)  { benchmarkWriteOutOrderD1Run(b, arrLen[1]) }
func BenchmarkWriteArrayOutOfOrderD1_N2048(b *testing.B)  { benchmarkWriteOutOrderD1Run(b, arrLen[2]) }
func BenchmarkWriteArrayOutOfOrderD1_N16384(b *testing.B)  { benchmarkWriteOutOrderD1Run(b, arrLen[3]) }
