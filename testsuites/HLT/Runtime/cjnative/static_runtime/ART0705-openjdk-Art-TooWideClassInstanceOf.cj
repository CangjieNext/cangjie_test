/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows and not MAC) EXEC: %compiler %compilation_options %extra_options %lto_options %sanitizer_options %mock_options %optimization_options %debug_options --static %overflow_wrapping %f -o %output
// (not Windows and not MAC) RUN-EXEC-PIPE: unset LD_LIBRARY_PATH && %output %run_args | compare %f
// ASSERT:scan passed

open class A {}

open class B1 <: A {}

class B2 <: A {}

open class C1 <: B1 {}

open class C2 <: B1 {}

open class D1 <: C1 {}

open class D2 <: C2 {}

class E1 <: D2 {}

class E2 <: D1 {}

class E3 <: D2 {}

class E4 <: D1 {}

class E5 <: D2 {}

class E6 <: D1 {}

class E7 <: D2 {}

class E8 <: D1 {}

class E9 <: D2 {}

class E10 <: D1 {}

class E11 <: D2 {}

class E12 <: D1 {}

class E13 <: D2 {}

class E14 <: D1 {}

class E15 <: D2 {}

class E16 <: D1 {}

class E17 <: D2 {}

class E18 <: D1 {}

class E19 <: D2 {}

class E20 <: D1 {}

class E21 <: D2 {}

class E22 <: D1 {}

class E23 <: D2 {}

class E24 <: D1 {}

class E25 <: D2 {}

class E26 <: D1 {}

class E27 <: D2 {}

class E28 <: D1 {}

class E29 <: D2 {}

class E30 <: D1 {}

class E31 <: D2 {}

class E32 <: D1 {}

class E33 <: D2 {}

class E34 <: D1 {}

class E35 <: D2 {}

class E36 <: D1 {}

class E37 <: D2 {}

class E38 <: D1 {}

class E39 <: D2 {}

class E40 <: D1 {}

class E41 <: D2 {}

class E42 <: D1 {}

class E43 <: D2 {}

class E44 <: D1 {}

class E45 <: D2 {}

class E46 <: D1 {}

class E47 <: D2 {}

class E48 <: D1 {}

class E49 <: D2 {}

class E50 <: D1 {}

class E51 <: D2 {}

class E52 <: D1 {}

class E53 <: D2 {}

class E54 <: D1 {}

class E55 <: D2 {}

class E56 <: D1 {}

class E57 <: D2 {}

class E58 <: D1 {}

class E59 <: D2 {}

class E60 <: D1 {}

class E61 <: D2 {}

class E62 <: D1 {}

class E63 <: D2 {}

class E64 <: D1 {}

class E65 <: D2 {}

class E66 <: D1 {}

class E67 <: D2 {}

class E68 <: D1 {}

class E69 <: D2 {}

class E70 <: D1 {}

class E71 <: D2 {}

class E72 <: D1 {}

class E73 <: D2 {}

class E74 <: D1 {}

class E75 <: D2 {}

class E76 <: D1 {}

class E77 <: D2 {}

class E78 <: D1 {}

class E79 <: D2 {}

class E80 <: D1 {}

class E81 <: D2 {}

class E82 <: D1 {}

class E83 <: D2 {}

class E84 <: D1 {}

class E85 <: D2 {}

class E86 <: D1 {}

class E87 <: D2 {}

class E88 <: D1 {}

class E89 <: D2 {}

class E90 <: D1 {}

class E91 <: D2 {}

class E92 <: D1 {}

class E93 <: D2 {}

class E94 <: D1 {}

class E95 <: D2 {}

class E96 <: D1 {}

class E97 <: D2 {}

class E98 <: D1 {}

class E99 <: D2 {}

class E100 <: D1 {}

class E101 <: D2 {}

class E102 <: D1 {}

class E103 <: D2 {}

class E104 <: D1 {}

class E105 <: D2 {}

class E106 <: D1 {}

class E107 <: D2 {}

class E108 <: D1 {}

class E109 <: D2 {}

class E110 <: D1 {}

class E111 <: D2 {}

class E112 <: D1 {}

class E113 <: D2 {}

class E114 <: D1 {}

class E115 <: D2 {}

class E116 <: D1 {}

class E117 <: D2 {}

class E118 <: D1 {}

class E119 <: D2 {}

class E120 <: D1 {}

class E121 <: D2 {}

class E122 <: D1 {}

class E123 <: D2 {}

class E124 <: D1 {}

class E125 <: D2 {}

class E126 <: D1 {}

class E127 <: D2 {}

class E128 <: D1 {}

class E129 <: D2 {}

class E130 <: D1 {}

class E131 <: D2 {}

class E132 <: D1 {}

class E133 <: D2 {}

class E134 <: D1 {}

class E135 <: D2 {}

class E136 <: D1 {}

class E137 <: D2 {}

class E138 <: D1 {}

class E139 <: D2 {}

class E140 <: D1 {}

class E141 <: D2 {}

class E142 <: D1 {}

class E143 <: D2 {}

class E144 <: D1 {}

class E145 <: D2 {}

class E146 <: D1 {}

class E147 <: D2 {}

class E148 <: D1 {}

class E149 <: D2 {}

class E150 <: D1 {}

class E151 <: D2 {}

class E152 <: D1 {}

class E153 <: D2 {}

class E154 <: D1 {}

class E155 <: D2 {}

class E156 <: D1 {}

class E157 <: D2 {}

class E158 <: D1 {}

class E159 <: D2 {}

class E160 <: D1 {}

class E161 <: D2 {}

class E162 <: D1 {}

class E163 <: D2 {}

class E164 <: D1 {}

class E165 <: D2 {}

class E166 <: D1 {}

class E167 <: D2 {}

class E168 <: D1 {}

class E169 <: D2 {}

class E170 <: D1 {}

class E171 <: D2 {}

class E172 <: D1 {}

class E173 <: D2 {}

class E174 <: D1 {}

class E175 <: D2 {}

class E176 <: D1 {}

class E177 <: D2 {}

class E178 <: D1 {}

class E179 <: D2 {}

class E180 <: D1 {}

class E181 <: D2 {}

class E182 <: D1 {}

class E183 <: D2 {}

class E184 <: D1 {}

class E185 <: D2 {}

class E186 <: D1 {}

class E187 <: D2 {}

class E188 <: D1 {}

class E189 <: D2 {}

class E190 <: D1 {}

class E191 <: D2 {}

class E192 <: D1 {}

class E193 <: D2 {}

class E194 <: D1 {}

class E195 <: D2 {}

class E196 <: D1 {}

class E197 <: D2 {}

class E198 <: D1 {}

class E199 <: D2 {}

class E200 <: D1 {}

class E201 <: D2 {}

class E202 <: D1 {}

class E203 <: D2 {}

class E204 <: D1 {}

class E205 <: D2 {}

class E206 <: D1 {}

class E207 <: D2 {}

class E208 <: D1 {}

class E209 <: D2 {}

class E210 <: D1 {}

class E211 <: D2 {}

class E212 <: D1 {}

class E213 <: D2 {}

class E214 <: D1 {}

class E215 <: D2 {}

class E216 <: D1 {}

class E217 <: D2 {}

class E218 <: D1 {}

class E219 <: D2 {}

class E220 <: D1 {}

class E221 <: D2 {}

class E222 <: D1 {}

class E223 <: D2 {}

class E224 <: D1 {}

class E225 <: D2 {}

class E226 <: D1 {}

class E227 <: D2 {}

class E228 <: D1 {}

class E229 <: D2 {}

class E230 <: D1 {}

class E231 <: D2 {}

class E232 <: D1 {}

class E233 <: D2 {}

class E234 <: D1 {}

class E235 <: D2 {}

class E236 <: D1 {}

class E237 <: D2 {}

class E238 <: D1 {}

class E239 <: D2 {}

class E240 <: D1 {}

class E241 <: D2 {}

class E242 <: D1 {}

class E243 <: D2 {}

class E244 <: D1 {}

class E245 <: D2 {}

class E246 <: D1 {}

class E247 <: D2 {}

class E248 <: D1 {}

class E249 <: D2 {}

class E250 <: D1 {}

class E251 <: D2 {}

class E252 <: D1 {}

class E253 <: D2 {}

class E254 <: D1 {}

class E255 <: D2 {}

class E256 <: D1 {}

class E257 <: D2 {}

class E258 <: D1 {}

class E259 <: D2 {}

class E260 <: D1 {}

class E261 <: D2 {}

class E262 <: D1 {}

class E263 <: D2 {}

class E264 <: D1 {}

class E265 <: D2 {}

class E266 <: D1 {}

class E267 <: D2 {}

class E268 <: D1 {}

class E269 <: D2 {}

class E270 <: D1 {}

class E271 <: D2 {}

class E272 <: D1 {}

class E273 <: D2 {}

class E274 <: D1 {}

class E275 <: D2 {}

class E276 <: D1 {}

class E277 <: D2 {}

class E278 <: D1 {}

class E279 <: D2 {}

class E280 <: D1 {}

class E281 <: D2 {}

class E282 <: D1 {}

class E283 <: D2 {}

class E284 <: D1 {}

class E285 <: D2 {}

class E286 <: D1 {}

class E287 <: D2 {}

class E288 <: D1 {}

class E289 <: D2 {}

class E290 <: D1 {}

class E291 <: D2 {}

class E292 <: D1 {}

class E293 <: D2 {}

class E294 <: D1 {}

class E295 <: D2 {}

class E296 <: D1 {}

class E297 <: D2 {}

class E298 <: D1 {}

class E299 <: D2 {}

class E300 <: D1 {}

class E301 <: D2 {}

class E302 <: D1 {}

class E303 <: D2 {}

class E304 <: D1 {}

class E305 <: D2 {}

class E306 <: D1 {}

class E307 <: D2 {}

class E308 <: D1 {}

class E309 <: D2 {}

class E310 <: D1 {}

class E311 <: D2 {}

class E312 <: D1 {}

class E313 <: D2 {}

class E314 <: D1 {}

class E315 <: D2 {}

class E316 <: D1 {}

class E317 <: D2 {}

class E318 <: D1 {}

class E319 <: D2 {}

class E320 <: D1 {}

class E321 <: D2 {}

class E322 <: D1 {}

class E323 <: D2 {}

class E324 <: D1 {}

class E325 <: D2 {}

class E326 <: D1 {}

class E327 <: D2 {}

class E328 <: D1 {}

class E329 <: D2 {}

class E330 <: D1 {}

class E331 <: D2 {}

class E332 <: D1 {}

class E333 <: D2 {}

class E334 <: D1 {}

class E335 <: D2 {}

class E336 <: D1 {}

class E337 <: D2 {}

class E338 <: D1 {}

class E339 <: D2 {}

class E340 <: D1 {}

class E341 <: D2 {}

class E342 <: D1 {}

class E343 <: D2 {}

class E344 <: D1 {}

class E345 <: D2 {}

class E346 <: D1 {}

class E347 <: D2 {}

class E348 <: D1 {}

class E349 <: D2 {}

class E350 <: D1 {}

class E351 <: D2 {}

class E352 <: D1 {}

class E353 <: D2 {}

class E354 <: D1 {}

class E355 <: D2 {}

class E356 <: D1 {}

class E357 <: D2 {}

class E358 <: D1 {}

class E359 <: D2 {}

class E360 <: D1 {}

class E361 <: D2 {}

class E362 <: D1 {}

class E363 <: D2 {}

class E364 <: D1 {}

class E365 <: D2 {}

class E366 <: D1 {}

class E367 <: D2 {}

class E368 <: D1 {}

class E369 <: D2 {}

class E370 <: D1 {}

class E371 <: D2 {}

class E372 <: D1 {}

class E373 <: D2 {}

class E374 <: D1 {}

class E375 <: D2 {}

class E376 <: D1 {}

class E377 <: D2 {}

class E378 <: D1 {}

class E379 <: D2 {}

class E380 <: D1 {}

class E381 <: D2 {}

class E382 <: D1 {}

class E383 <: D2 {}

class E384 <: D1 {}

class E385 <: D2 {}

class E386 <: D1 {}

class E387 <: D2 {}

class E388 <: D1 {}

class E389 <: D2 {}

class E390 <: D1 {}

class E391 <: D2 {}

class E392 <: D1 {}

class E393 <: D2 {}

class E394 <: D1 {}

class E395 <: D2 {}

class E396 <: D1 {}

class E397 <: D2 {}

class E398 <: D1 {}

class E399 <: D2 {}

class E400 <: D1 {}

class E401 <: D2 {}

class E402 <: D1 {}

class E403 <: D2 {}

class E404 <: D1 {}

class E405 <: D2 {}

class E406 <: D1 {}

class E407 <: D2 {}

class E408 <: D1 {}

class E409 <: D2 {}

class E410 <: D1 {}

class E411 <: D2 {}

class E412 <: D1 {}

class E413 <: D2 {}

class E414 <: D1 {}

class E415 <: D2 {}

class E416 <: D1 {}

class E417 <: D2 {}

class E418 <: D1 {}

class E419 <: D2 {}

class E420 <: D1 {}

class E421 <: D2 {}

class E422 <: D1 {}

class E423 <: D2 {}

class E424 <: D1 {}

class E425 <: D2 {}

class E426 <: D1 {}

class E427 <: D2 {}

class E428 <: D1 {}

class E429 <: D2 {}

class E430 <: D1 {}

class E431 <: D2 {}

class E432 <: D1 {}

class E433 <: D2 {}

class E434 <: D1 {}

class E435 <: D2 {}

class E436 <: D1 {}

class E437 <: D2 {}

class E438 <: D1 {}

class E439 <: D2 {}

class E440 <: D1 {}

class E441 <: D2 {}

class E442 <: D1 {}

class E443 <: D2 {}

class E444 <: D1 {}

class E445 <: D2 {}

class E446 <: D1 {}

class E447 <: D2 {}

class E448 <: D1 {}

class E449 <: D2 {}

class E450 <: D1 {}

class E451 <: D2 {}

class E452 <: D1 {}

class E453 <: D2 {}

class E454 <: D1 {}

class E455 <: D2 {}

class E456 <: D1 {}

class E457 <: D2 {}

class E458 <: D1 {}

class E459 <: D2 {}

class E460 <: D1 {}

class E461 <: D2 {}

class E462 <: D1 {}

class E463 <: D2 {}

class E464 <: D1 {}

class E465 <: D2 {}

class E466 <: D1 {}

class E467 <: D2 {}

class E468 <: D1 {}

class E469 <: D2 {}

class E470 <: D1 {}

class E471 <: D2 {}

class E472 <: D1 {}

class E473 <: D2 {}

class E474 <: D1 {}

class E475 <: D2 {}

class E476 <: D1 {}

class E477 <: D2 {}

class E478 <: D1 {}

class E479 <: D2 {}

class E480 <: D1 {}

class E481 <: D2 {}

class E482 <: D1 {}

class E483 <: D2 {}

class E484 <: D1 {}

class E485 <: D2 {}

class E486 <: D1 {}

class E487 <: D2 {}

class E488 <: D1 {}

class E489 <: D2 {}

class E490 <: D1 {}

class E491 <: D2 {}

class E492 <: D1 {}

class E493 <: D2 {}

class E494 <: D1 {}

class E495 <: D2 {}

class E496 <: D1 {}

class E497 <: D2 {}

class E498 <: D1 {}

class E499 <: D2 {}

class E500 <: D1 {}

class E501 <: D2 {}

class E502 <: D1 {}

class E503 <: D2 {}

class E504 <: D1 {}

class E505 <: D2 {}

class E506 <: D1 {}

class E507 <: D2 {}

class E508 <: D1 {}

class E509 <: D2 {}

class E510 <: D1 {}

class E511 <: D2 {}

class E512 <: D1 {}

class E513 <: D2 {}

class E514 <: D1 {}

class E515 <: D2 {}

class E516 <: D1 {}

class E517 <: D2 {}

class E518 <: D1 {}

class E519 <: D2 {}

class E520 <: D1 {}

class E521 <: D2 {}

class E522 <: D1 {}

class E523 <: D2 {}

class E524 <: D1 {}

class E525 <: D2 {}

class E526 <: D1 {}

class E527 <: D2 {}

class E528 <: D1 {}

class E529 <: D2 {}

class E530 <: D1 {}

class E531 <: D2 {}

class E532 <: D1 {}

class E533 <: D2 {}

class E534 <: D1 {}

class E535 <: D2 {}

class E536 <: D1 {}

class E537 <: D2 {}

class E538 <: D1 {}

class E539 <: D2 {}

class E540 <: D1 {}

class E541 <: D2 {}

class E542 <: D1 {}

class E543 <: D2 {}

class E544 <: D1 {}

class E545 <: D2 {}

class E546 <: D1 {}

class E547 <: D2 {}

class E548 <: D1 {}

class E549 <: D2 {}

class E550 <: D1 {}

class E551 <: D2 {}

class E552 <: D1 {}

class E553 <: D2 {}

class E554 <: D1 {}

class E555 <: D2 {}

class E556 <: D1 {}

class E557 <: D2 {}

class E558 <: D1 {}

class E559 <: D2 {}

class E560 <: D1 {}

class E561 <: D2 {}

class E562 <: D1 {}

class E563 <: D2 {}

class E564 <: D1 {}

class E565 <: D2 {}

class E566 <: D1 {}

class E567 <: D2 {}

class E568 <: D1 {}

class E569 <: D2 {}

class E570 <: D1 {}

class E571 <: D2 {}

class E572 <: D1 {}

class E573 <: D2 {}

class E574 <: D1 {}

class E575 <: D2 {}

class E576 <: D1 {}

class E577 <: D2 {}

class E578 <: D1 {}

class E579 <: D2 {}

class E580 <: D1 {}

class E581 <: D2 {}

class E582 <: D1 {}

class E583 <: D2 {}

class E584 <: D1 {}

class E585 <: D2 {}

class E586 <: D1 {}

class E587 <: D2 {}

class E588 <: D1 {}

class E589 <: D2 {}

class E590 <: D1 {}

class E591 <: D2 {}

class E592 <: D1 {}

class E593 <: D2 {}

class E594 <: D1 {}

class E595 <: D2 {}

class E596 <: D1 {}

class E597 <: D2 {}

class E598 <: D1 {}

class E599 <: D2 {}

class E600 <: D1 {}

class E601 <: D2 {}

class E602 <: D1 {}

class E603 <: D2 {}

class E604 <: D1 {}

class E605 <: D2 {}

class E606 <: D1 {}

class E607 <: D2 {}

class E608 <: D1 {}

class E609 <: D2 {}

class E610 <: D1 {}

class E611 <: D2 {}

class E612 <: D1 {}

class E613 <: D2 {}

class E614 <: D1 {}

class E615 <: D2 {}

class E616 <: D1 {}

class E617 <: D2 {}

class E618 <: D1 {}

class E619 <: D2 {}

class E620 <: D1 {}

class E621 <: D2 {}

class E622 <: D1 {}

class E623 <: D2 {}

class E624 <: D1 {}

class E625 <: D2 {}

class E626 <: D1 {}

class E627 <: D2 {}

class E628 <: D1 {}

class E629 <: D2 {}

class E630 <: D1 {}

class E631 <: D2 {}

class E632 <: D1 {}

class E633 <: D2 {}

class E634 <: D1 {}

class E635 <: D2 {}

class E636 <: D1 {}

class E637 <: D2 {}

class E638 <: D1 {}

class E639 <: D2 {}

class E640 <: D1 {}

class E641 <: D2 {}

class E642 <: D1 {}

class E643 <: D2 {}

class E644 <: D1 {}

class E645 <: D2 {}

class E646 <: D1 {}

class E647 <: D2 {}

class E648 <: D1 {}

class E649 <: D2 {}

class E650 <: D1 {}

class E651 <: D2 {}

class E652 <: D1 {}

class E653 <: D2 {}

class E654 <: D1 {}

class E655 <: D2 {}

class E656 <: D1 {}

class E657 <: D2 {}

class E658 <: D1 {}

class E659 <: D2 {}

class E660 <: D1 {}

class E661 <: D2 {}

class E662 <: D1 {}

class E663 <: D2 {}

class E664 <: D1 {}

class E665 <: D2 {}

class E666 <: D1 {}

class E667 <: D2 {}

class E668 <: D1 {}

class E669 <: D2 {}

class E670 <: D1 {}

class E671 <: D2 {}

class E672 <: D1 {}

class E673 <: D2 {}

class E674 <: D1 {}

class E675 <: D2 {}

class E676 <: D1 {}

class E677 <: D2 {}

class E678 <: D1 {}

class E679 <: D2 {}

class E680 <: D1 {}

class E681 <: D2 {}

class E682 <: D1 {}

class E683 <: D2 {}

class E684 <: D1 {}

class E685 <: D2 {}

class E686 <: D1 {}

class E687 <: D2 {}

class E688 <: D1 {}

class E689 <: D2 {}

class E690 <: D1 {}

class E691 <: D2 {}

class E692 <: D1 {}

class E693 <: D2 {}

class E694 <: D1 {}

class E695 <: D2 {}

class E696 <: D1 {}

class E697 <: D2 {}

class E698 <: D1 {}

class E699 <: D2 {}

class E700 <: D1 {}

class E701 <: D2 {}

class E702 <: D1 {}

class E703 <: D2 {}

class E704 <: D1 {}

class E705 <: D2 {}

class E706 <: D1 {}

class E707 <: D2 {}

class E708 <: D1 {}

class E709 <: D2 {}

class E710 <: D1 {}

class E711 <: D2 {}

class E712 <: D1 {}

class E713 <: D2 {}

class E714 <: D1 {}

class E715 <: D2 {}

class E716 <: D1 {}

class E717 <: D2 {}

class E718 <: D1 {}

class E719 <: D2 {}

class E720 <: D1 {}

class E721 <: D2 {}

class E722 <: D1 {}

class E723 <: D2 {}

class E724 <: D1 {}

class E725 <: D2 {}

class E726 <: D1 {}

class E727 <: D2 {}

class E728 <: D1 {}

class E729 <: D2 {}

class E730 <: D1 {}

class E731 <: D2 {}

class E732 <: D1 {}

class E733 <: D2 {}

class E734 <: D1 {}

class E735 <: D2 {}

class E736 <: D1 {}

class E737 <: D2 {}

class E738 <: D1 {}

class E739 <: D2 {}

class E740 <: D1 {}

class E741 <: D2 {}

class E742 <: D1 {}

class E743 <: D2 {}

class E744 <: D1 {}

class E745 <: D2 {}

class E746 <: D1 {}

class E747 <: D2 {}

class E748 <: D1 {}

class E749 <: D2 {}

class E750 <: D1 {}

class E751 <: D2 {}

class E752 <: D1 {}

class E753 <: D2 {}

class E754 <: D1 {}

class E755 <: D2 {}

class E756 <: D1 {}

class E757 <: D2 {}

class E758 <: D1 {}

class E759 <: D2 {}

class E760 <: D1 {}

class E761 <: D2 {}

class E762 <: D1 {}

class E763 <: D2 {}

class E764 <: D1 {}

class E765 <: D2 {}

class E766 <: D1 {}

class E767 <: D2 {}

class E768 <: D1 {}

class E769 <: D2 {}

class E770 <: D1 {}

class E771 <: D2 {}

class E772 <: D1 {}

class E773 <: D2 {}

class E774 <: D1 {}

class E775 <: D2 {}

class E776 <: D1 {}

class E777 <: D2 {}

class E778 <: D1 {}

class E779 <: D2 {}

class E780 <: D1 {}

class E781 <: D2 {}

class E782 <: D1 {}

class E783 <: D2 {}

class E784 <: D1 {}

class E785 <: D2 {}

class E786 <: D1 {}

class E787 <: D2 {}

class E788 <: D1 {}

class E789 <: D2 {}

class E790 <: D1 {}

class E791 <: D2 {}

class E792 <: D1 {}

class E793 <: D2 {}

class E794 <: D1 {}

class E795 <: D2 {}

class E796 <: D1 {}

class E797 <: D2 {}

class E798 <: D1 {}

class E799 <: D2 {}

class E800 <: D1 {}

class E801 <: D2 {}

class E802 <: D1 {}

class E803 <: D2 {}

class E804 <: D1 {}

class E805 <: D2 {}

class E806 <: D1 {}

class E807 <: D2 {}

class E808 <: D1 {}

class E809 <: D2 {}

class E810 <: D1 {}

class E811 <: D2 {}

class E812 <: D1 {}

class E813 <: D2 {}

class E814 <: D1 {}

class E815 <: D2 {}

class E816 <: D1 {}

class E817 <: D2 {}

class E818 <: D1 {}

class E819 <: D2 {}

class E820 <: D1 {}

class E821 <: D2 {}

class E822 <: D1 {}

class E823 <: D2 {}

class E824 <: D1 {}

class E825 <: D2 {}

class E826 <: D1 {}

class E827 <: D2 {}

class E828 <: D1 {}

class E829 <: D2 {}

class E830 <: D1 {}

class E831 <: D2 {}

class E832 <: D1 {}

class E833 <: D2 {}

class E834 <: D1 {}

class E835 <: D2 {}

class E836 <: D1 {}

class E837 <: D2 {}

class E838 <: D1 {}

class E839 <: D2 {}

class E840 <: D1 {}

class E841 <: D2 {}

class E842 <: D1 {}

class E843 <: D2 {}

class E844 <: D1 {}

class E845 <: D2 {}

class E846 <: D1 {}

class E847 <: D2 {}

class E848 <: D1 {}

class E849 <: D2 {}

class E850 <: D1 {}

class E851 <: D2 {}

class E852 <: D1 {}

class E853 <: D2 {}

class E854 <: D1 {}

class E855 <: D2 {}

class E856 <: D1 {}

class E857 <: D2 {}

class E858 <: D1 {}

class E859 <: D2 {}

class E860 <: D1 {}

class E861 <: D2 {}

class E862 <: D1 {}

class E863 <: D2 {}

class E864 <: D1 {}

class E865 <: D2 {}

class E866 <: D1 {}

class E867 <: D2 {}

class E868 <: D1 {}

class E869 <: D2 {}

class E870 <: D1 {}

class E871 <: D2 {}

class E872 <: D1 {}

class E873 <: D2 {}

class E874 <: D1 {}

class E875 <: D2 {}

class E876 <: D1 {}

class E877 <: D2 {}

class E878 <: D1 {}

class E879 <: D2 {}

class E880 <: D1 {}

class E881 <: D2 {}

class E882 <: D1 {}

class E883 <: D2 {}

class E884 <: D1 {}

class E885 <: D2 {}

class E886 <: D1 {}

class E887 <: D2 {}

class E888 <: D1 {}

class E889 <: D2 {}

class E890 <: D1 {}

class E891 <: D2 {}

class E892 <: D1 {}

class E893 <: D2 {}

class E894 <: D1 {}

class E895 <: D2 {}

class E896 <: D1 {}

class E897 <: D2 {}

class E898 <: D1 {}

class E899 <: D2 {}

class E900 <: D1 {}

class E901 <: D2 {}

class E902 <: D1 {}

class E903 <: D2 {}

class E904 <: D1 {}

class E905 <: D2 {}

class E906 <: D1 {}

class E907 <: D2 {}

class E908 <: D1 {}

class E909 <: D2 {}

class E910 <: D1 {}

class E911 <: D2 {}

class E912 <: D1 {}

class E913 <: D2 {}

class E914 <: D1 {}

class E915 <: D2 {}

class E916 <: D1 {}

class E917 <: D2 {}

class E918 <: D1 {}

class E919 <: D2 {}

class E920 <: D1 {}

class E921 <: D2 {}

class E922 <: D1 {}

class E923 <: D2 {}

class E924 <: D1 {}

class E925 <: D2 {}

class E926 <: D1 {}

class E927 <: D2 {}

class E928 <: D1 {}

class E929 <: D2 {}

class E930 <: D1 {}

class E931 <: D2 {}

class E932 <: D1 {}

class E933 <: D2 {}

class E934 <: D1 {}

class E935 <: D2 {}

class E936 <: D1 {}

class E937 <: D2 {}

class E938 <: D1 {}

class E939 <: D2 {}

class E940 <: D1 {}

class E941 <: D2 {}

class E942 <: D1 {}

class E943 <: D2 {}

class E944 <: D1 {}

class E945 <: D2 {}

class E946 <: D1 {}

class E947 <: D2 {}

class E948 <: D1 {}

class E949 <: D2 {}

class E950 <: D1 {}

class E951 <: D2 {}

class E952 <: D1 {}

class E953 <: D2 {}

class E954 <: D1 {}

class E955 <: D2 {}

class E956 <: D1 {}

class E957 <: D2 {}

class E958 <: D1 {}

class E959 <: D2 {}

class E960 <: D1 {}

class E961 <: D2 {}

class E962 <: D1 {}

class E963 <: D2 {}

class E964 <: D1 {}

class E965 <: D2 {}

class E966 <: D1 {}

class E967 <: D2 {}

class E968 <: D1 {}

class E969 <: D2 {}

class E970 <: D1 {}

class E971 <: D2 {}

class E972 <: D1 {}

class E973 <: D2 {}

class E974 <: D1 {}

class E975 <: D2 {}

class E976 <: D1 {}

class E977 <: D2 {}

class E978 <: D1 {}

class E979 <: D2 {}

class E980 <: D1 {}

class E981 <: D2 {}

class E982 <: D1 {}

class E983 <: D2 {}

class E984 <: D1 {}

class E985 <: D2 {}

class E986 <: D1 {}

class E987 <: D2 {}

class E988 <: D1 {}

class E989 <: D2 {}

class E990 <: D1 {}

class E991 <: D2 {}

class E992 <: D1 {}

class E993 <: D2 {}

class E994 <: D1 {}

class E995 <: D2 {}

class E996 <: D1 {}

class E997 <: D2 {}

class E998 <: D1 {}

class E999 <: D2 {}

class E1000 <: D1 {}

class E1001 <: D2 {}

class E1002 <: D1 {}

class E1003 <: D2 {}

class E1004 <: D1 {}

class E1005 <: D2 {}

class E1006 <: D1 {}

class E1007 <: D2 {}

class E1008 <: D1 {}

class E1009 <: D2 {}

class E1010 <: D1 {}

class E1011 <: D2 {}

class E1012 <: D1 {}

class E1013 <: D2 {}

class E1014 <: D1 {}

class E1015 <: D2 {}

class E1016 <: D1 {}

class E1017 <: D2 {}

class E1018 <: D1 {}

class E1019 <: D2 {}

class E1020 <: D1 {}

class E1021 <: D2 {}

class E1022 <: D1 {}

class E1023 <: D2 {}

class E1024 <: D1 {}

class E1025 <: D2 {}

class E1026 <: D1 {}

class E1027 <: D2 {}

class E1028 <: D1 {}

class E1029 <: D2 {}

class E1030 <: D1 {}

class E1031 <: D2 {}

class E1032 <: D1 {}

class E1033 <: D2 {}

class E1034 <: D1 {}

class E1035 <: D2 {}

class E1036 <: D1 {}

class E1037 <: D2 {}

class E1038 <: D1 {}

class E1039 <: D2 {}

class E1040 <: D1 {}

class E1041 <: D2 {}

class E1042 <: D1 {}

class E1043 <: D2 {}

class E1044 <: D1 {}

class E1045 <: D2 {}

class E1046 <: D1 {}

class E1047 <: D2 {}

class E1048 <: D1 {}

class E1049 <: D2 {}

class E1050 <: D1 {}

class E1051 <: D2 {}

class E1052 <: D1 {}

class E1053 <: D2 {}

class E1054 <: D1 {}

class E1055 <: D2 {}

class E1056 <: D1 {}

class E1057 <: D2 {}

class E1058 <: D1 {}

class E1059 <: D2 {}

class E1060 <: D1 {}

class E1061 <: D2 {}

class E1062 <: D1 {}

class E1063 <: D2 {}

class E1064 <: D1 {}

class E1065 <: D2 {}

class E1066 <: D1 {}

class E1067 <: D2 {}

class E1068 <: D1 {}

class E1069 <: D2 {}

class E1070 <: D1 {}

class E1071 <: D2 {}

class E1072 <: D1 {}

class E1073 <: D2 {}

class E1074 <: D1 {}

class E1075 <: D2 {}

class E1076 <: D1 {}

class E1077 <: D2 {}

class E1078 <: D1 {}

class E1079 <: D2 {}

class E1080 <: D1 {}

class E1081 <: D2 {}

class E1082 <: D1 {}

class E1083 <: D2 {}

class E1084 <: D1 {}

class E1085 <: D2 {}

class E1086 <: D1 {}

class E1087 <: D2 {}

class E1088 <: D1 {}

class E1089 <: D2 {}

class E1090 <: D1 {}

class E1091 <: D2 {}

class E1092 <: D1 {}

class E1093 <: D2 {}

class E1094 <: D1 {}

class E1095 <: D2 {}

class E1096 <: D1 {}

class E1097 <: D2 {}

class E1098 <: D1 {}

class E1099 <: D2 {}

class E1100 <: D1 {}

class E1101 <: D2 {}

class E1102 <: D1 {}

class E1103 <: D2 {}

class E1104 <: D1 {}

class E1105 <: D2 {}

class E1106 <: D1 {}

class E1107 <: D2 {}

class E1108 <: D1 {}

class E1109 <: D2 {}

class E1110 <: D1 {}

class E1111 <: D2 {}

class E1112 <: D1 {}

class E1113 <: D2 {}

class E1114 <: D1 {}

class E1115 <: D2 {}

class E1116 <: D1 {}

class E1117 <: D2 {}

class E1118 <: D1 {}

class E1119 <: D2 {}

class E1120 <: D1 {}

class E1121 <: D2 {}

class E1122 <: D1 {}

class E1123 <: D2 {}

class E1124 <: D1 {}

class E1125 <: D2 {}

class E1126 <: D1 {}

class E1127 <: D2 {}

class E1128 <: D1 {}

class E1129 <: D2 {}

class E1130 <: D1 {}

class E1131 <: D2 {}

class E1132 <: D1 {}

class E1133 <: D2 {}

class E1134 <: D1 {}

class E1135 <: D2 {}

class E1136 <: D1 {}

class E1137 <: D2 {}

class E1138 <: D1 {}

class E1139 <: D2 {}

class E1140 <: D1 {}

class E1141 <: D2 {}

class E1142 <: D1 {}

class E1143 <: D2 {}

class E1144 <: D1 {}

class E1145 <: D2 {}

class E1146 <: D1 {}

class E1147 <: D2 {}

class E1148 <: D1 {}

class E1149 <: D2 {}

class E1150 <: D1 {}

class E1151 <: D2 {}

class E1152 <: D1 {}

class E1153 <: D2 {}

class E1154 <: D1 {}

class E1155 <: D2 {}

class E1156 <: D1 {}

class E1157 <: D2 {}

class E1158 <: D1 {}

class E1159 <: D2 {}

class E1160 <: D1 {}

class E1161 <: D2 {}

class E1162 <: D1 {}

class E1163 <: D2 {}

class E1164 <: D1 {}

class E1165 <: D2 {}

class E1166 <: D1 {}

class E1167 <: D2 {}

class E1168 <: D1 {}

class E1169 <: D2 {}

class E1170 <: D1 {}

class E1171 <: D2 {}

class E1172 <: D1 {}

class E1173 <: D2 {}

class E1174 <: D1 {}

class E1175 <: D2 {}

class E1176 <: D1 {}

class E1177 <: D2 {}

class E1178 <: D1 {}

class E1179 <: D2 {}

class E1180 <: D1 {}

class E1181 <: D2 {}

class E1182 <: D1 {}

class E1183 <: D2 {}

class E1184 <: D1 {}

class E1185 <: D2 {}

class E1186 <: D1 {}

class E1187 <: D2 {}

class E1188 <: D1 {}

class E1189 <: D2 {}

class E1190 <: D1 {}

class E1191 <: D2 {}

class E1192 <: D1 {}

class E1193 <: D2 {}

class E1194 <: D1 {}

class E1195 <: D2 {}

class E1196 <: D1 {}

class E1197 <: D2 {}

class E1198 <: D1 {}

open class E1199 <: D2 {}

open class E1200 <: D1 {}

class F1 <: E1199 {}

class F2 <: E1199 {}

class F3 <: E1200 {}

main(): Int64 {
    var yes: String = "Yes";
    var no: String = "No";

    var a: A = A();
    var c1: A = C1();
    var c2: A = C2();
    var e1: A = E1199();
    var e2: A = E1200();
    var f1: A = F1();
    var f2: A = F3();

    expectTrue(f1 is E1199);
    expectFalse(f1 is E1200);
    expectFalse(f2 is E1199);
    expectTrue(f2 is E1200);

    expectFalse(e1 is F1);
    expectFalse(e1 is F3);
    expectFalse(e2 is F1);
    expectFalse(e2 is F3);

    expectFalse(e1 is C1);
    expectTrue(e2 is C1);
    expectTrue(e1 is C2);
    expectFalse(e2 is C2);

    expectFalse(c1 is F1);
    expectFalse(c1 is F3);
    expectFalse(c2 is F1);
    expectFalse(c2 is F3);
    print("passed");
    return 0
}

func expectTrue(value: Bool): Unit {
    if (!value) {
        throw Exception("Expected True");
    }
}

func expectFalse(value: Bool): Unit {
    if (value) {
        throw Exception("Expected False");
    }
}
