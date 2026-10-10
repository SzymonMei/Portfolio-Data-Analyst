# Analiza sprzedaży firmy – SQL | 2024–2025

## Cel projektu

Celem projektu była analiza danych sprzedażowych fikcyjnej firmy handlowej z lat 2024–2025 przy użyciu SQL Server Management Studio (SSMS).

Na podstawie danych przygotowałem zapytania, które pozwalają sprawdzić wyniki sprzedaży, najlepiej sprzedające się produkty oraz aktywność klientów.

## Wykorzystane narzędzia

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Język SQL (T-SQL)

## Zakres analizy

W projekcie przygotowałem pięć zapytań SQL:

1. **Sprzedaż według regionów** – sprawdziłem wartość sprzedaży w poszczególnych regionach w 2025 roku.
2. **TOP 5 produktów** – wybrałem pięć produktów generujących największą wartość sprzedaży w 2025 roku.
3. **Analiza klientów** – wyszukałem klientów, którzy złożyli minimum 8 zamówień i wydali łącznie ponad 30 000 zł w 2025 roku.
4. **Podział produktów według ceny** – podzieliłem produkty na tanie, średnie i drogie na podstawie ich ceny katalogowej.
5. **Porównanie sprzedaży kategorii** – porównałem wartość sprzedaży poszczególnych kategorii produktów w latach 2024 i 2025.

## Wykorzystane elementy SQL

Podczas wykonywania zapytań korzystałem między innymi z:

- `SELECT`, `WHERE`, `ORDER BY`
- `JOIN`
- `GROUP BY`, `HAVING`
- `SUM`, `COUNT`, `DISTINCT`
- `CASE WHEN`
- `TOP`
- Filtrowania danych według dat i statusu zamówienia

## Pliki projektu

- **zapytania.sql** – pięć zapytań przygotowanych do analizy sprzedaży.
- **Projekt_Analityk.sql** – skrypt bazy danych zawierający strukturę tabel oraz dane potrzebne do wykonania zapytań.

Projekt SQL jest powiązany z analizą sprzedaży przygotowaną również w Power BI.
