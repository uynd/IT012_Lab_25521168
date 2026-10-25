
.data
prompt0: .asciiz "Nhap chi so dau thang 1 (reading0): "
prompt1: .asciiz "Nhap chi so dau thang 2 (reading1): "
prompt2: .asciiz "Nhap chi so dau thang 3 (reading2): "
prompt3: .asciiz "Nhap chi so cuoi thang 3 (reading3): "

str_thang1: .asciiz "Thang 1: "
str_thang2: .asciiz "Thang 2: "
str_thang3: .asciiz "Thang 3: "
str_tong:   .asciiz "Tong:    "
newline:    .asciiz "\n"

.text
.globl main
main:
    # --- 1. ??c reading0 vào $s0 ---
    li   $v0, 4
    la   $a0, prompt0
    syscall

    li   $v0, 5
    syscall
    move $s0, $v0          

    # --- 2. ??c reading1 vào $s1 ---
    li   $v0, 4
    la   $a0, prompt1
    syscall

    li   $v0, 5
    syscall
    move $s1, $v0           

    # --- 3. ??c reading2 vào $s2 ---
    li   $v0, 4
    la   $a0, prompt2
    syscall

    li   $v0, 5
    syscall
    move $s2, $v0          

    # --- 4. ??c reading3 vào $s3 ---
    li   $v0, 4
    la   $a0, prompt3
    syscall

    li   $v0, 5
    syscall
    move $s3, $v0      

    # --- 5. Tính toán (Ch? dùng add, sub theo yêu c?u) ---
    sub  $t0, $s1, $s0      # usage1 = reading1 - reading0
    sub  $t1, $s2, $s1      # usage2 = reading2 - reading1
    sub  $t2, $s3, $s2      # usage3 = reading3 - reading2
    
    add  $t3, $t0, $t1      # t?ng t?m = usage1 + usage2
    add  $t3, $t3, $t2      # total = t?ng t?m + usage3

    # --- 6. In k?t qu? ra màn hình theo ?úng ??nh d?ng ---
    
    # In "Thang 1: " + usage1
    li   $v0, 4
    la   $a0, str_thang1
    syscall
    li   $v0, 1
    move $a0, $t0
    syscall
    li   $v0, 4
    la   $a0, newline
    syscall

    # In "Thang 2: " + usage2
    li   $v0, 4
    la   $a0, str_thang2
    syscall
    li   $v0, 1
    move $a0, $t1
    syscall
    li   $v0, 4
    la   $a0, newline
    syscall

    # In "Thang 3: " + usage3
    li   $v0, 4
    la   $a0, str_thang3
    syscall
    li   $v0, 1
    move $a0, $t2
    syscall
    li   $v0, 4
    la   $a0, newline
    syscall

    # In "Tong:    " + total
    li   $v0, 4
    la   $a0, str_tong
    syscall
    li   $v0, 1
    move $a0, $t3
    syscall
    li   $v0, 4
    la   $a0, newline
    syscall


    li   $v0, 10
    syscall
