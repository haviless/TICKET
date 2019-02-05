object fCuestionario: TfCuestionario
  Left = 309
  Top = 200
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'CUESTIONARIO'
  ClientHeight = 397
  ClientWidth = 935
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape3: TShape
    Left = 22
    Top = 186
    Width = 899
    Height = 4
  end
  object Panel2: TPanel
    Left = 2
    Top = 0
    Width = 939
    Height = 398
    TabOrder = 1
    object Label3: TLabel
      Left = 303
      Top = 7
      Width = 303
      Height = 21
      Caption = 'EVALUACI'#211'N DE CONOCIMIENTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Unicode MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape1: TShape
      Left = 12
      Top = 33
      Width = 909
      Height = 53
    end
    object lbltema1: TLabel
      Left = 100
      Top = 40
      Width = 49
      Height = 16
      Caption = 'Tema :'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label5: TLabel
      Left = 20
      Top = 40
      Width = 49
      Height = 16
      Caption = 'Tema :'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 22
      Top = 64
      Width = 51
      Height = 16
      Caption = 'Intento:'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblintento: TLabel
      Left = 100
      Top = 64
      Width = 42
      Height = 16
      Caption = 'Tema :'
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Shape2: TShape
      Left = 22
      Top = 220
      Width = 899
      Height = 4
    end
    object Shape4: TShape
      Left = 22
      Top = 179
      Width = 899
      Height = 4
    end
    object Shape5: TShape
      Left = 21
      Top = 268
      Width = 899
      Height = 4
    end
    object Shape6: TShape
      Left = 21
      Top = 312
      Width = 899
      Height = 4
    end
    object Shape7: TShape
      Left = 21
      Top = 358
      Width = 899
      Height = 4
    end
    object Shape8: TShape
      Left = 12
      Top = 130
      Width = 13
      Height = 233
      Pen.Style = psClear
    end
    object Shape9: TShape
      Left = 908
      Top = 130
      Width = 17
      Height = 233
      Pen.Style = psClear
    end
    object btnSiguiente: TBitBtn
      Left = 818
      Top = 367
      Width = 75
      Height = 25
      Caption = 'Siguiente'
      TabOrder = 0
      OnClick = btnSiguienteClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
        00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
        70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
        70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
        70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
        70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
        70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
        00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
      NumGlyphs = 2
    end
    object Panel3: TPanel
      Left = 11
      Top = 88
      Width = 909
      Height = 33
      Caption = 'PREGUNTAS'
      Color = clScrollBar
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object rb1: TRadioButton
      Left = 21
      Top = 184
      Width = 900
      Height = 35
      Caption = 'rb1'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 2
      WordWrap = True
    end
    object rb2: TRadioButton
      Left = 21
      Top = 226
      Width = 900
      Height = 41
      Caption = 'rb2'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      WordWrap = True
    end
    object rb3: TRadioButton
      Left = 21
      Top = 272
      Width = 900
      Height = 37
      Caption = 'rb3'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 4
      WordWrap = True
    end
    object rb4: TRadioButton
      Left = 20
      Top = 316
      Width = 900
      Height = 40
      Caption = 'rb4'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 5
      WordWrap = True
    end
    object txtcodcap: TEdit
      Left = 24
      Top = 8
      Width = 25
      Height = 21
      TabOrder = 6
      Visible = False
    end
    object txtpregunta: TEdit
      Left = 64
      Top = 8
      Width = 25
      Height = 21
      TabOrder = 7
      Visible = False
    end
    object btnfinalizar: TBitBtn
      Left = 809
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Finalizar'
      TabOrder = 8
      OnClick = btnfinalizarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object btnclock: TBitBtn
      Left = 832
      Top = 44
      Width = 81
      Height = 33
      Caption = '30 min'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F77777FFF333333009999900
        3333333777777777FF33330998FFF899033333777333F3777FF33099FFFCFFF9
        903337773337333777F3309FFFFFFFCF9033377333F3337377FF098FF0FFFFFF
        890377F3373F3333377F09FFFF0FFFFFF90377F3F373FFFFF77F09FCFFF90000
        F90377F733377777377F09FFFFFFFFFFF90377F333333333377F098FFFFFFFFF
        890377FF3F33333F3773309FCFFFFFCF9033377F7333F37377F33099FFFCFFF9
        90333777FF37F3377733330998FCF899033333777FF7FF777333333009999900
        3333333777777777333333333000003333333333377777333333}
      NumGlyphs = 2
    end
    object lblpregunta: TMemo
      Left = 14
      Top = 130
      Width = 901
      Height = 46
      BorderStyle = bsNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
  end
  object DBGrid1: TDBGrid
    Left = 96
    Top = 424
    Width = 320
    Height = 120
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object wwDBGrid1: TwwDBGrid
    Left = 16
    Top = 496
    Width = 320
    Height = 120
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    TabOrder = 3
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object Panel1: TPanel
    Left = 2
    Top = 2
    Width = 938
    Height = 396
    TabOrder = 0
    object Label1: TLabel
      Left = 352
      Top = 16
      Width = 137
      Height = 21
      Caption = 'CUESTIONARIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Unicode MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 55
      Height = 20
      Caption = 'Tema :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbltema: TLabel
      Left = 128
      Top = 48
      Width = 55
      Height = 20
      Caption = 'Tema :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object StaticText1: TStaticText
      Left = 24
      Top = 218
      Width = 559
      Height = 24
      Caption = 
        'd) Cuando se culmine el cuestionario se deber'#225' dar clic en la op' +
        'ci'#243'n "Finalizar".'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object StaticText2: TStaticText
      Left = 24
      Top = 194
      Width = 539
      Height = 24
      Caption = 
        'c) El cuestionario consta de 10 preguntas con alternativa '#250'nica ' +
        'para marcar.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object StaticText3: TStaticText
      Left = 24
      Top = 168
      Width = 847
      Height = 24
      Caption = 
        'b) Una vez empezado el cuestionario no se deber'#225' de cerrar el si' +
        'stema. En caso suceda lo indicado, perder'#225' un intento.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object StaticText4: TStaticText
      Left = 24
      Top = 120
      Width = 782
      Height = 24
      Caption = 
        'a) El siguiente cuestionario tendr'#225' una duraci'#243'n de 15 minutos, ' +
        'el cual se deber'#225' de responder en su totalidad.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object StaticText5: TStaticText
      Left = 16
      Top = 85
      Width = 485
      Height = 24
      Caption = 
        'Debe tener claro las instrucciones antes de empezar el cuestiona' +
        'rio.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object StaticText7: TStaticText
      Left = 42
      Top = 142
      Width = 843
      Height = 24
      Caption = 
        'Opcionalmente, tendr'#225' un 2do intento para poder resolver nuevame' +
        'nte el cuestionario con una duraci'#243'n de 10 minutos.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object grbBotones: TGroupBox
      Left = 592
      Top = 304
      Width = 329
      Height = 81
      TabOrder = 6
      object btnExportar: TBitBtn
        Left = 14
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Notas'
        TabOrder = 0
        OnClick = btnExportarClick
        Glyph.Data = {
          56080000424D560800000000000036000000280000001A0000001A0000000100
          18000000000020080000C40E0000C40E00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF7F7F7E4E4E4EBEBEBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B5B52E2E2E77
          7777BFBFBFC4C4C4BEBEBEF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFD2D2D2919191F7F7F79696968F8F8F8F8F8F9898989D9D
          9D989898C4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF878787FB
          FBFBFDFFFFFFFFFFFFFFFFC8C9CAA9AAABACACAC9898987272727474747E7E7E
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCFCFCF878787F8FFFFFF00005B4515C2C1BCFFFFF6FCF9
          F6FFFFFFF1F1F1C9C9C9CFCFCFC2C2C25F5F5F161616AFAFAFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF878787F7
          FFFFFF0203F9FFFF55271D603730430200FFFFFFFFFFFFFFFFFFFFFFFFDADADA
          ECECEC525252ADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCFCFCF878787F7FFFFFF0400E2FFFF4B50FF5A5FFFB49B
          82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4BAEAEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF878787F7
          FFFFFF0000EC4558D4E3FF3843FF1B1EFFFFFFF9D0D0D0D7D7D7B1B1B1FFFFFF
          FFFFFF4B4B4BAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCFCFCF878787F7FDFDFFFFFFFF9492FF0000FFBBAD0712
          FF1B1BFEFFFFFAFFFFFF9F9F9FCBCBCBD9D9D94F4F4FAEAEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF878787F8
          FFFFFF0000625D2FAABBAAE8E6D0F5E9C4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF4B4B4BAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCFCFCF878787F7FFFFFF0304FFFFFF5B364C68485F4708
          00FFFFFFE3E3E3E7E7E7D1D1D1FFFFFFFFFFFF4B4B4BAEAEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF878787F7
          FFFFFF0500D6FFFF4145FF4D50FFC9B7A9FFFFFFE7E7E7F1F1F1939393D9D9D9
          E2E2E24E4E4EAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCFCFCF878787F7FFFFFF0000F82933F5FFFF3C48FF0000
          FFFFFFFFFFFFFFFFFFFFF7F7F7F9F9F9F8F8F84C4C4CAEAEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF878787F7
          FDFDFFFFFFE79A91FF0000FFD8B13A46FF1616FEFFFFF6F7F7F7F3F3F3FFFFFF
          FFFFFF4B4B4BAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCFCFCF878787F8FFFFFF000078764D9AA083CCC1A3D7C3
          98FFFFFFD5D5D5DEDEDE8E8E8EECECECEFEFEF4D4D4DAEAEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF878787F7
          FFFFFF0203FFFFFF60457A70598E4B0D00FFFFFFFFFFFFFFFFFFDADADAE6E6E6
          EBEBEB4D4D4DAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCFCFCF878787F7FFFFFF0200CBFCFF383EFF3E40FFDBD2
          CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4BAEAEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF878889F9
          FFFFFF1010FF1F1DFFF1DB605DFD0000FFFFFFF7CACAC7D0D0D0919191FEFEFE
          FCFCFC4C4C4CAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCFD0D187877EEAE7D3F2FFFFF2BABDF10507FFD5B35C65
          FF4242FFFFFFFFFFFFFFBFBFBFD4D4D4DFDFDF4E4E4EAEAEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCED7D9984A3AED
          3818C4B697C2C5A7C1CDADD9E2DAF8FEF1F6FAEDEFF2F5FFFFFFFFFFFFFFFFFF
          FFFFFF4B4B4BAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFCCDCDCAE1A1BFF0000F42111F22514F51B0BD38260C1B9
          8DC2B185CAC2A8DAE4ECD8DFE4DCE3E7FFFFFF4B4B4CAEAEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D4D454505057
          6464FA0000FF0000FF0000FF0000FF0000FF0000ED3722C4AA73C79E6AC8A070
          D8E7EC4E5353AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8C3C36B8888699696BF4040E005
          05D8090AEB0000FF0000FF0000FF0000DE895355250DADB3B6FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFDAE9E99AB1B195B4B4AB8888C02121B01E1EB71B1C
          FF0000720000AABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF8FFFFC5D7D7BED2D2BFCDCDB04848200000A8AEAEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          EEFAFAE4EAEAF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      end
      object btnEmpezar: TBitBtn
        Left = 122
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Empezar'
        TabOrder = 1
        OnClick = btnEmpezarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
          00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
          70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
          70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
          70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
          70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
          70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
          00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
        NumGlyphs = 2
      end
      object btnSalir: TBitBtn
        Left = 238
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Salir'
        TabOrder = 2
        OnClick = btnSalirClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
          F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
          000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
          338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
          45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
          3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
          F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
          000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
          338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
          4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
          8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
          333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
          0000}
        NumGlyphs = 2
      end
    end
  end
  object pnlAdvertencias: TPanel
    Left = 437
    Top = 428
    Width = 241
    Height = 242
    ParentBackground = False
    TabOrder = 4
    TabStop = True
    Visible = False
    object Shape15: TShape
      Left = 1
      Top = 1
      Width = 239
      Height = 24
      Align = alTop
      Brush.Color = clRed
    end
    object Label48: TLabel
      Left = 66
      Top = 4
      Width = 108
      Height = 20
      Caption = '* * NOTAS * *'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Shape16: TShape
      Left = 0
      Top = 186
      Width = 240
      Height = 56
      Brush.Color = clRed
    end
    object lblextorno: TLabel
      Left = 82
      Top = 187
      Width = 79
      Height = 23
      Caption = 'GRACIAS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial Black'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object DBGNOTAS: TwwDBGrid
      Left = 8
      Top = 33
      Width = 225
      Height = 140
      DisableThemesInTitle = False
      Selected.Strings = (
        'EVALUACION'#9'19'#9'EVALUACI'#211'N'#9'F'
        'NOTA'#9'13'#9'NOTA')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DSAPRUEBA
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
    object BitBtn1: TBitBtn
      Left = 153
      Top = 212
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 888
    Top = 3
  end
  object CDSAPRUEBA: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EVALUACION'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NOTA'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 704
    Top = 524
    Data = {
      520000009619E0BD01000000180000000200000000000300000052000A455641
      4C554143494F4E0100490000000100055749445448020002001900044E4F5441
      01004900000001000557494454480200020014000000}
  end
  object DSAPRUEBA: TDataSource
    DataSet = CDSAPRUEBA
    Left = 703
    Top = 493
  end
end
