
# ----
# Informationsteknologi - Möjligheter och utmaningar, 1DT110
# Bjarne Rossen
##
# (Inledande #-tecken betyder att det som följer är en kommentar)
# ------------------------------------------------------------------------

# Skriv ut följande rad i konsolen.
print("Konvertera från decimaltal till binärtal")

# Definition av funktionen dec2bin som konverterar ett devimaltal till binärtal.
# Funktionen tar in två parametrar: värde och antal_bitar


def dec2bin(värde, antal_bitar):
    # Medan antal_bitar är angiven
    while antal_bitar:
        # Beräkna 2 upphöjd till (antal_bitar - 1) och sparar detta värde i bit_värde
        bit_värde = 2 ** (antal_bitar - 1)
        # Om värde större eller lika med bit_värde
        if värde >= bit_värde:
            # Skriv ut en etta
            print('1', end='')
            # Subtrahera bit_värde från värde och spara i värde
            värde = värde - bit_värde
        else:
            # Annars skriv ut en nolla
            print('0', end='')
        antal_bitar = antal_bitar - 1


# -------------------------------------------------------------------------
# Start på huvudprogrammet
# Härifrån anropas funktionen dec2bin() efter att användarens inmatade
# värden kontrollerats (givna inom intervallet 0 till 65535)
# Vi har ju inte börjat huvudprogrammet ännu så invärdet är ju inte ok...
invärde_ok = False
invärde = 0

# Medan invärde_ok är False
while not invärde_ok:
    # Mata in ett värde från användaren och spara i invärde
    invärde = int(input("Ange ett värde: "))

    # Om invärde är större än 65535, skriv ut meddellandet.
    if invärde > 65535:
        print("Fel. Kan inte hantera sa stora tal. Forsok igen.")

    # Om invärde är mindre än 0, skriv ut meddellandet.
    elif invärde < 0:
        print("Fel. Kan bara hantera positiva tal. Forsok igen.")

    # Annars; har vi kommit hit är det inlästa värdet inom gränserna invärde_ok = True
    else:
        invärde_ok = True

        # Om invärde är mindre än 256
        if invärde < 256:
            # skriv ut:
            print(
                f"Talet {invärde}  ryms i en byte och blir binärt: ")
            dec2bin(invärde, 8)

        else:
            # Annars skriv ut:
            print(
                f"Talet {invärde} ryms i 16 bitar och blir binart: ")
            dec2bin(invärde, 16)

# Huvudprogram slut!
# ------------------------------------------------------------------------

# Testkörningar

# Konvertera från decimaltal till binärtal
# Ange ett värde: 133456
# Fel. Kan inte hantera sa stora tal. Forsok igen.
# Ange ett värde: 234
# Talet 234  ryms i en byte och blir binärt:
# 11101010

# Konvertera från decimaltal till binärtal
# Ange ett värde: -597
# Fel. Kan bara hantera positiva tal. Forsok igen.
# Ange ett värde: 35442
# Talet 35442 ryms i 16 bitar och blir binart:
# 1000101001110010
