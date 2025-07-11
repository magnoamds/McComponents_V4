unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, uMcConnection, uMcMemTable, uMcCache,
  Vcl.ExtDlgs;

type
  TF_Main = class(TForm)
    Panel1: TPanel;
    dbgBase: TDBGrid;
    DataSource: TDataSource;
    btn_Open: TButton;
    DBNavigator1: TDBNavigator;
    edt_BaseUrl: TEdit;
    edt_Resource: TEdit;
    cbx_McCached: TCheckBox;
    btn_CancelCommit: TButton;
    btn_CommitUpd: TButton;
    McConnection: TMcConnection;
    McMemTable: TMcMemTable;
    McCache: TMcCache;
    DBImage: TDBImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    OpenPictureDialog: TOpenPictureDialog;
    cbx_Compression: TCheckBox;
    cbx_Binary: TCheckBox;
    lbl_Tempo: TLabel;
    btn_Close: TButton;
    procedure btn_OpenClick(Sender: TObject);
    procedure btn_CancelCommitClick(Sender: TObject);
    procedure btn_CommitUpdClick(Sender: TObject);
    procedure McConnectionBeforeConnect(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Main: TF_Main;

implementation

uses Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

{$R *.dfm}

procedure TF_Main.btn_CancelCommitClick(Sender: TObject);
begin
  if McMemTable.Cache.Active then
    McCache.Clear;
end;

procedure TF_Main.btn_CloseClick(Sender: TObject);
begin
  DataSource.DataSet.Active := False;
  lbl_Tempo.Caption := 'Tempo: 0 ms';
end;

procedure TF_Main.btn_CommitUpdClick(Sender: TObject);
begin
  if McMemTable.Cache.Active then
    if McCache.UpdatePending then
      if McCache.CommitUpdates then
        ShowMessage('Processado com sucesso.');
end;

procedure TF_Main.btn_OpenClick(Sender: TObject);
var
  lInicio, lFim: Cardinal;
  lTempo: Extended;
begin
  DBImage.DataField := '';

  McMemTable.Cache.Active := cbx_McCached.Checked;
  lInicio := GetTickCount;
  try
    DataSource.DataSet.Active := True;
  finally
    lFim := GetTickCount;
    lTempo := ((lFim - lInicio) / 1000);
    lbl_Tempo.Caption := Format('Tempo: %g ms', [lTempo]);
  end;

  if (DataSource.DataSet.FindField('photo') <> nil) then
    DBImage.DataField := 'photo';
end;

procedure TF_Main.McConnectionBeforeConnect(Sender: TObject);
begin
  McConnection.BaseURL := edt_BaseUrl.Text;
  McConnection.Resource := edt_Resource.Text;
  McConnection.Compression := cbx_Compression.Checked;
  McConnection.Binary := cbx_Binary.Checked;
end;

procedure TF_Main.SpeedButton1Click(Sender: TObject);
begin
  if DataSource.Dataset.State in dsEditModes then
    if OpenPictureDialog.Execute then
      DBImage.Picture.LoadFromFile(OpenPictureDialog.FileName);
end;

procedure TF_Main.SpeedButton2Click(Sender: TObject);
begin
  if DataSource.Dataset.State in dsEditModes then
    TBlobField(DataSource.Dataset.FieldByName(DBImage.DataField)).Clear;
end;

end.
