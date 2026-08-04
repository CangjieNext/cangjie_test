/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package http2_server

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"testing"
)

func TestStartHttp2Server(t *testing.T) {
	handlers := map[string]func(w http.ResponseWriter, r *http.Request){
		"/get32":   getHandlerHttp2(32),
		"/get256":  getHandlerHttp2(256),
		"/get2048": getHandlerHttp2(2048),
		"/get16384": getHandlerHttp2(16384),
		"/get131072": getHandlerHttp2(131072),
		"/get1048576": getHandlerHttp2(1048576),
		"/get8388608": getHandlerHttp2(8388608),
		"/get67108864": getHandlerHttp2(67108864),
		"/post": postHandlerHttp2(),
	}
	for path, handler := range handlers {
		http.HandleFunc(path, handler)
	}

	fmt.Println("Server started at https://127.0.0.1:62003")
	server := http.Server{
		Addr:    ":62003",
	}
	err := server.ListenAndServeTLS("data/end_rsa.cer", "data/end_rsa_private_key.pem")
	if err != nil {
		panic(err)
		return
	}
}

func getHandlerHttp2(size int) func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		body := make([]byte, size)
		w.Write(body)
	}
}

func postHandlerHttp2() func(w http.ResponseWriter, r *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		ioutil.ReadAll(r.Body)
		w.WriteHeader(http.StatusOK)
	}
}