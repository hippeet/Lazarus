program voorbeeld_4;

uses
  SysUtils,
  // uMain bevat ons programma
  uMain;

begin
  try
    bereken_aantal_dagen;
    WriteLn(output, 'Klaar.');
    Sleep(500); // Halve seconde wachten
  except
    on e: Exception do
    begin
      WriteLn(output, 'Fout: ' + e.message);
      Write(output, 'Hit return...');
      readln(input);
    end;
  end;
end.

