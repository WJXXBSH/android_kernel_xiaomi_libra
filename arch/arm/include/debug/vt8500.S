/*
 * Debugging macro include header
 *
 *  Copyright (C) 2010 Alexey Charkov <alchark@gmail.com>
 *    Moved from arch/arm/mach-vt8500/include/mach/debug-macro.S
 *    Minor changes for readability.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#define DEBUG_LL_PHYS_BASE		0xD8000000
#define DEBUG_LL_VIRT_BASE		0xF8000000
#define DEBUG_LL_UART_OFFSET		0x00200000

#if defined(CONFIG_DEBUG_VT8500_UART0)
	.macro	addruart, rp, rv, tmp
	mov	\rp,      #DEBUG_LL_UART_OFFSET
	orr	\rv, \rp, #DEBUG_LL_VIRT_BASE
	orr	\rp, \rp, #DEBUG_LL_PHYS_BASE
	.endm

	.macro	senduart,rd,rx
	strb	\rd, [\rx, #0]
	.endm

	.macro	busyuart,rd,rx
1001:	ldr	\rd, [\rx, #0x1c]
	ands	\rd, \rd, #0x2
	bne	1001b
	.endm

	.macro	waituart,rd,rx
	.endm

#endif
