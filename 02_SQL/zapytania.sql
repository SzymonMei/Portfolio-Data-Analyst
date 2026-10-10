-- 1. Sprzedaz wedlug regionow w 2025 roku.
-- Sprawdzam, ile wyniosla sprzedaz w kazdym regionie. Licze tylko zrealizowane zamowienia.

Select Regiony.Region,  sum(Ilosc*Cena_Jedn*(1-Rabat)) as sprzedaz from Pozycje
join Zamowienia on Zamowienia.ID_Zamowienia = Pozycje.ID_Zamowienia
join Regiony on Zamowienia.ID_Regionu = Regiony.ID_Regionu
where cast(Zamowienia.Data_Zamowienia as date) between '2025-01-01' and '2025-12-31' 
and Zamowienia.Status like 'Zrealizowane'
group by Regiony.Region;

-- 2. Piec produktow z najwieksza sprzedaza w 2025 roku.
-- Sprawdzam, ktore produkty przyniosly najwieksza wartosc sprzedazy.

Select distinct top 5 Produkty.Produkt, Produkty.Kategoria, sum(Ilosc*Cena_Jedn*(1-Rabat))as sprzedaz from Pozycje
join Zamowienia on Zamowienia.ID_Zamowienia = Pozycje.ID_Zamowienia
join Produkty on Produkty.ID_Produktu = Pozycje.ID_Produktu
where cast(Zamowienia.Data_Zamowienia as date) between '2025-01-01' and '2025-12-31'
AND Zamowienia.Status = 'Zrealizowane'
group by Produkty.Produkt, Produkty.Kategoria
order by sprzedaz desc;

-- 3. Klienci, ktorzy zrobili przynajmniej 8 zamowien w 2025 roku.
-- Pokazuje tylko tych, ktorzy wydali lacznie ponad 30 000 zl.

SELECT 
    Klienci.Klient,
    COUNT(DISTINCT Zamowienia.ID_Zamowienia) AS LiczbaZamowien,
    SUM(Pozycje.Ilosc * Pozycje.Cena_Jedn * (1 - Pozycje.Rabat)) AS Wartosc_Zakupow
FROM Klienci
JOIN Zamowienia ON Zamowienia.ID_Klienta = Klienci.ID_Klienta
JOIN Pozycje ON Pozycje.ID_Zamowienia = Zamowienia.ID_Zamowienia
WHERE Zamowienia.Data_Zamowienia BETWEEN '2025-01-01' AND '2025-12-31'
AND Zamowienia.Status = 'Zrealizowane'
GROUP BY Klienci.Klient
HAVING COUNT(DISTINCT Zamowienia.ID_Zamowienia) >= 8
AND SUM(Pozycje.Ilosc * Pozycje.Cena_Jedn * (1 - Pozycje.Rabat)) > 30000
ORDER BY Wartosc_Zakupow DESC;

-- 4. Podzial produktow wedlug ceny katalogowej.
-- Produkty ponizej 100 zl to Tani, od 100 do 500 zl to Sredni, a powyzej 500 zl to Drogi.

Select Produkt, Kategoria, Cena_Katalogowa,
case 
    when Cena_Katalogowa < 100 then 'Tani' 
    when Cena_Katalogowa between 100 and 500 then 'Średni' 
    else 'Drogi'
    end AS Segment
from Produkty;

-- 5. Porownanie sprzedazy kategorii w 2024 i 2025 roku.
-- Dla kazdej kategorii licze osobno sprzedaz w obu latach. Uwzgledniam zrealizowane zamowienia.

Select Kategoria, 
SUM(
    CASE
        WHEN YEAR(Zamowienia.Data_Zamowienia) = 2024
        THEN Ilosc * Cena_Jedn * (1-Rabat)
        ELSE 0
    END
) AS Sprzedaz_2024
, 
SUM(
    CASE
        WHEN YEAR(Zamowienia.Data_Zamowienia) = 2025
        THEN Ilosc * Cena_Jedn * (1-Rabat)
        ELSE 0
    END
) AS Sprzedaz_2025
from Produkty
join Pozycje on Pozycje.ID_Produktu = Produkty.ID_Produktu
join Zamowienia on Zamowienia.ID_Zamowienia = Pozycje.ID_Zamowienia
where Zamowienia.Status like 'Zrealizowane'
group by Kategoria;