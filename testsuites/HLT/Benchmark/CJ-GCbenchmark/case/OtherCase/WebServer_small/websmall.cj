/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

from std import collection.*

public open class Page {
	public var address: String = ""
	public var expectedDigest: String = ""
	public var expectedStatus: Int64 = 0
	public var contents: ?Array<Byte> = None
}

public open class RequestParameter {
	public var pageSize: Int64 = 0
	public var pageNum: Int64 = 0
}

public open class RequestHeader {
	public var accept: String = ""
	public var acceptEncoding: String = ""
	public var acceptLanguage: String = ""
	public var connection: String = ""
	public var cookie: String = ""
	public var host: String = ""
	public var Referer: String = ""
	public var secChUa: String = ""
	public var SecChUaMobile: String = ""
	public var SecChUaPlatform: String = ""
	public var SecFetchDest: String = ""
	public var SecFetchMode: String = ""
	public var SecFetchSite: String = ""
	public var UpgradeInsecureRequests: String = ""
	public var UserAgent: String = ""
}

public open class Request {
	public static var BASIC_AUTH: String = ""
	public static var FORM_AUTH: String = ""
	public static var CLIENT_CERT_AUTH: String = ""
	public static var DIGEST_AUTH: String = ""
	public var requestParameter: ?RequestParameter = None
	public var requestUrl: String = ""
	public var requestMethod: String = ""
	public var requestHeader: ?RequestHeader = None
}

public open class ResponseHeader {
	public var Bdpagetype: Int64 = 0
	public var Bdqid: String = ""
	public var CacheControl: String = ""
	public var Ckpacknum: Int64 = 0
	public var Ckrndstr: String = ""
	public var Connection: String = ""
	public var ContentEncoding: String = ""
	public var ContentSecurity_Policy: String = ""
	public var ContentType: String = ""
	public var Date: String = ""
	public var Server: String = ""
	public var SetCookie: String = ""
	public var StrictTransportSecurity: String = ""
	public var Traceid: Int64 = 0
	public var TransferEncoding: String = ""
	public var Vary: String = ""
	public var XUaCompatible: String = ""
}

public open class ResponseBody {
	public var pages: ?Array<?Page> = None
}

public open class Response {
	public var statusCode: Int64 = 0
	public var responseHeader: ?ResponseHeader = None
	public var responseBody: ?ResponseBody = None
}


func service(request: ?Request, response: ?Response): Unit {
	var pageNum: Int64 = getRequestPageNum(request)
	var pageSize: Int64 = getRequestPageSize(request)
	var responseHeader: ?ResponseHeader = ResponseHeader()
	var responseBody: ?ResponseBody = ResponseBody()
	initResponseBody(responseBody, pageNum, pageSize)
	response.getOrThrow().responseHeader = responseHeader
	response.getOrThrow().responseBody = responseBody
}

func initResponseBody(responseBody: ?ResponseBody, pageNum: Int64, pageSize: Int64): Unit {
	var futureList = ArrayList<Future<Unit>>()
	var pages: ?Array<?Page> = Array<?Page>(pageNum, item: None)
	for (i in 0..pageNum:1) {
		pages.getOrThrow()[i] = Page()
		var contents: ?Array<Byte> = Array<Byte>(pageSize, item: 0)
		pages.getOrThrow()[i].getOrThrow().contents = contents
	}
	responseBody.getOrThrow().pages = pages
	for (fut in futureList) { fut.get() }
}

func batchRun(totalThreadNum: Int64, pageNum: Int64, pageSize: Int64): Unit {
	var futureList = ArrayList<Future<Unit>>()
	for (i in 0..totalThreadNum:1) {
		let request: ?Request = ConstructRequest(pageNum, pageSize)
		let response: ?Response = Response()
		futureList.append(spawn { => service(request, response) })
	}
	for (fut in futureList) { fut.get() }
}

main(): Unit {
	var futureList = ArrayList<Future<Unit>>()
	var totalThreadNum: Int64 = 9
	var pageNum: Int64 = 8000
	var pageSize: Int64 = 4096
	var batchSize: Int64 = 300
	for (i in 0..batchSize:1) {
		batchRun(totalThreadNum, pageNum, pageSize)
	}
	for (fut in futureList) { fut.get() }
}

func ConstructRequest(pageNum: Int64, pageSize: Int64): ?Request {
	var request: ?Request = Request()
	initRequest(request, pageNum, pageSize)
	return request
}

func initRequest(request: ?Request, pageNum: Int64, pageSize: Int64): Unit {
	var requestParameter: ?RequestParameter = RequestParameter()
	initRequestParameter(requestParameter, pageNum, pageSize)
	var requestHeader: ?RequestHeader = RequestHeader()
	request.getOrThrow().requestParameter = requestParameter
	request.getOrThrow().requestHeader = requestHeader
}

func initRequestParameter(requestParameter: ?RequestParameter, pageNum: Int64, pageSize: Int64): Unit {
	requestParameter.getOrThrow().pageNum = pageNum
	requestParameter.getOrThrow().pageSize = pageSize
}

func getRequestPageNum(request: ?Request): Int64 {
	var requestParameter: ?RequestParameter = request.getOrThrow().requestParameter
	var pageNum: Int64 = requestParameter.getOrThrow().pageNum
	return pageNum
}

func getRequestPageSize(request: ?Request): Int64 {
	var requestParameter: ?RequestParameter = request.getOrThrow().requestParameter
	var pageSize: Int64 = requestParameter.getOrThrow().pageSize
	return pageSize
}

