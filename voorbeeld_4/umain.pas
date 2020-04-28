unit uMain;

interface

uses
  SysUtils,
  Math;

procedure bereken_aantal_dagen;

implementation

type
  Tpersoon = record
    naam: string;
    geboortedatum: TDateTime;
  end;

procedure bereken_aantal_dagen;
var
  personen: array[1..2] of TPersoon; // array met twee Tpersoon-en
  aantal_dagen: integer;
  nog_een_keer: boolean;
  fs: TFormatSettings;
  // s wordt vaak gebruikt als variabele-naam voor een string die je maar eventjes nodig hebt
  s, tekst: string;
  // Dataype char is 1 karakter. k is een korte naam, hebben we waarschijn ook maar kort nodig
  k: char;
  i: integer; // een tellertje
  i_oudste, i_jongste: integer; // index (positie) in array van oudste en jongste persoon
begin
  nog_een_keer := True;

  // datum-formaat dat we gaan gebruiken even instellen
  fs.DateSeparator := '-';
  fs.ShortDateFormat := 'dd-mm-yyyy';

  while nog_een_keer do
  begin
    // "for" is een iteratie zoals "while", maar dan met een vast aantal rondjes en een teller die oploopt
    for i := 1 to 2 do
    begin
      //initialisatie persoon[i]
      Write(output, Format('Geef naam persoon %d: ', [i]));
      readln(input, personen[i].naam);
      Write(output, Format('Geef geboortedatum persoon %d (%s): ',
        [i, fs.ShortDateFormat]));
      readln(input, s);
      personen[i].geboortedatum := StrToDate(s, fs);
    end;

    //even kijken wie de oudste is
    if personen[1].geboortedatum < personen[2].geboortedatum then
    begin
      i_oudste := 1;
      i_jongste := 2;
    end
    else
    begin
      i_oudste := 2;
      i_jongste := 1;
    end;

    aantal_dagen := floor(personen[i_jongste].geboortedatum -
      personen[i_oudste].geboortedatum); // grootste datum eerst
    Tekst := Format('%s is %d dagen ouder dan %s',
      [personen[i_oudste].naam, aantal_dagen, personen[i_jongste].naam]);

    Writeln(output, tekst);
    Write(output, 'Nog een keer? (Tik N om te stoppen): ');
    Readln(input, k);
    if uppercase(k) = 'N' then
      nog_een_keer := False;
  end;

end;

end.
