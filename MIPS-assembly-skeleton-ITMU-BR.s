##############################################################################
# Course: IT - Possibilities and Challenges, 1DT110. 
#@Per Foyer
#
# Obligatory assignment 4: Assembly programming i MIPS
#
# Name:   Bjarne Rossen
# Date:   19.07.2022
##############################################################################


  .text
  
        j   main
        
##############################################################################
# DESCRIPTION: Converts a lowercase [a-z] string to an uppercase [A-Z] string
#   
# INPUT:       $a0 - Address to ONE character
# OUTPUT:      (Nothing!)
##############################################################################  

to_uppercase:  
loopi:
#   Retrieve the byte from memory at the address that $a0 points to
    lb $t1, STR_to_convert($t0)
#   Branch if $t1 is equal to 0, exit
    beq $t1, 0, exit
#   If the $t1 is less than 'a' in ASCII table jump to case
    blt $t1, 'a', case
#   If the $t1 is greater than 'a' in ASCII table jump to case
    bgt $t1, 'z', case
#   Set $t1 to $t1 minus 32
    sub $t1, $t1, 32
#   Store the low-order 8-bits of $t1 into the adress of STR_to_convert
    sb $t1, STR_to_convert($t0)

case: 
    addi $t0, $t0, 1
    j loopi

exit:
    li $v0, 4
    la $a0, STR_to_convert
    syscall
    	
     jr      $ra         # Return to the caller code   
##############################################################################
# Description: Returns the the number of characters in a string
#
# INPUT:     $a0 - The address of a (any) null-terminated string
# OUTPUT:    $v0 - The length (number of characters) of the string, zero excluded
#
##############################################################################  
character_count:
#   Load immediate, and set $t1 to 16-bit
    li $t1, 0 
#   Load address, and set $t0 address to STR_to_convert
    la $t0, STR_to_convert

loop:
#   Retrieve the **byte** that $a0 refers to  
#   retrieve the next character
    lb   $a0,0($t0)
#   Is the byte zero / is the string over? 
#   Go to done below 
    beqz $a0,done
#   Increase $t0 by one                      
#   Counts another letter 
    addi $t0,$t0,1
#   increase the address register $t1 by one  
#   So that it refers to the next character
    addi $t1,$t1,1
#   Go back to the beginning of the loop above                             
#   Read the next character
    j     loop
done:
#   Set $t1 to sum of $v0 and $0
    add  $v0, $0, $t1 
    

#characters_finished:
    jr      $ra        # Return to the caller code
##############################################################################
# DESCRIPTION: Converts a lowercase [a-z] string to an uppercase [A-Z] string
#   
# INPUT:       $a0 - Address to ONE character
# OUTPUT:      (Nothing!)
##############################################################################      


##############################################################################
# Description: Calculates the total sum of all elements in an integer array
#
# INPUT:        $a0 - The address of the first number in the array
#               $a1 - Number of integers stored in the array
#
# OUTPUT:       $v0 - The sum of all numbers in the integer array
##############################################################################
integer_array_sum:  

##  Clues:
##  - Do not forget to reset registers if needed
##  - An integer is stored in bytes of memory. Each integer is thus 32 bits
##  - If you want to multiply the contents of a register by a power of two,
##    a common trick (hint) is to shift bits a few steps to the left.
##    Example (verify with pen and paper. Sll = Shift Left Logical):
##    sll $t1, $t0, 2     #    $t1 = $t0 * 4
##    sll $t0, $t1, 4     #    $t0 = $t1 * 16
    

## Each line below corresponds to an assembly instruction.
## i is the index in the array, N is the totoal number of elements in the array (come in $a0), and 
## n is the number just retrieved. A symbolizes the address of the array
## NOTE: You must first understand each instruction you write and
## understand how the function you write works!

#### WRITE YOUR ASSEMBLY CODE HERE ####
#Suggested algorithm
# Reset $v0
	li $v0, 0
# Reset $t0
	li $t0, 0

loop_all_numbers:
# If $t0 (i) is equal to $a1 jump to number_end  # Done if i == N
	beq $t0, $a1, number_end
# Multiply $t0 by four and store it in $t1       # Index_address = i * 4
	sll $t1, $t0, 2
# Sum $t1 with $a0 and store it in $t2           # Address = $a0 + Index_address
	add $t2, $t1, $a0
# Retrieve the number from memory that $t2 points to and store it in $t3     # n = A[i]
	lb $t3, 0($t2)
# Add $t3 to $v0 (the result register) and store the results in $v0       # Sum = Sum + n
	addu $v0, $v0, $t3
# Add 1 to the register $t0                     # i = i + 1
	add $t0, $t0, 1
# Jump to loop_all_numbers
	j loop_all_numbers
    
number_end:
    	jr      $ra                   # Return to caller code










##############################################################################
##############################################################################
##
##    * Don't change or use ANYTHING below this line. 
##
##    * Andra eller anvand INGENTING under detta avsnitt    
##  
##############################################################################
##############################################################################

### Data used by the main program

    .data
    
NUMBER_COUNT:
    .word       11
NUMBER_ARRAY:
    .word       1, 3, 6, 9, 2, 4, 6, 8, 10, 55, 113
STR_to_convert:
    .asciiz "today is a sunny, but cold day!"

NUMBER_1_str: 
    .asciiz "The sum of the " 
NUMBER_2_str:
    .asciiz " numbers is " 

STRlen_1_str:
    .asciiz "\n\nThe number of characters in the string \""
STRlen_2_str:
    .asciiz "\" is "
STRlen_3_str:
   .asciiz ".\n\n"

STRupper_1_str:
    .asciiz "If all lowercase letters are capitalized, the string becomes: \""
STRupper_2_str:
    .asciiz "\"\n\n"


    .text
    .globl main
##############################################################################
#
# MAIN: Calls the subrutines and prints out the result
#
##############################################################################  
main:
    ##------
    ### to_upper
    ##-------
    
    li      $v0, 4
    la      $a0, STRupper_1_str        #If all lowercase letters are capitalized, the string becomes: \
    syscall                            # print string     #"today is a sunny, but cold day!"
    jal   to_uppercase                                                          # calling the function 
    li      $v0, 4
    la      $a0, STRlen_3_str
    syscall                            # print string
    
    ##---
    ### integer_numbers_sum
    ##---
    li      $v0, 4
    la      $a0, NUMBER_1_str
    syscall                            # print string

    lw      $a0, NUMBER_COUNT
    li      $v0, 1
    syscall                            # print integer

    li      $v0, 4
    la      $a0, NUMBER_2_str
    syscall                            # print string
    
    li      $v0, -1
    la      $a0, NUMBER_ARRAY
    lw      $a1, NUMBER_COUNT
    jal     integer_array_sum        # run subroutine

    # Print sum
    add     $a0, $v0, $zero
    li      $v0, 1
    syscall                            # print integer (arraysum)
    

    ##---
    ### number_of_characters 
    ##---
    li      $v0, 4
    la      $a0, STRlen_1_str
    syscall                            # print string

    li      $v0, 4
    la      $a0, STR_to_convert
    syscall                            # print string

    li      $v0, 4
    la      $a0, STRlen_2_str
    syscall                            # print string
    
    li      $v0, -2
    la      $a0, STR_to_convert
    jal     character_count               # run subroutine

    add     $a0, $v0, $zero
    li      $v0, 1
    syscall                             # print integer (antal tecken)

    li      $v0, 4
    la      $a0, STRlen_3_str
    syscall                            # print string

                          # print string
    
###--- EXIT
    li		$v0, 10                # MARS / SPIM exit
    syscall
    
#### EOF #####################################################################