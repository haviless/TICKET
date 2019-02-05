// Inicio Uso Estándares: 01/08/2011
// Unidad               : U_Ingreso
// Formulario           : fIngreso
// Fecha de Creación    :
// Autor                : Ricardo Medina
// Objetivo             : Ingreso a la VENTANILLA
// Actualizaciones      :
// HPC_201802_TICKET    : Implementación de fase 2 (Controlar Sistemas de Atención)
// HPC_201803_TICKET    : Se adiciona opcion de tutor en video y evaluación

//Inicio   HPC_201801_TICKET
unit U_Ingreso;

interface

uses     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcImager, fcButton, fcImgBtn, fcShapeBtn, StdCtrls, ExtCtrls,
//Inicio   HPC_201803_TICKET
//Se adiciona opcion de tutor en video y evaluación virtual
 fcLabel, jpeg,shellapi,MPlayer;
//Fin   HPC_201803_TICKET

type
  TfIngreso = class(TForm)
    fcLabel1: TfcLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Eusuario: TEdit;
    Epass: TEdit;
    BtnIngresa: TfcShapeBtn;
    fcImager1: TfcImager;
    Label3: TLabel;
    lblEquipo: TLabel;
    fcShapeBtn1: TfcShapeBtn;
    EDTOPERACION: TEdit;
    chkOperacion: TCheckBox;
    lbloperacion: TLabel;
    Label4: TLabel;
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
    lblVersionProd: TLabel;
    lblVersion: TLabel;
// Fin HPC_201802_TICKET
//Inicio   HPC_201803_TICKET
//Se adiciona opcion de tutor en video y evaluación virtual
    btnTutor: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
//Fin   HPC_201803_TICKET
    procedure FormCreate(Sender: TObject);
    procedure BtnIngresaClick(Sender: TObject);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EpassExit(Sender: TObject);
    procedure chkOperacionClick(Sender: TObject);
    procedure EDTOPERACIONExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
//Inicio   HPC_201803_TICKET
//Se adiciona opcion de tutor en video y evaluación virtual
    procedure btnTutorClick(Sender: TObject);
    procedure fcShapeBtn2Click(Sender: TObject);
//Fin   HPC_201803_TICKET
  private
    { Private declarations }
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
    Function VerificaVersion: Boolean;
// Fin HPC_201802_TICKET
  public
     function ComputerName: string;
    { Public declarations }
  end;

var
  fIngreso: TfIngreso;

implementation
//Inicio   HPC_201803_TICKET
//Se adiciona opcion de tutor en video y evaluación virtual
uses ASODM, U_VENTANILLA, U_EVALVENTANILLA;
//Fin   HPC_201803_TICKET

{$R *.dfm}



//Nombre de Computadora
function TfIngreso.ComputerName: string;
var
  Buffer: array[ 0..MAX_COMPUTERNAME_LENGTH ] of Char;
  MaxSize: dword;
begin
  MaxSize := SizeOf( Buffer );
  if not GetComputerName( @Buffer, MaxSize ) then
    raise Exception.Create( 'No puedo determinar el nombre de la máquina' );
  Result := StrPas( @Buffer );
end;


procedure TfIngreso.FormCreate(Sender: TObject);
begin
   dm1.xEquipo := ComputerName ;
   lblequipo.Caption    := dm1.xEquipo ;
   EDTOPERACION.Text    := Trim(Dm1.XOPERACION1);
   lbloperacion.Caption := Trim(Dm1.XOPERACION1);
end;

procedure TfIngreso.BtnIngresaClick(Sender: TObject);

begin
  DM1.CDSUSUARIO.Open;
  DM1.CDSUSUARIO.Filter := 'USERID = '''+trim(Eusuario.Text)+ ''' and PASSWORD = ''' +trim(Epass.Text)+''' ';
  DM1.CDSUSUARIO.Filtered := True;
  if DM1.CDSUSUARIO.RecordCount =0 then
     begin
      MessageDlg('No Tiene Autorización Para Ingresar' , mtError , [ mbyes ] , 0 );
      DM1.CDSUSUARIO.Close;
      Exit;
     end;

  dm1.xUsuario     := Trim(Eusuario.Text);
  dm1.xOfdesid     := trim(dm1.CDSUSUARIO.fieldbyname('ORIGEN').AsString);
  dm1.xUserNom     := trim(dm1.CDSUSUARIO.fieldbyname('USERNOM').AsString);
  dm1.wNivelUsuari := trim(dm1.CDSUSUARIO.FieldByName('NVL_DGT').AsString);
  EDTOPERACIONExit(self);
  DM1.CDSUSUARIO.Close;
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
  If not VerificaVersion then exit;
// Fin HPC_201802_TICKET
  fIngreso.Hide;
  fVentanilla := TfVentanilla.Create(self);
  fVentanilla.ShowModal;
end;

procedure TfIngreso.fcShapeBtn1Click(Sender: TObject);
begin
Close;
end;

procedure TfIngreso.FormKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
  End;
end;

procedure TfIngreso.EpassExit(Sender: TObject);
begin
BtnIngresa.SetFocus;
end;

procedure TfIngreso.chkOperacionClick(Sender: TObject);
begin

 If chkOperacion.Checked = True Then
 Begin
   EDTOPERACION.Enabled := True;
   EDTOPERACION.Visible := True;
   lbloperacion.Visible := False;
 End
 Else
 Begin
   EDTOPERACION.Enabled := False;
   EDTOPERACION.Visible := False;
   lbloperacion.Visible := True;
 End;

end;

procedure TfIngreso.EDTOPERACIONExit(Sender: TObject);
var ini,x :Integer;
    XOERACION2 : String;
begin
   chkOperacion.Checked := False;
   lbloperacion.Caption := Trim(EDTOPERACION.Text);
   ini:=1;
   For x := 1 to Length(trim(EDTOPERACION.Text)) do
   Begin
     If copy(EDTOPERACION.Text,x,1)=',' Then
     Begin
       XOERACION2:=XOERACION2+''''+copy(EDTOPERACION.Text,ini,3)+''',';
       ini:=x+1;
     End;
   end;
   XOERACION2:=XOERACION2+''''+copy(EDTOPERACION.Text,ini,x-1)+'''';
   Dm1.xoperacion := Trim(XOERACION2);
end;

procedure TfIngreso.FormActivate(Sender: TObject);
begin
 dm1.CDSUSUARIO.Close;
 dm1.CDSUSUARIO.DataRequest('select USERID,USERNOM,AREA,ORIGEN,NIVEL,PASSWORD,USROPE,ACTIVO,USRMTO,USRREGL,IDDGT,NVL_DGT,ZONORIOPE from USERTABLE');
 dm1.CDSUSUARIO.Open;
end;
//Inicio   HPC_201803_TICKET
//Se adiciona opcion de tutor en video y evaluación virtual
procedure TfIngreso.btnTutorClick(Sender: TObject);
  const
  URL='http://appweb.derrama.org.pe:8080/DMVideo/';
begin

  DM1.CDSUSUARIO.Open;
  DM1.CDSUSUARIO.Filter := 'USERID = '''+trim(Eusuario.Text)+ ''' and PASSWORD = ''' +trim(Epass.Text)+''' ';
  DM1.CDSUSUARIO.Filtered := True;
  if DM1.CDSUSUARIO.RecordCount =0 then
  begin
    MessageDlg('No Tiene Autorización Para Ingresar' , mtError , [ mbyes ] , 0 );
    DM1.CDSUSUARIO.Close;
    Exit;
  end;
  dm1.xUsuario     := Trim(Eusuario.Text);
  dm1.xOfdesid     := trim(dm1.CDSUSUARIO.fieldbyname('ORIGEN').AsString);
  dm1.xUserNom     := trim(dm1.CDSUSUARIO.fieldbyname('USERNOM').AsString);
  dm1.wNivelUsuari := trim(dm1.CDSUSUARIO.FieldByName('NVL_DGT').AsString);
  EDTOPERACIONExit(self);
  DM1.CDSUSUARIO.Close;
  Try
     ShellExecute(Handle,'open',URL,nil,nil,SW_SHOWNORMAL)
  Except
     ShowMessage('Existe un error en la emisión del video de capacitación');
     exit;
  End;

end;

procedure TfIngreso.fcShapeBtn2Click(Sender: TObject);
begin
  DM1.CDSUSUARIO.Open;
  DM1.CDSUSUARIO.Filter := 'USERID = '''+trim(Eusuario.Text)+ ''' and PASSWORD = ''' +trim(Epass.Text)+''' ';
  DM1.CDSUSUARIO.Filtered := True;
  if DM1.CDSUSUARIO.RecordCount =0 then
  begin
    MessageDlg('No Tiene Autorización Para Ingresar' , mtError , [ mbyes ] , 0 );
    DM1.CDSUSUARIO.Close;
    Exit;
  end;
  dm1.xUsuario     := Trim(Eusuario.Text);
  dm1.xOfdesid     := trim(dm1.CDSUSUARIO.fieldbyname('ORIGEN').AsString);
  dm1.xUserNom     := trim(dm1.CDSUSUARIO.fieldbyname('USERNOM').AsString);
  dm1.wNivelUsuari := trim(dm1.CDSUSUARIO.FieldByName('NVL_DGT').AsString);
  EDTOPERACIONExit(self);
  DM1.CDSUSUARIO.Close;

  Try
      fCuestionario := TfCuestionario.create(self);
      fCuestionario.Showmodal;
  Finally
      fCuestionario.free;
  End;
end;
//Final   HPC_201803_TICKET


// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
Function TfIngreso.VerificaVersion: Boolean;
Var
   xSQL: String;
Begin
   Result := False;
   xSQL := 'Select VERSION from TGE600 Where CODIGO=''' + dm1.wModulo + '''';
   DM1.CDSQRY1.Close;
   DM1.CDSQRY1.DataRequest(xSQL);
   DM1.CDSQRY1.Open;
   If lblVersion.caption = DM1.CDSQRY1.FieldByName('VERSION').AsString Then
      Result := True
   Else
   Begin
      ShowMessage('Para poder continuar, es necesario que actualice la Versión');
      DM1.Socket1.Connected:=False;
      Application.Terminate;
      Result := False;
   End
End;
// Fin HPC_201802_TICKET
end.
//Final   HPC_201801_TICKET

