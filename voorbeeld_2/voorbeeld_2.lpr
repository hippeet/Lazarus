program voorbeeld_2;

uses
  SysUtils,
  Math;

var
  naam1, naam2: string;
  datum1, datum2: TDateTime;
  aantal_dagen: integer;
  nog_een_keer: boolean;
  fs: TFormatSettings;
  // s wordt vaak gebruikt als variabele-naam voor een string die je maar eventjes nodig hebt
  s, tekst: string;
  // Dataype char is 1 karakter. k is een korte naam, hebben we waarschijn ook maar kort nodig
  k: char;
begin
  nog_een_keer := True;

  // datum-formaat dat we gaan gebruiken even instellen
  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'dd-mm-yyyy';

  while nog_een_keer do
  begin
    //initialisatie persoon1
    Write(output, 'Geef naam persoon 1: ');
    readln(input, naam1);
    Write(output, Format('Geef geboortedatum persoon 1 (%s): ', [fs.ShortDateFormat]));
    readln(input, s);
    datum1 := StrToDate(s, fs);
    //initialisatie persoon1
    Write(output, 'Geef naam persoon 2: ');

    readln(input, naam2);
    Write(output, Format('Geef geboortedatum persoon 2 (%s): ', [fs.ShortDateFormat]));
    readln(input, s);
    datum2 := StrToDate(s, fs);

    //even kijken wie de oudste is
    if datum1 < datum2 then
    begin
      //persoon1 is de oudste
      aantal_dagen := floor(datum2 - datum1); // grootste datum eerst
      Tekst := Format('%s is %d dagen ouder dan %s',
        [naam1, aantal_dagen, naam2]);
      // oudste persoon eerst
    end
    else
    begin
      //persoon2 is de oudste
      aantal_dagen := floor(datum1 - datum2); // grootste datum eerst
      Tekst := Format('%s is %d dagen ouder dan %s',
        [naam2, aantal_dagen, naam1]);
      // oudste persoon eerst
    end;

    Writeln(output, tekst);
    Write(output, 'Nog een keer? (Tik N om te stoppen): ');
    Readln(input, k);
    if uppercase(k) = 'N' then
      nog_een_keer := False;
  end;
end.
