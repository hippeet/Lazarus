program kaartspel;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX} {$IFDEF UseCThreads}
  cthreads, {$ENDIF} {$ENDIF}
  Classes,
  SysUtils,
  CustApp { you can add units after this };

type

  { TMyApplication }

  TMyApplication = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
  end;

type
  TkaartKleur = (harten, schoppen, ruiten, klaver);
  TkaartWaarde = (k2, k3, k4, k5, k6, k7, k8, k9, k10,
    kBoer, kVrouw, kHeer, kAas);
  Tkaart = record
    kleur: TkaartKleur;
    waarde: TkaartWaarde;
  end;

  { TMyApplication }

  procedure TMyApplication.DoRun;
  var
    ErrorMsg: string;
    spel: array [TkaartKleur, TkaartWaarde] of Tkaart;
    kleur: TkaartKleur;
    waarde: TkaartWaarde;
  begin
    // quick check parameters
    ErrorMsg := CheckOptions('h', 'help');
    if ErrorMsg <> '' then
    begin
      ShowException(Exception.Create(ErrorMsg));
      Terminate;
      Exit;
    end;

    // parse parameters
    if HasOption('h', 'help') then
    begin
      WriteHelp;
      Terminate;
      Exit;
    end;

    for kleur in TkaartKleur do
      for waarde in TkaartWaarde do
      begin
        spel[kleur, waarde].kleur := kleur;
        spel[kleur, waarde].waarde := waarde;
      end;

    // stop program loop
    Terminate;
  end;

  constructor TMyApplication.Create(TheOwner: TComponent);
  begin
    inherited Create(TheOwner);
    StopOnException := True;
  end;

  destructor TMyApplication.Destroy;
  begin
    inherited Destroy;
  end;

  procedure TMyApplication.WriteHelp;
  begin
    { add your help code here }
    writeln('Usage: ', ExeName, ' -h');
  end;

var
  Application: TMyApplication;
begin
  Application := TMyApplication.Create(nil);
  Application.Title := 'My Application';
  Application.Run;
  Application.Free;
end.
