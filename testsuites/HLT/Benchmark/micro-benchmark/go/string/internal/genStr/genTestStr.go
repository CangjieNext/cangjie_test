/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package genStr

import "math/rand"

const letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
const (
	letterIndexBits = 6                      // 6 bits to represent a letter index
	letterIndexMask = 1<<letterIndexBits - 1 // All 1-bits, as many as letterIndexBits
)

var StrLenArray = [...]int{32, 256, 2048, 2 * 1024, 16 * 1024, 128 * 1024, 1 * 1024 * 1024, 8 * 1024 * 1024, 64 * 1024 * 1024, 512 * 1024 * 1024, 2 * 1024 * 1024 * 1024}

func GenerateStr(strLen int) string {
	s := make([]byte, strLen)

	for i := 0; i < strLen; {
		if idx := int(rand.Int63() & letterIndexMask); idx < len(letters) {
			s[i] = letters[idx]
			i++
		}
	}

	return string(s)
}
