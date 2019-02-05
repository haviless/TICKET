//------------------------------------------------------------------------------------
// Unidad            : U_EVALVENTANILLA
// Formulario        : fCuestionario - Cuestionario
// Fecha de Creación : 04/07/2018
// Autor             : Equipo de Desarrollo.
// Objetivo          : Realizar cuestionario
// HPC_201803_TICKET : 04/07/2018 Implementación de cuestionario

//Inicio   HPC_201803_TICKET
unit U_EVALVENTANILLA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Wwdbigrd, Wwdbgrid,
  jpeg, DB, DBClient;

type
  TfCuestionario = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbltema: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText7: TStaticText;
    Panel2: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbltema1: TLabel;
    btnSiguiente: TBitBtn;
    Panel3: TPanel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    txtcodcap: TEdit;
    lblintento: TLabel;
    txtpregunta: TEdit;
    btnfinalizar: TBitBtn;
    Timer2: TTimer;
    btnclock: TBitBtn;
    DBGrid1: TDBGrid;
    wwDBGrid1: TwwDBGrid;
    Shape1: TShape;
    lblpregunta: TMemo;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    pnlAdvertencias: TPanel;
    Shape15: TShape;
    Label48: TLabel;
    Shape16: TShape;
    lblextorno: TLabel;
    DBGNOTAS: TwwDBGrid;
    BitBtn1: TBitBtn;
    CDSAPRUEBA: TClientDataSet;
    DSAPRUEBA: TDataSource;
    grbBotones: TGroupBox;
    btnExportar: TBitBtn;
    btnEmpezar: TBitBtn;
    btnSalir: TBitBtn;
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEmpezarClick(Sender: TObject);
    procedure btnSiguienteClick(Sender: TObject);
    procedure btnfinalizarClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    fechaActual:String;
    minutos:Integer;
    inicio:boolean;
    function generarNumeroAleatorio():Integer;
    procedure generarPregunta();
    procedure grabarRespuesta();
    procedure siguiente();
    procedure calificacion();
  public
    { Public declarations }
  end;

var
  fCuestionario: TfCuestionario;

implementation

uses ASODM;

{$R *.dfm}

procedure TfCuestionario.btnSalirClick(Sender: TObject);
begin
close;
end;

procedure TfCuestionario.FormCreate(Sender: TObject);
   var xSQL:String;
begin
  inicio:=false;
  Panel1.Visible:=true;
  Panel2.Visible:=false;
  lbltema.Caption:='';
  lbltema1.Caption:='';
  xSQL:='SELECT CODCAP,DESCAP,TIEM01,TIEM02,CODEST FROM ASO_TICKETS_CAPACITA WHERE CODEST=1';
  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(xSQL);
  DM1.CDSQRY1.Open;
  If DM1.CDSQRY1.RecordCount>0 Then
  Begin
    lbltema.Caption:=DM1.CDSQRY1.FieldByName('DESCAP').AsString;
    lbltema1.Caption:=DM1.CDSQRY1.FieldByName('DESCAP').AsString;
    txtcodcap.Text:=DM1.CDSQRY1.FieldByName('CODCAP').AsString;
  End;
end;

procedure TfCuestionario.btnEmpezarClick(Sender: TObject);
var xSQL:String;
min_intento01,min_intento02:Integer;
intento:String;
begin
  lblintento.Caption:='';
  inicio:=false;
  xSQL:='SELECT TO_CHAR(SYSDATE,''DD/MM/YYYY HH24:MI:SS'') FECHA FROM DUAL';
  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(xSQL);
  DM1.CDSQRY1.Open;
  If DM1.CDSQRY1.RecordCount>0 Then
  begin
    fechaActual:= DM1.CDSQRY1.FieldByName('FECHA').AsString;
  End;


  minutos:=0;
  xSQL:='SELECT TIEM01,TIEM02 FROM ASO_TICKETS_CAPACITA WHERE CODCAP='+txtcodcap.Text;
  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(xSQL);
  DM1.CDSQRY1.Open;
  If DM1.CDSQRY1.RecordCount>0 Then
  begin
    min_intento01:= DM1.CDSQRY1.FieldByName('TIEM01').AsInteger;
    min_intento02:= DM1.CDSQRY1.FieldByName('TIEM02').AsInteger;
  End;

  xSQL:=''+
  'SELECT SUM(CASE WHEN B.NROINT=1 THEN 1 '+
  '          ELSE 0 END) INTENTO1,        '+
  'SUM(CASE WHEN B.NROINT=2 THEN 1        '+
  '          ELSE 0 END) INTENTO2         '+
  'FROM  ASO_TICKETS_PREGUNTA A,ASO_TICKETS_EVALUACION B   '+
  'WHERE A.CODCAP='+txtcodcap.Text+
  ' AND A.CODEST=1 '+
  ' AND A.CODCAP = B.CODCAP '+
  ' AND A.CODPRE = B.CODPRE  '+
  ' AND B.CODUSU='+QuotedStr(Trim(DM1.xUsuario));
  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(xSQL);
  DM1.CDSQRY1.Open;
  If DM1.CDSQRY1.RecordCount>0 Then
  begin
    IF DM1.CDSQRY1.FieldByName('INTENTO1').asInteger= 0 Then
    Begin
      lblintento.Caption:= '1';
      intento:='Primer';
      minutos:= min_intento01;
    End
    Else
    Begin
      IF DM1.CDSQRY1.FieldByName('INTENTO2').asInteger=0 Then
      Begin
        lblintento.Caption:= '2';
        intento:='Segundo';
        minutos:=min_intento02;
      End;
    End;
  End;
  If lblintento.Caption<>'' Then
  Begin

    If MessageDlg('¿Esta seguro de iniciar el '+intento+' intento',mtconfirmation,[mbYes,MbNo],0)=mrYes then
    Begin
      Panel1.Visible:=false;
      Panel2.Visible:=true;
      btnSiguiente.Visible:=true;
      btnfinalizar.Visible:=false;
      inicio:=true;
      generarPregunta();
    End
    Else
    Begin
      Exit;
    End;
  End
  Else
  Begin
     MessageDlg('Ya no tiene oportunidad a otro intento', mtInformation, [mbOK], 0);
  End;

end;
function TfCuestionario.generarNumeroAleatorio():Integer;
var valor:Integer;
xSQL:String;
minimo:Integer;
maximo:Integer;
begin
  valor:=-1;
  xSQL:=''+
  'SELECT MIN(N) MI,MAX(N) MA FROM (     '+
  '  SELECT CODPRE,DESPRE,ROW_NUMBER() OVER(ORDER BY CODPRE) N FROM(  '+
  '    SELECT DISTINCT A.CODCAP,A.CODPRE,A.DESPRE FROM ASO_TICKETS_PREGUNTA A LEFT JOIN ASO_TICKETS_EVALUACION B  '+
  '    ON A.CODCAP=B.CODCAP AND A.CODPRE=B.CODPRE AND B.NROINT='+lblintento.Caption+' AND B.CODUSU='+QuotedStr(Trim(DM1.xUsuario))+'  '+
  '    WHERE A.CODEST=1 AND A.CODCAP='+txtcodcap.Text+' AND B.CODALT IS NULL  '+
  '  ) ' +
  ' )';
  DM1.cdsQry1.Close;
  DM1.cdsQry1.DataRequest(xSQL);
  DM1.cdsQry1.Open;
  If DM1.cdsQry1.RecordCount>0 Then
  Begin
    minimo:=DM1.cdsQry1.FieldByName('mi').AsInteger;
    maximo:=DM1.cdsQry1.FieldByName('ma').AsInteger;
  End;
  if maximo=1 Then
  Begin
    btnSiguiente.Visible:=false;
    btnfinalizar.Visible:=true;
  End;
  If minimo=0 Then
  Begin
     Panel1.Visible:=true;
     Panel2.Visible:=false;
     MessageDlg('Ha finalizado la evaluación', mtInformation, [mbOK], 0);
     calificacion;
  End;
  valor:=1 + Random(maximo);
  Result:=valor;
end;
procedure TfCuestionario.generarPregunta();
var item:Integer;
xSQL:String;
codpre:Integer;
cont:Integer;
begin
  item:=generarNumeroAleatorio();
  xSQL:=''+
  'SELECT CODPRE,((SELECT COUNT(1) FROM ASO_TICKETS_PREGUNTA WHERE CODEST = 1 AND CODCAP = '+txtcodcap.Text+') - CANTIDAD +1)||''.- ''||DESPRE DESPRE FROM (     '+
  '  SELECT CODCAP,CODPRE,DESPRE,COUNT(1) OVER () CANTIDAD,ROW_NUMBER() OVER(ORDER BY CODPRE) N FROM(  '+
  '    SELECT DISTINCT A.CODCAP,A.CODPRE,A.DESPRE FROM ASO_TICKETS_PREGUNTA A LEFT JOIN ASO_TICKETS_EVALUACION B  '+
  '    ON A.CODCAP=B.CODCAP AND A.CODPRE=B.CODPRE AND B.NROINT='+lblintento.Caption+' AND B.CODUSU='+QuotedStr(Trim(DM1.xUsuario))+'    '+
  '    WHERE A.CODEST=1 AND A.CODCAP='+txtcodcap.Text+' AND B.CODALT IS NULL  '+
  '  ) ' +
  ' ) WHERE N='+inttostr(item);

  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(xSQL);
  DM1.CDSQRY1.Open;
  If DM1.CDSQRY1.RecordCount>0 Then
  begin
    lblpregunta.Text:= DM1.CDSQRY1.FieldByName('DESPRE').AsString;
    txtpregunta.Text:=DM1.CDSQRY1.FieldByName('CODPRE').AsString;
    codpre:= DM1.CDSQRY1.FieldByName('CODPRE').AsInteger;
  End;

  cont:=1;
  xSQL:='SELECT CODCAP,CODALT,DESALT FROM ASO_TICKETS_ALTERNATIVA WHERE CODCAP='+txtcodcap.Text+' AND CODPRE='+inttostr(codpre);
  DM1.CDSQRY1.Close;
  DM1.CDSQRY1.DataRequest(xSQL);
  DM1.CDSQRY1.Open;
  DM1.CDSQRY1.First;
  While Not DM1.CDSQRY1.Eof Do
  Begin
    if  cont=1 Then
    Begin
      rb1.Caption:=DM1.CDSQRY1.FieldByName('DESALT').AsString;
      rb1.Tag:=DM1.CDSQRY1.FieldByName('CODALT').AsInteger;
    End;
    if  cont=2 Then
    Begin
      rb2.Caption:=DM1.CDSQRY1.FieldByName('DESALT').AsString;
      rb2.Tag:=DM1.CDSQRY1.FieldByName('CODALT').AsInteger;
    End;
    if  cont=3 Then
    Begin
      rb3.Caption:=DM1.CDSQRY1.FieldByName('DESALT').AsString;
      rb3.Tag:=DM1.CDSQRY1.FieldByName('CODALT').AsInteger;
    End;
    if  cont=4 Then
    begin
      rb4.Caption:=DM1.CDSQRY1.FieldByName('DESALT').AsString;
      rb4.Tag:=DM1.CDSQRY1.FieldByName('CODALT').AsInteger;
    End;
    cont:=cont+1;
    DM1.CDSQRY1.Next;
  End;
  rb1.Checked:=false;
  rb2.Checked:=false;
  rb3.Checked:=false;
  rb4.Checked:=false;
end;
procedure TfCuestionario.grabarRespuesta();
var xSQL:String;
codalt:Integer;
begin

  If rb1.Checked Then codalt:=rb1.Tag;
  If rb2.Checked Then codalt:=rb2.Tag;
  If rb3.Checked Then codalt:=rb3.Tag;
  If rb4.Checked Then codalt:=rb4.Tag;

  xSQL:='INSERT INTO ASO_TICKETS_EVALUACION(CODCAP,CODEVA,CODPRE,CODALT,CODUSU,CODOFI,NROINT,FECREG,USUREG) VALUES('+
  QuotedStr(txtcodcap.Text)+',(SELECT NVL(MAX(CODEVA),0)+1 FROM ASO_TICKETS_EVALUACION),'+
  ''+txtpregunta.text+','+
  ''+inttostr(codalt)+','+
  ''+QuotedStr(Trim(DM1.xUsuario))+','+
  ''+QuotedStr(Trim(DM1.xOfdesid))+','+
  ''+lblintento.Caption+','+
  'SYSDATE,'+
  ''+QuotedStr(Trim(DM1.xUsuario))+')';
  DM1.CDSQRY2.Close;
  DM1.CDSQRY2.DataRequest(XSQL);
  DM1.CDSQRY2.Execute;
end;
procedure TfCuestionario.btnSiguienteClick(Sender: TObject);
begin
   siguiente();
end;
procedure TfCuestionario.siguiente();
  var q:boolean;
begin
  q:=true;
   If rb1.Checked Then q:=false;
   If rb2.Checked Then q:=false;
   If rb3.Checked Then q:=false;
   If rb4.Checked Then q:=false;
   If q Then
   Begin
    MessageDlg('Seleccione una respuesta', mtError, [mbOK], 0);
    Exit;
   End;
   grabarRespuesta();
   generarPregunta();
end;

procedure TfCuestionario.btnfinalizarClick(Sender: TObject);
begin
   siguiente();
end;

procedure TfCuestionario.Timer2Timer(Sender: TObject);
var xSQL:String;
minutos_restantes:Integer;
begin
  If inicio Then
  Begin
    xSQL:='SELECT TRUNC((SYSDATE-TO_DATE('+QuotedStr(fechaActual)+',''DD/MM/YYYY HH24:MI:SS'')) * 24 * 60) MINUTO FROM DUAL';
    DM1.CDSQRY1.Close;
    DM1.CDSQRY1.DataRequest(xSQL);
    DM1.CDSQRY1.Open;
    minutos_restantes:= minutos-DM1.CDSQRY1.FieldByName('MINUTO').AsInteger;
    btnclock.Caption:= inttostr(minutos_restantes)+' min';
    If minutos_restantes=0 Then
    Begin
      inicio:=false;
      MessageDlg('Ha finalizado la evaluación', mtInformation, [mbOK], 0);
      close;
    End;
  End;
end;

procedure TfCuestionario.btnExportarClick(Sender: TObject);
var  xSQL:String;
begin
  grbBotones.Enabled := False;
  calificacion;
end;

procedure TfCuestionario.calificacion;
var xsql:String;
begin
   xSQL:='' +
   'SELECT B.USERNOM,D.OFDESNOM,E.DESZONCOM,'+
   'NVL(TRIM(TO_CHAR(SUM(CASE WHEN A.NROINT=1 THEN C.PUNALT ELSE NULL END))),''SIN NOTA'') INTENTO01,'+
   'NVL(TRIM(TO_CHAR(SUM(CASE WHEN A.NROINT=2 THEN C.PUNALT ELSE NULL END))),''SIN NOTA'') INTENTO02 '+
   'FROM ASO_TICKETS_EVALUACION A,TGE006 B,ASO_TICKETS_ALTERNATIVA C,APO110 D,DB2ADMIN.CRE_ZON_GES_COM_MAE E   '+
   'WHERE A.CODUSU='+QuotedStr(Trim(DM1.xUsuario))+' AND  A.CODUSU=B.USERID  AND A.CODCAP = C.CODCAP  AND A.CODPRE = C.CODPRE AND A.CODALT=C.CODALT AND '+
   '      A.CODOFI=D.OFDESID AND D.CODZONCOM = E.CODZONCOM(+)  '+
   'GROUP BY B.USERNOM,D.OFDESNOM,E.DESZONCOM  '+
   'ORDER BY E.DESZONCOM,D.OFDESNOM,B.USERNOM ';
   DM1.cdsQry3.Close;
   DM1.cdsQry3.DataRequest(xSql);
   DM1.cdsQry3.Open;

   If DM1.CDSQRY3.RecordCount>0 Then
   Begin
     If DM1.CDSQRY3.FieldByName('INTENTO01').AsCurrency>0 Then
     begin
       CDSAPRUEBA.Insert;
       CDSAPRUEBA.FieldByName('EVALUACION').AsString :='SEGUNDO INTENTO';
       CDSAPRUEBA.FieldByName('NOTA').AsString      := DM1.CDSQRY3.FieldByName('INTENTO02').AsString;
       CDSAPRUEBA.Insert;
       CDSAPRUEBA.FieldByName('EVALUACION').AsString :='PRIMER INTENTO';
       CDSAPRUEBA.FieldByName('NOTA').AsString      := DM1.CDSQRY3.FieldByName('INTENTO01').AsString;
       CDSAPRUEBA.First;
       pnlAdvertencias.Left    := 349;
       pnlAdvertencias.Top     := 124;
       grbBotones.Enabled      := False;
       pnlAdvertencias.Visible := True;
     end;
   End
   Else
   Begin
     ShowMessage('Sin evaluación');
     grbBotones.Enabled      := True;
   End;

end;

procedure TfCuestionario.BitBtn1Click(Sender: TObject);
begin
 grbBotones.Enabled      := True;
 pnlAdvertencias.Visible := False;
 CDSAPRUEBA.EmptyDataSet;
end;

end.
//Final   HPC_201803_TICKET
