/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package http_server

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"testing"
)

func TestStartHttpServer(t *testing.T) {
	handlers := map[string]func(w http.ResponseWriter, r *http.Request){
		"/get32":   getHandler(32),
		"/get256":  getHandler(256),
		"/get2048": getHandler(2048),
		"/get16384": getHandler(16384),
		"/get131072": getHandler(131072),
		"/get1048576": getHandler(1048576),
		"/get8388608": getHandler(8388608),
		"/get67108864": getHandler(67108864),
		"/post": postHandler(),
	}
	for path, handler := range handlers {
		http.HandleFunc(path, handler)
	}

	fmt.Println("Server started at http://127.0.0.1:62001")
	http.ListenAndServe(":62001", nil)
}

func getHandler(size int) func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		body := make([]byte, size)
		w.Write(body)
	}
}

func postHandler() func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		ioutil.ReadAll(r.Body)
		w.WriteHeader(http.StatusOK)
	}
}
