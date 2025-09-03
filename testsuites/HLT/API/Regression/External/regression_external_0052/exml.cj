/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



import std.collection.*
import std.math.*

interface OldEnum <: Equatable<OldEnum> {
    func toInt(): Int64
}

/* Internal states for parsing. */
enum ParsingState <: ToString & OldEnum {
    ST_DOC |
    ST_LT |
    ST_OPEN |
    ST_CLOSE |
    ST_TEXT |
    ST_ATTR |
    ST_ATTR_VAL |
    ST_QM |
    ST_EX |
    ST_ERROR |
    ST_OK

    func toString(): String {
        match (this) {
            case ST_DOC => "DOC"
            case ST_LT => "LT"
            case ST_OPEN => "OPEN"
            case ST_CLOSE => "CLOSE"
            case ST_TEXT => "TEXT"
            case ST_ATTR => "ATTR"
            case ST_ATTR_VAL => "ATTR_VAL"
            case ST_QM => "QM"
            case ST_EX => "EX"
            case ST_ERROR => "ERROR"
            case ST_OK => "OK"
        }
    }

    func toInt(): Int64 {
        match (this) {
            case ST_DOC => 0
            case ST_LT => 1
            case ST_OPEN => 2
            case ST_CLOSE => 3
            case ST_TEXT => 4
            case ST_ATTR => 5
            case ST_ATTR_VAL => 6
            case ST_QM => 7
            case ST_EX => 8
            case ST_ERROR => 9
            case ST_OK => 10
        }
    }

    operator func == (that: OldEnum): Bool {
        this.toInt() == that.toInt()
    }

    operator func != (that: OldEnum): Bool {
        !(this == that)
    }
}

enum TokenRole <: ToString & OldEnum {
    TOKEN_OPEN |
    TOKEN_CLOSE |
    TOKEN_TEXT |
    TOKEN_ATTR |
    TOKEN_ATTR_VAL |
    TOKEN_PI |
    TOKEN_PI_VAL |
    TOKEN_DOC

    func toString(): String {
        match (this) {
            case TOKEN_OPEN => "OPEN"
            case TOKEN_CLOSE => "CLOSE"
            case TOKEN_TEXT => "TEXT"
            case TOKEN_ATTR => "ATTR"
            case TOKEN_ATTR_VAL => "ATTR_VAL"
            case TOKEN_PI => "PI"
            case TOKEN_PI_VAL => "PI_VAL"
            case TOKEN_DOC => "DOC"
        }
    }

    func toInt(): Int64 {
        match (this) {
            case TOKEN_OPEN => 0
            case TOKEN_CLOSE => 1
            case TOKEN_TEXT => 2
            case TOKEN_ATTR => 3
            case TOKEN_ATTR_VAL => 4
            case TOKEN_PI => 5
            case TOKEN_PI_VAL => 6
            case TOKEN_DOC => 7
        }
    }

    operator func == (that: OldEnum): Bool {
        this.toInt() == that.toInt()
    }

    operator func != (that: OldEnum): Bool {
        !(this == that)
    }
}

struct TokenCB {
    var role: TokenRole
    var depth: UInt8
    var offset_raw: UInt32
    var length_raw: UInt32
    init(role: TokenRole, depth: UInt8, offset: UInt32, length: UInt32) {
        this.role = role
        this.depth = depth
        this.offset_raw = offset
        this.length_raw = length
    }
    mut prop length: Int64 {
        get() { Int64(length_raw) }
        set(v) { length_raw = UInt32(v) }
    }
    mut prop offset: Int64 {
        get() { Int64(offset_raw) }
        set(v) { offset_raw = UInt32(v) }
    }
}

type Token = Int64

func is_some_token(t: ?Token): Bool {
    match (t) {
        case Some(v) => true
        case None => false
    }
}

enum SkipOperation <: OldEnum {
    SKIP_IDLE |
    SKIP_ELEM |
    SKIP_ATTR |
    SKIP_PI |
    SKIP_TEXT

    func toInt(): Int64 {
        match (this) {
            case SKIP_IDLE => 0
            case SKIP_ELEM => 1
            case SKIP_ATTR => 2
            case SKIP_PI => 3
            case SKIP_TEXT => 4
        }
    }

    operator func == (that: OldEnum): Bool {
        this.toInt() == that.toInt()
    }

    operator func != (that: OldEnum): Bool {
        !(this == that)
    }
}

type SkipperFunc = (TokenRole, Int64, String) -> Bool

class Exml {
    private var debug = false

    private var quoter: Rune = '\0'
    private var xmlstr: Array<UInt8>
    private var xmlsize: Int64
    private var offset: Int64 = 0
    private var bk_offset: Int64 = 0
    private var skip_op = SKIP_IDLE

    private var eof: Bool
    private var state: ParsingState

    private var root: ?Token = None

    private var stack = ArrayList<TokenCB>(64)

    var tokens = ArrayList<TokenCB>()

    private var skipper: ?SkipperFunc = None
    private var skip_depth: Int64 = 0

    init(xmlStr: String) {
        this.xmlstr = xmlStr.toArray()
        this.xmlsize = xmlstr.size
        this.state = ST_DOC
        this.eof = false
    }

    func Dump() {
        println("- EXML DUMP -----")
        println("State: ${state} XML string length: ${xmlsize}")

        if (state == ST_OK) {
            println("Token number: ${tokens.size}")
        } else if (state == ST_ERROR) {

            println("Error context ----------")
            var start = offset - 100 // Error context window
            var stop = offset + 1
            if (start < 0) {
                start = 0
            }
            if (stop > xmlsize) {
                stop = xmlsize
            }

            println("${xmlstr}")
            println( "----- End of error context" )
        }
        println("- DUMP END -----" )
    }

    private func pushToken(t: TokenCB) {
        if (stack.size < stack.capacity) {
            stack.add(t)
        } else {
            state = ST_ERROR
        }
    }

    private func popToken(): TokenCB {
        if (stack.size > 0) {
            return stack.remove(at: stack.size - 1)
        }

        state = ST_ERROR

        return TokenCB(TOKEN_DOC, 0, 0, 0)
    }

    private func token_str(t: TokenCB): String {
        return String.fromUtf8(xmlstr[t.offset..t.offset + t.length])
    }

    private func xmlstrMatch(pos1:Int64, pos2:Int64, len1:Int64, len2:Int64): Bool {
        if (len1 != len2) {
            return false
        }
        for (i in 0..len1) {
            if (xmlstr[pos1 + i] != xmlstr[pos2 + i]) {
                return false
            }
        }
        return true
    }

    private func procToken_stack(t: TokenCB): Bool {
        if (t.role == TOKEN_OPEN) {
            pushToken(t)
        } else if (t.role == TOKEN_CLOSE) {
            let t_pop = popToken()

            /* make sure the close element matches the open element */
            if (xmlstr[t.offset] != UInt8(UInt32('/'))) {
                if (!xmlstrMatch(t.offset, t_pop.offset, t.length, t_pop.length)) {
                    state = ST_ERROR
                    return false
                }
            }
        }
        return true
    }

    private func procToken_write(t: TokenCB): Bool {
        if (t.role == TOKEN_TEXT) {
            var prev = tokens[tokens.size - 1]
            if (prev.role == TOKEN_TEXT) {
                /* Appending current text token to previous one */
                for (i in 0..prev.length) {
                    xmlstr[prev.offset + i] = xmlstr[t.offset + i]
                }
                prev.length += t.length
                tokens[tokens.size - 1] = prev
                if (debug) {
                    println("\t\t\t+:${token_str(prev)}")
                }
                return true
            }
        }

        tokens.add(t)

        if (debug) {
            println("\t\t\t${t.role}:${t.offset}..${t.length}")
            println("\t\t\t${t.role}:${token_str(t)}")
        }

        return true
    }

    private func procToken_skip_begin(role: TokenRole) {
        if (role == TOKEN_OPEN) {
            skip_op = SKIP_ELEM
            skip_depth = stack.size
        } else if (role == TOKEN_ATTR) {
            skip_op = SKIP_ATTR
        } else if (role == TOKEN_PI) {
            skip_op = SKIP_PI
        } else if (role == TOKEN_TEXT) {
            skip_op = SKIP_TEXT
        }
    }

    func tokenCanSkip(role: TokenRole): Bool {
        (role == TOKEN_OPEN) || (role == TOKEN_ATTR) || 
        (role == TOKEN_PI) || (role == TOKEN_TEXT)
    }

    func procToken_skip(t: TokenCB): Unit {
        if (!tokenCanSkip(t.role)) {
            return
        }

        /* Let the callback make skip decision for this token */
        match(skipper) {
            case Some(f) =>
                let token = xmlstr[t.offset..t.offset + t.length]
                if (!f(t.role, stack.size, String.fromUtf8(token))) {
                    return
                }
            case None => return
        }

        procToken_skip_begin(t.role)
    }

    private func procToken_skip_recover1(role: TokenRole) {
        /* skip recovers from SKIP_PI */
        if ((skip_op == SKIP_PI) && (role != TOKEN_PI_VAL)) {
            skip_op = SKIP_IDLE
        }
        /* skip recovers from SKIP_ATTR */
        if ((skip_op == SKIP_ATTR) && (role != TOKEN_ATTR_VAL)) {
            skip_op = SKIP_IDLE
        }
    }

    private func procToken_skip_recover2(role: TokenRole) {
        /* skip recovers from SKIP_ELEM */
        if ((skip_op == SKIP_ELEM) &&
            (role == TOKEN_CLOSE) &&
            (stack.size == skip_depth)) {
            skip_op = SKIP_IDLE
        }
        /* skip recovers from SKIP_TEXT */
        if (skip_op == SKIP_TEXT) {
            skip_op = SKIP_IDLE
        }
    }

    /*
    * This handles token skipping, it helps users save memory.
    * The logic is:
    *   1. Make skip desicion in *_ifskip() which calls a custom callback
    *   2. Skip action is stored in the xml object, 5 types:
    *       1) SKIP_IDLE: a skip not in process, do not skip
    *       2) SKIP_ELEM: skip the element and its all child tokens
    *       3) SKIP_PI: skip the PI and corresponding PI_VAL
    *       4) SKIP_ATTR: skip the ATTR and corresponding ATTR_VAL
    *       5) SKIP_TEXT: skip the TEXT token
    *   3. Do real write in *_write()
    *   4. Recover from a skip process in _recover1() and _recover2()
    */
    private func procToken(role: TokenRole, offset: Int64, length: Int64) {
        var t = TokenCB(role, 0, UInt32(offset), math.UInt32.Max)

        if (length < t.length) {
            t.length = length
        }

        t.depth = UInt8(stack.size)

        if (role == TOKEN_CLOSE) {
            t.depth--
        }

        /* check if recover from SKIP_PI and SKIP_ATTR */
        procToken_skip_recover1(t.role)

        /* A skip action is in progress, no new decision required */
        if (skip_op == SKIP_IDLE) {
            /* make decision if skip storing the token */
            procToken_skip(t)
        }

        /* if not skip, then write token into storage */
        if (skip_op == SKIP_IDLE) {
            if ((role == TOKEN_OPEN) && (t.depth == 0)) {
                /* root element found */
                if ((root ?? -1) >= 0) {
                    /* more than one root */
                    state = ST_ERROR
                    return
                }
                root = Some(tokens.size)
            }

            if (!procToken_write(t)) {
                return
            }
        }

        /* stack operation for depth calculation and open/close match check */
        if (!procToken_stack(t)) {
            return
        }

        /* check if recover from SKIP_ELEM and SKIP_TEXT */
        procToken_skip_recover2(t.role)
    }

    private func skip_ch_any() {
        if (offset >= xmlsize) {
            eof = true
        } else {
            offset++
        }
    }

    private func skip_ch(ch: Rune): Bool {
        if (offset >= xmlsize) {
            eof = true
            return false
        }

        if (UInt8(UInt32(ch)) == xmlstr[offset]) {
            offset++
            return true
        }

        return false
    }

    private func skip_ch_anyof(str: String): Bool {
        for (ch in str) {
            if (skip_ch(ch)) {
                return true
            }
        }

        return false
    }

    private func skip_ch_noneof(str: String): Bool {
        if (offset >= xmlsize) {
            eof = true
            return false
        }

        for (ch in str) {
            if (UInt8(UInt32(ch)) == xmlstr[offset]) {
                return false
            }
        }

        offset++
        return true
    }

    func isValidInitial(c: UInt8) {
        let ch = UInt32(c)
        return ((ch >= UInt32('a')) && (ch <= UInt32('z'))) ||
            ((ch >= UInt32('A')) && (ch <= UInt32('Z'))) ||
            (ch == UInt32('_')) || (ch >= 128)
    }
    
    private func skip_ch_initial(): Bool {
        if (offset >= xmlsize) {
            eof = true
            return false
        }

        if (isValidInitial(xmlstr[offset])) {
            offset++
            return true
        }

        if (debug) {
            println("Initial Error: ${Rune(UInt32(xmlstr[offset]))}")
        }

        return false
    }

    private func skip_str(str: String): Bool {
        for (ch in str) {
            if (!skip_ch(ch)) {
                return false
            }
        }

        return true
    }

    private func skip_str_name() {
        while (skip_ch_noneof(" \t\r\n<>/!&=?'[]{}\"\\")) {
        }
    }

    private func skip_str_ws() {
        while (skip_ch_anyof(" \r\n\t")) {
        }
    }

    private func finalize(): Bool {
        if (state == ST_ERROR) {
            return false
        }

        if (((root ?? -1) < 0) || (stack.size != 0)) {
            state = ST_ERROR
            return false
        }

        state = ST_OK
        return true
    }

    private func parse_doc() {
        skip_str_ws()

        if (skip_ch('<')) {
            state = ST_LT
        } else if (!eof) {
            state = ST_ERROR
        }
    }

    private func parse_lt() {
        if (skip_ch('?')) {
            state = ST_QM
        } else if (skip_ch('!')) {
            state = ST_EX
        } else if (skip_ch_anyof(" \t\r\n<>")) {
            state = ST_ERROR
        } else if (skip_ch('/')) {
            state = ST_CLOSE
        } else {
            state = ST_OPEN
        }
    }

    private func parse_open() {
        bk_offset = offset

        if (!skip_ch_initial()) {
            state = ST_ERROR
            return
        }

        skip_str_name()

        if (skip_ch_anyof("!&")) {
            state = ST_ERROR
            return
        }

        let len = offset - bk_offset

        procToken(TOKEN_OPEN, bk_offset, len)
        if (state == ST_ERROR) {
            return
        }

        skip_str_ws()

        state = ST_ATTR
    }

    private func is_attr_ended(): Bool {
        if (skip_ch('/')) {
            if (skip_ch('>')) {
                procToken(TOKEN_CLOSE, offset - 2, 1)
                if (state == ST_ERROR) {
                    return true
                }

                state = if (stack.size == 0) { ST_DOC } else { ST_TEXT }
            } else {
                state = ST_ERROR
            }

            return true
        } else if (skip_ch('>')) {
            state = ST_TEXT
            return true
        }

        return false
    }

    private func parse_attr() {
        if (is_attr_ended()) {
            return
        }

        bk_offset = offset

        if (!skip_ch_initial()) {
            state = ST_ERROR
            return
        }

        skip_str_name()

        let temp = offset
        skip_str_ws()

        if (skip_ch('=')) {
            let len = temp - bk_offset
            procToken(TOKEN_ATTR, bk_offset, len)
            if (state == ST_ERROR) {
                return
            }

            skip_str_ws()

            if (skip_ch('"')) {
                quoter = '"'
                state = ST_ATTR_VAL
                return
            } else if (skip_ch('\'')) {
                quoter = '\''
                state = ST_ATTR_VAL
                return
            }
        }
        state = ST_ERROR
    }

    private func parse_attr_val() {
        bk_offset = offset

        while (skip_ch_noneof("<\\" + quoter)) {
        }

        let temp = offset
        if (skip_ch(quoter)) {
            let len = temp - bk_offset
            procToken(TOKEN_ATTR_VAL, bk_offset, len)
            if (state == ST_ERROR) {
                return
            }

            skip_str_ws()

            if (skip_ch('>')) {
                state = ST_TEXT
            } else {
                state = ST_ATTR
            }
        } else {
            state = ST_ERROR
        }
    }

    private func parse_close() {
        bk_offset = offset

        if (!skip_ch_initial()) {
            state = ST_ERROR
            return
        }

        skip_str_name()

        if (skip_ch_anyof("!/")) {
            state = ST_ERROR
            return
        }

        let len = offset - bk_offset
        procToken(TOKEN_CLOSE, bk_offset, len)
        if (state == ST_ERROR) {
            return
        }

        skip_str_ws()

        if (!skip_ch('>')) {
            state = ST_ERROR
            return
        }

        state = if (stack.size == 0) { ST_DOC } else { ST_TEXT }
    }

    private func parse_text() {
        bk_offset = offset
        skip_str_ws()

        var temp = 0
        while (skip_ch_noneof("<")) {
            temp = offset
        }

        if (!skip_ch('<')) {
            state = ST_ERROR
            return
        }

        if (temp > 0) {
            let len = temp - bk_offset
            procToken(TOKEN_TEXT, bk_offset, len)
            if (state == ST_ERROR) {
                return
            }
        }
        state = ST_LT
    }

    private func parse_pi_val() {
        bk_offset = offset

        while (!skip_str("?>")) {
            skip_ch_any()
            if (eof) {
                state = ST_ERROR
                return
            }
        }

        let len = offset - bk_offset - 2 /* excluding 2-byte "?>" */
        procToken(TOKEN_PI_VAL, bk_offset, len)
        if (state == ST_ERROR) {
            return
        }

        state = if (stack.size == 0) { ST_DOC } else { ST_TEXT }
    }

    private func parse_qm() {
        bk_offset = offset

        if (!skip_ch_initial()) {
            state = ST_ERROR
            return
        }

        skip_str_name()

        if (skip_ch_anyof("!&/")) {
            state = ST_ERROR
            return
        }

        procToken(TOKEN_PI, bk_offset, offset - bk_offset)
        if (state == ST_ERROR) {
            return
        }

        skip_str_ws()
        parse_pi_val()
    }

    private func parse_cdata() {
        if (stack.size == 0) {
            state = ST_ERROR
            return
        }

        bk_offset = offset
        while (!eof) {
            if (skip_str("]]>")) {
                state = ST_TEXT
                let len = offset - bk_offset - 3
                if (len > 0) {
                    procToken(TOKEN_TEXT, bk_offset, len)
                }
                return
            }
            skip_ch_any()
        }
        state = ST_ERROR
    }

    private func ignore_until(boundary: String) {
        while (!eof) {
            if (skip_str(boundary)) {
                state = if (stack.size == 0) { ST_DOC } else { ST_TEXT }
                return
            }
            skip_ch_any()
        }
        state = ST_ERROR
    }

    private func parse_ex() {
        if (skip_str("--")) {
            ignore_until("-->")
        } else if (skip_str("[CDATA[")) {
            parse_cdata()
        } else if (skip_str("DOCTYPE")) {
            ignore_until(">")
        } else {
            state = ST_ERROR
        }
    }

    private func run_state(): Bool {
        if (state == ST_DOC) {
            parse_doc()
        } else if (state == ST_LT) {
            parse_lt()
        } else if (state == ST_OPEN) {
            parse_open()
        } else if (state == ST_CLOSE) {
            parse_close()
        } else if (state == ST_TEXT) {
            parse_text()
        } else if (state == ST_ATTR) {
            parse_attr()
        } else if (state == ST_ATTR_VAL) {
            parse_attr_val()
        } else if (state == ST_QM) {
            parse_qm()
        } else if (state == ST_EX) {
            parse_ex()
        } else {
            return false
        }

        return true
    }

    func Parse(skipper: ?SkipperFunc): Bool {
        this.skipper = skipper

        procToken(TOKEN_DOC, 0, 0)

        while (!eof) {
            if (debug) {
                println("\t\t\t\t\t\t\t\tST_${state}")
            }
            if (!run_state()) {
                return false
            }
        }

        return finalize()
    }

    func Parse(): Bool {
        return Parse(None<SkipperFunc>)
    }

    func Root(): ?Token {
        return root
    }

    func Query(pos: Token, xpath: String): ExmlSet {
        return ExmlSet(this, pos, xpath)
    }

    func GetElement(pos: Token, xpath: String): ?Token {
        return Query(pos, xpath).iterator().next()
    }

    func GetName(element: Token): ?String {
        if (!is_valid_open_token(element)) {
            return None
        }
        let t = tokens[element]
        return token_str(t)
    }

    func GetText(element: Token): ?String {
        if (!is_valid_open_token(element)) {
            return None
        }

        let depth = tokens[element].depth
        for (i in element + 1..tokens.size) {
            let t = tokens[i]
            if (match_token_depth_role(t, depth, TOKEN_CLOSE)) {
                break
            }

            /* only the first text block is returned */
            if (match_token_depth_role(t, depth + 1, TOKEN_TEXT)) {
                return token_str(t)
            }
        }

        return None
    }

    private func match_name(pattern: String, name: String): Bool {
        var pat = pattern
        var to_match = name

        if (pat[0] == ':') {
            /* name in xpath starting with ':' means to ignore namespace,
            * so we only need to match name without the namespace */
            pat = pat.substring(1)
            to_match = to_match.substring(to_match.indexOf(':') ?? 0)
        }

        return (pat == "*") || (pat == to_match)
    }

    func GetAttr(element: Token, attr: String): ?String {
        if (!is_valid_open_token(element)) {
            return None
        }

        for (i in element + 1..tokens.size - 1) {
            let t = tokens[i]
            if (t.role == TOKEN_ATTR) {
                if (!match_name(attr, token_str(t))) {
                    continue
                }

                let val = tokens[i + 1]
                if (val.role != TOKEN_ATTR_VAL) {
                    return "" /* attribute with no value */
                }

                return token_str(val)
            } else if (t.role != TOKEN_ATTR_VAL) {
                /* Neither ATTR nor ATTR_VAL, must be out of attr area. */
                break
            }
        }

        return None /* attribute not found */
    }

    func GetPI(pos: Token, pi: String): ?Token {
        if (!is_valid_token(pos)) {
            return None
        }
        let t = tokens[pos]
        let start = if (t.role == TOKEN_OPEN) { pos + 1 } else { pos }
        let depth = if (t.role == TOKEN_OPEN) { t.depth + 1 } else { t.depth }

        for (i in start..tokens.size) {
            let tmp = tokens[i]
            if (tmp.depth < depth) {
                break
            }
            if ((tmp.depth == depth) && (tmp.role == TOKEN_PI)) {
                if (token_str(tmp) == pi) {
                    return i
                }
            }
        }
        return None
    }

    func GetPIValue(pi: Token): ?String {
        if (!is_valid_token(pi) || (tokens[pi].role != TOKEN_PI)) {
            return None
        }

        let pi_val = pi + 1
        if (pi_val < tokens.size) {
            let t = tokens[pi_val]
            if (t.role == TOKEN_PI_VAL) {
                return token_str(t)
            }
        }

        return ""
    }

    func GetElemText(pos: Token, xpath: String): ?String {
        let element = GetElement(pos, xpath)
        return GetText(element ?? -1)
    }

    private func is_valid_token(t: Token): Bool {
        return (t >= 0) && (t < tokens.size)
    }

    private func is_valid_open_token(t: Token): Bool {
        if (!is_valid_token(t)) {
            return false
        }
        return tokens[t].role == TOKEN_OPEN
    }

    private func match_token_depth_role(token: TokenCB, depth: UInt8, role: TokenRole): Bool {
        return (token.depth == depth) && (token.role == role)
    }

    func Parent(element: Token): ?Token {
        if (!is_valid_open_token(element)) {
            return None
        }

        let ref = tokens[Int64(element)]
        if (ref.depth == 0) {
            return None
        }
        
        let start = Int64(element) - 1
        for (i in start..=0:-1) {
            let t = tokens[i]
            if (match_token_depth_role(t, ref.depth - 1, TOKEN_OPEN)) {
                return i
            }
        }

        return None
    }

    private func find_child(element: Token, find_first: Bool): ?Token {
        if (!is_valid_open_token(element)) {
            return None
        }

        let ref = tokens[element]
        var found: ?Token = None

        let start = element + 1
        for (i in start..tokens.size) {
            let t = tokens[i]
            if (match_token_depth_role(t, ref.depth + 1, TOKEN_OPEN)) {
                found = Some(i)
                if (find_first) {
                    return found
                }
            }

            if (match_token_depth_role(t, ref.depth, TOKEN_CLOSE)) {
                break
            }
        }

        return found
    }

    func FirstChild(element: Token): ?Token {
        return find_child(element, true)
    }

    func LastChild(element: Token): ?Token {
        return find_child(element, false)
    }

    private func find_sibling(element: Token, forward: Bool): ?Token {
        if (!is_valid_open_token(element)) {
            return None
        }

        let ref = tokens[element]

        let scope = if (forward) {
            (element + 1)..tokens.size:1 
        } else {
            (element - 1)..=0:-1 
        }

        for (i in scope) {
            let t = tokens[i]
            if (match_token_depth_role(t, ref.depth, TOKEN_OPEN)) {
                return i
            }

            if (t.depth < ref.depth) {
                break
            }
        }

        return None
    }

    func NextSibling(element: Token): ?Token {
        return find_sibling(element, true)
    }

    func PrevSibling(element: Token): ?Token {
        return find_sibling(element, false)
    }

    private static let entities = HashMap<String, Rune*Int64>(
            [("quot", ('"', 6)), ("amp", ('&', 5)), ("apos", ('\'', 6)),
             ("lt", ('<', 4)), ("gt", ('>', 4))])

    func lookup_entity(src: SubArray<UInt8>): ?(Rune*Int64) {
        if (UInt32(src[0]) != UInt32('&')) {
            return None
        }
        
        for (i in 0..min(5, src.size)) {
            let ch = Rune(UInt32(src[1 + i]))
            if (ch == ';') {
                let key = String.fromUtf8(src.slice(1, i).toArray())
                if (entities.contains(key)) {
                    return entities[key]
                }
                break
            }
            if ((ch < 'a') || (ch > 'z')) {
                break
            }
        }
        return None
    }

    private func parse_entity(text: SubArray<UInt8>): Int64 {
        var read = 0
        var written = 0
        while (read < text.size) {
            let ent = lookup_entity(text.slice(read, text.size - read))
            match (ent) {
                case Some(v) => 
                    text[written] = UInt8(UInt32(v[0]))
                    read += v[1]
                case None =>
                    text[written] = text[read]
                    read++
            }
            written++
        }

        return written
    }

    private func text_op(xpath: String, recursive: Bool, op: (Int64) -> Unit) {
        let set = Query(0, xpath)
        for (t in set) {
            let token_open = tokens[t]
            for (i in t + 1..tokens.size) {
                let token = tokens[i]
                if (token.depth <= token_open.depth) {
                    break
                }
                if (!recursive && (token.depth > token_open.depth + 1)) {
                    continue
                }
                if (token.role != TOKEN_TEXT) {
                    continue;
                }
                op(i)
            }
        }
    }

    private func decode_entity(text_token: Int64) {
        var t = tokens[text_token]
        t.length = parse_entity(xmlstr.slice(t.offset, t.length))
        tokens[text_token] = t
    }

    func DecodeEntity(xpath: String, recursive: Bool) {
        text_op(xpath, recursive, decode_entity)
    }

    private func is_ws_chr(offset: Int64): Bool {
        let ch = Rune(UInt32(xmlstr[offset]))
        return (ch == ' ') || (ch == '\r') || (ch == '\n') || (ch == '\t')
    }

    private func trim_text(text_token: Int64) {
        var t = tokens[text_token]
        /* trim from left */
        while (t.length > 0) {
            if (!is_ws_chr(t.offset)) {
                break;
            }
            t.offset = t.offset + 1
            t.length = t.length - 1
        }
        /* trim from right */
        while (t.length > 0) {
            if (!is_ws_chr(t.offset + t.length - 1)) {
                break
            }
            t.length = t.length - 1
        }
        t.length++
        tokens[text_token] = t
    }

    func TrimText(xpath: String, recursive: Bool) {
        text_op(xpath, recursive, trim_text);
    }

    private func locate_close(open_offset: Int64): Int64 {
        let open_token = tokens[open_offset]

        for (i in open_offset + 1..tokens.size) {
            let t = tokens[i]
            if ((t.role == TOKEN_CLOSE) && (t.depth == open_token.depth)) {
                return i
            }
        }

        return -1
    }

    func GetElementBlock(element: Token): ?(Int64*Int64) {
        if (!is_valid_open_token(element)) {
            return None
        }

        let open_token = tokens[element]
        var result = (open_token.offset - 1, 0)

        let t = tokens[locate_close(element)]
        for (i in t.offset + t.length..xmlstr.size) {
            if (UInt32(xmlstr[i]) == UInt32('>')) {
                return (open_token.offset - 1, i - open_token.offset + 2)
            }
        }

        return None
    }
}

enum XPathExprOperation <: OldEnum {
    XPATH_EXPR_OP_ELEMENT |
    XPATH_EXPR_OP_POSITION |
    XPATH_EXPR_OP_ATTR |
    XPATH_EXPR_OP_CHILD

    func toInt(): Int64 {
        match (this) {
            case XPATH_EXPR_OP_ELEMENT => 0
            case XPATH_EXPR_OP_POSITION => 1
            case XPATH_EXPR_OP_ATTR => 2
            case XPATH_EXPR_OP_CHILD => 3
        }
    }

    operator func == (that: OldEnum): Bool {
        this.toInt() == that.toInt()
    }

    operator func != (that: OldEnum): Bool {
        !(this == that)
    }
}

struct XPathExpr {
    var invert = false /* invert expression result */
    var op: XPathExprOperation
    var name: String = ""
    var value: ?String = None
    var position: Int64 = 0

    init(op: XPathExprOperation) {
        this.op = op
    }

    init(op: XPathExprOperation, name: String) {
        this.op = op
        this.name = name
    }

    init(op: XPathExprOperation, position: Int64) {
        this.op = op
        this.position = position
    }
}

struct XPathStep {
    var exprs = ArrayList<XPathExpr>(64)
}

class ExmlXpath {
    private var debug = false
    private var offset = 0
    private var xpath: String

    var from_root: Bool = false
    var steps = ArrayList<XPathStep>(64)
    //private var exml: Exml

    init(xpath: String) {
        //this.exml = exml
        this.xpath = xpath
    }

    private func more_char(): Bool { offset < xpath.size }
    private func next_char(): Rune {
        if (offset < xpath.size) { xpath[offset] } else { '\u{0}' }
    }

    private func skip_str(str: String): Bool {
        if (offset + str.size > xpath.size) {
            return false
        } else if (xpath.substring(offset, str.size) == str) {
            offset += str.size
            return true
        } else {
            return false
        }
    }

    private func skip_token(bad_chars: String): String {
        var stop = xpath.size
        for (i in offset..xpath.size) {
            if (bad_chars.contains(xpath[i])) {
                stop = i
                break
            }
        }
        let token = xpath[offset..stop - offset]
        offset = stop
        return token
}

    private func extract_node_name(): String {
        return skip_token(" \t\r\n<>/!&=?'[]{}\"\\")
    }

    /* A child name can have path separater '/' */
    private func extract_child_name(): String {
        return skip_token(" \t\r\n<>!&=?'[]{}\"\\")
    }

    private func is_next_char_digit(): Bool {
        return more_char() && (next_char() >= '0') && (next_char() <= '9')
    }

    /* Extract position expression: element[3], decimal number only */
    private func extract_pos_expr(): ?XPathExpr {
        var pos = 0
        while (is_next_char_digit()) {
            pos = pos * 10 + Int64(UInt32(next_char()) - UInt32('0'))
            offset++
        }

        if (!skip_str("]")) {
            return None
        }

        return XPathExpr(XPATH_EXPR_OP_POSITION, pos)
    }

    /* Extract "name=val]", covering both attribute and child predicates */
    private func extract_name_value_expr(isAttr: Bool): ?XPathExpr {
        var expr = if (isAttr) { 
            XPathExpr(XPATH_EXPR_OP_ATTR, extract_node_name())
        } else {
            XPathExpr(XPATH_EXPR_OP_CHILD, extract_child_name())
        }
        
        if (expr.name.size == 0) { 
            return None
        }

        if (skip_str("!=")) {
            expr.invert = true
            expr.value = skip_token("]")
        } else if (skip_str("=")) {
            expr.value = skip_token("]")
        } else if (skip_str("!")) {
            expr.invert = true
        }

        if (!skip_str("]")) {
            return None
        }

        return expr
    }

    private func extract_predicate(): ?XPathExpr {
        if (is_next_char_digit()) {
            return extract_pos_expr()
        }

        if (skip_str("@")) {
            return extract_name_value_expr(true) // Attribute
        }

        return extract_name_value_expr(false) // Child element
    }

    private func extract_first_axis() {
        if (skip_str("/")) {
            /* First step starting with "/" means from root */
            from_root = true

            if (more_char()) {
                return
            }
        } 

        /*
        * Begin with "./" or NOT means the same: from current element,
        * so we insert a step of * first and extract axis for next step.
        */
        skip_str("./")
        var step = XPathStep()
        step.exprs.add(XPathExpr(XPATH_EXPR_OP_ELEMENT, ":*"))
        steps.add(step)
    }

    /*
    * Extract and compile just one xpath step.
    *
    * E.g. in xpath "/one[xxx]/two[yyy][zzz]/three", there're 3 steps:
    * 1. "/one[xxx]", 2. "/two[yyy][zzz]", 3. "/three".
    * In each step of xpath, there're axis, node test and predicates.
    */
    private func compile_step(): Bool {
        var step = XPathStep()

        if (!more_char()) {
            return true
        }

        let name = extract_node_name()
        if (name == "") {
            return false
        }

        step.exprs.add(XPathExpr(XPATH_EXPR_OP_ELEMENT, name))

        /* Yes, we support multiple predicates */
        while (skip_str("[")) {
            match (extract_predicate()) {
                case None =>  return false
                case Some(expr) => step.exprs.add(expr)
            }
        }

        steps.add(step)
        return true
    }

    private func expr_name_value(prefix: String, expr: XPathExpr) {
        print("[${prefix}${expr.name}")
        let inverter = if (expr.invert) { "!" } else { "" }
        match (expr.value) {
            case None => print("${inverter}]")
            case Some(v) => print("${inverter}=${v}]")
        }
    }

    private func dump_expr(expr: XPathExpr) {
        match (expr.op) {
            case XPATH_EXPR_OP_ELEMENT => print("${expr.name}")
            case XPATH_EXPR_OP_POSITION => print("[${expr.position}]")
            case XPATH_EXPR_OP_ATTR => expr_name_value("@", expr)
            case XPATH_EXPR_OP_CHILD => expr_name_value("", expr)
        }
    }

    func Dump() {
        println("XPath total steps: ${steps.size}")

        for (i in 0..steps.size) {
            let step = steps[i]
            print("  ${i}(${step.exprs.size}): ")
            if ((i == 0) && from_root) {
                print("/")
            }
            for (expr in step.exprs) {
                dump_expr(expr)
            }
            println("")
        }
    }

    func Compile(): Bool  {
        offset = 0
        steps.clear()

        extract_first_axis()
        do {
            if (!compile_step()) {
                return false
            }
        } while (skip_str("/"))

        if (debug) {
            Dump()
        }

        return true
    }
}

class ExmlSet <: Iterator<Token> {
    private var xml: Exml
    private var xpath: ExmlXpath

    /* following vars are for the element searching using specified path expression */
    private var ready = false
    private var start_pos = 0 /* position of the token where search starts */
    private var current_pos = 0 /* current position of the token of the search */
    private var matched_depth = 0 /* depth of deepest matched element */
    private var current_depth = 0 /* relative depth of the element being visited */

    private var counter = Array<Int64>() /* runtime occurrence counter */

    init(xml: Exml, token: Token, xpath: String) {
        this.xml = xml
        this.xpath = ExmlXpath(xpath)
        ready = this.xpath.Compile()
        start_pos = token
    }

    func iterator(): Iterator<Token> {
        counter = Array<Int64>(xpath.steps.size + 1) { i => 0 }
        return this
    }

    func next(): ?Token {
        if (!ready) {
            return None
        }

        var found: ?Token = None

        while (current_pos < xml.tokens.size) {
            if ((found ?? -1) >= 0) {
                break
            }

            let t = xml.tokens[current_pos]
            if (t.role == TOKEN_OPEN) {
                found = xpath_match_element()
                current_depth++
            } else if (t.role == TOKEN_CLOSE) {
                current_depth--
                if (current_depth < matched_depth) {
                    matched_depth = current_depth
                }

                if (current_depth == 0) {
                    return None
                }
            }
            current_pos++
        }

        return found
    }

    /* match with namespace */
    private func xpath_match_with_ns(xp_name: String, name: String): Bool {
        var xp = xp_name
        var to_match = name

        if (xp[0] == ':') {
            /* name in xpath starting with ':' means to ignore namespace,
            * so we only need to match name without the namespace */
            xp = xp.substring(1)
            to_match = to_match.substring((to_match.indexOf(':') ?? -1) + 1)
        }

        return (xp == "*") || (xp == to_match)
    }

    private func xpath_match_attr(expr: XPathExpr, element: Token): Bool {
        let attr_val = xml.GetAttr(element, expr.name)
        let hit = match((expr.value, attr_val)) {
            case (Some(p), Some(v)) => p == v
            case (Some(p), None) => false
            case (None, Some(v)) => true
            case (None, None) => false
        }
        return (hit != expr.invert)
    }

    private func xpath_match_child(expr: XPathExpr, element: Token): Bool {
        let child = xml.GetElement(element, expr.name);
        let hit = match((expr.value, child)) {
            case (Some(p), Some(v)) => p == (xml.GetText(v) ?? "")
            case (Some(p), None) => false
            case (None, Some(v)) => true
            case (None, None) => false
        }
        return (hit != expr.invert);
    }

    private func xpath_eval_expr(expr: XPathExpr, element: Token): Bool {
        if (expr.op == XPATH_EXPR_OP_ELEMENT) { 
            let name = xml.GetName(element) ?? "<>"
            return xpath_match_with_ns(expr.name, name)
        } else if (expr.op == XPATH_EXPR_OP_CHILD) {
            return xpath_match_child(expr, element)
        } else if (expr.op == XPATH_EXPR_OP_ATTR) {
            return xpath_match_attr(expr, element)
        }

        return false
    }

    private func xpath_match_step(element: Token, depth: Int64): Bool {
        let step = xpath.steps[depth]
        for (i in 0..step.exprs.size) {
            if (step.exprs[i].op == XPATH_EXPR_OP_POSITION) {
                if (counter[depth] != step.exprs[i].position) {
                    return false
                }
            } else if (!xpath_eval_expr(step.exprs[i], element)) {
                return false
            }
        }

        return true
    }

    private func xpath_match_element(): ?Token
    {
        if ((current_depth != matched_depth) ||
            (matched_depth >= xpath.steps.size)) {
            return None
        }

        counter[current_depth] = counter[current_depth] + 1

        if (!xpath_match_step(current_pos, current_depth)) {
            return None
        }

        matched_depth++
        counter[matched_depth] = 0

        if (matched_depth == xpath.steps.size) {
            return current_pos
        }

        return None
    }
}
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_expected_character
