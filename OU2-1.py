# Informationsteknologi - Möjligheter och utmaningar, 1DT110
# Bjarne Rossen

# importerar math libaryn för att kunna genomföra beräkningarna
import math

# Funktionsdefinitioner

# Definition av enkel funktion skriv_ut, som skriver ut nedstående text in consolen


def skriv_ut():
    print("Mata in födelseårtal. För att avsluta, ange talet 0.")


# Deklaration av varibaler
antal_ar = 0
summa_ar = 0
max_ar = 0
min_ar = 110
inmatat_ar = -1

# Så länge inmatat år är inte 0 stanna i loopen
while inmatat_ar != 0:
    skriv_ut()
    # Mata in ett årtal och sparar den i inmatat_ar
    inmatat_ar = int(input("Skriv årtal här: "))
    # Beräkna åldern genom att subtrahera det inmatate året från 2022 och sparar i variabeln alder
    alder = (2022 - inmatat_ar)

    # Om åldern är mindre än noll eller större än 110 OCH INTE 2022, skriv ut raden "Orimligt årtal. Försök igen." i konsolen
    if alder < 0 or alder > 110 and alder != 2022:
        print("Orimligt årtal. Försök igen.")

    else:
        # Annars, om inmatate året är större än noll, höj antal_ar med 1 och addera alder och summa_ar och gör detta till nya summa summa_ar.
        if inmatat_ar > 0:
            antal_ar += 1
            summa_ar = summa_ar + alder

            # Om aldern är mindre än min_ar, betyder detta att vi har hittat vår min_ar och ska sätta min_ar lika med alder.
            if alder < min_ar:
                min_ar = alder

            # Om aldern är mindre än max_ar, betyder detta att vi har hittat vår max_ar och ska sätta max_ar lika med alder.
            if alder > max_ar:
                max_ar = alder

    # Om inmatate året är lika med 0, bryt ur loopen
    if inmatat_ar == 0:
        break

# Skriv ut medellandet med beräkningen av medelåldern i konsolen.
print(f"Medelaldern är {math.trunc(summa_ar / antal_ar)} år.")
# Skriv ut medellandet med lägsta år och högsta ålder i konsolen.
print(f"Den yngsta är {min_ar} och den aldsta är {max_ar}.")
