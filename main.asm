; 10 SYS (2064)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $30, $36, $34, $29, $00, $00, $00

PRINTLINE=$AB1E

; program entrance
*=$0810
PROGRAM_START
        
        LDA #2 ; value for color red
        JSR CHANGE_BORDER_COLOR

        JSR SWAP_BACKGROUND_AND_TEXT_COLORS

        JSR PRINT_HELLO
        
        JSR PLACE_GREEN_HEART_IN_UPPER_LEFT_CORNER

        JSR PLACE_WHITE_HEART_IN_UPPER_RIGHT_CORNER

        JSR PLACE_VIOLET_HEART_IN_LOWER_LEFT_CORNER

        JSR PLACE_LIGHT_GREEN_HEART_IN_LOWER_RIGHT_CORNER
PROGRAM_END
        rts

HELLO_STRING
        text "hello"
        byte 13, 00

; start writing your subroutines after this line

; Changes the border color
CHANGE_BORDER_COLOR
        STA $D020 ; frame
        RTS

; Swaps the back and text colors
SWAP_BACKGROUND_AND_TEXT_COLORS
        LDA $0286 ; current text color
        TAX       ; x now contains original text color
        LDA $D021 ; current background color
        STA $0286 ; change the text color
        STX $D021 ; change the background color
        RTS

; Print "HELLO"
PRINT_HELLO
        LDA #<HELLO_STRING
        LDY #>HELLO_STRING
        JSR PRINTLINE
        RTS

; Place a green heart in the upper left corner
PLACE_GREEN_HEART_IN_UPPER_LEFT_CORNER
        JSR LOAD_HEART_IN_UPPER_LEFT_CORNER
        JSR CHANGE_HEART_COLOR_TO_GREEN
        RTS

; Loads heart in the upper left corner
LOAD_HEART_IN_UPPER_LEFT_CORNER
        LDA #83   ; load heart
        STA $0400 ; upper left corner
        RTS

; Change heart color to green
CHANGE_HEART_COLOR_TO_GREEN
        LDA #5
        STA $D800
        RTS

; Place a white heart in the upper right corner
PLACE_WHITE_HEART_IN_UPPER_RIGHT_CORNER
        JSR LOAD_HEART_IN_UPPER_RIGHT_CORNER
        JSR CHANGE_HEART_COLOR_TO_WHITE
        RTS

; Load heart in upper right corner
LOAD_HEART_IN_UPPER_RIGHT_CORNER
        LDA #83   ; load heart
        STA $0427 ; upper right corner
        RTS

; Change heart color to white
CHANGE_HEART_COLOR_TO_WHITE
        LDA #1    ; value for color white
        STA $D827
        RTS

; Place a violet heart in the lower left corner
PLACE_VIOLET_HEART_IN_LOWER_LEFT_CORNER
        JSR LOAD_HEART_IN_LOWER_LEFT_CORNER
        JSR CHANGE_HEART_COLOR_TO_VIOLET
        RTS

; Load heart in lower left corner
LOAD_HEART_IN_LOWER_LEFT_CORNER
        LDA #83   ; load heart
        STA $07C0 ; lower left corner
        RTS

; Change heart color to violet
CHANGE_HEART_COLOR_TO_VIOLET
        LDA #4    ; value for color violet
        STA $DBC0
        RTS

; Place a light green heart in the lower right corner
PLACE_LIGHT_GREEN_HEART_IN_LOWER_RIGHT_CORNER
        JSR LOAD_HEART_IN_LOWER_RIGHT_CORNER
        JSR CHANGE_HEART_COLOR_TO_LIGHT_GREEN
        RTS

; Load heart in lower right corner
LOAD_HEART_IN_LOWER_RIGHT_CORNER
        LDA #83   ; load heart
        STA $07E7 ; lower right corner
        RTS

; Change heart color to light green
CHANGE_HEART_COLOR_TO_LIGHT_GREEN
        LDA #13   ; value for color light green
        STA $DBE7
        RTS