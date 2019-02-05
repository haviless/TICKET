// Inicio Uso Estándares: 01/08/2011
// Unidad               : ASODM
// Formulario           : DM1
// Fecha de Creación    :
// Autor                : Ricardo Medina
// Objetivo             : Llamado de Tickets
// Actualizaciones      :
// HPC_201802_TICKET    : Implementación de fase 2 (Controlar Sistemas de Atención)
// HPC_201803_TICKET    :Se adiciona opcion de tutor en video y evaluación virtual

//Inicio   HPC_201801_TICKET
unit ASODM;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect,IniFiles,
  Windows, Messages,Graphics, Controls, Forms, Dialogs,Wwdatsrc, wwclient,RecError,variants, DBTables,Wwquery, FileCtrl,
  ObjBrkr,Math, wwdbedit, DBGrids,Excel2000, OleServer,DateUtils, Sockets,
//Inicio   HPC_201803_TICKET
//Se adiciona opcion de tutor en video y evaluación virtual
  SConnect, ExcelXP;
//Final   HPC_201803_TICKET

type
  TDM1 = class(TDataModule)
    CDSQRY1: TClientDataSet;
    DSQRY1: TDataSource;
    CDSQRY2: TClientDataSet;
    DSQRY2: TDataSource;
    CDSQRY3: TClientDataSet;
    DSQRY3: TDataSource;
    CDSPANTALLA: TClientDataSet;
    DSPANTALLA: TDataSource;
    CDSQRYDISPENSA: TClientDataSet;
    DSDISPENSA: TDataSource;
    CDSUSUARIO: TClientDataSet;
    DSUSUARIO: TDataSource;
    CDSRUTA: TClientDataSet;
    DSRUTA: TDataSource;
    CDSFINALIZA: TClientDataSet;
    DSFINALIZA: TDataSource;
    CDSRESAGADOS: TClientDataSet;
    DSRESAGADOS: TDataSource;
    TcpClient1: TTcpClient;
    CDSESPERA: TClientDataSet;
    DSESPERA: TDataSource;
    Socket1: TSocketConnection;
    dsOperaciones: TDataSource;
    cdsOperaciones: TClientDataSet;
    CDSQRY4: TClientDataSet;
    DSQRY4: TDataSource;
//Inicio   HPC_201803_TICKET
//Se adiciona opcion de tutor en video y evaluación virtual
    ExcelApp: TExcelApplication;
    ExcelBook: TExcelWorkbook;
    WS: TExcelWorksheet;
//Final   HPC_201803_TICKET
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
//Inicio   HPC_201803_TICKET
//Se adiciona opcion de tutor en video y evaluación virtual
    FormatCel: Array Of OleVariant;
//Final HPC_201803
  public
   wSRV:string;
   xEquipo,xUsuario,xOfdesid,xUserNom,wNivelUsuari,xventanilla,xoperacion,Xcodip,xoperllama:string;
   XOPERACION1:string;
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
   wModulo:String;
// Fin HPC_201802_TICKET
    { Public declarations }
    function FechaSys(): tDateTime;
    function HoraSys: String;
    function FechasOutPut(xFInput : tDateTime): tDateTime;
    function xminuto(yhora:string):integer;
    function xhora(hora1:integer; hora2:integer):string;
    function xhora2(Segundo1:integer; Segundo2:integer):string;
    function xsegundo(yhora:string):integer;
    function StrZero(wNumero:String;wLargo:Integer):string;
//Inicio   HPC_201803_TICKET
//Se adiciona opcion de tutor en video y evaluación virtual
    Procedure HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
    Procedure FormatosCeldas(N: Integer; TDs: TDataSource);
//Final   HPC_201803_TICKET
  end;

var
  DM1: TDM1;

implementation

{$R *.dfm}

procedure TDM1.DataModuleCreate(Sender: TObject);
var
 inifile : TIniFile;
 X,ini : integer;
 XOERACION2 :String;
begin

  Socket1.Connected:=False;
  if ParamStr(1)='' then
   begin
     inifile:=TIniFile.Create('C:\SOLExes\TicketsConf.ini');
     Socket1.Address:=IniFile.ReadString('TCPIP','ADDRESS','');
     wSRV:=IniFile.ReadString('MOTOR','NAME','');
     xventanilla:=IniFile.ReadString('VENTANILLA','NUMERO','') ;
     xoperacion:=IniFile.ReadString('OPERACION','NAME','') ;
     XOPERACION1:=IniFile.ReadString('OPERACION','NAME','') ;
     xoperllama:=IniFile.ReadString('OPERLLAMA','NAME','') ; //SE UTILIZA CUANDO SE QUIERE LLAMAR UNA OPERACION EN LA PANTALLA DE OTRA OPERACION[OPERACION]

     ini:=1;
     For x := 1 to Length(trim(xoperacion)) do
     Begin
        If copy(xoperacion,x,1)=',' Then
        Begin
          XOERACION2:=XOERACION2+''''+copy(xoperacion,ini,3)+''',';
          ini:=x+1;
        End;
     end;
     XOERACION2:=XOERACION2+''''+copy(xoperacion,ini,x-1)+'''';
     xoperacion:=XOERACION2;
   end;

  TRY
     Socket1.Connected:=True;
     Xcodip:=TcpClient1.LocalHostAddr;
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
     wModulo:='TICKET';
// Fin HPC_201802_TICKET
  EXCEPT
     // por no realizar la conexion
     SHOWMESSAGE( 'ERROR de Conexión.');
     Exit;
  END;

end;



function TDM1.FechasOutPut(xFInput: tDateTime): tDateTime;
begin
   Result:=StrToDate(Copy(DateToStr(xFInput),1,10));
end;



//Fecha del Sistema
function TDM1.FechaSys: tDateTime;
var
   FormatoFecha: PChar;
begin
FormatoFecha:='dd/MM/yyyy';
SetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SSHORTDATE,FormatoFecha);
CDSQRY1.Close;
CDSQRY1.DataRequest('SELECT /*+ RULE */TO_CHAR(SYSDATE,''dd/mm/yyyy'') AS FECHA FROM DUAL');
CDSQRY1.Open;
If CDSQRY1.RecordCount > 0 Then
   Result:=FechasOutPut(CDSQRY1.fieldbyname('FECHA').AsDateTime)
Else Result:=FechasOutPut(Date);

CDSQRY1.Close;
End;


//Hora del Sistema
//Inicio   HPC_201803_TICKET
//Se adiciona opcion de tutor en video y evaluación virtual
procedure TDM1.FormatosCeldas(N: Integer; TDs: TDataSource);
Var
   I: Integer;
   F: TFieldDef;
Begin
   For I := 1 To N Do
   Begin
      F := TDs.DataSet.FieldDefs.Items[I - 1];
      Case F.DataType Of
         ftString: FormatCel[I] := DM1.StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
         ftDate: FormatCel[I] := 'dd/mm/yyyy';
         ftDateTime: FormatCel[I] := 'dd/mm/yyyy';
         ftTimeStamp: FormatCel[I] := 'dd/mm/yyyy';
         ftUnknown: FormatCel[I] := DM1.StrZero('0', Length(TDs.DataSet.Fields[I - 1].AsString));
      Else
         FormatCel[I] := Null;
      End;
   End;
end;

procedure TDM1.HojaExcel(Tit: String; TDs: TDataSource; TDb: TDBGrid);
Var
   Lcid, C, CH, CH1, I, W, X, Y, TotHoja: Integer;
   Bk: TBookmarkStr;
   Tabla: Variant;
   L, A: OleVariant;
   HH: Extended;
Begin
   If Not TDs.DataSet.Active Then Exit;
   If TDs.DataSet.RecordCount = 0 Then Exit;

   Lcid := GetUserDefaultLCID;
   C := TDb.Columns.Count;
   CH := 1;
   If TDs.DataSet.RecordCount > 15100 Then
   Begin
      HH := TDs.DataSet.RecordCount / 15100;
      CH := Trunc(HH);
      If Frac(HH) > 0 Then CH := CH + 1;
   End;

   ExcelApp.Visible[Lcid] := True;
   ExcelApp.Caption := 'Consultas en EXCEL';
   ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(1, Lcid));
   If CH > 1 Then
   Begin
      ExcelBook.Worksheets.Add(NULL, NULL, (CH - 1), NULL, Lcid);
      For I := 1 To CH Do
      Begin
         WS.ConnectTo(ExcelBook.Worksheets[I] As _Worksheet);
         WS.Name := Tit + '_' + IntToStr(I);
      End;
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);
   If CH = 1 Then WS.Name := Tit;
   ExcelApp.ScreenUpdating[Lcid] := False;
   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);
      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         WS.Range[L, L].Value2 := TDb.Columns[I].Title.Caption;
      End;
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);

   CH1 := 1;
   W := 2;
   I := 1;
   Y := 1;
   TotHoja := 0;
   TDs.DataSet.DisableControls;
   Bk := TDs.DataSet.Bookmark;

   Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
   TDs.DataSet.First;
   While Not TDs.DataSet.Eof Do
   Begin
      For X := 0 To (C - 1) Do
         Tabla[Y, X] := TDs.DataSet.Fields[X].AsString;
      If Y = 5000 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I + 1, C]].Value2 := Tabla;
         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;

         Y := 0;
         W := I + 2;
      End;
      Inc(Y, 1);
      Inc(I, 1);
      Inc(TotHoja, 1);
      If TotHoja = 15100 Then
      Begin
         L := 'A' + IntToStr(W);
         WS.Range[L, WS.Cells.Item[I, C]].Value2 := Tabla;

         Try
            Tabla := Unassigned;
         Finally
            Tabla := VarArrayCreate([1, 5000, 0, C], varVariant);
         End;

         CH1 := CH1 + 1;
         WS.ConnectTo(ExcelBook.Worksheets[CH1] As _Worksheet);
         WS.Activate(Lcid);

         Y := 1;
         W := 2;
         I := 1;
         TotHoja := 0;
      End;
      Application.ProcessMessages;
      TDs.DataSet.Next;
   End;
   CH1 := I;
   Try
      WS.Range['A' + IntToStr(W), WS.Cells.Item[CH1, C]].Value2 := Tabla;
   Finally
      Tabla := Unassigned;
   End;

   For X := 1 To CH Do
   Begin
      WS.ConnectTo(ExcelBook.Worksheets[X] As _Worksheet);
      WS.Activate(Lcid);

      SetLength(FormatCel, C + 1);
      FormatosCeldas(C, TDs);
      For I := 1 To C Do
      Begin
         L := WS.Cells.Item[1, I];
         WS.Range[L, L].EntireColumn.NumberFormat := FormatCel[I];
      End;

      For I := 0 To (C - 1) Do
      Begin
         L := WS.Cells.Item[1, I + 1];
         Y := TDs.DataSet.Fields[I].DisplayWidth;
         If Length(TDb.Columns[I].Title.Caption) > Y Then
            Y := Length(TDb.Columns[I].Title.Caption);
         WS.Range[L, L].EntireColumn.ColumnWidth := Y + 2;
         If TDb.Columns[I].Alignment = taLeftJustify Then A := 2;
         If TDb.Columns[I].Alignment = taCenter Then A := 3;
         If TDb.Columns[I].Alignment = taRightJustify Then A := 4;
         WS.Range[L, L].EntireColumn.HorizontalAlignment := A;
      End;

      L := WS.Cells.Item[1, C];
      WS.Range['A1', L].HorizontalAlignment := 3;
      WS.Range['A1', L].Interior.Color := clMaroon;
      WS.Range['A1', L].Font.Color := clWhite;
      WS.Range['A1', L].Font.Bold := True;

      If CH = 1 Then
         W := TDs.DataSet.RecordCount + 1
      Else
         If (CH > 1) And (X < CH) Then
            W := 15101
         Else
            If (CH > 1) And (X = CH) Then W := CH1;

      WS.PageSetup.PrintGridlines := True;
      WS.PageSetup.PrintTitleRows := '1:1';

      WS.DefaultInterface.Set_DisplayAutomaticPageBreaks(Lcid, True);
   End;

   WS.ConnectTo(ExcelBook.Worksheets[1] As _Worksheet);
   WS.Activate(Lcid);

   ExcelApp.ScreenUpdating[Lcid] := True;

   TDs.DataSet.EnableControls;
   TDs.DataSet.Bookmark := Bk;
end;
//Fin   HPC_201803_TICKET

function TDM1.HoraSys: String;
begin
CDSQRY1.Close;
CDSQRY1.DataRequest('SELECT /*+ RULE */ TO_CHAR(SYSDATE,''HH24:MI:SS'') AS HORA FROM DUAL');
CDSQRY1.Open;
If CDSQRY1.RecordCount > 0 Then
    Result:=CDSQRY1.fieldbyname('HORA').AsString
Else
    Result:='';
CDSQRY1.Close;

end;


//Covierte los minutos en horas y saca la diferencia entre dos horas
function TDM1.StrZero(wNumero: String; wLargo: Integer): string;
var
  i : integer;
  s, xTemp : string;
begin
  s := '';
  for i:=1 to wLargo do
  	s := s+'0';
  s := s+trim(wNumero);
  xTemp := copy(s,length(s)-(wLargo-1),wLargo);
	result := xTemp;
end;

function TDM1.xhora(hora1, hora2: integer): string;
  var rhora,rminu,Lrh,Lrm :integer;
      rh,rm,xhor,xmin :string;

   begin
    rhora := (hora1-hora2) div 60;
    rminu := (hora1-hora2) mod 60;
    str(rhora,rh);
    str(rminu,rm);

    Lrh:=Length(trim(rh));
    Lrm:=Length(trim(rm));

    if Lrh=1 then
       xhor:='0'+rh
    else
       xhor:=rh;
    //endif

    if Lrm=1  then
       xmin:='0'+rm
    else
       xmin:=rm;
   //endif

    result:=xhor+':'+xmin

end;


//Convierte los segundos en horas y resta
function TDM1.xhora2(Segundo1, Segundo2: integer): string;
  var rhora,rminu,rsegundos :integer;
      rh,rm,rs :string;

    Begin
      rhora     := (Segundo1-Segundo2)  div 3600;
      rminu     := ((Segundo1-Segundo2) mod 3600) div 60;
      rsegundos := (Segundo1-Segundo2)  mod 60 ;

      str(rhora,rh);
      str(rminu,rm);
      str(rsegundos,rs);

      Result := StrZero(rh,2)+':'+StrZero(rm,2)+':'+StrZero(rs,2);
    End;


//Convierte las horas en minutos
function TDM1.xminuto(yhora: string): integer;
var y1,y2,code :integer;
begin
  val(copy(yhora,1,2),y1,code);
  val(copy(yhora,4,2),y2,code);
  result:= (y1*60)+y2;
end;

//Convierte la horas en segundos
function TDM1.xsegundo(yhora: string): integer;
var y1,y2,y3,code :integer;
begin
  val(copy(yhora,1,2),y1,code);
  val(copy(yhora,4,2),y2,code);
  val(copy(yhora,7,2),y3,code);

  result:= (y1*3600)+(y2*60)+y3;

end;

end.
//Final   HPC_201801_TICKET
