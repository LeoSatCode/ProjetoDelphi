object frmAlterarSenha: TfrmAlterarSenha
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Alterar Senha'
  ClientHeight = 325
  ClientWidth = 361
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    361
    325)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 47
    Top = 197
    Width = 145
    Height = 20
    Caption = 'DIGITE NOVAMENTE:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI Variable Text Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblUsuarioLogado: TLabel
    Left = 0
    Top = 0
    Width = 377
    Height = 18
    Alignment = taCenter
    AutoSize = False
    Caption = 'XXXXXXXXXXXXXX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 47
    Top = 35
    Width = 102
    Height = 20
    Caption = 'SENHA ATUAL:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI Variable Text Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 47
    Top = 114
    Width = 99
    Height = 20
    Caption = 'NOVA SENHA:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI Variable Text Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtSenhaAtual: TEdit
    Left = 47
    Top = 61
    Width = 271
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
  end
  object edtNovaSenha: TEdit
    Left = 47
    Top = 140
    Width = 271
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtSenhaNovamente: TEdit
    Left = 47
    Top = 223
    Width = 271
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
  end
  object pnlFechar: TPanel
    Left = 47
    Top = 270
    Width = 103
    Height = 23
    Cursor = crHandPoint
    Anchors = [akLeft, akRight]
    Caption = 'Fechar'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Variable Text Semibold'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    TabStop = True
    OnClick = pnlFecharClick
    OnEnter = OnTabEnter
    OnExit = OnTabExit
    OnMouseEnter = OnMouseEnter
    OnMouseLeave = OnMouseLeave
    DesignSize = (
      103
      23)
    object imgj4: TImage
      Left = 5
      Top = 3
      Width = 22
      Height = 19
      Anchors = [akLeft, akTop, akRight, akBottom]
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
        001008060000001FF3FF61000000097048597300000B1300000B1301009A9C18
        000000584944415478DA636480022929A9FF0C448267CF9E31C2D88C54370059
        9218405F03A06A3A816A2A28318001D910720D801B82D3002263A59352031A28
        F14203506D23B9068035931B8870CD241B800D50DF0062005573230069A461B4
        756035F10000000049454E44AE426082}
    end
    object PngBitBtn1: TPngBitBtn
      Left = 93
      Top = 29
      Width = 42
      Height = 14
      Cursor = crHandPoint
      Cancel = True
      Caption = 'FECHAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI Variable Text Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = False
      OnClick = pnlFecharClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000097048597300000B1300000B1301009A9C18000000584944415478DA
        636480022929A9FF0C448267CF9E31C2D88C543700599218405F03A06A3A816A
        2A28318001D910720D801B82D3002263A59352031A28F14203506D23B9068035
        931B8870CD241B800D50DF0062005573230069A461B4756035F1000000004945
        4E44AE426082}
    end
  end
  object pnlAlterar: TPanel
    Left = 215
    Top = 270
    Width = 103
    Height = 23
    Cursor = crHandPoint
    Caption = 'Alterar'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Variable Text Semibold'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    TabStop = True
    OnClick = pnlAlterarClick
    OnEnter = OnTabEnter
    OnExit = OnTabExit
    OnMouseEnter = OnMouseEnter
    OnMouseLeave = OnMouseLeave
    DesignSize = (
      103
      23)
    object imgss: TImage
      Left = 15
      Top = 4
      Width = 10
      Height = 19
      Anchors = [akLeft, akTop, akRight, akBottom]
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
        00100803000000282D0F53000000017352474201D9C92C7F0000000970485973
        00000B1300000B1301009A9C1800000084504C5445000000D3D3D3B1B1B1B1B1
        B1B1B1B1A6A6A6BCBCBCB1B1B1B1B1B1D3D3D3BCBCBCB1B1B1A6A6A6B1B1B1BC
        BCBCB1B1B19B9B9BBCBCBCBCBCBCFFFFFFB1B1B1BCBCBC000000BCBCBCBCBCBC
        B1B1B1FFFFFF434343B1B1B1B1B1B1BCBCBCBCBCBCB1B1B1B1B1B1B1B1B1BCBC
        BC7A7A7AFFFFFFB1B1B1BCBCBCBCBCBCBCBCBCC8C8C8C8C8C8003FC030000000
        2C74524E53000BB6EA444BE4FFC316BF9B41E7E33A09BB9E049AB506B4A9C20D
        07A6A2BC6FA5B9ADA00801D33C3DE249488FFA6F090000007F4944415478DA63
        6440038C484C20F80314606564847119193F0305F8183F820404C002AF8102EC
        3F417C3146C67F7FD8199FC104A47FB1FF62677CFD9D012620FF589295F13DE7
        73B88012E37D06A53B2026444095F1CFDF3F4F1990046E835D821080021C027C
        9237A17C0DC6EB2001AD2730254A4C57513C87E15B0800005A202711CAAA9D31
        0000000049454E44AE426082}
      ExplicitWidth = 16
    end
    object Image1: TImage
      Left = 9
      Top = 3
      Width = 18
      Height = 19
      Anchors = [akLeft, akTop, akRight, akBottom]
      Center = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
        001008060000001FF3FF61000000097048597300000B1300000B1301009A9C18
        000001474944415478DAB5924D4B846010C77B148BF4A210F94A274F9EBBD635
        C24B6D876821E8B4D7BE4D6C11DD5A88680F9D0A3AC5D207E8185E44D035108D
        45C983DA7F2F829BDA823430CC3CF3CCFC861986AC7414B26CA2288A1C4DD3F7
        70B7A17DD7755F4A80AAAA669EE7978410B5A6769265D911455177F8B7A0A3A2
        284600C825409665071FC708BE2D566B9AB60EC0235CC7F3BC81A2281700A8F0
        CD12806081E25FE31886B11A86E1186E2C08C229FC211AE9699A9A4110CC5A01
        BAAEAFC5713C46C117CFF36751145DA3B38251FBBEEF7F56965807C058E728DE
        6359F63049921B8436B08703009E91BBFB2700B107749C01B2397F330CD3B36D
        FB7B31B70940107B87FD00E495E3B8A16559695D6E23005AD4DDC3B28046F91F
        C0FC90604E701C93B662E4EDC0DC226FAB029024691FDBBE826A6D002CD4810E
        A6D3E95305D0453A037E00228FB6115BBA0A080000000049454E44AE426082}
    end
  end
end
