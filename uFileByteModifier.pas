unit uFileByteModifier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ComCtrls;

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
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    SpinEdit10: TSpinEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    CheckBoxActive: TCheckBox;
    Memo1: TMemo;
    procedure btnSelectFileClick(Sender: TObject);
    procedure btnChangeByteClick(Sender: TObject);
    procedure edtNewByteChange(Sender: TObject);
    procedure edtNewByteKeyPress(Sender: TObject; var Key: Char);
    procedure btnCreateFilesInRangeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxActiveClick(Sender: TObject);
  private
    { Private declarations }
    SelectedFileName: string;
    procedure ChangeBytesInFile(const FileName: string; BytePosition: Int64; NewWord: Word; NewWordText: string);
    procedure ReadBytesFromFile(const FileName: string; BytePosition: Int64; var WordValue: Word);
    procedure CreateFilesInRange(const FileName: string; StartID, EndID: Word);
    procedure ReadBytesFromFileToEdits(const FileName: string; StartBytePosition: Int64);
    procedure CheckBoxClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CheckBoxControls: array[1..10] of TCheckBox;
  SpinEditControls: array[1..10] of TSpinEdit;

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
  LogMessage: String;
begin
  if SelectedFileName = '' then
  begin
    ShowMessage('Пожалуйста, сначала выберите файл.');
    Exit;
  end;

  if not TryStrToInt(edtStartID.Text, StartID) or (StartID < 0) or (StartID > 65535) then
  begin
    ShowMessage('Неверное значение начального ID. Должно быть от 0 до 65535.');
    Exit;
  end;

  if not TryStrToInt(edtEndID.Text, EndID) or (EndID < 0) or (EndID > 65535) then
  begin
    ShowMessage('Неверное значение конечного ID. Должно быть от 0 до 65535.');
    Exit;
  end;

  if StartID > EndID then
  begin
    ShowMessage('Начальный ID не может быть больше конечного ID.');
    Exit;
  end;

  CreateFilesInRange(SelectedFileName, Word(StartID), Word(EndID));
end;

procedure TForm1.btnSelectFileClick(Sender: TObject);
var
  ReadWord: Word;
begin
  if OpenDialog.Execute then
  begin
    SelectedFileName := OpenDialog.FileName;
    lblSelectedFile.Caption := 'Выбранный файл: ' + SelectedFileName;
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
begin
  if SelectedFileName = '' then
  begin
    ShowMessage('Пожалуйста, сначала выберите файл.');
    Exit;
  end;

  NewWordText := edtNewByte.Text;
  while Length(NewWordText) < 3 do
    NewWordText := '0' + NewWordText;

  if not TryStrToInt(NewWordText, NewWordInt) or (NewWordInt < 0) or (NewWordInt > 65535) then
  begin
    ShowMessage('Неверное значение. Должно быть от 0 до 65535.');
    Exit;
  end;

  NewWord := Word(NewWordInt);
  ChangeBytesInFile(SelectedFileName, BytePosition, NewWord, NewWordText);
end;

procedure TForm1.ChangeBytesInFile(const FileName: string; BytePosition: Int64; NewWord: Word; NewWordText: string);
var
  i: Integer;
  FileStream, NewFileStream: TFileStream;
  BaseFileName, FileExt, NewFileName, BeforeNumber, AfterNumber: string;
  Buffer: TBytes;
  ByteValue: Byte;
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

  if CheckBoxActive.Checked then
    NewFileName := ExtractFilePath(FileName) + BeforeNumber + NewWordText + '+' + AfterNumber + FileExt
  else
    NewFileName := ExtractFilePath(FileName) + BeforeNumber + NewWordText + AfterNumber + FileExt;

  NewFileStream := TFileStream.Create(NewFileName, fmCreate);

  try
    NewFileStream.WriteBuffer(Buffer[0], Length(Buffer));

    for i := 1 to 10 do
    begin
      if CheckBoxControls[i].Checked then
        ByteValue := 1
      else
        ByteValue := 0;

      NewFileStream.Seek(BytePositionSwitchPower + 2 * (i - 1), soBeginning);
      NewFileStream.WriteBuffer(ByteValue, SizeOf(ByteValue));

      if (SpinEditControls[i].Value < 0) or (SpinEditControls[i].Value > 255) then
        ByteValue := 0
      else
        ByteValue := Byte(SpinEditControls[i].Value);

      NewFileStream.Seek(BytePositionSwitchPower + 2 * (i - 1) + 1, soBeginning);
      NewFileStream.WriteBuffer(ByteValue, SizeOf(ByteValue));
    end;
    Memo1.Lines.Add(Format('Файл: %s | Новый ID: %s | Статус: Успешно', [NewFileName, NewWordText]));
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
  if not CharInSet(Key, ['0'..'9']) then
  begin
    Key := #0;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:Integer;
begin
  for i := 1 to 10 do
  begin
    CheckBoxControls[i] := TCheckBox(FindComponent('CheckBox' + IntToStr(i)));
    CheckBoxControls[i].OnClick := CheckBoxClick;
    CheckBoxControls[i].Caption := 'Выкл.';
    SpinEditControls[i] := TSpinEdit(FindComponent('SpinEdit' + IntToStr(i)));
  end;
  CheckBoxActive.OnClick(self);
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
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    for i := 1 to 20 do
    begin
      FileStream.Seek(StartBytePosition + (i - 1), soBeginning);
      FileStream.ReadBuffer(ByteValue, SizeOf(ByteValue));

      if (i mod 2) = 1 then
      begin
        // Нечетные CheckBox
        if ByteValue = 0 then
          CheckBoxControls[(i div 2) + 1].Checked := False
        else if ByteValue = 1 then
          CheckBoxControls[(i div 2) + 1].Checked := True
      end
      else
      begin
        // Четные SpinEdit
        SpinEditControls[i div 2].Value := ByteValue;
      end;
    end;
  finally
    FileStream.Free;
  end;
end;

procedure TForm1.CheckBoxActiveClick(Sender: TObject);
var
  i: Integer;
begin
 if CheckBoxActive.Checked then  CheckBoxActive.Caption:='Включено'
  else CheckBoxActive.Caption:='Выключено';

  for i := 1 to 10 do
  begin
    CheckBoxControls[i].Enabled := CheckBoxActive.Checked;
    SpinEditControls[i].Enabled := CheckBoxActive.Checked;
  end;

end;

procedure TForm1.CheckBoxClick(Sender: TObject);
var
  CheckBox: TCheckBox;
begin
  CheckBox := TCheckBox(Sender);
  if CheckBox.Checked then
    CheckBox.Caption := 'Вкл.'
  else
    CheckBox.Caption := 'Выкл.';
end;




end.
