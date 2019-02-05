// Inicio Uso Estándares: 01/08/2011
// Unidad               : U_VENTANILLA
// Formulario           : fVentanilla
// Fecha de Creación    :
// Autor                : Ricardo Medina
// Objetivo             : Llamado de Tickets
// Actualizaciones      :
// HPC_201802_TICKET    : Implementación de fase 2 (Controlar Sistemas de Atención)

//Inicio   HPC_201801_TICKET
unit U_VENTANILLA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, wwdbedit, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc, Wwtable, Wwquery,Variants, wwdblook, DBClient,
  Buttons, AppEvnts, Wwdbspin, wwclearbuttongroup, wwradiogroup, ComCtrls,
  wwriched, jpeg;

type
  TfVentanilla = class(TForm)
    ControlBar1: TControlBar;
    lblOperacion: TLabel;
    lblUsuario: TLabel;
    CDSRESAGADOS: TClientDataSet;
    DSRESAGADOS: TDataSource;
    Shape1: TShape;
    Label2: TLabel;
    dbgResagados: TwwDBGrid;
    pnlRESAGADOS: TPanel;
    BitBtn1: TBitBtn;
    Button1: TButton;
    pnlFINALIZA: TPanel;
    Shape2: TShape;
    Label3: TLabel;
    DBLFINALIZA: TwwDBLookupCombo;
    BTNACEPTA: TButton;
    edtFinaliza: TEdit;
    BitBtn2: TBitBtn;
    Shape3: TShape;
    Label4: TLabel;
    pnlEspera: TPanel;
    BitBtn3: TBitBtn;
    DBLESPERA: TwwDBLookupCombo;
    BTNESPERA: TButton;
    Shape4: TShape;
    Label5: TLabel;
    pnlOperaciones: TPanel;
    Shape5: TShape;
    Label6: TLabel;
    dbgOperaciones: TwwDBGrid;
    BitBtn4: TBitBtn;
    btnBorrarOpe: TButton;
    btnIrOpe: TButton;
    btnSalirOpe: TButton;
    edtOperaciones: TEdit;
    pnlEncuesta: TPanel;
    Shape6: TShape;
    Label7: TLabel;
    Label8: TLabel;
    imgEncuesta: TImage;
    edtEncuesta: TEdit;
    principal: TGroupBox;
    gbFINALIZA: TGroupBox;
    DBLRUTA: TwwDBLookupCombo;
    MANDAR: TButton;
    SOLTAR: TButton;
    RESAGADOS: TBitBtn;
    btnColas: TButton;
    GroupBox2: TGroupBox;
    lbltickets: TLabel;
    dbgDispensa: TwwDBGrid;
    ENESPERA: TButton;
    GroupBox3: TGroupBox;
    lblTimer: TLabel;
    btnNSP: TButton;
    GroupBox1: TGroupBox;
    edtAsoid: TEdit;
    edtDNI: TEdit;
    edtNombres: TEdit;
    LLAMA: TButton;
    ATENDER: TButton;
    RELLAMA: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    SEMAFORO: TShape;
    edtVentanilla: TEdit;
    Timer1: TTimer;
    Timer2: TTimer;

    procedure LLAMAClick(Sender: TObject);
    procedure ATENDERClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RELLAMAClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SOLTARClick(Sender: TObject);
    procedure DBLRUTAChange(Sender: TObject);
    procedure DBLRUTAExit(Sender: TObject);
    procedure MANDARClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ENESPERAClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RESAGADOSClick(Sender: TObject);
    procedure dbgResagadosDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure BTNACEPTAClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBLFINALIZAExit(Sender: TObject);
    procedure DBLFINALIZAChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BTNESPERAClick(Sender: TObject);
    procedure dbgResagadosDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure btnColasClick(Sender: TObject);
    procedure dbgOperacionesDblClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnBorrarOpeClick(Sender: TObject);
    procedure btnIrOpeClick(Sender: TObject);
    procedure btnNSPClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure edtEncuestaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Ticks: Integer;
    HoraInicial: TDateTime;
    sOperacionG,sOperacion,sAsoidG,vGenSolCre,vAprSolCre : string;
    Procedure limpiaCronometro();
    Procedure inicializaColas();
    Procedure recuperaTieEvaCre();
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
    Procedure DesacIniAteMod();
    Function ConsultaAtencion(): boolean;
// Fin HPC_201802_TICKET

  public
      XSIGUIENTE,XFECHA,XHORA,XNOMBRES,XLLAMA,XOPERA: STRING;
      gbFINALIZAant:boolean;
      Function numTick():boolean;
      Function FechaSys(): tDateTime;
      Function HoraSys: String;
      Function FechasOutPut(xFInput : tDateTime): tDateTime;
      Function xminuto(yhora:string):integer;
      Function xhora1(hora1:integer; hora2:integer):string;
      Function xhora2(Segundo1:integer; Segundo2:integer):string;
      Function xsegundo(yhora:string):integer;
      Function StrZero(wNumero:String;wLargo:Integer):string;
      Procedure BloqueoPantalla();
      Procedure BloqueoTickets();
    { Public declarations }
  end;

var
  fVentanilla: TfVentanilla;

implementation

uses ASODM, U_Ingreso,StrUtils;

{$R *.DFM}

procedure TfVentanilla.LLAMAClick(Sender: TObject);
VAR XSQL:STRING;
    I,XS:integer;

 {A=ATENDIDO
  R=RESAGADO
  L=LLAMANDO
  N=SIN ATENDER}
begin
  //Para que no se disparen dos a la vez
  XS:=DM1.xsegundo(FormatDateTime('HH:MM',NOW))+StrToInt(FormatDateTime('SS',NOW));
  I:=0;
  While  I <(StrToInt(DM1.xventanilla)*75*XS) DO
     Begin
       I:=I+1;
     End;

  //NUMERO DE TICKET,SI NO EXITE DOCENTES RETORNA FALSE
  If not Numtick() then exit;

  //MUESTRA EL NOMBRE DEL ASOCIADO LLAMADO
  edtNombres.Enabled := False;
  edtNombres.Text := XNOMBRES;

 DM1.CDSPANTALLA.Close;
 DM1.CDSPANTALLA.DataRequest('SELECT TICKETS,VENTANILLA,T1,V1,R1,T2,V2,R2,T3,V3,R3,ULTIMO,A,B,C,D,E,OFICINA,OPERACION,T4,V4,R4 FROM ASO_TICKETS_PANTALLA WHERE OFICINA='''+DM1.xOfdesid+''' AND OPERACION='''+XLLAMA+''' ');
 DM1.CDSPANTALLA.Open;



  //AVANZA LA COLA,  LLAMA NUEVO CLIENTE  Y ACTUALIZA EN EL ARCHIVO DE LA PANTALLA
  XSQL := 'UPDATE ASO_TICKETS_PANTALLA SET '+
                              'T4='''+DM1.CDSPANTALLA.FieldByname('T3').AsString+''','+
                              'V4='''+DM1.CDSPANTALLA.FieldByname('V3').AsString+''','+
                              'T3='''+DM1.CDSPANTALLA.FieldByname('T2').AsString+''','+
                              'V3='''+DM1.CDSPANTALLA.FieldByname('V2').AsString+''','+
                              'T2='''+DM1.CDSPANTALLA.FieldByname('T1').AsString+''','+
                              'V2='''+DM1.CDSPANTALLA.FieldByname('V1').AsString+''','+
                              'T1='''+XSIGUIENTE+''','+
                              'V1='''+DM1.xventanilla+''' WHERE OFICINA='''+DM1.xOfdesid+''' AND OPERACION='''+XLLAMA+''' ';
  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(XSQL);
  DM1.CDSQRY1.Execute;
  DM1.CDSQRY1.Close;

  EdtVentanilla.Text   := XSIGUIENTE;
  RELLAMA.Enabled      := TRUE;
  LLAMA.Enabled        := FALSE;
  SOLTAR.Enabled       := TRUE;
  ATENDER.Enabled      := TRUE;
  SOLTAR.Enabled     := True;
  RESAGADOS.Enabled     := False;
  SEMAFORO.Brush.Color := clRed;
  ENESPERAClick(Self);
  ATENDER.SetFocus;

end;


procedure TfVentanilla.ATENDERClick(Sender: TObject);
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
var xsql,xsql2,xHora,xTiempoEspera,xHoraInicio:string;
// Fin HPC_201802_TICKET
begin
  btnNSP.Enabled:=false;
  edtNombres.Enabled := True;
  xHora:=Dm1.HoraSys;
  //principal.Enabled := false;

  XSQL:=' SELECT ESPERA,HORINIATE FROM ASO_TICKETS_RUTA '+
        ' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+XOPERA+''' AND TICKETS='''+edtVentanilla.Text+''' ';
  DM1.CDSQRY1.CLOSE;
  DM1.CDSQRY1.DataRequest(XSQL);
  DM1.CDSQRY1.Open;
  //Si inicio la atencion y  posterior lo mando a espera para aprobación o fotocopia o otro
  //no toca la hora de inicio de atencion pone hora fin de espera
  If (Length(Trim(DM1.CDSQRY1.FieldByName('Espera').AsString)) >0) And
     (Length(Trim(DM1.CDSQRY1.FieldByName('Horiniate').AsString)) >0)  Then
     Begin
       xTiempoEspera := 'HORFINESP='''+xHora+''',SEGFINESP='+IntToStr(DM1.xsegundo(xHora));
       xHoraInicio   := ''
     End
  //Si lo mando a espera antes de iniciar atencion las horas de inicio de espera lo blanquea
  //y pone su hora de inicio de atencion
  Else If (Length(Trim(DM1.CDSQRY1.FieldByName('Espera').AsString)) >0) And
           (Length(Trim(DM1.CDSQRY1.FieldByName('Horiniate').AsString)) =0)  Then
      Begin
         xHoraInicio  := 'HORINIATE='''+xHora+''',USUARIO='''+DM1.xUsuario+''',SEGINIATE='+IntToStr(DM1.xsegundo(xHora));
         xTiempoEspera := ',HORINIESP=NULL,HORFINESP=NULL,SEGFINESP=NULL,SEGINIESP=NULL,ESPERA=NULL ';
      End
  //Si la atencion es normal solo actualiza hora de inicio de atencion
  Else If (Length(Trim(DM1.CDSQRY1.FieldByName('Espera').AsString)) =0) Then
     Begin
      xTiempoEspera:='';
      xHoraInicio  := 'HORINIATE='''+xHora+''',USUARIO='''+DM1.xUsuario+''',SEGINIATE='+IntToStr(DM1.xsegundo(xHora));
     End;


  //GRABA DATOS DE INICIAR ATENCION
  XSQL:=' UPDATE ASO_TICKETS_RUTA SET '+xHoraInicio+xTiempoEspera+
        ' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+XOPERA+''' AND TICKETS='''+edtVentanilla.Text+''' ';
  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(XSQL);
  DM1.CDSQRY1.Execute;

  XSQL:='SELECT ASOID,ASODNI,ASOAPENOM FROM ASO_TICKETS_RUTA WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+XOPERA+''' AND TICKETS='''+edtVentanilla.Text+''' ';
  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(XSQL);
  DM1.CDSQRY1.Open;
  edtDNI.Text := DM1.CDSQRY1.FieldByName('ASODNI').AsString;
  If Length(Trim(DM1.CDSQRY1.FieldByName('ASOAPENOM').AsString))= 0 Then edtNombres.Text := 'ASOCIADO NUEVO' Else
     edtNombres.Text := DM1.CDSQRY1.FieldByName('ASOAPENOM').AsString;
  If Length(Trim(DM1.CDSQRY1.FieldByName('ASOID').AsString))= 0 Then edtAsoid.Text := '' Else
     edtAsoid.Text := DM1.CDSQRY1.FieldByName('Asoid').AsString;
  sAsoidG:= DM1.CDSQRY1.FieldByName('ASOID').AsString;
  DM1.CDSQRY1.Close;

  ATENDER.Enabled    := FALSE;
  RELLAMA.Enabled    := FALSE;
  LLAMA.Enabled      := FALSE;
  gbFINALIZA.Enabled := TRUE;
  RESAGADOS.Enabled  := False;
  Ticks:=0;
  HoraInicial:=Now;
  Timer2.Enabled:=true;

// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
  {XSQL:= 'SELECT 1 EXISTE FROM DB2ADMIN.TICKET_MOD_CTRL_VEN_MOV WHERE OFIDES='+QuotedStr(DM1.xOfdesid)+
         ' AND NUMVEN='+QuotedStr(DM1.xventanilla)+' AND TIPOPE='+QuotedStr(XLLAMA)+' AND USUVEN='+QuotedStr(DM1.xUsuario)+
         ' AND TRUNC(FECATE)=TRUNC(SYSDATE)';}

    XSQL2:='SELECT OFDESID, USERID, PANTALLA, VENTANILLA, OPERACION, FECREG FROM TICKET_ASG_VEN_MOD_USU '
         +'WHERE OFDESID='+QuotedStr(DM1.xOfdesid)+
         ' AND  USERID='+QuotedStr(DM1.xUsuario)+
         ' AND  PANTALLA='+QuotedStr(XLLAMA)+
         ' AND VENTANILLA='+QuotedStr(DM1.xventanilla);
    DM1.CDSQRY1.Close;
    DM1.CDSQRY1.DataRequest(XSQL2);
    DM1.CDSQRY1.Open;
    While not DM1.CDSQRY1.Eof do
    begin
       XSQL:= 'SELECT 1 EXISTE FROM TICKET_MOD_CTRL_VEN_MOV WHERE OFIDES='+QuotedStr(DM1.xOfdesid)+
         ' AND PANTALLA='+QuotedStr(XLLAMA)+' AND NUMVEN='+QuotedStr(DM1.xventanilla)+' AND USUVEN='+QuotedStr(DM1.xUsuario)+' '+
         ' AND TIPOPE='+QuotedStr(DM1.CDSQRY1.Fieldbyname('OPERACION').Asstring);
       DM1.CDSQRY2.Close;
       DM1.CDSQRY2.DataRequest(XSQL);
       DM1.CDSQRY2.Open;
          If DM1.CDSQRY2.FieldByName('EXISTE').AsString = '1' Then
          Begin
            XSQL:= 'UPDATE TICKET_MOD_CTRL_VEN_MOV SET FLGATE='+QuotedStr('V')+',FECATE=SYSDATE '+
                   ' WHERE OFIDES='+QuotedStr(DM1.xOfdesid)   +' AND PANTALLA='+QuotedStr(XLLAMA)+
                   ' AND   NUMVEN='+QuotedStr(DM1.xventanilla)+' AND TIPOPE='+QuotedStr(DM1.CDSQRY1.Fieldbyname('OPERACION').Asstring)+
                   ' AND   USUVEN='+QuotedStr(DM1.xUsuario); 
          End
          Else
          Begin
             XSQL:= 'INSERT INTO TICKET_MOD_CTRL_VEN_MOV (OFIDES,PANTALLA, NUMVEN, TIPOPE, USUVEN, FECATE, FLGATE) VALUES ('+
             QuotedStr(DM1.xOfdesid)+','+QuotedStr(XLLAMA)+','+QuotedStr(DM1.xventanilla)+','+
             QuotedStr(DM1.CDSQRY1.Fieldbyname('OPERACION').Asstring)+','+QuotedStr(DM1.xUsuario)+',SYSDATE,'+QuotedStr('V')+')';
          End;

             DM1.CDSQRY2.Close;
             DM1.CDSQRY2.DataRequest(xSql);
             DM1.CDSQRY2.Execute;

        DM1.CDSQRY1.Next;
     end;

  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(XSQL2);
  DM1.CDSQRY1.Execute;
// Fin HPC_201802_TICKET

end;


procedure TfVentanilla.FormCreate(Sender: TObject);
VAR XSQL:STRING;
    xorden:integer;
begin

 ShortDateFormat:='dd/mm/yyyy';
 LongDateFormat :='dd/mm/yyyy';
 ShortTimeFormat:='HH:mm:ss';
 LongTimeFormat :='HH:mm:ss';

  //Actualiza Dispensador
  ENESPERAClick(SELF);

  //Saco el orden de operacion
  Xsql:= 'SELECT ORDEN FROM ASO_TICKETS_OPERACION WHERE OFICINA='''+DM1.xOfdesid+''' AND OPERACION IN ('+DM1.xoperacion+') ';
  DM1.CDSQRY1.Close; DM1.CDSQRY1.DataRequest(XSQL); DM1.CDSQRY1.Open;
  xorden:= DM1.CDSQRY1.FieldByName('orden').AsInteger;
  DM1.CDSQRY1.Close;

  Xsql:= 'SELECT  operacion, nombre, orden, oficina, ruta, letra, modulo, flgact, flgaso FROM ASO_TICKETS_OPERACION  WHERE OFICINA='''+DM1.xOfdesid+''' AND (RUTA IN ('+DM1.xoperacion+') OR RUTA=''FIN'') ORDER BY ORDEN ';
  DM1.CDSRUTA.Close;
  DM1.CDSRUTA.DataRequest(Xsql);
  DM1.CDSRUTA.Open;
  If DM1.CDSRUTA.RecordCount = 0 Then //Si no esta configurado la finalizacion toma de la oficina 01 son la finalización
  Begin
     Xsql:= 'SELECT  operacion, nombre, orden, oficina, ruta, letra, modulo, flgact, flgaso FROM ASO_TICKETS_OPERACION  WHERE OFICINA=''01'' AND  RUTA=''FIN'' ORDER BY ORDEN ';
    DM1.CDSRUTA.Close;
    DM1.CDSRUTA.DataRequest(Xsql);
    DM1.CDSRUTA.Open;
  End;
  dblruta.LookupTable := DM1.CDSRUTA;
  dblruta.LookupField := 'OPERACION';

  lblOperacion.Caption := DM1.xoperacion;
  lblUsuario.Caption   := DM1.xUsuario;
end;


procedure TfVentanilla.RELLAMAClick(Sender: TObject);
VAR
XRELLAMA,xSql:STRING;

begin

   Timer1Timer(nil);
   DM1.CDSPANTALLA.Close;
   xSql:='SELECT tickets, ventanilla, t1, v1, r1, t2, v2, r2, t3, v3, r3, ultimo, a, b, c, d, e, oficina, operacion, t4, v4, r4 '+
         'FROM ASO_TICKETS_PANTALLA WHERE OFICINA='''+DM1.xOfdesid+''' AND OPERACION='''+XLLAMA+''' ';
   DM1.CDSPANTALLA.DataRequest(xSql);
   DM1.CDSPANTALLA.Open;

   If  DM1.CDSPANTALLA.FieldByName('T1').AsString    =  Trim(edtVentanilla.Text) Then
       xSql:='Update ASO_TICKETS_PANTALLA Set R1=''1'' WHERE OFICINA='''+DM1.xOfdesid+''' AND OPERACION='''+XLLAMA+''' '
   Else If DM1.CDSPANTALLA.FieldByName('T2').AsString = Trim(edtVentanilla.Text) Then
       xSql:='Update ASO_TICKETS_PANTALLA Set R2=''1'' WHERE OFICINA='''+DM1.xOfdesid+''' AND OPERACION='''+XLLAMA+''' '
   Else If DM1.CDSPANTALLA.FieldByName('T3').AsString = Trim(edtVentanilla.Text) Then
       xSql:='Update ASO_TICKETS_PANTALLA Set R3=''1'' WHERE OFICINA='''+DM1.xOfdesid+''' AND OPERACION='''+XLLAMA+''' '
   Else If DM1.CDSPANTALLA.FieldByName('T4').AsString = Trim(edtVentanilla.Text) Then
       xSql:='Update ASO_TICKETS_PANTALLA Set R4=''1'' WHERE OFICINA='''+DM1.xOfdesid+''' AND OPERACION='''+XLLAMA+''' '
   Else
    Begin
       XRELLAMA:=Trim(edtVentanilla.Text);
       //AVANZA LA COLA, Y LLAMA NUEVAMENTE AL CLIENTE Y ACTUALIZA EN EL ARCHIVO DE LA PANTALLA
       XSQL := 'UPDATE ASO_TICKETS_PANTALLA SET '+
                                   'T4='''+DM1.CDSPANTALLA.FieldByname('T3').AsString+''','+
                                   'V4='''+DM1.CDSPANTALLA.FieldByname('V3').AsString+''','+
                                   'T3='''+DM1.CDSPANTALLA.FieldByname('T2').AsString+''','+
                                   'V3='''+DM1.CDSPANTALLA.FieldByname('V2').AsString+''','+
                                   'T2='''+DM1.CDSPANTALLA.FieldByname('T1').AsString+''','+
                                   'V2='''+DM1.CDSPANTALLA.FieldByname('V1').AsString+''','+
                                   'T1='''+XRELLAMA+''','+
                                   'V1='''+DM1.xventanilla+''' WHERE OFICINA='''+DM1.xOfdesid+''' AND OPERACION='''+XLLAMA+''' ';
    End;

    DM1.CDSQRY1.Close;
    DM1.CDSQRY1.DataRequest(xSql);
    DM1.CDSQRY1.Execute;

end;


//NUMERO DE TICKETS
Function TfVentanilla.numtick:boolean;
 VAR XSQL:STRING;
begin
 ENESPERAClick(NIL);
 If DM1.CDSQRYDISPENSA.RecordCount<=0 Then
    Begin
     ShowMessage('No hay docentes para atender');
     Result := False;
    End
 Else
    Begin
     DM1.CDSQRYDISPENSA.Last;
     DM1.CDSQRYDISPENSA.First;
     XFECHA     := DM1.CDSQRYDISPENSA.FieldByName('Fecha').AsString;
     XSIGUIENTE := DM1.CDSQRYDISPENSA.FieldByName('Tickets').AsString;
     XNOMBRES   := DM1.CDSQRYDISPENSA.FieldByName('Asoapenom').AsString;
     XOPERA     := DM1.CDSQRYDISPENSA.FieldByName('Operacion').AsString;

     XSQL:= 'UPDATE ASO_TICKETS_RUTA SET ATENCION=''L''  WHERE OFICINA='''+DM1.xOfdesid+'''AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+XOPERA+''' AND TICKETS='''+XSIGUIENTE+'''  ';
     DM1.CDSQRY2.Close;
     DM1.CDSQRY2.DataRequest(XSQL);
     DM1.CDSQRY2.Execute;

     Result := True;

    End;

end;

procedure TfVentanilla.FormActivate(Sender: TObject);
VAR XSQL:STRING;

begin
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
//  fVentanilla.Caption := 'Control de Colas y Rutas en la Ventanilla '+ DM1.xventanilla+'->'+Dm1.xoperllama;
  fVentanilla.Caption := 'Llamado de Tickets para la Ventanilla '+ DM1.xventanilla+'->'+Dm1.xoperllama;
// Fin HPC_201802_TICKET
  If Length(Trim(DM1.xoperllama))=0 Then
    XLLAMA:=Dm1.xoperacion
  Else  XLLAMA:=Dm1.xoperllama;
end;

procedure TfVentanilla.Timer1Timer(Sender: TObject);
begin
 Timer1.Enabled := True;
 if RELLAMA.Enabled Then RELLAMA.Enabled := False else RELLAMA.Enabled := True;
 if (Timer1.Enabled) and (RELLAMA.Enabled) then  Timer1.Enabled:=False;
end;

Function TfVentanilla.FechasOutPut(xFInput: tDateTime): tDateTime;
begin
   Result:=StrToDate(Copy(DateToStr(xFInput),1,10));
end;

//Fecha del Sistema
Function TfVentanilla.FechaSys: tDateTime;
var
   FormatoFecha: PChar;
begin
FormatoFecha:='dd/MM/yyyy';
SetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SSHORTDATE,FormatoFecha);
DM1.CDSQRY1.Close;
DM1.CDSQRY1.DataRequest('SELECT /*+ RULE */TO_CHAR(SYSDATE,''dd/mm/yyyy'') AS FECHA FROM DUAL');
DM1.CDSQRY1.Open;
If DM1.CDSQRY1.RecordCount > 0 Then
   Result:=FechasOutPut(DM1.CDSQRY1.fieldbyname('FECHA').AsDateTime)
Else Result:=FechasOutPut(Date);

DM1.CDSQRY1.Close;
End;


//Hora del Sistema
function TfVentanilla.HoraSys: String;
begin
DM1.CDSQRY1.Close;
DM1.CDSQRY1.DataRequest('SELECT /*+ RULE */ TO_CHAR(SYSDATE,''HH24:MI:SS'') AS HORA FROM DUAL');
DM1.CDSQRY1.Open;
If DM1.CDSQRY1.RecordCount > 0 Then
    Result:=DM1.CDSQRY1.fieldbyname('HORA').AsString
Else
    Result:='';
DM1.CDSQRY1.Close;

end;


//Covierte los minutos en horas y saca la diferencia entre dos horas
function TfVentanilla.StrZero(wNumero: String; wLargo: Integer): string;
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

function TfVentanilla.xhora1(hora1, hora2: integer): string;
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

    if Lrm=1  then
       xmin:='0'+rm
    else
       xmin:=rm;

    result:=xhor+':'+xmin

end;

//Convierte los segundos en horas y resta
function TfVentanilla.xhora2(Segundo1, Segundo2: integer): string;
  var rhora,rminu,rsegundos,xx,Lrh,Lrm,Lrs :integer;
      rh,rm,rs,xhor,xmin :string;

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
function TfVentanilla.xminuto(yhora: string): integer;
var y1,y2,code :integer;
begin
  val(copy(yhora,1,2),y1,code);
  val(copy(yhora,4,2),y2,code);
  result:= (y1*60)+y2;
end;

//Convierte la horas en segundos
function TfVentanilla.xsegundo(yhora: string): integer;
var y1,y2,y3,code :integer;
begin
  val(copy(yhora,1,2),y1,code);
  val(copy(yhora,4,2),y2,code);
  val(copy(yhora,7,2),y3,code);

  result:= (y1*3600)+(y2*60)+y3;
end;

procedure TfVentanilla.SOLTARClick(Sender: TObject);
VAR XSQL,xVenPre:STRING;
begin
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
  If ConsultaAtencion Then Exit;
// Fin HPC_201802_TICKET


  If Length(trim(edtVentanilla.Text))=0 Then
    Begin
      ShowMessage('No llamo ningún Ticket...');
      Exit;
    End;

  XSQL:='Select codigo,desesp,restieope,orden,operacion From Aso_Tickets_Espera Where Operacion='''+Trim(XOPERA)+''' or Operacion is null Order by Orden';
  DM1.CDSESPERA.Close;
  DM1.CDSESPERA.DataRequest(XSQL);
  DM1.CDSESPERA.Open;
  gbFINALIZAant         := gbFINALIZA.Enabled;
  gbFINALIZA.Enabled    := False;
  DBLESPERA.LookupTable := DM1.CDSESPERA;
  DBLESPERA.LookupField := 'DESESP';
  pnlEspera.Top  := 280;
  pnlEspera.Left := 8;
  pnlEspera.Visible := True;
  DBLESPERA.DropDown;
  DBLESPERA.SetFocus;
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
// btnNSP.Enabled:=True;
// Fin HPC_201802_TICKET
end;

procedure TfVentanilla.DBLRUTAChange(Sender: TObject);
begin
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
 If (length(trim(DBLRUTA.Text))>0) And (ConsultaAtencion) Then
 Begin
  DBLRUTA.Text:='';
  mandar.Caption :='RUTA A SEGUIR';
  Exit;
 End
 Else
 Begin
  mandar.Caption := DM1.CDSRUTA.FieldByName('NOMBRE').AsString;
 End;
// Fin HPC_201802_TICKET
end;

procedure TfVentanilla.DBLRUTAExit(Sender: TObject);
begin
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
mandar.Caption := mandar.Caption;// DM1.CDSRUTA.FieldByName('NOMBRE').AsString;
// Fin HPC_201802_TICKET
end;

procedure TfVentanilla.MANDARClick(Sender: TObject);
var xSql,xHora,xVenPre :string;
    XCORR:Integer;
begin
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
If ConsultaAtencion Then Exit;
// Fin HPC_201802_TICKET
If Length(Trim(DBLRUTA.Text))=0  Then
   Begin
     ShowMessage('DEBE SELECIONAR LA RUTA A SEGUIR...');
     DBLRUTA.SetFocus;
     DBLRUTA.DropDown;
     exit;
   End;

If DBLRUTA.Text='FIN' Then
   Begin

      pnlFINALIZA.Top := 240;
      pnlFINALIZA.Left:= 120;
      pnlFINALIZA.Visible :=True;
      DM1.CDSFINALIZA.Close;
      DM1.CDSFINALIZA.DataRequest('SELECT codigo,desfin,operacion FROM ASO_TICKETS_FINALIZA Where (Operacion='''+Trim(XOPERA)+''' or Operacion is null) and activo=''A''');
      DM1.CDSFINALIZA.Open;
      DM1.CDSFINALIZA.Last;
      DBLFINALIZA.LookupTable := DM1.CDSFINALIZA;
      DBLFINALIZA.LookupField := 'CODIGO';
      DBLFINALIZA.DropDown;
   // Inicio HPC_201802_TICKET
   // Implementación de fase 2 (Controlar Sistemas de Atención)
   // btnNSP.Enabled:=true;
   // Fin HPC_201802_TICKET
   End
Else
  Begin
    if MessageDlg('EL ASOCIADO PASARA A '+DM1.CDSRUTA.FieldByName('NOMBRE').AsString+' ESTA SEGURO(A)....' ,mtConfirmation, [mbYes, mbNo], 0) = mrNo  then Exit;

    If DM1.CDSRUTA.FieldByName('FLGASO').AsString='S' Then
       Begin
        XSQL:='SELECT ASOID,ASOCODMOD,ASODNI,ASOAPENOM FROM APO201 WHERE ASODNI='''+TRIM(edtDNI.Text)+''' ';
        DM1.CDSQRY1.Close;
        DM1.CDSQRY1.DataRequest(XSQL);
        DM1.CDSQRY1.Open;
        If DM1.CDSQRY1.RecordCount=0 Then
          Begin
            ShowMessage('El DNI debe estar inscrito en el maestro de ASOCIADOS, SI ES DOCENTE DEBE PASAR A MANTENIMIENTO DE ASOCIADOS PARA REGULARIZAR SU ESTADO..');
            EXIT;
          End;
       End;

    If DM1.CDSRUTA.FieldByName('FLGACT').AsString='S' Then
       Begin


       End;

     recuperaTieEvaCre;
    //GRABA DATOS DE  ATENCION
     xHora := Dm1.HoraSys;
     XSQL:=' UPDATE ASO_TICKETS_RUTA SET HORFINATE='''+xHora+''',USUARIO='''+DM1.xUsuario+''',ATENCION=''A'',SEGFINATE='+IntToStr(DM1.xsegundo(xHora))+', HORGENSOLCRE='''+vGenSolCre+''' '
          +' ,HORAPRSOLCRE='''+vAprSolCre+''' '
          +' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+XOPERA+''' AND TICKETS='''+edtVentanilla.Text+''' ';
     DM1.CDSQRY1.Close;
     DM1.CDSQRY1.DataRequest(XSQL);
     DM1.CDSQRY1.Execute;


    //INSERTA NUEVO REGISTRO SEGUN RUTA
      xVenPre:='';
      If copy(edtVentanilla.Text,1,1)='P' Then //Preferente
         Begin
          //Verifico si existe Ventanilla Para Preferente segun la ruta de operación y Oficina
          xSql:='Select Ventanilla From Aso_tickets_Ventanilla_casos where Oficina='''+DM1.xOfdesid+''' And Operacion='''+DBLRUTA.Text+''' ';
          DM1.CDSQRY1.Close;
          DM1.CDSQRY1.DataRequest(xSql);
          DM1.CDSQRY1.Open;
          If DM1.CDSQRY1.RecordCount > 0 Then xVenPre:= DM1.CDSQRY1.FieldByName('Ventanilla').AsString Else xVenPre:='' ;
         End;

       xSql:='Select Max(nvl(correlativo,0)) Ultimo From  ASO_TICKETS_RUTA Where '+
             'OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+DBLRUTA.Text+''' ';
       DM1.CDSQRY1.Close;
       DM1.CDSQRY1.DataRequest(xSql);
       DM1.CDSQRY1.Open;
       XCORR:=DM1.CDSQRY1.FieldByName('Ultimo').AsInteger+1;

       XsQL:= 'Insert Into ASO_TICKETS_RUTA(Correlativo,Tickets,Oficina,Atencion,Operacion,Fecha,Horemitic,Segemitic,Venpre,Asodni,Asoid,Asoapenom)'+
              ' Values('+IntToStr(xcorr)+','''+edtVentanilla.Text+''','''+DM1.xOfdesid+''',''N'','''+DBLRUTA.Text+''','''+DateToStr(Dm1.FechaSys)+''','''+Dm1.HoraSys+''','+IntToStr(DM1.xsegundo(xHora))+
              ','''+xVenPre+''','''+edtDNI.Text+''','''+edtAsoid.Text+''','''+edtNombres.Text+''')';
       DM1.CDSQRY1.Close;
       DM1.CDSQRY1.DataRequest(xSql);
       DM1.CDSQRY1.Execute;

       DBLRUTA.Text:='';
       MANDAR.Caption       := 'RUTA A SEGUIR';
       ATENDER.Enabled      := FALSE;
       RELLAMA.Enabled      := FALSE;
       LLAMA.Enabled        := TRUE;
       gbFINALIZA.Enabled   := FALSE;
       SOLTAR.Enabled       := False;
       RESAGADOS.Enabled    := True;
       edtVentanilla.Text   :='';
       SEMAFORO.Brush.Color := clLime;
       edtNombres.Text      :='';
       edtDNI.Text          :='';
       edtAsoid.Text        :='';
       ENESPERAClick(SELF);
       limpiaCronometro;
       btnNSP.Enabled:=true;
      // Inicio HPC_201802_TICKET
      // Implementación de fase 2 (Controlar Sistemas de Atención)
      DesacIniAteMod;
      // Fin HPC_201802_TICKET       
  End;
end;

procedure TfVentanilla.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
If DM1.CDSRESAGADOS.RecordCount>0 Then
 Begin
   ShowMessage('Tiene Asociados rezagados, primero debe terminar estas operaciones para salir');
   Action := caNone;
 End
Else
 Begin
  If (Length(Trim(edtVentanilla.Text))<> 0)   Then
  Begin
    ShowMessage('AUN NO FINALIZA ATENCION DEL ASOCIADO....');
    Action := caNone;
  End
  Else
  Begin
    close;
    fIngreso.Close;
    fVentanilla.close;
    Action := caFree
  End;
 End;
//Fin HPC_201802_TICKET
end;

procedure TfVentanilla.ENESPERAClick(Sender: TObject);
VAR XSQL:STRING;
    NTickets:Integer;
begin
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
If ConsultaAtencion Then Exit;
// Fin HPC_201802_TICKET
 Xsql:= 'SELECT TICKETS,ASODNI,ASOAPENOM,FECHA,HORFINATE,CORRELATIVO,OPERACION FROM ASO_TICKETS_RUTA WHERE  '+
        'OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION IN ('+DM1.xoperacion+') AND ATENCION NOT IN(''A'',''L'',''R'') AND HORFINATE IS NULL AND VENPRE IS NULL ORDER BY CORRELATIVO,TICKETS';
 DM1.CDSQRYDISPENSA.DisableControls;
 DM1.CDSQRYDISPENSA.Close;
 DM1.CDSQRYDISPENSA.DataRequest(Xsql);
 DM1.CDSQRYDISPENSA.Open;
 DM1.CDSQRYDISPENSA.IndexFieldNames :='CORRELATIVO;TICKETS';
 dbgDispensa.DataSource := DM1.DSDISPENSA;
 DM1.CDSQRYDISPENSA.EnableControls;

 Xsql:='Select COUNT(1) Tickets FROM ASO_TICKETS_RUTA WHERE  '+
       'OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION IN ('+DM1.xoperacion+') AND ATENCION NOT IN(''A'',''L'',''R'') AND HORFINATE IS NULL AND VENPRE IS NULL ORDER BY CORRELATIVO';
 DM1.CDSQRY1.Close;
 DM1.CDSQRY1.DataRequest(Xsql);
 DM1.CDSQRY1.Open;
 NTickets:= DM1.CDSQRY1.FieldByName('Tickets').AsInteger;
 DM1.CDSQRY1.Close;

 Xsql:= 'SELECT TICKETS,ASODNI,ASOAPENOM,FECHA,HORFINATE,ESPERA,HORFINESP,DESESP,A.OPERACION FROM ASO_TICKETS_RUTA A,ASO_TICKETS_ESPERA B WHERE  '+
        'OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND A.OPERACION IN ('+DM1.xoperacion+') AND '+
        'A.ESPERA=B.CODIGO (+) AND ' +
        '((ATENCION =''R'' AND USUARIO='''+DM1.xUsuario+''') OR (VENPRE='''+DM1.xventanilla+''' )) ORDER BY CORRELATIVO,TICKETS';
 DM1.CDSRESAGADOS.Close;
 DM1.CDSRESAGADOS.DataRequest(Xsql);
 DM1.CDSRESAGADOS.Open;
 dbgResagados.DataSource := DM1.DSRESAGADOS;

 If Ntickets>0 then
   lbltickets.Caption:='Tickets por atender = '+ IntToStr(Ntickets)
 Else lbltickets.Caption:='Tickets por atender = 0';

 If DM1.CDSRESAGADOS.RecordCount>0 then
    Begin
      RESAGADOS.Font.Color := clred ;
      RESAGADOS.Enabled := true;
    End
 else
    Begin
      RESAGADOS.Font.Color := clBlack;
      RESAGADOS.Enabled := False;
    End;


end;

procedure TfVentanilla.BitBtn1Click(Sender: TObject);
begin
pnlRESAGADOS.Visible := False;
end;

procedure TfVentanilla.RESAGADOSClick(Sender: TObject);
VAR xsql:string;
begin


ENESPERAClick(sELF);
pnlRESAGADOS.Top  := 145;
pnlRESAGADOS.Left := 8;
pnlRESAGADOS.Visible:=True;
end;


procedure TfVentanilla.dbgResagadosDblClick(Sender: TObject);
VAR XSQL:String;
begin

  pnlRESAGADOS.Visible:= False;
  edtVentanilla.Text  := DM1.CDSRESAGADOS.FieldByName('TICKETS').AsString;
  edtNombres.Enabled  := False;
  edtNombres.Text     := DM1.CDSRESAGADOS.FieldByName('ASOAPENOM').AsString;

   //BloqueoTickets;
   XSQL:=' UPDATE ASO_TICKETS_RUTA SET ATENCION=''L'',USUARIO='''+DM1.xUsuario+''',VENPRE='''' '+
         ' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+DM1.CDSRESAGADOS.FieldByname('OPERACION').Asstring+''' AND TICKETS='''+edtVentanilla.Text+''' ';
   DM1.CDSQRY2.Close;
   DM1.CDSQRY2.DataRequest(XSQL);
   DM1.CDSQRY2.Execute;

  Xsql:= 'SELECT TICKETS,ASODNI,ASOAPENOM,FECHA,HORFINATE,ESPERA,HORFINESP FROM ASO_TICKETS_RUTA A,ASO_TICKETS_ESPERA B WHERE  '+
         'OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND A.OPERACION IN ('+DM1.xoperacion+') AND '+
         'A.ESPERA=B.CODIGO (+) AND ' +
         '((ATENCION =''R'' AND USUARIO='''+DM1.xUsuario+''') OR (VENPRE='''+DM1.xventanilla+''' )) ORDER BY CORRELATIVO';
  DM1.CDSRESAGADOS.Close;
  DM1.CDSRESAGADOS.DataRequest(Xsql);
  DM1.CDSRESAGADOS.Open;
  dbgResagados.DataSource := DM1.DSRESAGADOS;
   If DM1.CDSRESAGADOS.RecordCount >0 Then RESAGADOS.Font.Color:=clRed Else RESAGADOS.Font.Color:=clBlack;


  RELLAMA.Enabled      := TRUE;
  LLAMA.Enabled        := FALSE;
  SOLTAR.Enabled       := TRUE;
  ATENDER.Enabled      := TRUE;
  SOLTAR.Enabled     := True;
  RESAGADOS.Enabled    := False;
  SEMAFORO.Brush.Color := clRed;
  ATENDER.SetFocus;


end;

procedure TfVentanilla.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 Then
   if (ActiveControl is TButton) or
      (ActiveControl is TCheckBox) then
      Begin
       Key:=#0;
       Perform(CM_DialogKey,VK_TAB,0);
      end
   else
      Begin
        Key:=#0;
        Perform(CM_DialogKey,VK_TAB,0);
      end;
end;


procedure TfVentanilla.Button1Click(Sender: TObject);
var xsql:string;
begin


 If  MessageDlg('ESTA SEGURO(A) DE LIBERAR *** REZAGADOS ***' ,mtConfirmation, [mbYes, mbNo], 0) = mrNo  then Exit;

     xsql:='Update Aso_Tickets_Ruta Set ATENCION=''N'',USUARIO=NULL,HORINIATE=NULL,SEGINIATE=NULL,ESPERA=NULL,HORINIESP=NULL,SEGINIESP=NULL,HORFINESP=NULL,SEGFINESP=NULL ' +
           ' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION IN ('+DM1.xoperacion+') AND ATENCION=''R'' AND USUARIO='''+DM1.xUsuario+''' AND VENPRE IS NULL AND (ESPERA=''03'' OR ESPERA IS NULL)';
     DM1.CDSQRY1.Close;
     DM1.CDSQRY1.DataRequest(xsql);
     DM1.CDSQRY1.Execute;

 ENESPERAClick(sELF);
 pnlRESAGADOS.Visible := False;

end;

procedure TfVentanilla.BTNACEPTAClick(Sender: TObject);
VAR XSQL,xHora:STRING;
begin
    If Length(Trim(DBLFINALIZA.Text))=0 then
      Begin
        ShowMessage('Debe seleccionar un Motivo....');
        DBLFINALIZA.SetFocus;
        exit;
      End;
     If  MessageDlg('EL ASOCIADO CULMINA TODAS SUS OPERACION ESTA SEGURO(A)....' ,mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
       Begin
          recuperaTieEvaCre;
          xHora := Dm1.HoraSys;
          //GRABA DATOS DE FINAL ATENCION
          XSQL:=' UPDATE ASO_TICKETS_RUTA SET HORFINATE='''+xHora+''',USUARIO='''+DM1.xUsuario+''',ATENCION=''A'',FINALIZA='''+Trim(DBLFINALIZA.Text)+''',SEGFINATE='+IntToStr(DM1.xsegundo(xHora))+', HORGENSOLCRE='''+vGenSolCre+''' '
                +' ,HORAPRSOLCRE='''+vAprSolCre+''' '
                +' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+XOPERA+''' AND TICKETS='''+TRIM(edtVentanilla.Text)+''' ';
          DM1.CDSQRY1.Close;
          DM1.CDSQRY1.DataRequest(XSQL);
          DM1.CDSQRY1.Execute;
          pnlFINALIZA.Visible := False;

          pnlEncuesta.Top := 150;
          pnlEncuesta.Left:= 20;
          pnlEncuesta.Visible :=True;
          principal.Enabled:=false;
          edtEncuesta.SetFocus;

          DBLRUTA.Text:='';
          MANDAR.Caption       := 'RUTA A SEGUIR';
          ATENDER.Enabled      := FALSE;
          RELLAMA.Enabled      := FALSE;
          LLAMA.Enabled        := TRUE;
          gbFINALIZA.Enabled   := FALSE;
          SOLTAR.Enabled       := False;
          RESAGADOS.Enabled    := True;
          SEMAFORO.Brush.Color := clLime;
          edtNombres.Text      :='';
          edtDNI.Text          :='';
          edtAsoid.Text        :='';
          ENESPERAClick(SELF);
      // Inicio HPC_201802_TICKET
      // Implementación de fase 2 (Controlar Sistemas de Atención)
         btnNSP.Enabled:=true;
         DesacIniAteMod;
      // Fin HPC_201802_TICKET
          limpiaCronometro;



       End
     Else Exit;
end;

procedure TfVentanilla.BitBtn2Click(Sender: TObject);
begin
DM1.CDSFINALIZA.Close ;
pnlFINALIZA.Visible := False;
end;

procedure TfVentanilla.DBLFINALIZAExit(Sender: TObject);
begin
 If Length(Trim(DBLFINALIZA.Text))= 0 Then
    edtFinaliza.Text:='' else edtFinaliza.Text:=DM1.CDSFINALIZA.FieldByName('DESFIN').AsString
end;

procedure TfVentanilla.DBLFINALIZAChange(Sender: TObject);
begin
 If Length(Trim(DBLFINALIZA.Text))= 0 Then
    edtFinaliza.Text:='' else edtFinaliza.Text:=DM1.CDSFINALIZA.FieldByName('DESFIN').AsString
end;


//Bloquea la pantalla
procedure TfVentanilla.BloqueoPantalla;
var Xsql:string;
begin
 xSQL:='SELECT tickets, ventanilla, t1, v1, r1, t2, v2, r2, t3, v3, r3, ultimo, a, b, c, d, e, oficina, operacion, t4, v4, r4 '+
       'FROM ASO_TICKETS_PANTALLA WHERE OFICINA='''+DM1.xOfdesid+''' AND OPERACION='''+XLLAMA+''' For Update ';
 DM1.CDSQRY3.Close;
 DM1.CDSQRY3.DataRequest(XSQL);
 DM1.CDSQRY3.Execute;
end;


//Bloquea Tickets
procedure TfVentanilla.BloqueoTickets;
var XSQL:string;
begin
 XSQL:='SELECT tickets, correlativo, atencion, fecha, horemitic, horiniate, horfinate, usuario, asoid, asoapenom, asodni, operacion, areate, oficina, segemitic, seginiate, segfinate, finaliza, venpre, horiniesp, horfinesp, seginiesp, espera, segfinesp '+
       ' FROM ASO_TICKETS_RUTA WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+XOPERA+''' AND TICKETS='''+edtVentanilla.Text+''' For Update ';
 DM1.CDSQRY3.Close;
 DM1.CDSQRY3.DataRequest(XSQL);
 DM1.CDSQRY3.Execute;
end;

procedure TfVentanilla.BitBtn3Click(Sender: TObject);
begin
pnlEspera.Visible := False;
gbFINALIZA.Enabled := gbFINALIZAant;
DM1.CDSESPERA.Close;

end;

procedure TfVentanilla.BTNESPERAClick(Sender: TObject);
var xSql,xVenPre,xHora,xTiempoEspera:String;
begin
  //SI ES PREFERENTA
   IF  Length(Trim(DBLESPERA.Text))=0 Then
       Begin
         ShowMessage('DEBE SELECCIONAR UN MOTIVO DE ESPERA');
           DBLESPERA.DropDown;
           DBLESPERA.SetFocus;
           exit;
       End;

   If DM1.CDSESPERA.FieldByName('RESTIEOPE').AsString='N' Then
      Begin
        xTiempoEspera:=',ESPERA=SUBSTR(LTRIM(ESPERA||'''+DM1.CDSESPERA.FieldByName('Codigo').AsString+'''),1,2) ,HORFINESP=NULL,SEGFINESP=NULL ' ;
      End
   Else
      Begin
        xHora  := DM1.HoraSys;
        xTiempoEspera :=',ESPERA='''+DM1.CDSESPERA.FieldByName('Codigo').AsString+''',HORINIESP='''+xHora+''',SEGINIESP='+IntToStr(DM1.xsegundo(xHora))+',HORFINESP=NULL,SEGFINESP=NULL ';
      End;

   xVenPre:='';
   If copy(edtVentanilla.Text,1,1)='P' Then //Preferente
      Begin
         //Verifico si existe Ventanilla Para Preferente segun la ruta de operación y Oficina
         xSql:='Select Ventanilla From Aso_tickets_Ventanilla_casos where Oficina='''+DM1.xOfdesid+''' And Operacion IN ('+DM1.xOperacion+')';
         DM1.CDSQRY1.Close;
         DM1.CDSQRY1.DataRequest(xSql);
         DM1.CDSQRY1.Open;
         If DM1.CDSQRY1.RecordCount > 0 Then
             Begin
               xVenPre:= DM1.CDSQRY1.FieldByName('Ventanilla').AsString;
               XSQL:=' UPDATE ASO_TICKETS_RUTA SET ATENCION=''N'', VENPRE='''+xVenPre+''',USUARIO='''' '+xTiempoEspera+
                     ' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION IN ('+DM1.xOperacion+') AND TICKETS='''+edtVentanilla.Text+''' '
             End
            Else
             Begin
               XSQL:=' UPDATE ASO_TICKETS_RUTA SET ATENCION=''R'',USUARIO='''+DM1.xUsuario+''' '+xTiempoEspera+
                     ' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION IN ('+DM1.xOperacion+') AND TICKETS='''+edtVentanilla.Text+''' '
             End;
       End
   Else


     Begin
       XSQL:=' UPDATE ASO_TICKETS_RUTA SET ATENCION=''R'',USUARIO='''+DM1.xUsuario+''' '+xTiempoEspera+
             ' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION IN ('+DM1.xOperacion+') AND TICKETS='''+edtVentanilla.Text+''' ';
     End;

  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(XSQL);
  DM1.CDSQRY1.Execute;
  DM1.CDSQRY1.Close;

// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
  XSQL:= 'UPDATE TICKET_MOD_CTRL_VEN_MOV SET FLGATE=Null WHERE OFIDES='+
    QuotedStr(DM1.xOfdesid)+' AND NUMVEN='+QuotedStr(DM1.xventanilla)+' AND PANTALLA='+QuotedStr(XLLAMA)+' AND USUVEN='+QuotedStr(DM1.xUsuario)
  +' AND TRUNC(FECATE)=TRUNC(SYSDATE)';
  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(XSQL);
  DM1.CDSQRY1.Execute;
  DM1.CDSQRY1.Close;
// Fin HPC_201802_TICKET

  edtDNI.Text     :='';
  edtNombres.Text :='';
  edtAsoid.Text   :='';

  ENESPERAClick(SELF);
  ATENDER.Enabled      := FALSE;
  RELLAMA.Enabled      := FALSE;
  LLAMA.Enabled        := TRUE;
  gbFINALIZA.Enabled   := FALSE;
  SOLTAR.Enabled       := FALSE;
  SEMAFORO.Brush.Color := clLime;
  RESAGADOS.Enabled    := True;
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
   btnNSP.Enabled:=True;
// Fin HPC_201802_TICKET
  edtVentanilla.Text   := '';
  pnlEspera.Visible    := False;
  If gbFINALIZA.Enabled Then gbFINALIZA.Enabled := False;
  DM1.CDSESPERA.Close;
  limpiaCronometro;
end;

procedure TfVentanilla.dbgResagadosDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  If copy(DM1.CDSRESAGADOS.FieldByName('Tickets').AsString,1,1)='P' Then
    begin
       dbgResagados.Canvas.Font.Color := clGreen;
       dbgResagados.DefaultDrawDataCell(Rect, Field, State);
     end
end;

procedure TfVentanilla.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin


IF KEY=VK_F5 THEN
       begin
         If ENESPERA.Enabled Then ENESPERAClick(Nil);
       end;

IF KEY=VK_F9 THEN
    Begin
      If RELLAMA.Enabled Then RELLAMAClick(Nil);
    End;

IF KEY=VK_F10 THEN
    Begin
       If LLAMA.Enabled Then LLAMAClick(Nil);
    end;


end;

procedure TfVentanilla.Timer2Timer(Sender: TObject);
var
 i:Integer;
begin
   Ticks := Ticks+1;
   lblTimer.Caption:= TimeToStr(Now - HoraInicial);
   //cada media hora emite un sonido
   If (Ticks mod 1800) = 0 Then
   Begin
      for i:=1 to 8 do Windows.Beep(800,100);
   End;
end;

procedure TfVentanilla.limpiaCronometro;
begin
  Ticks:=0;
  Timer2.Enabled:=false;
  HoraInicial:=Now;
  lblTimer.caption:=TimeToStr(Now-HoraInicial);
end;

procedure TfVentanilla.btnColasClick(Sender: TObject);
begin
// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
  If ConsultaAtencion Then Exit;
// Fin HPC_201802_TICKET
    inicializaColas;

    If DM1.cdsOperaciones.RecordCount = 0 Then
    Begin
      ShowMessage('NO EXISTEN COLAS PARA PRIORIZAR');
      pnlOperaciones.Visible:= False;
    End
    Else
    Begin
      dbgOperaciones.DataSource := DM1.dsOperaciones;
      edtOperaciones.Text:= '';
      pnlOperaciones.Top  := 145;
      pnlOperaciones.Left := 100;
      pnlOperaciones.Visible:=True;
    End;
end;

procedure TfVentanilla.inicializaColas;
var
  Xsql: String;
Begin
    Xsql:= 'SELECT OPERACION, COUNT(OPERACION) AS TOTAL, ''A'' AS ESTADO FROM ASO_TICKETS_RUTA WHERE  '+
        'OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' '+
        'AND ATENCION NOT IN(''A'',''L'',''R'') AND HORFINATE IS NULL AND VENPRE IS NULL GROUP BY OPERACION';
    DM1.cdsOperaciones.Close;
    DM1.cdsOperaciones.DataRequest(Xsql);
    DM1.cdsOperaciones.Open;
End;

procedure TfVentanilla.dbgOperacionesDblClick(Sender: TObject);
var
  ListOpe,ListOpe2: TStrings;
  i: Integer;
  bpriorizacion:boolean;
begin
  bpriorizacion:= false;
  If Length(trim(edtOperaciones.Text)) = 0 Then
  Begin
     If DM1.cdsOperaciones.FieldByName('ESTADO').AsString = 'A' Then
     Begin
          edtOperaciones.Text := edtOperaciones.Text+DM1.cdsOperaciones.FieldByName('OPERACION').AsString+',';
          DM1.cdsOperaciones.Edit;
          DM1.cdsOperaciones.FieldByName('ESTADO').AsString:='I';
          DM1.cdsOperaciones.Post;
          bpriorizacion:=true;
     End
     Else
     Begin
          ShowMessage('YA SE ENCUENTRA PRIORIZADA');
     End;
  End
  Else
  Begin
     If DM1.cdsOperaciones.FieldByName('ESTADO').AsString = 'A' Then
     Begin
          edtOperaciones.Text := edtOperaciones.Text+','+DM1.cdsOperaciones.FieldByName('OPERACION').AsString+',';
          DM1.cdsOperaciones.Edit;
          DM1.cdsOperaciones.FieldByName('ESTADO').AsString:='I';
          DM1.cdsOperaciones.Post;
          bpriorizacion:=true;
     End
     Else
     Begin
          ShowMessage('YA SE ENCUENTRA PRIORIZADA');
     End;
  End;

  If bpriorizacion Then
  Begin
      sOperacionG:='';
      sOperacion:='';
  
      ListOpe := TStringList.Create;
      ListOpe2 := TStringList.Create;

      ExtractStrings([','], [], PChar(trim(edtOperaciones.Text)), ListOpe);

      For i:=0 to ListOpe.Count-1 do
      Begin
         sOperacion := sOperacion+ListOpe[i] +',';
      End;

      sOperacion:=Copy (sOperacion, 0, Length(sOperacion)-1);

      ExtractStrings([','], [],PChar(trim(sOperacion)), ListOpe2);

      If ListOpe2.Count > 0 Then
      Begin
         For i:=0 to ListOpe2.Count-1 do
         Begin
           sOperacionG := sOperacionG+''''+ListOpe2[i] +''','
         End;
      End;
  
      sOperacionG:=Copy (sOperacionG, 0, Length(sOperacionG)-1);

      edtOperaciones.Text := sOperacion
  End;
end;

procedure TfVentanilla.BitBtn4Click(Sender: TObject);
begin
   inicializaColas;
   pnlOperaciones.Visible:= False;
end;

procedure TfVentanilla.btnBorrarOpeClick(Sender: TObject);
begin
  inicializaColas;
  edtOperaciones.Text:='';
end;

procedure TfVentanilla.btnIrOpeClick(Sender: TObject);
begin
  If Length(edtOperaciones.Text) >0 Then
  Begin
    Dm1.xoperacion := sOperacionG;
    If Length(Trim(DM1.xoperllama))=0 Then
      XLLAMA:=Dm1.xoperacion
    Else  XLLAMA:=Dm1.xoperllama;
    ENESPERAClick(sELF);
    lblOperacion.Caption := DM1.xoperacion;
    ShowMessage('PRIORIDAD MODIFICADA');
    pnlOperaciones.Visible:= False;
  End
  Else
  Begin
    ShowMessage('DEBE SELECCIONAR UNA COLA');
  End;
end;

procedure TfVentanilla.recuperaTieEvaCre;
var
  XSQL: String;
begin 
  XSQL:='SELECT TO_CHAR(MAX(C.HREG),''HH24:MI:SS'') GEN_SOL_CRE, TO_CHAR(MAX(B.FECAUTCRE),''HH24:MI:SS'') APR_SOL_CRE '
//Inicio HPC_201802_TICKET   
//Se quita Ticket.
             +'FROM ASO_TICKETS_RUTA A, CRE301 B, EVAL_RES_CAB C '
//Final HPC_201802_TICKET   
             +'WHERE OFICINA = '''+DM1.xOfdesid+''' '
             +'AND A.ASOID='''+sAsoidG+''' '
             +'AND A.FECHA='''+DateToStr(DM1.FechaSys)+''' '
             +'AND B.ASOID= A.ASOID AND B.FREG=A.FECHA AND B.CREESTID NOT IN (''13'') '
             +'AND C.ASOID= B.ASOID AND C.FREG=B.FREG ';			 		 
  DM1.CDSQRY4.Close;
  DM1.CDSQRY4.DataRequest(XSQL);
  DM1.CDSQRY4.Open;

  vGenSolCre:=trim(DM1.CDSQRY4.FieldByName('GEN_SOL_CRE').AsString);
  vAprSolCre:=trim(DM1.CDSQRY4.FieldByName('APR_SOL_CRE').AsString);
end;

procedure TfVentanilla.btnNSPClick(Sender: TObject);
var
  XSQL: String;
begin
  If LLAMA.Enabled = False Then
  Begin
      If  MessageDlg('CANCELAR OPERACION DEBIDO A QUE EL ASOCIADO NO SE PRESENTO, ESTA SEGURO(A)....' ,mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
       Begin
          xHora := Dm1.HoraSys;
          //GRABA DATOS DE FINAL ATENCION
          XSQL:=' UPDATE ASO_TICKETS_RUTA SET HORINIATE='''+xHora+''',HORFINATE='''+xHora+''',USUARIO='''+DM1.xUsuario+''',ATENCION=''N'',FINALIZA=''17'',SEGFINATE='+IntToStr(DM1.xsegundo(xHora))+', HORGENSOLCRE='''+vGenSolCre+''' '
                +' ,HORAPRSOLCRE='''+vAprSolCre+''' '
                +' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+XOPERA+''' AND TICKETS='''+TRIM(edtVentanilla.Text)+''' ';
          DM1.CDSQRY1.Close;
          DM1.CDSQRY1.DataRequest(XSQL);
          DM1.CDSQRY1.Execute;

          ATENDER.Enabled      := FALSE;
          RELLAMA.Enabled      := FALSE;
          LLAMA.Enabled        := TRUE;
          gbFINALIZA.Enabled   := FALSE;
          SOLTAR.Enabled       := False;
          RESAGADOS.Enabled    := True;
          edtVentanilla.Text   :='';
          SEMAFORO.Brush.Color := clLime;
          edtNombres.Text      :='';
          edtDNI.Text          :='';
          edtAsoid.Text        :='';
          ENESPERAClick(SELF);
          limpiaCronometro;
       End
     Else Exit;
  End
  Else
  Begin
     ShowMessage('PRIMERO DEBE DE LLAMAR PARA ATENCIÓN');
  End;
end;

procedure TfVentanilla.BitBtn5Click(Sender: TObject);
begin
  pnlEncuesta.Visible := False;
end;

procedure TfVentanilla.edtEncuestaKeyPress(Sender: TObject; var Key: Char);
var
  xSql:String;
begin
  If not(Key in ['1'..'5',#8]) then
  begin
    Key:=#0;
  end
  else
  begin
      xSql:= 'UPDATE ASO_TICKETS_RUTA SET NIVSAT='''+Key+''''
            +' WHERE OFICINA='''+DM1.xOfdesid+''' AND FECHA='''+DateToStr(DM1.FechaSys)+''' AND OPERACION='''+XOPERA+''' AND TICKETS='''+TRIM(edtVentanilla.Text)+''' ';
      DM1.CDSQRY1.Close;
      DM1.CDSQRY1.DataRequest(XSQL);
      DM1.CDSQRY1.Execute;
      edtVentanilla.Text   :='';
      ShowMessage('GRACIAS, PRESIONE LA TECLA ENTER');
      pnlEncuesta.Visible:=false;
      principal.Enabled:=true;
  end;

end;

// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
Function TfVentanilla.ConsultaAtencion:boolean;
var
   xSql:String;
   valor: boolean;
begin
   valor:= false;
   xSql:='SELECT FLGATE FROM TICKET_MOD_CTRL_VEN_MOV WHERE OFIDES='+QuotedStr(DM1.xOfdesid)+
         ' AND NUMVEN='+QuotedStr(DM1.xventanilla)+
         ' AND PANTALLA='+QuotedStr(XLLAMA)+
         ' AND USUVEN='+QuotedStr(DM1.xUsuario)+
         ' AND TRUNC(FECATE)=TRUNC(SYSDATE)'+
         ' AND FLGATE=''M'' ';
   DM1.CDSQRY1.Close;
   DM1.CDSQRY1.DataRequest(XSQL);
   DM1.CDSQRY1.Open;

  // If DM1.CDSQRY1.FieldByName('FLGATE').AsString = 'M' Then
   If DM1.CDSQRY1.RecordCount>0 Then
   Begin
     ShowMessage('PRIMERO DEBE FINALIZAR LA OPERACIÓN EN EL SISTEMA DE ATENCIÓN');
     valor:= true;
   End;
   Result:=valor;
end;
// Fin HPC_201802_TICKET


// Inicio HPC_201802_TICKET
// Implementación de fase 2 (Controlar Sistemas de Atención)
procedure TfVentanilla.DesacIniAteMod;
var xsql:String;
begin
  XSQL:= 'UPDATE TICKET_MOD_CTRL_VEN_MOV SET FLGATE=Null WHERE OFIDES='+
  QuotedStr(DM1.xOfdesid)+' AND NUMVEN='+QuotedStr(DM1.xventanilla)+' AND PANTALLA='+QuotedStr(XLLAMA)+' AND USUVEN='+QuotedStr(DM1.xUsuario)
  +' AND TRUNC(FECATE)=TRUNC(SYSDATE)';
  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(XSQL);
  DM1.CDSQRY1.Execute;
  DM1.CDSQRY1.Close;
end;
// Fin HPC_201802_TICKET

end.
//Final   HPC_201801_TICKET
