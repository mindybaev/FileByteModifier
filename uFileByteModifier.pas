unit uFileByteModifier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

const
  BytePosition = 36866;//32770;
  BytePositionSwitchPower = 38912;

type
  TForm1 = class(TForm)
    btnSelectFile: TButton;
    btnChangeByte: TButton;
    OpenDialog: TOpenDialog;
    edtNewByte: TEdit;
    lblSelectedFile: TLabel;
    Label1: TLabel;
    btnCreateFilesInRange: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edtStartID: TEdit;
    edtEndID: TEdit;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    SpinEdit8: TSpinEdit;
    SpinEdit9: TSpinEdit;
    SpinEdit10: TSpinEdit;
    SpinEdit11: TSpinEdit;
    SpinEdit12: TSpinEdit;
    SpinEdit13: TSpinEdit;
    SpinEdit14: TSpinEdit;
    SpinEdit15: TSpinEdit;
    SpinEdit16: TSpinEdit;
    SpinEdit17: TSpinEdit;
    SpinEdit18: TSpinEdit;
    SpinEdit19: TSpinEdit;
    SpinEdit20: TSpinEdit;
    procedure btnSelectFileClick(Sender: TObject);
    procedure btnChangeByteClick(Sender: TObject);
    procedure edtNewByteChange(Sender: TObject);
    procedure edtNewByteKeyPress(Sender: TObject; var Key: Char);
    procedure btnCreateFilesInRangeClick(Sender: TObject);
  private
    { Private declarations }
    SelectedFileName: string;
    procedure ChangeBytesInFile(const FileName: string; BytePosition: Int64; NewWord: Word; NewWordText: string);
    procedure ReadBytesFromFile(const FileName: string; BytePosition: Int64; var WordValue: Word);
    procedure CreateFilesInRange(const FileName: string; StartID, EndID: Word);
    procedure ReadBytesFromFileToEdits(const FileName: string; StartBytePosition: Int64);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CreateFilesInRange(const FileName: string; StartID, EndID: Word);
var
  i: Word;
  NewWordText: string;
begin
  for i := StartID to EndID do
  begin
    NewWordText := IntToStr(i);
    while Length(NewWordText) < 3 do
      NewWordText := '0' + NewWordText;

    ChangeBytesInFile(FileName, BytePosition, i, NewWordText);
  end;
end;

procedure TForm1.btnCreateFilesInRangeClick(Sender: TObject);
var
  StartID, EndID: Integer;
begin
  if SelectedFileName = '' then
  begin
    ShowMessage('����������, ������� �������� ����.');
    Exit;
  end;

  if not TryStrToInt(edtStartID.Text, StartID) or (StartID < 0) or (StartID > 65535) then
  begin
    ShowMessage('�������� �������� ���������� ID. ������ ���� �� 0 �� 65535.');
    Exit;
  end;

  if not TryStrToInt(edtEndID.Text, EndID) or (EndID < 0) or (EndID > 65535) then
  begin
    ShowMessage('�������� �������� ��������� ID. ������ ���� �� 0 �� 65535.');
    Exit;
  end;

  if StartID > EndID then
  begin
    ShowMessage('��������� ID �� ����� ���� ������ ��������� ID.');
    Exit;
  end;

  CreateFilesInRange(SelectedFileName, Word(StartID), Word(EndID));
  ShowMessage('����� ������� �������.');

end;

procedure TForm1.btnSelectFileClick(Sender: TObject);
var
  ReadWord: Word;
begin
  if OpenDialog.Execute then
  begin
    SelectedFileName := OpenDialog.FileName;
    lblSelectedFile.Caption := '��������� ����: ' + SelectedFileName;
    ReadBytesFromFile(SelectedFileName, BytePosition, ReadWord);
    edtNewByte.Text := IntToStr(ReadWord);
    ReadBytesFromFileToEdits(SelectedFileName, BytePositionSwitchPower);
  end;
end;

procedure TForm1.btnChangeByteClick(Sender: TObject);
var
  NewWordInt: Integer;
  NewWord: Word;
  NewWordText: string;
  FileStream: TFileStream;
  ByteValue: Byte;
  i: Integer;
  SpinEditControls: array[1..20] of TSpinEdit;
begin
  if SelectedFileName = '' then
  begin
    ShowMessage('����������, ������� �������� ����.');
    Exit;
  end;

  NewWordText := edtNewByte.Text;
  while Length(NewWordText) < 3 do
    NewWordText := '0' + NewWordText;

  if not TryStrToInt(NewWordText, NewWordInt) or (NewWordInt < 0) or (NewWordInt > 65535) then
  begin
    ShowMessage('�������� ��������. ������ ���� �� 0 �� 65535.');
    Exit;
  end;

  NewWord := Word(NewWordInt);
  ChangeBytesInFile(SelectedFileName, BytePosition, NewWord, NewWordText);
  //
  for i := 1 to 20 do
    SpinEditControls[i] := TSpinEdit(FindComponent('SpinEdit' + IntToStr(i)));

  FileStream := TFileStream.Create(SelectedFileName, fmOpenReadWrite);
  try
    for i := 0 to 19 do
    begin
      ByteValue := StrToIntDef(SpinEditControls[i + 1].Text, 0);
      FileStream.Seek(BytePositionSwitchPower + i, soBeginning);
      FileStream.WriteBuffer(ByteValue, SizeOf(ByteValue));
    end;
  finally
    FileStream.Free;
  end;
  //
  ShowMessage('ID ������� �������.');
end;

procedure TForm1.ChangeBytesInFile(const FileName: string; BytePosition: Int64; NewWord: Word; NewWordText: string);
var
  UnderscoreIndex, i: Integer;
  FileStream, NewFileStream: TFileStream;
  BaseFileName, FileExt, NewFileName, BeforeNumber, AfterNumber: string;
  Buffer: TBytes;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    SetLength(Buffer, FileStream.Size);
    FileStream.ReadBuffer(Buffer[0], FileStream.Size);
  finally
    FileStream.Free;
  end;
  Move(NewWord, Buffer[BytePosition], SizeOf(NewWord));
  BaseFileName := ChangeFileExt(ExtractFileName(FileName), '');
  FileExt := ExtractFileExt(FileName);
  BeforeNumber := Copy(BaseFileName, 1, LastDelimiter('_', BaseFileName));
  AfterNumber := Copy(BaseFileName, LastDelimiter('_', BaseFileName) + 4, Length(BaseFileName));
  NewFileName := ExtractFilePath(FileName) + BeforeNumber + NewWordText + AfterNumber + FileExt;
  NewFileStream := TFileStream.Create(NewFileName, fmCreate);
  try
    NewFileStream.WriteBuffer(Buffer[0], Length(Buffer));
  finally
    NewFileStream.Free;
  end;
end;

procedure TForm1.edtNewByteChange(Sender: TObject);
begin
  if Length(edtNewByte.Text) > 3 then
    edtNewByte.Text := Copy(edtNewByte.Text, 1, 3);
end;

procedure TForm1.edtNewByteKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9']) then
    Key := #0;
end;

procedure TForm1.ReadBytesFromFile(const FileName: string; BytePosition: Int64; var WordValue: Word);
var
  FileStream: TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    FileStream.Seek(BytePosition, soBeginning);
    FileStream.ReadBuffer(WordValue, SizeOf(WordValue));
  finally
    FileStream.Free;
  end;
end;

procedure TForm1.ReadBytesFromFileToEdits(const FileName: string; StartBytePosition: Int64);
var
  FileStream: TFileStream;
  i: Integer;
  ByteValue: Byte;
  SpinEditControls: array[1..20] of TSpinEdit;
begin
  for i := 1 to 20 do
    SpinEditControls[i] := TSpinEdit(FindComponent('SpinEdit' + IntToStr(i)));

  FileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    for i := 0 to 19 do
    begin
      FileStream.Seek(StartBytePosition + i, soBeginning);
      FileStream.ReadBuffer(ByteValue, SizeOf(ByteValue));
      SpinEditControls[i + 1].Text := IntToStr(ByteValue);
    end;
  finally
    FileStream.Free;
  end;
end;

end.

