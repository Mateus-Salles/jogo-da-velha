unit U_jogodavelha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    txt_linha: TEdit;
    lb_linha: TLabel;
    lb_coluna: TLabel;
    txt_coluna: TEdit;
    bt_enviar: TButton;
    ListBox1: TListBox;
    lb_player: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure bt_enviarClick(Sender: TObject);
  private
    { Private declarations }

    procedure atualizar;
    procedure testar;
    procedure reset;
    procedure mudar;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  posicoes:array[0..8] of String;
  player, simb:Char;
  winner:boolean;

implementation

{$R *.dfm}

procedure Tform1.testar;
var
  c:integer;
begin
  for c := 0 to 6 do
  begin
    case c of
      0:
      begin
        if (posicoes[c] = posicoes[c+1]) and (posicoes[c] = posicoes[c+2]) then
        begin
          ShowMessage('parabéns Jogador'+player+'!'+#13+'Você venceu.');
          reset;
          winner := True;
          break;
        end
        else if (posicoes[c] = posicoes[c+4]) and (posicoes[c+8] = posicoes[c+4]) then
        begin
          ShowMessage('parabéns Jogador'+player+'!'+#13+'Você venceu.');
          reset;
          winner := True;
          break;
        end
        else if (posicoes[c] = posicoes[c+3]) and (posicoes[c+3] = posicoes[c+6]) then
        begin
          ShowMessage('parabéns Jogador'+player+'!'+#13+'Você venceu.');
          reset;
          winner := True;
          break;
        end;
      end;

      1:
      begin
        if (posicoes[c] = posicoes[c+6]) and (posicoes[c] = posicoes[c+3]) then
        begin
          ShowMessage('parabéns Jogador'+player+'!'+#13+'Você venceu.');
          reset;
          winner := True;
          break;
        end;
      end;

      2:
      begin
        if (posicoes[c] = posicoes[c+3]) and (posicoes[c+3] = posicoes[c+6]) then
        begin
          ShowMessage('parabéns Jogador'+player+'!'+#13+'Você venceu.');
          reset;
          winner := True;
          break;
        end;
      end;

      3:
      begin
        if (posicoes[c] = posicoes[c+1]) and (posicoes[c+1] = posicoes[c+2]) then
        begin
          ShowMessage('parabéns Jogador'+player+'!'+#13+'Você venceu.');
          reset;
          winner := True;
          break;
        end;
      end;

      6:
      begin
        if (posicoes[c] = posicoes[c+1]) and (posicoes[c] = posicoes[c+2]) then
        begin
          ShowMessage('parabéns Jogador'+player+'!'+#13+'Você venceu.');
          reset;
          winner := True;
          break;
        end;
      end;
    end;

  end;

end;

procedure Tform1.mudar;
begin
  if player = '1' then
  begin
    player := '2';
    simb := 'o';
  end
  else
  begin
    player := '1';
    simb := 'x';
  end;
end;

procedure Tform1.atualizar;
begin
  ListBox1.Clear;

  ListBox1.Items.Add(Format(' %s | %s | %s '+#13, [posicoes[0], posicoes[1], posicoes[2]]));
  ListBox1.Items.Add(Format(' %s | %s | %s '+#13, [posicoes[3], posicoes[4], posicoes[5]]));
  ListBox1.Items.Add(Format(' %s | %s | %s '+#13, [posicoes[6], posicoes[7], posicoes[8]]));

end;

procedure TForm1.bt_enviarClick(Sender: TObject);
var
  linha, coluna, pos:integer;
begin
  linha := StrToInt(txt_linha.Text);
  coluna := StrToInt(txt_coluna.Text);

  if coluna > 3 then
  begin
    ShowMessage('Valor inválido');
  end
  else
  begin
    pos := (linha-1) * 3 + coluna;

    if (posicoes[pos-1] = 'x') or (posicoes[pos-1] = 'o') then
    begin
      ShowMessage('Posição inválida');
    end
    else if (pos > 9) then
    begin
      ShowMessage('Posição inválida');
    end
    else
    begin
      posicoes[pos-1] := simb;
      atualizar;
      testar;
      mudar;
      if (player = '2') and winner then
      begin
        mudar;
        winner := False;
      end;
    end;

    lb_player.Caption := 'Jogador'+player;
  end;

end;

procedure Tform1.reset;
var
  c:integer;
begin
  for c := 0 to 8 do
  posicoes[c] := IntToStr(c+1);

  ListBox1.Clear;

  atualizar;

  player := '1';
  simb := 'x';

  lb_player.Caption := 'Jogador1';
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  reset;
end;

end.
