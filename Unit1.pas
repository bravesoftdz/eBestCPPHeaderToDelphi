unit Unit1;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Clipbrd, Vcl.StdCtrls, Winapi.UrlMon, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    LinkLabel1: TLinkLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  _Clipboard: TClipboard;
  _StartIndex, _EndIndex, _ArrayEndIndex: Integer;
  _StringList: TStringList;
  _BlockName: string;
  _String: string;
  _FieldName: string;
  _Valid: Boolean;
begin
  Memo1.Clear;

  _Clipboard := TClipboard.Create;
  _StringList := TStringList.Create;

  _StringList.Text := _Clipboard.AsText;

  _Valid := False;

  for _String in _StringList do
  begin
    if Pos('typedef', _String) > 0 then
    begin
      _Valid := True;
    end;
  end;

  if not _Valid then
  begin
    Memo1.Lines.Add('NOT A VALID HEADER');

    Exit;
  end;

  Memo1.Lines.BeginUpdate;

  for _String in _StringList do
  begin
    if Pos('typedef', _String) > 0 then
    begin
      _StartIndex := Pos('_', _String, 1) + 1;

      _BlockName := Copy(_String, _StartIndex, length(_String) - _StartIndex + 1);

      _BlockName := StringReplace(_BlockName, '_In', 'In', [rfReplaceAll]);
      _BlockName := StringReplace(_BlockName, '_Out', 'Out', [rfReplaceAll]);

      Memo1.Lines.Add('  ' + _BlockName + ' = packed record');
    end
    else if Pos('char', _String) > 0 then
    begin
      _StartIndex := Pos('char', _String, 1) + 8;
      _EndIndex := Pos('[', _String, 1);

      _FieldName := '    ' + Copy(_String, _StartIndex, _EndIndex - _StartIndex) + ': array[0..';

      _StartIndex := _EndIndex + 1;
      _EndIndex := Pos(']', _String, 1);

      _ArrayEndIndex := StrToInt(Copy(_String, _StartIndex, _EndIndex - _StartIndex));

      _FieldName := _FieldName + Format('%*d', [4, _ArrayEndIndex - 1]) + '] of AnsiChar; ';

      _StartIndex := Pos('_', _String, _EndIndex);

      if _StartIndex > 0 then
      begin
        _FieldName := _FieldName + Copy(_String, _StartIndex, 21) + ': AnsiChar;';
      end;

      Memo1.Lines.Add(_FieldName);
    end
    else if Pos('}', _String) > 0 then
    begin
      Memo1.Lines.Add('  end;');
      Memo1.Lines.Add('');
      Memo1.Lines.Add('  p' + _BlockName + '= ^' + _BlockName + ';');
      Memo1.Lines.Add('');
    end;
  end;

  Memo1.Lines.EndUpdate;

  _Clipboard.AsText := Memo1.Lines.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LinkLabel1.Caption := '<a href="http://shinjguk.blog.me">shinjguk.blog.me </a>';
end;

procedure TForm1.LinkLabel1LinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);
begin
  HlinkNavigateString(nil, pwidechar(Link));
end;

end.
